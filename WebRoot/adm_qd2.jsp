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
				
				String lec_id=request.getParameter("lec_id");
				String S=request.getParameter("E");
				if(S!=null){
					int E=Integer.parseInt(S);
					if(E == 2)
						out.print("<script>alert('签到失败！');location.href='adm_gl2.jsp?lec_id='+lec_id;</script>");
				}
				else ;
				S=(String)session.getAttribute("sign");
  				if(S==null||S.equals("login")){
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
				ArrayList<signTable> st=db.findSignTable();
				ArrayList<signTable> lst=new ArrayList<signTable>();
				Iterator iter=st.iterator();
				while(iter.hasNext()){
					signTable s=(signTable)iter.next();
					if(s.getLec_id().equals(lec_id)) lst.add(s);
				}
			%>
			<table class="table">
				<thead>
					<tr>
						<th>
							编号
						</th>
						<th>
							姓名
						</th>
						<th>
							状态
						</th>
						<th>
							签到
						</th>
					</tr>
				</thead>
				<%
					int i=0;
					iter=lst.iterator();
					while(iter.hasNext()){
						signTable s=(signTable)iter.next();
						i++;
				%>
				<tbody>
					<tr>
						<td>
							<%=i %>
						</td>
						<td>
							<%=s.getStu_id() %>
						</td>
						<td>
							<%
								if(s.getSign()==0) out.print("未签到");
								else out.print("已签到");
							%>
						</td>
						<td>
							<button class="btn btn-default" type="button" onClick="location.href='http://localhost:8080/LLecture/Sign_inServlet?lec_id=<%=lec_id %>&stu_id=<%=s.getStu_id() %>'">签到</button>
						</td>
						<%} %>
					</tr>
				</tbody>
			</table>		
		  </div>
		</div>
	</div>
</div>
  </body>
  <%db.Close(); } %>
</html>