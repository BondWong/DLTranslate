package transaction.read;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import model.News;
import persistence.DAO;
import transaction.DAOTransaction;

public class FetchNewsByDateTransaction extends DAOTransaction {

	@SuppressWarnings({ "rawtypes" })
	@Override
	protected Object process(DAO dao, Map param) throws Exception {
		// TODO Auto-generated method stub
		int startIndex = (int) param.get("startIndex");
		int pageSize = (int) param.get("pageSize");
		String dateString = (String) param.get("date");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(dateString);
		List<News> news = dao.objectsRead("News.fetchByDate", startIndex,
				pageSize, News.class, date);
		List<Map<String, Object>> results = new ArrayList<>();
		for (News n : news)
			results.add(n.toRepresentation());
		return results;
	}

}
