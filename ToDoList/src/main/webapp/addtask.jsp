<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Task</title>
<style type="text/css"></style>
</head>
<body>
	<form action="addtask" method="post">
		<table>
			<tr> <td colspan="2">ADD TASK</td> </tr>
			<!-- <tr>
				<td>Task Id:</td>
				<td> <input type="text" name="taskid" required="required"></td>
			</tr> -->
			<tr>
				<td>Task Title:</td>
				<td> <input type="text" name="tasktitle" required="required"></td>
			</tr>
			<tr>
				<td>Task Description:</td>
				<td> <input type="text" name="taskdescription"> </td>
			</tr>
			<!-- <tr>
				<td><label for="low">Task Priority:</label>
                </td>
                <td><input type="radio" name="taskpriority" value="low">Low
                    <input type="radio" name="taskpriority" value="medium">Medium
                    <input type="radio" name="taskpriority" value="high">High
                </td> 
			</tr> -->
			<tr>
				<td>Due Date:</td>
				<td> <input type="date" name="taskduedate"> </td>
			</tr>
			<tr>
				<td colspan="2"> <input type="submit"> </td>
			</tr>
		</table>
	</form>
</body>
</html>