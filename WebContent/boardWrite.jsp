<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Board List</title>
		<meta charset="UTF-8" />
		<link href="./resources/css/style.css" />
	</head>
	<body>
		<form action="boardWriteConfirm.jsp" method="POST">
		<table border="1" cellpadding="5">
			<tr>
				<th colspan="4">Subject</th>
			</tr>
			<tr>
				<td colspan="4"><input type="text" name="subject" size="60" /></td>
			</tr>
			<tr>
				<th>Name</th>
				<td><input type="text" name="name" size="20" /></td>
				<th>Password</th>
				<td><input type="text" name="password" size="20" /></td>
			</tr>
			<tr>
				<th colspan="4">content</th>
			</tr>
			<tr>
				<td colspan="4">
					<textarea cols="50" rows="18" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="submit" value="Write" />
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>