package servlet;

import java.io.IOException;
import db.DB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;

@SuppressWarnings("serial")
public class AddcomServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		String Stu_id=user.getU_id();
		String Lec_id=request.getParameter("lec_id");
		String Com=request.getParameter("com");
		DB db=new DB();
		
		if(db.addCom(Stu_id, Lec_id, Com)!=0){
			response.sendRedirect("xxxx.jsp?E=0&lec_id="+Lec_id);
		}
		else
			response.sendRedirect("xxxx.jsp?E=1&lec_id="+Lec_id);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}