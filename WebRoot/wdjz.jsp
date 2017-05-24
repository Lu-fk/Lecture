<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="model.*"%>
<%@ page import="db.DB"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>我的讲座</title>
    
    <!-- 使网页适应不同分辨率的设备 -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
        
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
			

  </head>
  <%
				String S=request.getParameter("E");
				if(S!=null){
					int E=Integer.parseInt(S);
					if(E == 0)
						out.print("<script>alert('取消预约成功！');location.href='wdjz.jsp';</script>");
					else if(E == 2)
						out.print("<script>alert('操作失败！');location.href='wdjz.jsp';</script>");
				}
				else ;
				S=(String)session.getAttribute("sign");
  				if(S==null||S.equals("login")){
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
						<li>
							 <a href="jzcx.jsp"><strong>讲座查看</strong></a>
						</li>
						<li>
							 <a href="jzyy.jsp"><strong>讲座评论</strong></a>
						</li>
						<li class="active">
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
			
			<div class="tabbable" id="tabs-305889">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-179416" data-toggle="tab">已预约</a>
					</li>
					<li>
						 <a href="#panel-898624" data-toggle="tab">已参加</a>
					</li>
				</ul>
				<%
					User user=(User)session.getAttribute("user");
  					ArrayList<signTable> st=db.findSignTable();
  					Iterator iter=st.iterator();
  					ArrayList<signTable> sbst=new ArrayList<signTable>();
  					ArrayList<signTable> sast=new ArrayList<signTable>();
  					Date dt=new Date();
  					while(iter.hasNext()){
  						signTable s=(signTable)iter.next();
  						if(s.getStu_id().equals(user.getU_id())){
  							if(db.getLec(s.getLec_id()).getLec_date().after(dt)) sast.add(s);
  							else sbst.add(s);
  						}
  					}
  					int i;
					
				%>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-179416">
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
									讲座时间
								</th>
								<th>
									讲座地点
								</th>
								<th>
									状态
								</th>
								<th>
									取消预约
								</th>
							</tr>
						</thead>
						<tbody>
						<%
							i=0;
							iter=sast.iterator();
							while(iter.hasNext())
							{
								signTable s=(signTable)iter.next();
								i++;
						%>
							<tr>
								<td>
									<%=i %>
								</td>
								<td>
									<%=db.getLec(s.getLec_id()).getLec_name() %>
								</td>
								<td>
									<%=db.getLec(s.getLec_id()).getLec_date() %>
								</td>
								<td>
									<%=db.getLec(s.getLec_id()).getRoom_id() %>
								</td>
								<td>
									已预约
								</td>
								<td>
									<button class="btn btn-default" type="button" onClick="location.href='http://localhost:8080/LLecture/delappServlet?lec_id=<%=s.getLec_id() %>'">删除</button>							
								</td>
							</tr>
							<%} %>
						</tbody>
					</table>
				</div>
				<div class="tab-pane" id="panel-898624">
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
									讲座时间
								</th>
								<th>
									讲座地点
								</th>
								<th>
									状态
								</th>
								<th>
									详细信息
								</th>
							</tr>
						</thead>
						<tbody>
						<%
							i=0;
							iter=sbst.iterator();
							while(iter.hasNext())
							{
								signTable s=(signTable)iter.next();
								i++;
						%>
							<tr>
								<td>
									<%=i %>
								</td>
								<td>
									<%=db.getLec(s.getLec_id()).getLec_name() %>
								</td>
								<td>
									<%=db.getLec(s.getLec_id()).getLec_date() %>
								</td>
								<td>
									<%=db.getLec(s.getLec_id()).getRoom_id() %>
								</td>
								<td>
									<%
										if(s.getSign()==0) out.print("未签到");
										else out.print("已完成");
									%>
								</td>
								<td>
									<button class="btn btn-default" type="button" onClick="location.href='http://localhost:8080/LLecture/xxxx.jsp?lec_id=<%=s.getLec_id() %>'">详细信息</button>
								</td>
							</tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		</div>
		</div>
	</div>
</div>
  </body>
  <%db.Close(); } %>
</html>