<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>预约成功</title>
<link rel="stylesheet" href="ok.css">
</head>
<%
	int did = Integer.parseInt(request.getParameter("did").toString());
	String account = request.getParameter("account");
	String time = request.getParameter("time");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	String connStr = "jdbc:mysql://localhost:3306/hospital?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai";
	Connection conn = DriverManager.getConnection(connStr, "root", "123456");
	Statement stmt = conn.createStatement();	

	String sql = "insert into record(did,account,time,ostatus) values("+did+",'"+account+"','"+time+"','1')";
	int i = stmt.executeUpdate(sql);
	String message="预约失败！";
	if(i>0) message="预约成功！";
%>
<body>										
	<div class="m-box">
		<div class="m-head">
			<div class="m-title">
				<div class="t-name">XXXXX医院</div>
				<div class="t-return"><a href='do.jsp?account=<%=account %>&did=<%=did %>' style="color: white">返回</a></div>
			</div>
		</div>
		<div class="info"><div><%=message %></div></div>
	</div>	
</body>
</html>