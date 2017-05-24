package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import db.DB;



@SuppressWarnings("serial")
public class UpdateServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		DB db=new DB();
		String lec_id=request.getParameter("lec_id");
		String lec_name=request.getParameter("uplec_name");
		String t1=request.getParameter("uptime1");
		String t2=request.getParameter("uptime2").trim().split("~")[0];
		String lecturer_id=request.getParameter("uplr_id");
		String room_id=request.getParameter("uproom");
		String lec_date=t1+" "+t2;
		if(db.Lec_timecheck(room_id, lec_date)!=1){
			String lec_mess=request.getParameter("upmess");
			if(db.updateLec(lec_id, lec_name, lecturer_id, lec_date, room_id,lec_mess)!=0) response.sendRedirect("adm_gl.jsp?E=10");//修改成功
			else response.sendRedirect("adm_gl.jsp?E=12");//修改失败
		}
		else
			response.sendRedirect("adm_xg.jsp?E=13&lec_id="+lec_id);//时间冲突
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}