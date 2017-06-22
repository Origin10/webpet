package util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class SessionFactoryListener implements ServletContextListener {
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		System.out.println("Web應用程式停止");
		HibernateUtil.closeSessionFactory();
	}
	@Override
	public void contextInitialized(ServletContextEvent event) {
		System.out.println("Web應用程式啟動");
		HibernateUtil.getSessionFactory();
	}
}
