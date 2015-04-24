package transaction.create;

import java.util.Map;

import model.Message;
import persistence.DAO;
import transaction.DAOTransaction;

public class CreateMessageTransaction extends DAOTransaction {

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	protected Object process(DAO dao, Map param) throws Exception {
		// TODO Auto-generated method stub
		Message message = new Message();
		message.init(param);
		dao.create(message);
		return message.toRepresentation();
	}

}
