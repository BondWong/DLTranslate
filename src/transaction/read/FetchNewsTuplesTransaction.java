package transaction.read;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import persistence.DAO;
import transaction.DAOTransaction;

public class FetchNewsTuplesTransaction extends DAOTransaction {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	protected Object process(DAO dao, Map param) throws Exception {
		// TODO Auto-generated method stub
		List<Object[]> tuples = dao.attributeTuplesRead("News.fetchTuples");
		Map<Date, List<String>> results = new HashMap<>();
		for (Object[] tuple : tuples) {
			if (!results.containsKey(tuple[0])) {
				List<String> titles = new ArrayList<>();
				results.put((Date) tuple[0], titles);
			}
			results.get(tuple[0]).add((String) tuple[1]);
		}
		return results;
	}

}
