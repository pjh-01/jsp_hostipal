package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCUtil {
    // 数据库连接参数
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/hospital?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "112629";

    // 静态代码块，加载数据库驱动
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // 获取数据库连接的方法
    public static Connection getConnection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

//    // 关闭数据库连接的方法
//    public static void closeConnection(Connection connection, Statement statement) {
//        if (connection != null) {
//            try {
//                statement.close();
//                connection.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//    }
}
