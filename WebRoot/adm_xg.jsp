<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="model.*"%>
<%@ page import="db.DB"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>修改讲座</title>
    
    <!-- 使网页适应不同分辨率的设备 -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
        
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">


  </head>
  		<%
  			String lec_id=request.getParameter("lec_id");
  			String S=request.getParameter("E");
 				 if(S!=null){
					int E=Integer.parseInt(S);
					if(E == 12)
						out.print("<script>alert('修改失败！');location.href='adm_xg.jsp?lec_id='+lec_id;</script>");
					else if(E == 13)
						out.print("<script>alert('修改后时间地点冲突！');location.href='adm_xg.jsp?lec_id='+lec_id;</script>");
					
				}
				else;
  			String s=(String)session.getAttribute("sign");
  			if(s==null||s.equals("login")){
				response.sendRedirect("login.jsp");
			}
			else{
		  		DB db=new DB();
		  		lecture l=db.getLec(lec_id);
	  	%>
  <body>
	<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-4 column">
					<img alt="140x140" src="pictures/main_10.jpg" />
				</div>
				<div class="col-md-8 column">
					<h2 class="text-center">
						东华大学讲座管理系统
					</h2>
				</div>
			</div>
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <a class="navbar-brand" href="administrator.jsp.jsp">主页</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							 <a href="adm_gl.jsp"><strong>讲座管理</strong></a>
						</li>
						<li>
							 <a href="adm_tj.jsp"><strong>添加讲座</strong></a>
						</li>
						<li class=>
							 <a href="adm_qd.jsp"><strong>学生签到</strong></a>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="logoutServlet">登出|切换账户</a>
						</li>
					</ul>					
				</div>				
			</nav>
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">
						原始讲座信息
					</h3>
				</div>
				<div class="panel-body">
					<h3 class="panel-title">
						编号：<%=lec_id %>
					</h3>
					<h3 class="panel-title">
						名称：<%=l.getLec_name() %>
					</h3>
					<h3 class="panel-title">
						时间：<%=l.getLec_date() %>
					</h3>
					<h3 class="panel-title">
						地点：<%=l.getRoom_id() %>
					</h3>
					<h3 class="panel-title">
						讲师：<%=db.getLecturername(l.getLecturer_id()) %>
					</h3>
					<h3 class="panel-title">
						介绍：<%=l.getLec_mess() %>
					</h3>
				</div>
			</div>
			
			<div class="panel panel-danger">
				<div class="panel-heading">
					<h3 class="panel-title">
						修改讲座信息
					</h3>
				</div>
				<div class="panel-body">
				<form class="form-horizontal" role="form" action="UpdateServlet?lec_id=<%=lec_id %>" method="post">
					<div class="form-group">
						 <label for="lname" class="col-lg-5 control-label">讲座名</label>
						 <div class="col-lg-3">
						 	<input class="form-control" name="uplec_name" id="Lname" type="text" />
						 </div>
					</div>
					<div class="form-group">
						 <label for="ldate" class="col-lg-5 control-label">讲座时间</label>
						 <div class="col-lg-3">
						 	<input class="form-control" name="uptime1" id="Ldate1" type="text" placeholder="年月日：xxxx-xx-xx 如2000-01-01"/>
						 </div>
						 <div class="col-lg-3">
							<select class="form-control" name="uptime2" id="Ldate2"> 
								<option value="08:00:00">8:00~9:30</option> 
								<option value="10:00:00">10:00~11:30</option> 
								<option value="13:00:00">13:00~14:30</option> 
								<option value="15:00:00">15:00~16:30</option> 
								<option value="17:00:00">17:00~18:30</option> 
								<option value="19:30:00">19:30~21:00</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						 <label for="ladr" class="col-lg-5 control-label">讲座地点</label>
						 <div class="col-lg-3">
							<select class="form-control" name="uproom" id="Ladr"> 
							<%
								ArrayList<room> rt=db.getRoom();
								Iterator iter=rt.iterator();
								while(iter.hasNext()){
									room r=(room)iter.next();
							%>
								<option value="<%=r.getRoom_id() %>"><%=r.getRoom_id() %></option> 
							<%} %>
							</select>
						</div>
					</div>
					<div class="form-group">
						 <label for="ladr" class="col-lg-5 control-label">主讲人</label>
						 <div class="col-lg-3">
						 	<select class="form-control" name="uplr_id" id="Ladr"> 
							<%
								ArrayList<lecturer> lrt=db.getLecturer();
								iter=lrt.iterator();
								while(iter.hasNext()){
									lecturer lr=(lecturer)iter.next();
							%>
								<option value="<%=lr.getLecturer_id() %>"><%=lr.getLecturer_name() %></option> 
							<%} %>
							</select>
						 </div>
					</div>
					<div class="form-group">
	    				<label for="linf" class="col-lg-5 control-label">讲座介绍</label>
	    				<div class="col-lg-4">
	    				<textarea class="form-control" rows="8" name="upmess"></textarea>
	    				</div>
	  				</div>		
	  				<div class=" text-center">		
						<input class="btn btn-default" type="submit" value="确认修改">
					</div>
					
			</form>
				</div>
					
			</div>
			
		</div>
	</body>
	<%db.Close(); } %>
</html>