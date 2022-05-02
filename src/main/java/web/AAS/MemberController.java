package web.AAS;

import java.sql.*;

public class MemberController {
	public Member checkLogin(String email, String password_) throws SQLException,
    ClassNotFoundException {
		
		Connection connection = null;
		
		Class.forName("com.mysql.jdbc.Driver");
		connection=DriverManager.getConnection("jdbc:mysql://localhost/newschema","root","My12?Sql");
		
		String sql = "SELECT * FROM members WHERE email = ? and password_ = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, password_);
		
        ResultSet result = statement.executeQuery();
		Member member = null;
		
		if (result.next()) {
			member = new Member();
            member.setusername(result.getString("username"));
            member.setemail(email);
        }
 
        connection.close();
		
		return member;
	}
}
