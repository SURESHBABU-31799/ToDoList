package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.Task;
import dto.User;

@WebServlet("/addtask")
public class AddTask extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		int taskid = Integer.parseInt(req.getParameter("taskid"));
		String tasktitle = req.getParameter("tasktitle");
		String taskdescription = req.getParameter("taskdescription");
//		String taskpriority = req.getParameter("taskpriority");
		String taskduedate = req.getParameter("taskduedate");
		User u = (User)req.getSession().getAttribute("user");
		int userid = u.getUserid();
		Dao dao = new Dao();
		try {
			Task tasks = new Task(dao.getTaskId(), tasktitle, taskdescription, "Default", taskduedate, "Pending", userid);
			int res = dao.createTask(tasks);
			if(res > 0 )
			{
				
				User user =(User)req.getSession().getAttribute("user");
				req.setAttribute("tasks", dao.getalltaskByUserId(user.getUserid()));
				RequestDispatcher dispatcher = req.getRequestDispatcher("home.jsp");
				dispatcher.include(req, resp);
			}
			else {
				resp.getWriter().print("Failed");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
