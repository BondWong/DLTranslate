package transaction.create;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.News;
import model.Paragraph;
import persistence.DAO;
import transaction.DAOTransaction;

public class CreateNewsTransaction extends DAOTransaction {

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	protected Object process(DAO dao, Map param) throws Exception {
		// TODO Auto-generated method stub
		List<Map<String, Object>> paragraphParams = (List<Map<String, Object>>) param
				.get("paragraphParams");
		String title = (String) param.get("title");
		List<String> imageLinks = (List<String>) param.get("imageLinks");

		Map<String, Object> newsParameters = new HashMap<>();
		newsParameters.put("title", title);

		News news = new News();
		news.init(newsParameters);
		news.setImageLinks(imageLinks);
		dao.create(news);
		
		int sequence = 1;
		for (Map<String, Object> pargraphParam : paragraphParams) {
			pargraphParam.put("ID", news.getID() + (sequence++));
			Paragraph paragraph = new Paragraph();
			paragraph.init(pargraphParam);
			news.addParagraph(paragraph);
		}
		
		dao.update(news);
		return news.toRepresentation();
	}

}
