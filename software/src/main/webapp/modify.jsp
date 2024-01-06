<%@ page import="util.JDBCUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
Created by IntelliJ IDEA.
User: 宇宙无敌超级大帅哥
Date: 2024/1/5
Time: 16:03
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modify</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String account = request.getParameter("account");
    String username = request.getParameter("username");
    String realName = request.getParameter("realName");
    int gender = request.getParameter("gender").equals("男") ? 0 : 1;
    String phone = request.getParameter("phone");
    String identification = request.getParameter("identification");

    Connection connection = JDBCUtil.getConnection();

    String sql = "update user set username =?,realName=?,gender=?,phone=?,identification=? where account = ?";
    try {
        PreparedStatement statement = connection.prepareStatement(sql);
        // 设置参数
        statement.setString(1, username);
        statement.setString(2, realName);
        statement.setInt(3, gender);
        statement.setString(4, phone);
        statement.setString(5, identification);
        statement.setString(6, account);

        // 执行更新操作
        int rowsUpdated = statement.executeUpdate();

        if (rowsUpdated > 0) {
            System.out.println("用户信息更新成功！");
            response.sendRedirect("user.jsp?account=" + account);
        } else {
            System.out.println("用户信息更新失败！");
        }
        statement.close();
        connection.close();
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }

%>
</body>
</html>
