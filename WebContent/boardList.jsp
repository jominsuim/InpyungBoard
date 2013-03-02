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
	ResultSet results = null;
	
	// 예외 처리
	try {
		// jdbc:mysql://HOST[:PORT]/DATABASE
		String dbHost = "jdbc:mysql://localhost:3306/board?useUnicode=true&characterEncoding=utf-8";
		String dbUser = "root";
		String dbPassword = "";
		
		// DB와 커넥션 연결 
		connection = DriverManager.getConnection(dbHost, dbUser, dbPassword);
		
		// Statement 생성
		statement = connection.createStatement();
		
		// 쿼리 실행
		String query = "SELECT id, name, password, subject, content, regdate, hit";
				query += " FROM board";
		results = statement.executeQuery(query);
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
		<table border="1" cellpadding="1">
		<thead>
			<tr>
				<th>No.</th>
				<th>Subject</th>
				<th>Writer</th>
				<th>Date</th>
				<th>Hit</th>
			</tr>
		</thead>
		<tbody>
			<% while(results.next()){ %>
			<tr>
				<td><%= results.getString("id") %></td>
				<td><a href="boardView.jsp?id=<%= results.getString("id") %>"><%= results.getString("subject") %></a></td>
				<td><%= results.getString("name")  %></td>
				<td><%= results.getString("regdate")  %></td>
				<td><%= results.getString("hit") %></td>
			</tr>
			<% } %>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">
					<a href="boardWrite.jsp">글쓰기</a>
				</td>
			</tr>
		</tfoot>
		</table>
		
		<%
			if(results != null) try { results.close(); } catch(SQLException e){ }
			if(statement != null) try { statement.close(); } catch(SQLException e){ }
			if(connection != null) try { connection.close(); } catch(SQLException e){ } 
		%>
	</body>
</html>