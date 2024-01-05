package register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String connStr = "jdbc:mysql://localhost:3306/Hospital?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai";
			Connection conn = DriverManager.getConnection(connStr, "root", "yqc2001yqc");
			Statement stmt = conn.createStatement();
			
			String account = request.getParameter("account");
			String phonenum = request.getParameter("phonenum");
			String password = request.getParameter("password");
			
			String sql = "select * from User where account = '"+account+"'";
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
			
			if(!rs.next()) {
				//response.getWriter().append("54321");
				sql = "insert into user(account,password,phone) values('"+account+"','"+password+"','"+phonenum+"')";
				int i = stmt.executeUpdate(sql);
				if (i > 0) {
					System.out.println(sql);
					response.sendRedirect("register.jsp?message=yes");
				} else {
					System.out.println("添加失败");
					response.sendRedirect("register.jsp?message=no");
				}	
			}
			else {
				response.sendRedirect("register.jsp?message=have");
			}
			stmt.close();
			conn.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
