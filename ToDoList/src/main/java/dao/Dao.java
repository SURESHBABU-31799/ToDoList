package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import dto.Task;
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
		Connection con = getConnection();
		PreparedStatement pst  = con.prepareStatement("select * from user where useremail = ?");
		pst.setString(1, email);
		ResultSet rs = pst.executeQuery();
		if(rs.next())
		{
			User u = new User();
			u.setUserid(rs.getInt(1));
			u.setUsername(rs.getString(2));
			u.setUseremail(rs.getString(3));
			u.setUsercontact(rs.getLong(4));
			u.setUserpassword(rs.getString(5));
			//convert blog image to byte[]
			Blob blob = rs.getBlob(6);
			byte[] image = blob.getBytes(1, (int)blob.length());
			u.setUserimage(image);
			return u;
		}
		else {
			return null;
		}
	}
	public int createTask(Task task) throws ClassNotFoundException, SQLException 
	{
		Connection conn = getConnection();
		PreparedStatement pst  = conn.prepareStatement("insert into task values(?,?,?,?,?,?,?)");
		pst.setInt(1, task.getTaskId());
		pst.setString(2, task.getTaskTitle());
		pst.setString(3, task.getTaskDescription());
		pst.setString(4, task.getTaskPriority());
		pst.setString(5, task.getTaskDueDate());
		pst.setString(6, task.getTaskStatus());
		pst.setInt(7, task.getUserId());
		int res = pst.executeUpdate();
		return res;
	}
	public List<Task> getalltaskByUserId(int userid) throws ClassNotFoundException, SQLException
	{
		Connection con = getConnection();
		PreparedStatement pst  = con.prepareStatement("select * from task where userid = ?");
		pst.setInt(1, userid);
		ResultSet rs= pst.executeQuery();
		List<Task> tasks = new ArrayList<>();
			while (rs.next())
			{
				Task task = new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
				tasks.add(task);
			}
		return tasks;
	}
	public int  deleteTaskById(int taskid) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("delete from task where taskid = ?");
		pst.setInt(1, taskid);
		int res = pst.executeUpdate();
		return res;
		
	}
	public int getUserId() throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("select max(userid) from user");
		ResultSet rs =  pst.executeQuery();
		if(rs.next())
		{
			int id = rs.getInt(1);
			return id+1;
		}
		else {
			return 1;
		}
	}
	public int getTaskId() throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("select max(taskid) from task");
		ResultSet rs = pst.executeQuery();
		if(rs.next())
		{
			int id = rs.getInt(1);
			return id+1;
		}
		else {
			return 1;
		}
	}
	public Task findtaskById(int taskid) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("select * from task where taskid = ?");
		pst.setInt(1, taskid);
		ResultSet rs = pst.executeQuery();
		rs.next();
		Task task = new Task(taskid,rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7));
		return task;	
	}
	public int updateTask(Task task) throws ClassNotFoundException, SQLException
	{
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("update task set tasktitle=?, taskdescription = ?, taskPriority = ?, taskduedate = ?, taskstatus = ? where taskid = ?");
		pst.setString(1, task.getTaskTitle());
		pst.setString(2, task.getTaskDescription());
		pst.setString(3, task.getTaskPriority());
		pst.setString(4,task.getTaskDueDate());
		pst.setString(5, task.getTaskStatus());
		pst.setInt(6, task.getTaskId());
		int res = pst.executeUpdate();
		return res;
	}
	public ResultSet getDueDate() throws ClassNotFoundException, SQLException {
		Connection conn = getConnection();
		PreparedStatement pst = conn.prepareStatement("select taskduedate from task");
		ResultSet rs = pst.executeQuery();
		return rs;
	}
}
