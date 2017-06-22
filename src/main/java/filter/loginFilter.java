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
import dao.Pet_JDBC;
import dao.Share_JDBC;
import service.InformfriService;
import service.MemService;
import service.PetService;
import service.ShareService;
import util.HibernateUtil;
import vo.Informfri_VO;
import vo.Mem_VO;
import vo.Pet_VO;
import vo.Share_VO;

//@WebFilter(urlPatterns = { "/MemInfo.jsp", "/memInfo.do","/needBloodForm.jsp"})
public class loginFilter implements Filter {
	private ShareService shareService;
	private MemService memService;
	private PetService petService;
	private InformfriService informfriService;


	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		WebApplicationContext context =
				WebApplicationContextUtils.getWebApplicationContext(filterConfig.getServletContext());

				memService = (MemService) context.getBean("memService");
				petService = (PetService) context.getBean("petService");
				shareService = (ShareService) context.getBean("shareService");
		informfriService = (InformfriService) context.getBean("informfriService");;

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;	
		
		Cookie[] cookies = req.getCookies();
		

		
	if(cookies == null){
		resp.sendRedirect("/webpet/index");
				return;	}

	if(cookies!= null){
		for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			if (cookie.getName().toString().equals("user")) {
				System.out.println("filter");
				String user = cookie.getValue();
				int id = Integer.parseInt(user);
				
				
				
				System.out.println("Loginid:" + id);
				
				List<Pet_VO> pBean = petService.select_pet_all(id);
				Mem_VO mbean =  memService.select(id);	
				List<Share_VO> sBean =shareService.select_all(id);
				
				
				
				
				
		
				
//				try {
//				 sBean =
//				} catch (java.lang.NullPointerException e) {
//					System.out.println("share:"+ e);
//				}
				System.out.println("sBean:" + sBean);

				
				HttpSession session = req.getSession();
				
				session.setAttribute("share", sBean);
				session.setAttribute("mem", mbean);
				session.setAttribute("pet", pBean);

				chain.doFilter(request, response);
				
				break;
			}
		}
	}

}

	@Override
	public void destroy() {

	}

}
