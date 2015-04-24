package persistence;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

public class DAO implements Creator, Reader, Updator, Deletor {
	private EntityManager em;

	public DAO(EntityManager em) {
		this.em = em;
	}

	@Override
	public <T> void create(T t) {
		// TODO Auto-generated method stub
		em.persist(t);
	}

	@Override
	public <T> T get(Class<T> type, Object ID) {
		return em.find(type, ID);
	}

	@Override
	public <T> List<T> objectsRead(String queryName, int startIndex,
			int pageSize, Class<T> type, Object... params) {
		// TODO Auto-generated method stub
		TypedQuery<T> query = em.createNamedQuery(queryName, type);
		query.setFirstResult(startIndex);
		query.setMaxResults(pageSize);
		for (int i = 1; params != null && i <= params.length
				&& params[i - 1] != null; i++) {
			query.setParameter(i, params[i - 1]);
		}
		return query.getResultList();
	}

	@Override
	public <T> List<T> objectsRead(String queryName, Class<T> type,
			Object... params) {
		// TODO Auto-generated method stub
		TypedQuery<T> query = em.createNamedQuery(queryName, type);
		for (int i = 1; params != null && i <= params.length
				&& params[i - 1] != null; i++) {
			query.setParameter(i, params[i - 1]);
		}
		return query.getResultList();
	}

	@Override
	public <T> T objectRead(String queryName, Class<T> type, Object... params) {
		// TODO Auto-generated method stub
		List<T> result = objectsRead(queryName, 0, 1, type, params);
		return result.size() != 0 ? result.get(0) : null;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List attributeTuplesRead(String queryName, int startIndex,
			int pageSize, Object... params) {
		// TODO Auto-generated method stub
		Query query = em.createNamedQuery(queryName);
		query.setFirstResult(startIndex);
		query.setMaxResults(pageSize);
		for (int i = 1; params != null && i <= params.length
				&& params[i - 1] != null; i++) {
			query.setParameter(i, params[i - 1]);
		}
		return query.getResultList();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List attributeTuplesRead(String queryName, Object... params) {
		// TODO Auto-generated method stub
		Query query = em.createNamedQuery(queryName);
		for (int i = 1; params != null && i <= params.length
				&& params[i - 1] != null; i++) {
			query.setParameter(i, params[i - 1]);
		}
		return query.getResultList();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Object[] attributeTupleRead(String queryName, Object... params) {
		// TODO Auto-generated method stub
		List result = attributeTuplesRead(queryName, 0, 1, params);
		try {
			return (Object[]) (result.size() != 0 ? result.get(0) : null);
		} catch (Exception e) {
			Object[] tuple = new Object[] { (Object) (result.size() != 0 ? result
					.get(0) : null) };
			return tuple;
		}
	}

	@Override
	public <T> void update(T t) {
		// TODO Auto-generated method stub
		em.merge(t);
	}

	@Override
	public int delete(String deleteQuery, int startIndex, int pageSize,
			Object... params) {
		// TODO Auto-generated method stub
		Query query = em.createNamedQuery(deleteQuery);
		query.setFirstResult(startIndex);
		query.setMaxResults(pageSize);
		return query.executeUpdate();
	}

	@Override
	public <T> List<T> objectsReadWithCustomeQuery(String queryString,
			int startIndex, int pageSize, Class<T> type) {
		// TODO Auto-generated method stub
		TypedQuery<T> query = em.createQuery(queryString, type);
		query.setFirstResult(startIndex);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public <T> List<T> objectsReadWithCustomeQuery(String queryString,
			Class<T> type) {
		// TODO Auto-generated method stub
		TypedQuery<T> query = em.createQuery(queryString, type);
		return query.getResultList();
	}

	@Override
	public <T> T objectReadWithCustomeQuery(String queryString, Class<T> type) {
		// TODO Auto-generated method stub
		List<T> result = objectsReadWithCustomeQuery(queryString, 0, 1, type);
		return result.size() != 0 ? result.get(0) : null;
	}
}
