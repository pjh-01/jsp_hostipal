package login;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("1234");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String connStr = "jdbc:mysql://localhost:3306/Hospital?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai";
			Connection conn = DriverManager.getConnection(connStr, "root", "123456");
			Statement stmt = conn.createStatement();
			
			String sql = "select * from User";
			ResultSet rs=stmt.executeQuery(sql);
			String account = request.getParameter("account");
			String password = request.getParameter("password");
			String message = "";
			boolean Account = false;
			boolean Password = false;
			response.getWriter().append("12345");
			if(rs != null) {
				while(rs.next()) {
					String acc = rs.getString("account");
					String pwd = rs.getString("password");
					if(account.equals(acc)) {
						Account = true;
						if(password.equals(pwd)) {
							Password = true;
							message="yes";
							break;
						}
					}
				}
			}
			
			if(Account&&!Password) {
				message="password";
			}
			else if(!Account){
				message="account";
			}
			response.sendRedirect("login.jsp?message="+message+"&account="+account);
			
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
