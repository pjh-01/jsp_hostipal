package search;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RecordSearchServlet")

public class RecordSearchServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取搜索类型和搜索日期参数
        int recordType = Integer.parseInt(request.getParameter("recordType"));
        String account = request.getParameter("account");
        String Date = request.getParameter("Date");

        String connStr = "jdbc:mysql://localhost:3306/Hospital?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai";
        try (Connection conn = DriverManager.getConnection(connStr, "root", "123456")) {
            // 构建基础的 SQL 查询语句
            String baseSql = "SELECT * FROM record NATURAL JOIN doctor WHERE ostatus=? AND account=? AND time LIKE ?";
            try (PreparedStatement pstmt = conn.prepareStatement(baseSql)) {
                // 设置 ostatus 参数，假设 ostatus=3 表示已取消订单
                pstmt.setInt(1, recordType);

                // 设置 account 参数，假设 account 是用户的账号，这里你需要根据实际情况修改
                pstmt.setString(2, account);

                // 追加日期条件
                pstmt.setString(3, "%" + Date + "%");

                // 执行查询
                try (ResultSet rs = pstmt.executeQuery()) {
                    // 获取输出流
                	response.setCharacterEncoding("UTF-8");
                    PrintWriter out = response.getWriter();

                    // 输出 HTML 头部
                    out.println("<html><head><title>Search Result</title></head><body>");

                    // 处理查询结果，将结果返回给前端
                    while (rs.next()) {
                        // 你可以根据查询结果的列名或索引获取相应的数据
                        int oid = rs.getInt("oid");
                        String time = rs.getString("time");
                        String department = rs.getString("darea");
                        String dname = rs.getString("dname");

                        // 输出到 HTML
                        out.println("<div class=\"order\">");
                        out.println("<div class=\"ac\">订单号<span>( " + oid + " )</span></div>");
                        out.println("<div class=\"ac_d\">");
                        out.println("<div class=\"department\">科室：<span>【" + department + "】</span></div>");
                        out.println("<div class=\"doc\">就诊医师<span>" + dname + "</span></div>");
                        out.println("<div class=\"time\">时间:<span>" + time + "</span></div>");
                        out.println("</div></div>");
                    }

                    // 输出 HTML 底部
                    out.println("</body></html>");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // 处理异常
            System.out.println("SQLException: " + e.getMessage());
        }
    }
}
