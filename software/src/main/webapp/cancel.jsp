<%@page import="java.sql.*" %>
<%
	String account = request.getParameter("account");
	int oid = Integer.parseInt(request.getParameter("oid").toString());
	Class.forName("com.mysql.cj.jdbc.Driver");
	String connStr = "jdbc:mysql://localhost:3306/hospital?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai";
	Connection conn = DriverManager.getConnection(connStr, "root", "root");
	Statement stmt = conn.createStatement();
	String sql = "update record set ostatus=3 where oid="+oid;
	stmt.executeUpdate(sql);
	response.sendRedirect("user.jsp?account="+account);
%>