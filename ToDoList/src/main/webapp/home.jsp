<%@page import="dto.Task"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Base64"%>
<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<style type="text/css">
#tasklist{
	text-align:center;
	height: 100%;
	width: 100%;
}
#row1,table{
	border: 1px solid black;
	border-collapse: collapse;
}
#row1{
	height: 30px;
}
</style>
</head>
<body>
		<!--get user from session  -->
		<%User user = (User)request.getSession().getAttribute("user"); %>
		<%String username = user.getUsername(); %>
		<h2>Welcome <%= username %></h2>
		<h4>Email: <%= user.getUseremail() %></h4>
		<h4>UserId: <%= user.getUserid() %></h4>
		<%String image = new String(Base64.getEncoder().encode(user.getUserimage())); %>
		<img alt="" src="data:image/jpeg;base64,<%= image%>"width="150"height="100"><br>
		
		<a href="addtask.jsp">Add Task</a><br><br>
		<h2>Task List</h2><br>
		<% List<Task> tasks = (List)request.getAttribute("tasks"); %>
		<table id="tasklist">
			<thead>
				<tr id="row1">
					<th>ID</th>
					<th>TITLE</th>
					<th>DESCRIPTION</th>
					<th>PRIORITY</th>
					<th>DUE DATE</th>
					<th>STATUS</th>
					<th>EDIT</th>
					<th>DELETE</th>
				</tr>
			</thead>
				<% int num = 1; %>
				<% for(Task task : tasks){ %>
					<tr>
						<td><%= num %></td>
						<td><%= task.getTaskTitle() %></td>
						<td><%= task.getTaskDescription() %></td>
						<td><%= task.getTaskPriority() %></td>
						<td><%= task.getTaskDueDate() %></td>
						<td><%= task.getTaskStatus() %></td>
						<td><a href="edit?id=<%=task.getTaskId()%>">Edit</a> </td>
						<td> <a href="delete?id=<%=task.getTaskId()%>">Delete</a> </td>
					</tr>
					<% num+=1; %>
				<%} %>

		</table>
		<a href="logout">Logout</a>
</body>
</html>