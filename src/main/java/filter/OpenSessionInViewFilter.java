package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class OpenSessionInViewFilter implements Filter {
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		try {
			sessionFacotry.getCurrentSession().beginTransaction();
			chain.doFilter(request, response);
			sessionFacotry.getCurrentSession().getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			sessionFacotry.getCurrentSession().getTransaction().rollback();
			chain.doFilter(request, response);
		}
	}
	private SessionFactory sessionFacotry;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String sessionFactoryBeanName = filterConfig.getInitParameter("sessionFactoryBeanName");
		if(sessionFactoryBeanName==null || sessionFactoryBeanName.length()==0) {
			sessionFactoryBeanName = "sessionFactory";
		}
		WebApplicationContext context =
				WebApplicationContextUtils.getWebApplicationContext(filterConfig.getServletContext());
		this.sessionFacotry = (SessionFactory) context.getBean(sessionFactoryBeanName);
	}
	@Override
	public void destroy() {

	}
}
