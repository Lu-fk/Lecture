package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import db.DB;



@SuppressWarnings("serial")
public class AddlecServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		DB db=new DB();
		String lec_id=request.getParameter("addid");
		if(db.Lec_idcheck(lec_id)==1)
			response.sendRedirect("adm_tj.jsp?E=1");//id�ظ�
		else{
			String lec_name=request.getParameter("addname");
			String t1=request.getParameter("addtime1");
			String t2=request.getParameter("addtime2").trim().split("~")[0];
			String lecturer_id=request.getParameter("addlrid");
			String room_id=request.getParameter("addroom");
			String lec_date=t1+" "+t2;
			if(db.Lec_timecheck(room_id, lec_date)!=1){
				String lec_mess=request.getParameter("addmess");
				if(db.addLec(lec_id, lec_name, lecturer_id, lec_date, room_id,lec_mess)!=0) response.sendRedirect("adm_gl.jsp?E=0");//��ӳɹ�
				else response.sendRedirect("adm_tj.jsp?E=2");//���ʧ��
			}
			else
				response.sendRedirect("adm_tj.jsp?E=3");//ʱ���ͻ
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}