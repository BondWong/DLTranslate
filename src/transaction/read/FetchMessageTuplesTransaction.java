package transaction.read;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Message;
import persistence.DAO;
import transaction.DAOTransaction;

public class FetchMessageTuplesTransaction extends DAOTransaction {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	protected Object process(DAO dao, Map param) throws Exception {
		// TODO Auto-generated method stub
		List<Object[]> tuples = dao.attributeTuplesRead("Message.fetchTuples");
		Map<Date, List<Map<String, Object>>> results = new HashMap<>();
		for (Object[] tuple : tuples) {
			if (!results.containsKey(tuple[0])) {
				List<Map<String, Object>> messages = new ArrayList<>();
				results.put((Date) tuple[0], messages);
			}
			results.get(tuple[0]).add(((Message) tuple[1]).toRepresentation());
		}
		return results;
	}

}
