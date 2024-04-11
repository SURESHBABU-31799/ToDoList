package controller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import dao.Dao;

public class PriorityUpdate implements ServletContextListener
{

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		Dao dao = new Dao();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/todolist?user=root&password=root");
			PreparedStatement pst = conn.prepareStatement("select taskduedate from task");
			ResultSet rs = pst.executeQuery();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
			long mills = System.currentTimeMillis();
			Date cdate = new Date(mills);
			Date date1 = cdate;
			while(rs.next())
			{
				String date = rs.getString(1);
				java.util.Date date2 = sdf.parse(date);
				long dayDifference = date2.getDate() - date1.getDate();
				PreparedStatement pst1 = conn.prepareStatement("update task set taskpriority = ?");
				if(dayDifference <= 1)
				{
					pst1.setString(1, "high");
					pst1.executeUpdate();
				}
				else if(dayDifference == 2)
				{
					pst1.setString(1, "medium");
					pst1.executeUpdate();
					
				}
				else
				{
					pst1.setString(1, "low");
					pst1.executeUpdate();
				}
			}
		} catch (ClassNotFoundException | SQLException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}
