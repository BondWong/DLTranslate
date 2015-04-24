package transaction.read;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import persistence.DAO;
import transaction.DAOTransaction;

public class FetchMessageTuplesTransaction extends DAOTransaction {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	protected Object process(DAO dao, Map param) throws Exception {
		// TODO Auto-generated method stub
		List<Object[]> tuples = dao.attributeTuplesRead("Message.fetchTuples");
		Map<Date, List<String>> results = new HashMap<>();
		for (Object[] tuple : tuples) {
			if (!results.containsKey(tuple[0])) {
				List<String> topics = new ArrayList<>();
				results.put((Date) tuple[0], topics);
			}
			results.get(tuple[0]).add((String) tuple[1]);
		}
		return results;
	}

}
