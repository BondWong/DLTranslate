package transaction.create;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.News;
import persistence.DAO;
import transaction.DAOTransaction;

public class CreateNewsTransaction extends DAOTransaction {

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	protected Object process(DAO dao, Map param) throws Exception {
		// TODO Auto-generated method stub
		String content = (String) param.get("content");
		content = content.replace("[\n\r]+", "<br /><br />").replaceAll("\n+", "<br /><br />");
		String title = (String) param.get("title");
		List<String> imageLinks = (List<String>) param.get("imageLinks");

		Map<String, Object> newsParameters = new HashMap<>();
		newsParameters.put("title", title);
		newsParameters.put("content", content);

		News news = new News();
		news.init(newsParameters);
		news.setImageLinks(imageLinks);
		dao.create(news);
		
		return news.toRepresentation();
	}

}
