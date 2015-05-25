package transaction.read;

import java.text.SimpleDateFormat;
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
		Map<String, List<Object[]>> results = new HashMap<>();
		for (Object[] tuple : tuples) {
			if (!results.containsKey((new SimpleDateFormat("yyyy-MM-dd"))
					.format((Date) tuple[0]))) {
				List<Object[]> t = new ArrayList<>();
				results.put((new SimpleDateFormat("yyyy-MM-dd"))
						.format((Date) tuple[0]), t);
			}
			results.get(
					(new SimpleDateFormat("yyyy-MM-dd"))
							.format((Date) tuple[0])).add(tuple);
		}
		return results;
	}
}
