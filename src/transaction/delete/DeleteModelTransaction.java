package transaction.delete;

import java.util.Map;

import model.Model;
import persistence.DAO;
import transaction.DAOTransaction;

public class DeleteModelTransaction extends DAOTransaction {

	@SuppressWarnings({ "rawtypes", "unchecked"})
	@Override
	protected Object process(DAO dao, Map param) throws Exception {
		// TODO Auto-generated method stub
		String id = (String) param.get("ID");
		Class Type = (Class) param.get("type");
		
		Model model = dao.get(Type, id);
		model.delete();
		dao.update(model);
		return model.toRepresentation();
	}

}
