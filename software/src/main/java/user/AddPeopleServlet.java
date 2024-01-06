package user;

import util.JDBCUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.*;

@WebServlet("/AddPeopleServlet")
public class AddPeopleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("UTF-8");
        String userId = req.getParameter("userId");
        String account = req.getParameter("account");
        String name = req.getParameter("newName");
        String sex = req.getParameter("newSex");
        String newIdentity = req.getParameter("newIdentity");
        Connection conn = JDBCUtil.getConnection();
        String sql = "insert into people(name,sex,identity) values(?,?,?)";
        PreparedStatement statement;
        try {
            statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, name);
            statement.setString(2, sex);
            statement.setString(3, newIdentity);
            int row = statement.executeUpdate();
            if (row > 0) {
                ResultSet keys = statement.getGeneratedKeys();
                int peopleId = 0;
                if (keys.next()) {
                    peopleId = keys.getInt(1);
                }
                sql = "insert into user_people (userId,peopleId) values (?,?)";
                statement = conn.prepareStatement(sql);
                statement.setInt(1, Integer.parseInt(userId));
                statement.setInt(2, peopleId);
                int isUpdate = statement.executeUpdate();
                if(isUpdate>0){
                    resp.sendRedirect("user.jsp?account="+account+"&executeFunF=true");
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
