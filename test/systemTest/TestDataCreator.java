package systemTest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import transaction.Transaction;
import transaction.create.CreateMessageTransaction;
import transaction.create.CreateNewsTransaction;

/**
 * Application Lifecycle Listener implementation class TestDataCreator
 * 
 */
@WebListener
public class TestDataCreator implements ServletContextListener {

	/**
	 * Default constructor.
	 */
	public TestDataCreator() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		Map param = new HashMap();
		param.put("name", "劉威雄");
		param.put("email", "email");
		param.put("topic", "叼你");
		param.put("content", "叼你");
		Transaction transaction = new CreateMessageTransaction();
		try {
			for (int i = 0; i < 10; i++)
				transaction.execute(param);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		param.clear();
		param.put("title", "fuck");
		param.put("imageLinks", new ArrayList<String>());
		List<Map> paragraphParams = new ArrayList<>();
		Map paragraphParam = new HashMap();
		paragraphParam.put("isImportant", "false");
		paragraphParam.put("content", "叼你");
		paragraphParams.add(paragraphParam);
		paragraphParams.add(paragraphParam);
		List<String> imageLinks = new ArrayList<>();
		imageLinks.add("create_news.png");
		imageLinks.add("create_news.png");
		imageLinks.add("create_news.png");
		param.put("imageLinks", imageLinks);
		param.put("paragraphParams", paragraphParams);
		transaction = new CreateNewsTransaction();
		try {
			for (int i = 0; i < 10; i++)
				transaction.execute(param);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
	}

}
