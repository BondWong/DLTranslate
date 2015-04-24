package transaction.create;

import java.util.Map;

import model.Comment;
import model.News;
import persistence.DAO;
import transaction.DAOTransaction;

public class CreateCommentTransaction extends DAOTransaction {

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	protected Object process(DAO dao, Map param) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> commentParams = (Map<String, Object>) param
				.get("commentParams");
		String id = (String) param.get("id");

		News news = dao.get(News.class, id);
		Comment comment = new Comment();
		comment.init(commentParams);
		news.addComment(comment);
		dao.update(news);
		return news.toRepresentation();
	}

}
