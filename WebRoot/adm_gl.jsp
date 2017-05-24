<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="model.*"%>
<%@ page import="db.DB"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>讲座管理</title>
    
    <!-- 使网页适应不同分辨率的设备 -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
        
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">


  </head>
 			<%
 				String S=request.getParameter("E");
 				if(S!=null){
					int E=Integer.parseInt(S);
					if(E == 0)
						out.print("<script>alert('添加成功！');location.href='adm_gl.jsp';</script>");
					else if(E == 10)
						out.print("<script>alert('修改成功！');location.href='adm_gl.jsp';</script>");
					else if(E == 20)
						out.print("<script>alert('删除成功！');location.href='adm_gl.jsp';</script>");
					else if(E == 22)
						out.print("<script>alert('删除失败！');location.href='adm_gl.jsp';</script>");
				}
				else ;
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
						<li class="active">
							 <a href="adm_gl.jsp"><strong>讲座管理</strong></a>
						</li>
						<li>
							 <a href="adm_tj.jsp"><strong>添加讲座</strong></a>
						</li>
						<li>
							 <a href="adm_qd.jsp"><strong>学生签到</strong></a>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="login.jsp">登出|切换账户</a>
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
							举办时间
						</th>
						<th>
							地点
						</th>
						<th>
							详细信息
						</th>
						<th>
							讲座管理
						</th>
					</tr>
				</thead>
				<%!
					int pageCount;
					int curPage=1;
					public static final int PAGESIZE = 5;
				%>
				<%
				User user=(User)session.getAttribute("user");
  				ArrayList<lecture> Lec=db.findAllLec();
  				Iterator iter=Lec.iterator();
				int i=0;
				
				int size=Lec.size();
				iter=Lec.iterator();
				pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);
				String tmp = request.getParameter("curPage");
				if(tmp==null){
					tmp="1";
				}
				curPage = Integer.parseInt(tmp);
				if(curPage>=pageCount) curPage = pageCount;
				for(i=1;i<curPage;i++){
					for(int j=0;j<PAGESIZE;j++)iter.next();
				}
				%>
				<tbody>
				<%
				i=0;
				for(i=0;iter.hasNext()&&i<PAGESIZE;i++){
					lecture l=(lecture)iter.next();
					if(i%2==0){
  				%>
					<tr>
				<%
					}
					else{
				%>
					
					<tr class="info">
				<%
					}
				%>
						<td>
							<%=i+1 %>
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
							<button class="btn btn-default" type="button" onClick="location.href='http://localhost:8080/LLecture/adm_xxxx.jsp?lec_id=<%=l.getLec_id() %>'">详细信息</button>
						</td>
						<td>
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle" 
										data-toggle="dropdown">
									管理 <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a href="adm_xg.jsp?lec_id=<%=l.getLec_id() %>">修改讲座</a></li>
									<li><a href="DellecServlet?lec_id=<%=l.getLec_id() %>">删除讲座</a></li>
								</ul>
							</div>							
						</td>
					</tr>
					<%} i=Lec.size(); %>
				</tbody>
			</table>
			<div class="text-center">
				<ul class="pagination">
					<%if(curPage>1){ %>
					<li>
						 <a href="adm_gl.jsp?curPage=<%=curPage-1%>">&laquo;</a>
					</li>
					<%} %>
				<% 
					for(i=1;i<=pageCount;i++){
				%>
					<li>
						<a href="adm_gl.jsp?curPage=<%=i%>"><%=i%></a>
					</li>
				<%
					}
					if(curPage<pageCount){
				 %>
					<li>
						<a href="adm_gl.jsp?curPage=<%=curPage+1%>">&raquo;</a>
					</li>
					<%} %>
				</ul>
			</div>				
		  </div>
		</div>
	</div>
</div>
<%db.Close();} %>
  </body>
</html>