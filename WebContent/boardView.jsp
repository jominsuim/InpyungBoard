<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%
	// MySQL Driver 로딩
	Class.forName("com.mysql.jdbc.Driver");

	// 커넥션, 상태, 결과를 담을 변수를 선언.
	Connection connection = null;
	Statement statement = null;
	ResultSet result = null;
	
	// 예외 처리
	try {
		// jdbc:mysql://HOST[:PORT]/DATABASE
		String dbHost = "jdbc:mysql://localhost:3306/board?useUnicode=true&characterEncoding=utf-8";
		String dbUser = "root";
		String dbPassword = "";
		
		// 해당 게시판 id값 얻기
		int id = Integer.parseInt(request.getParameter("id"));
		
		// DB와 커넥션 연결 
		connection = DriverManager.getConnection(dbHost, dbUser, dbPassword);
		
		// Statement 생성
		statement = connection.createStatement();
		
		// 쿼리 실행
		String query = "SELECT id, name, password, subject, content, regdate, hit";
				query += " FROM board";
				query += " WHERE id = "+id+"";
		
		result = statement.executeQuery(query);
		result.next();
	} catch(SQLException e){
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
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
				<th colspan="4"><%= result.getString("subject") %></th>
			</tr>
			<tr>
				<th>Name</th>
				<td><%= result.getString("name") %></td>
				<th>Date</th>
				<td><%= result.getString("regdate") %></td>
			</tr>
			<tr>
				<th colspan="4">content</th>
			</tr>
			<tr>
				<td colspan="4">
					<%= result.getString("content") %>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<a href="#" onclick="alert('Comming soon...');" />수정</a>
					<a href="boardList.jsp">되돌아 가기</a>
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>