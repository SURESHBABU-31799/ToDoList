package dao;

import java.sql.*;

import javax.sql.rowset.serial.SerialBlob;

import dto.User;

public class Dao {
	public static Connection getConnection() throws SQLException, ClassNotFoundException
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/todolist?user=root&password=root");
		return conn;
	}
	public static int saveUser(User user) throws ClassNotFoundException, SQLException
	{
		Connection conn = getConnection();
		PreparedStatement psmt = conn.prepareStatement("insert into user values(?,?,?,?,?,?)");
		psmt.setInt(1, user.getUserid());
		psmt.setString(2, user.getUsername());
		psmt.setString(3,user.getUseremail());
		psmt.setLong(4, user.getUsercontact());
		psmt.setString(5,user.getUserpassword());
		Blob blob = new SerialBlob(user.getUserimage());
		psmt.setBlob(6, blob);
		int res = psmt.executeUpdate();
		return res;
	}
	public static User findByEmail(String email) throws ClassNotFoundException, SQLException
	{
		User u = new User();
		Connection con = getConnection();
		PreparedStatement pst  = con.prepareStatement("select * from user where useremail = ?");
		pst.setString(1, email);
		ResultSet rs = pst.executeQuery();
		if(rs.next())
		{
			u.setUserid(rs.getInt(1));
			u.setUsername(rs.getString(2));
			u.setUseremail(rs.getString(3));
			u.setUsercontact(rs.getLong(4));
			u.setUserpassword(rs.getString(5));
			//convert blog image to byte[]
			Blob blob = rs.getBlob(6);
//			byte[] image = blob.getBytes(0, (int)blob.length());
//			u.setUserimage(image);
			return u;
		}
		else {
			return u=null;
		}
			
	}
}
