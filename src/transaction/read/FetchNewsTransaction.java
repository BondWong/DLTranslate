package transaction.read;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import model.News;
import persistence.DAO;
import transaction.DAOTransaction;

public class FetchNewsTransaction extends DAOTransaction {

	@SuppressWarnings("rawtypes")
	@Override
	protected Object process(DAO dao, Map param) throws Exception {
		// TODO Auto-generated method stub
		int startIndex = (int) param.get("startIndex");
		int pageSize = (int) param.get("pageSize");
		List<News> news = dao.objectsRead("News.fetch", startIndex, pageSize,
				News.class);
		List<Map<String, Object>> results = new ArrayList<>();
		for (News n : news)
			results.add(n.toRepresentation());
		return results;
	}

}
