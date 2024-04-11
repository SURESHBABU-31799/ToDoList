<%@page import="dto.Task"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% Task task = (Task)request.getAttribute("task"); %>
	<form action="updatetask" method="post">
		<table>
			<tr>
				<td>TASK ID:</td>
				<td> <input type="text" name="taskid" hidden="" value="<%=task.getTaskId() %>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>TASK TITLE:</td>
				<td> <input type="text" name="tasktitle" value="<%=task.getTaskTitle() %>" required="required"> </td>
			</tr>
			<tr>
				<td>TASK DESCRIPTION:</td>
				<td> <input type="text" name="taskdescription" value="<%=task.getTaskDescription() %>"> </td>
			</tr>
			<tr>
				<td>CURRENT TASK PRIORITY:</td>
				<td> <h3><%= task.getTaskPriority() %></h3> </td>
			</tr>
			<!-- <tr>
				<td><label for="option1">Task Priority:</label></td>
                <td><input id="option1" type="radio" name="taskpriority" value="low">Low
                    <input id="option2" type="radio" name="taskpriority" value="medium">Medium
                    <input id="option3" type="radio" name="taskpriority" value="high">High
                </td>
			</tr> -->
			<tr>
				<td>DUE DATE:</td>
				<td> <input type="date" name="taskduedate" value="<%=task.getTaskDueDate() %>"> </td>
			</tr>
			<tr>
				<td>STATUS:</td>
				<td> <input type="text" name="taskstatus" value="<%=task.getTaskStatus() %>"> </td>
			</tr>
			<tr>
				<td colspan="2"> <input type="submit"> </td>
			</tr>
		</table>
	</form>
</body>
</html>