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
public class apptimeServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		DB db=new DB();
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		String lec_id=(String) request.getParameter("lec_id");
		
		if(db.signcheck(user.getU_id(), lec_id)==1||db.signcheck(user.getU_id(), lec_id)==0)
			response.sendRedirect("jzcx.jsp?E=1");//�ظ�ԤԼ
		else{
			if(db.apptimeLec(user.getU_id(), lec_id)!=0)
				response.sendRedirect("jzcx.jsp?E=0");//ԤԼ�ɹ�
			else response.sendRedirect("jzcx.jsp?E=2");//ԤԼʧ��
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}