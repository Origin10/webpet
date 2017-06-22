package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;

import dao.Mem_JDBC;
import dao.Pet_JDBC;
import dao.Share_JDBC;
import service.MemService;
import service.PetService;
import service.ShareService;
import util.HibernateUtil;
import vo.Mem_VO;
import vo.Pet_VO;
import vo.Share_VO;

@WebServlet(urlPatterns = { "/frilist" , "/friInfo.do"})

public class FriendList extends HttpServlet {
	private Gson gson;
	private MemService memService;
	private PetService petService;
	private ShareService shareService;
	private JsonParser jp;

	@Override
	public void init() throws ServletException {
		gson = new Gson();
		WebApplicationContext context =
				WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		memService = (MemService) context.getBean("memService");
		petService = (PetService) context.getBean("petService");
		shareService = (ShareService) context.getBean("shareService");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String fid = request.getParameter("id");
		String path = request.getServletPath();
		
		int id = 0;
			if(path.equals("/frilist")){
				if(fid != null && fid.length() != 0){
					 id = Integer.parseInt(fid);
				}
				else{
					Mem_VO mbean = (Mem_VO) request.getSession().getAttribute("mem");
					 id = mbean.getmem_id();
				}

				try {
					List<Mem_VO> fri = memService.select_fri_info(id);
					List<String> list = new ArrayList<String>();

					for (int i = 0; i < fri.size(); i++) {
						list.add(fri.get(i).getmem_name());
						list.add(fri.get(i).getmem_mail());
					}

					String fobj = gson.toJson(list);
					response.getWriter().write(fobj);
				} catch (java.lang.NullPointerException e) {
					response.getWriter().append(null);
					return;
				}
			}
			
			
		if( path.equals("/friInfo.do")){				//朋友頁面info
			String email = request.getParameter("id");
			
			Mem_VO fmbean = memService.select_id(email);
			
			List<Pet_VO> fpBean	= petService.select_pet_all(fmbean.getmem_id());
			List<Share_VO> fsBean = shareService.select_all(fmbean.getmem_id());

			HttpSession session = request.getSession();
			session.setAttribute("mfri", fmbean);
			session.setAttribute("frishare", fsBean);
			session.setAttribute("fripet", fpBean);
			
			response.sendRedirect("/webpet/friInfo.jsp");

		}
		
		
		
 }
		

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		

	}
}