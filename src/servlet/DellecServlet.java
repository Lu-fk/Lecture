package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import db.DB;



@SuppressWarnings("serial")
public class DellecServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		DB db=new DB();
		String lec_id=request.getParameter("lec_id");
		if(db.dellec(lec_id)!=0) response.sendRedirect("adm_gl.jsp?E=20");//É¾³ý³É¹¦
		else response.sendRedirect("adm_gl.jsp?E=22");//É¾³ýÊ§°Ü
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}