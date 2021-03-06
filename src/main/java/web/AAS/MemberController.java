package web.AAS;

import java.sql.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class MemberController {
	public Member checkLogin(String userName, String password_) throws SQLException,
    ClassNotFoundException {
		
		
		Connection connection = null;
		
		Class.forName("com.mysql.jdbc.Driver");
		connection=DriverManager.getConnection("jdbc:mysql://localhost/arkadasaramasitesidb","root","12345");
		
		String sql = "SELECT userID,userName,privelege FROM member WHERE userName = ? and password_ = ?";

		PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, userName);
        statement.setString(2, password_);
		
        ResultSet result = statement.executeQuery();
		Member member = null;
		
		if (result.next()) {
			member = new Member();
            member.setuserName(result.getString("userName"));
            member.setuserID(result.getInt("userID"));
            member.setPrivelege(result.getString("privelege"));

        }
 
        connection.close();
		
		return member;
	}
	public void deleteUser(String userName) throws SQLException,ClassNotFoundException {
		
		
		Connection connection = null;
		
		Class.forName("com.mysql.jdbc.Driver");
		connection=DriverManager.getConnection("jdbc:mysql://localhost/arkadasaramasitesidb","root","12345");
		
		String sql = "DELETE FROM member WHERE userName= ?";
		PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, userName);
        statement.execute();
              
        connection.close();
		return;
	}
	
	public boolean findUser(String userName) throws SQLException,ClassNotFoundException {
		
		
		Connection connection = null;
		
		Class.forName("com.mysql.jdbc.Driver");
		connection=DriverManager.getConnection("jdbc:mysql://localhost/arkadasaramasitesidb","root","12345");
		
		String sql = "Select FROM member WHERE userName= ?";
		PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, userName);
        boolean result = statement.execute();
        

        connection.close();
		return result;
	}

	public void makeAdmin(String userName) throws ClassNotFoundException,SQLException {
		Connection connection = null;
		
		Class.forName("com.mysql.jdbc.Driver");
		connection=DriverManager.getConnection("jdbc:mysql://localhost/arkadasaramasitesidb","root","12345");
		
		String sql = "UPDATE member SET privelege =? WHERE userName= ?";
		PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, "1");
        statement.setString(2, userName);
        statement.execute();
        

        connection.close();
		return;		
	}


}
