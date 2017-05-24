<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="model.*"%>
<%@ page import="db.DB"%>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>讲座评论</title>
    
    <!-- 使网页适应不同分辨率的设备 -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
        
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<%
				String S=request.getParameter("E");
				if(S!=null){
					int E=Integer.parseInt(S);
					if(E == 0)
						out.print("<script>alert('删除成功！');location.href='jzyy.jsp';</script>");
					else if(E == 1)
						out.print("<script>alert('删除失败！');location.href='jzyy.jsp';</script>");
				}
				else ;
				String s=(String)session.getAttribute("sign");
  				if(s==null||s.equals("login")){
					response.sendRedirect("login.jsp");
				}
				else{
					DB db=new DB();
			%>

  </head>
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
					 <a class="navbar-brand" href="index.jsp">主页</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li>
							 <a href="jzcx.jsp"><strong>讲座查看</strong></a>
						</li>
						<li class="active">
							 <a href="jzyy.jsp"><strong>讲座评论</strong></a>
						</li>
						<li>
							 <a href="wdjz.jsp"><strong>我的讲座</strong></a>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="logoutServlet">登出|切换账户</a>
						</li>
					</ul>
				</div>				
			</nav>
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
							评论内容
						</th>
						<th>
							评论时间
						</th>
						<th>
							删除评论
						</th>
					</tr>
				</thead>
				<%
				User user=(User)session.getAttribute("user");
  				ArrayList<comTable> SC=db.findS_ComTable(user.getU_id());
  				int i=0;
  				Iterator iter=SC.iterator();
				%>
				<tbody>
				<%
				while(iter.hasNext()){
					comTable c=(comTable)iter.next();
					i++;
				%>
					<tr>
						<td>
							<%=i %>
						</td>
						<td>
							<%=db.getLec(c.getLec_id()).getLec_name() %>
						</td>
						<td>
							<%=c.getCom() %>
						</td>
						<td>
							<%=c.getCom_date() %>
						</td>
						<td>
							<%SimpleDateFormat form=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); %>
							<button class="btn btn-default" type="button" onClick="location.href='http://localhost:8080/LLecture/DelcomServlet?type=s&lec_id=<%=c.getLec_id() %>&com_date=<%=form.format(c.getCom_date()) %>'">删除</button>							
						</td>
					</tr>
					<%} %>
				</tbody>
			</table>
			</div>
		</div>
	</div>
</div>
  </body>
  <%db.Close();} %>
</html>