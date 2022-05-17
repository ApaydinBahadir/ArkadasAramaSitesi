package web.AAS;

import java.sql.*;

public class MemberController {
	public Member checkLogin(String userName, String password_) throws SQLException,
    ClassNotFoundException {
		
		
		Connection connection = null;
		
		Class.forName("com.mysql.jdbc.Driver");
		connection=DriverManager.getConnection("jdbc:mysql://localhost/arkadasaramasitesidb","root","My12?Sql");
		
		String sql = "SELECT userID,userName FROM member WHERE userName = ? and password_ = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, userName);
        statement.setString(2, password_);
		
        ResultSet result = statement.executeQuery();
		Member member = null;
		
		if (result.next()) {
			member = new Member();
            member.setuserName(result.getString("userName"));
            member.setuserID(result.getInt("userID"));
        }
 
        connection.close();
		
		return member;
	}
	
	
}
