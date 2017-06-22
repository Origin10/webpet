package filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import dao.Checkfri;
import dao.Mem_JDBC;
import service.InformfriService;
import service.MemService;
import util.HibernateUtil;
import vo.Informfri_VO;
import vo.Mem_VO;

public class indexfilter implements Filter{
	private InformfriService informfriService;
	private MemService memService;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		WebApplicationContext context =
				WebApplicationContextUtils.getWebApplicationContext(filterConfig.getServletContext());
		memService = (MemService) context.getBean("memService");
		informfriService = (InformfriService) context.getBean("informfriService");
	}


	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	
	

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;	
		Cookie[] cookies = req.getCookies();

		
		if(cookies == null){
			chain.doFilter(request, response);
			return;
		}
		
		if(cookies!= null){
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				if (cookie.getName().toString().equals("user")) {
					System.out.println("filter");
					String user = cookie.getValue();
					int id = Integer.parseInt(user);
					
					List<Informfri_VO> invo = informfriService.select_info(id);
					List<Mem_VO> minfo = new ArrayList<Mem_VO>();
					if (!invo.isEmpty()) {
						for (int a = 0; a< invo.size(); a++) {
							Mem_VO mvo = memService.select(invo.get(a).getMem_id());
							System.out.println("mvo" + mvo);
							Mem_VO data = new Mem_VO();
							data.setmem_id(mvo.getmem_id());
							data.setmem_name(mvo.getmem_name());
							data.setmem_mail(mvo.getmem_mail());					
							minfo.add(data);
						}
					}
						HttpSession session = req.getSession();
						session.setAttribute("alert", minfo);
						chain.doFilter(request, response);
						break;
					}

			}
		}
		
	}

}
