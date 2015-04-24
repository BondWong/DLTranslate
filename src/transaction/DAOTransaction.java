package transaction;

import java.util.Map;

import utils.EntityManagerFactoryUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.OptimisticLockException;
import javax.persistence.RollbackException;

import persistence.DAO;

public abstract class DAOTransaction implements Transaction {
	private EntityManagerFactory emf;
	private EntityManager em;
	private EntityTransaction tx;
	private DAO dao;

	@SuppressWarnings("rawtypes")
	public final Object execute(Map param) throws Exception {
		initEntityManagerFactory();
		initEntityManager();
		initDAO();
		initEntityTransaction();

		return execute(dao, param);
	}

	private void initEntityManagerFactory() {
		emf = EntityManagerFactoryUtil.getInstance().getEntityManagerFactory();
	}

	private void initEntityManager() {
		em = emf.createEntityManager();
	}

	private void initEntityTransaction() {
		tx = em.getTransaction();
	}

	private void initDAO() {
		dao = new DAO(em);
	}

	private void beginTransaction() {
		tx.begin();
	}

	@SuppressWarnings("rawtypes")
	protected abstract Object process(DAO dao, Map param) throws Exception;

	private void commitTransaction() {
		tx.commit();
	}

	private void rollBackTransaction() {
		if (tx.isActive())
			tx.rollback();
	}

	private void close() {
		if (em.isOpen())
			em.close();
	}

	@SuppressWarnings("rawtypes")
	private Object execute(DAO dao, Map param) throws Exception {
		try {
			beginTransaction();
			Object result = process(dao, param);
			commitTransaction();
			return result;
		} catch (RollbackException re) {
			if (re.getCause() instanceof OptimisticLockException) {
				return execute(dao, param);
			} else {
				rollBackTransaction();
				throw re;
			}
		} catch (Exception e) {
			rollBackTransaction();
			throw e;
		} finally {
			close();
		}
	}
}
