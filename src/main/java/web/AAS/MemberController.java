package web.AAS;

import java.sql.*;

public class MemberController {
	public Member checkLogin(String username, String password_) throws SQLException,
    ClassNotFoundException {
		
		Connection connection = null;
		
		Class.forName("com.mysql.jdbc.Driver");
		connection=DriverManager.getConnection("jdbc:mysql://localhost/newschema","root","My12?Sql");
		
		String sql = "SELECT * FROM members WHERE username = ? and password_ = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, username);
        statement.setString(2, password_);
		
        ResultSet result = statement.executeQuery();
		Member member = null;
		
		while (result.next()) {
			member = new Member();
            member.setusername(result.getString("username"));
        }
 
        connection.close();
		
		return member;
	}
}
