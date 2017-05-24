package servlet;

import java.io.IOException;
import db.DB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class registerServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id=request.getParameter("userid");
		String username=request.getParameter("username");
		String pwd=request.getParameter("pwd");
		if(id.equals(""))response.sendRedirect("register.jsp?E=3");
		else if(username.equals(""))response.sendRedirect("register.jsp?E=4");
		else if(pwd.equals(""))response.sendRedirect("register.jsp?E=5");
		else{
			if(new DB().stu_idcheck(id)==1)
				response.sendRedirect("register.jsp?E=1");
			else if(new DB().stu_idcheck(id)==0){
				if(new DB().regist(id,pwd, username)!=0)
					response.sendRedirect("login.jsp?E=4");
				else
					response.sendRedirect("register.jsp?E=2");
			}
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}