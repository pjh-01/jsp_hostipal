<%@ page import="java.sql.Connection" %>
<%@ page import="util.JDBCUtil" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 宇宙无敌超级大帅哥
  Date: 2024/1/6
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int userId = Integer.parseInt(request.getParameter("userId"));
    int peopleId = Integer.parseInt(request.getParameter("peopleId"));
    String account = request.getParameter("account");
    Connection conn = JDBCUtil.getConnection();
    String sql = "delete from people where id = ?";
    PreparedStatement statement;
    try {
        statement= conn.prepareStatement(sql);
        statement.setInt(1,peopleId);
        if(statement.executeUpdate() > 0) {
            sql = "delete from user_people where userId = ? and peopleId = ?";
            statement = conn.prepareStatement(sql);
            statement.setInt(1,userId);
            statement.setInt(2,peopleId);
            if(statement.executeUpdate() > 0) {
                response.sendRedirect("user.jsp?account="+account+"&executeFunF=true");
            }
        }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }


%>
</body>
</html>
