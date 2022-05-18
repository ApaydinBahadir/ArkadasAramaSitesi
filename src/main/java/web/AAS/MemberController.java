package web.AAS;

import java.sql.*;

public class MemberController {
	public Member checkLogin(String username, String password_) throws SQLException,
    ClassNotFoundException {
		
		Connection connection = null;
		
		Class.forName("com.mysql.jdbc.Driver");
<<<<<<< Updated upstream
		connection=DriverManager.getConnection("jdbc:mysql://localhost/newschema","root","My12?Sql");
		
		String sql = "SELECT * FROM members WHERE username = ? and password_ = ?";
=======
		connection=DriverManager.getConnection("jdbc:mysql://localhost/newschema","root","12345");
		
		String sql = "SELECT userID,userName,privelege FROM member WHERE userName = ? and password_ = ?";
>>>>>>> Stashed changes
		PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, username);
        statement.setString(2, password_);
		
        ResultSet result = statement.executeQuery();
		Member member = null;
		
		while (result.next()) {
			member = new Member();
<<<<<<< Updated upstream
            member.setusername(result.getString("username"));
=======
            member.setuserName(result.getString("userName"));
            member.setuserID(result.getInt("userID"));
            member.setPrivelege(result.getString("privelege"));
>>>>>>> Stashed changes
        }
 
        connection.close();
		
		return member;
	}
<<<<<<< Updated upstream
=======
	
	public void deleteUser(String userName) throws SQLException,ClassNotFoundException {
		
		
		Connection connection = null;
		
		Class.forName("com.mysql.jdbc.Driver");
		connection=DriverManager.getConnection("jdbc:mysql://localhost/newschema","root","12345");
		
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
		connection=DriverManager.getConnection("jdbc:mysql://localhost/newschema","root","12345");
		
		String sql = "Select FROM member WHERE userName= ?";
		PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, userName);
        boolean result = statement.execute();
        

        connection.close();
        System.out.print(result);
		return result;
	}

	public void makeAdmin(String userName) throws ClassNotFoundException,SQLException {
		Connection connection = null;
		
		Class.forName("com.mysql.jdbc.Driver");
		connection=DriverManager.getConnection("jdbc:mysql://localhost/newschema","root","12345");
		
		String sql = "UPDATE member SET privelege =? WHERE userName= ?";
		PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, "1");
        statement.setString(2, userName);
        boolean result = statement.execute();
        

        connection.close();
        System.out.print(result);
		return;		
	}
	
>>>>>>> Stashed changes
}
