<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="model.*"%>
<%@ page import="db.DB"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>学生签到</title>
    
    <!-- 使网页适应不同分辨率的设备 -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
        
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">


  </head>
			<%
				String s=(String)session.getAttribute("sign");
  				if(s==null||s.equals("login")){
					response.sendRedirect("login.jsp");
				}
				else{
					DB db=new DB();
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
					 <a class="navbar-brand" href="administrator.jsp">主页</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li>
							 <a href="adm_gl.jsp"><strong>讲座管理</strong></a>
						</li>
						<li>
							 <a href="adm_tj.jsp"><strong>添加讲座</strong></a>
						</li>
						<li class="active">
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
			<%
				ArrayList<lecture> ALec=db.findAllLec();
  				Iterator iter=ALec.iterator();
				ArrayList<lecture> Lec=new ArrayList<lecture>();
				Date dt=new Date();
				int i=0;
				while(iter.hasNext()){
  					lecture l=(lecture)iter.next();
					if(l.getLec_date().after(dt)) Lec.add(l);
				}
			%>
			<table class="table">
				<thead>
					<tr>
						<th>
							编号
						</th>
						<th>
							讲座名
						</th>
						<th>
							举办时间
						</th>
						<th>
							地点
						</th>
						<th>
							签到管理
						</th>
					</tr>
				</thead>
				<tbody>
				<%
					iter=Lec.iterator();
					i=0;
					while(iter.hasNext())
					{
						lecture l=(lecture)iter.next();
						i++;
				%>
					<tr>
						<td>
							<%=i %>
						</td>
						<td>
							<%=l.getLec_name() %>
						</td>
						<td>
							<%=l.getLec_date() %>
						</td>
						<td>
							<%=l.getRoom_id() %>
						</td>
						<td>
							<a href="adm_qd2.jsp?lec_id=<%=l.getLec_id() %>"><input class="btn btn-default" type="button" value="查看" ></a>
						</td>
					</tr>
					<%} %>
				</tbody>
			</table>		
		  </div>
		</div>
	</div>
</div>
<%db.Close();} %>
  </body>
</html>