<%@ page language="java" pageEncoding="utf-8"%>
<html>
<head>
    	<title>注册</title>
    	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    	<meta name="viewport" content="width=device-width,initial-scale=1.0">
    	<%
				String S=request.getParameter("E");
				if(S!=null){
					int E=Integer.parseInt(S);
					if(E == 1)
						out.print("<script>alert('此登陆ID已存在！');location.href='register.jsp';</script>");
					else if(E == 2)
						out.print("<script>alert('注册失败，请稍后重试！');location.href='register.jsp';</script>");
					else if(E == 3)
						out.print("<script>alert('登陆ID不能为空！');location.href='register.jsp';</script>");
					else if(E == 4)
						out.print("<script>alert('用户名不能为空！');location.href='register.jsp';</script>");
					else if(E == 5)
						out.print("<script>alert('密码不能为空！');location.href='register.jsp';</script>");
				}
				else;
			
			%>
</head>
<body>

			<center>
	<form class="form-horizontal"  action="registerServlet" method="post">
		<table>
		<caption></caption>
			<tr><td>登录名:</td>
			<td><input class="form-control" name="userid" type="text" placeholder="登录时的ID，不超过9位"/></td>
			<tr><td>用户名:</td>
			<td><input class="form-control" type="text" name="username" placeholder="您在系统中显示的名字"/></td>
			</tr><tr><td>密码:</td>
			<td><input class="form-control" type="password" name="pwd" placeholder="登录密码"/></td></tr>
		</table>
		<input type="submit" value="注册"/>
		<input type="reset" value="重置"/>
	</form>
	</center>
</body>
</html>
