package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import db.DB;



@SuppressWarnings("serial")
public class Sign_inServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		DB db=new DB();
		String stu_id=(String) request.getParameter("stu_id");
		String lec_id=(String) request.getParameter("lec_id");
		if(db.sign_in(stu_id, lec_id)!=0) response.sendRedirect("adm_qd2.jsp?lec_id="+lec_id);//签到成功
		else response.sendRedirect("adm_qd2.jsp?E=2&lec_id="+lec_id);//签到失败
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}