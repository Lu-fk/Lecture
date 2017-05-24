<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%@ page import="db.DB"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>讲座查看</title>
    
    <!-- 使网页适应不同分辨率的设备 -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
        
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">


  </head>
  <%
				String S=request.getParameter("E");
				if(S!=null){
					int E=Integer.parseInt(S);
					if(E == 0)
						out.print("<script>alert('预约成功！');location.href='jzcx.jsp';</script>");
					else if(E == 1)
						out.print("<script>alert('请勿重复预约！');location.href='jzcx.jsp';</script>");
					else if(E == 2)
						out.print("<script>alert('预约失败！');location.href='jzcx.jsp';</script>");
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
					 <a class="navbar-brand" href="index.jsp">主页</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							 <a href="jzcx.jsp"><strong>讲座查看</strong></a>
						</li>
						<li>
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
							举办时间
						</th>
						<th>
							地点
						</th>
						<th>
							详细信息
						</th>
						<th>
							预约
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
  				ArrayList<lecture> ALec=db.findAllLec();
  				Iterator iter=ALec.iterator();
				ArrayList<lecture> Lec=new ArrayList<lecture>();
				Date dt=new Date();
				int i=0;
				while(iter.hasNext()){
  					lecture l=(lecture)iter.next();
					if(l.getLec_date().after(dt)) Lec.add(l);
				}
				
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
							<button class="btn btn-default" type="button" onClick="location.href='http://localhost:8080/LLecture/xxxx.jsp?lec_id=<%=l.getLec_id() %>'">详细信息</button>
						</td>
						<td>
							<button class="btn btn-default" type="button" onClick="location.href='http://localhost:8080/LLecture/apptimeServlet?lec_id=<%=l.getLec_id() %>'">预约</button>						
						</td>
					</tr>
					<%} i=Lec.size(); %>
				</tbody>
			</table>
			<div class="text-center">
				<ul class="pagination">
				<%if(curPage>1){ %>
					<li>
						 <a href="jzcx.jsp?curPage=<%=curPage-1%>">&laquo;</a>
					</li>
					<%} %>
				<% 
					for(i=1;i<=pageCount;i++){
				%>
					<li>
						<a href="jzcx.jsp?curPage=<%=i%>"><%=i%></a>
					</li>
				<%
					}
					if(curPage<pageCount){
				 %>
					<li>
						<a href="jzcx.jsp?curPage=<%=curPage+1%>">&raquo;</a>
					</li>
					<%} %>
				</ul>
			</div>			
		  </div>
		</div>
	</div>
</div>
  </body>
  <%db.Close();}%>
</html>