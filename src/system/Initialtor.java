package system;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import utils.EntityManagerFactoryUtil;

/**
 * Application Lifecycle Listener implementation class Boostrap
 * 
 */
// @WebListener
public class Initialtor implements ServletContextListener {
	// private static final int DELETEMODELTIME = 60 * 60;

	/**
	 * Default constructor.
	 */
	public Initialtor() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent servletContextEvent) {
		// TODO Auto-generated method stub
		EntityManagerFactoryUtil.getInstance().closeEntityManagerFactory();
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		// TODO Auto-generated method stub
	}

}
