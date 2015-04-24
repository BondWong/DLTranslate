package transaction.read;

import java.util.Map;

import model.Model;
import persistence.DAO;
import transaction.DAOTransaction;

public class GetModelByIDTransaction extends DAOTransaction {

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	protected Object process(DAO dao, Map param) throws Exception {
		// TODO Auto-generated method stub
		String id = (String) param.get("ID");
		Class type = (Class) param.get("type");
		Model model = dao.get(type, id);
		return model.toRepresentation();
	}

}
