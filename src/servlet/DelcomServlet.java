package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import db.DB;



@SuppressWarnings("serial")
public class DelcomServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		DB db=new DB();
		String type=request.getParameter("type");
		String lec_id=(String) request.getParameter("lec_id");
		String date=request.getParameter("com_date");
		if(type.equals("s")){
			HttpSession session=request.getSession();
			User user=(User)session.getAttribute("user");
			if(db.delCom(user.getU_id(), lec_id,date)!=0)
				response.sendRedirect("jzyy.jsp?E=0");//É¾³ý³É¹¦
			else 
				response.sendRedirect("jzyy.jsp?E=1");//É¾³ýÊ§°Ü
		}
		else{
			String Stu_id=(String) request.getParameter("stu_id");
			if(db.delCom(Stu_id, lec_id,date)!=0)
				response.sendRedirect("adm_xxxx.jsp?E=0&lec_id="+lec_id);//É¾³ý³É¹¦
			else 
				response.sendRedirect("adm_xxxx.jsp?E=1&lec_id="+lec_id);//É¾³ýÊ§°Ü
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}