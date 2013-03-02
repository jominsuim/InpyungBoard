<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.util.Locale" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%
	// MySQL Driver 로딩
	Class.forName("com.mysql.jdbc.Driver");

	Connection connection = null;
	Statement statement = null;
	
	try {
		// jdbc:mysql://HOST[:PORT]/DATABASE
		String dbHost = "jdbc:mysql://localhost:3306/board?useUnicode=true&characterEncoding=utf-8";
		String dbUser = "root";
		String dbPassword = "";
		
		// POST로 boardWrite.jsp로부터 받은 값을 저장.
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String regdate = "";
		
		// 현재 날짜 구히기
		Date today = new Date();
		regdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(today);
		
		// DB와 커넥션 연결
		connection = DriverManager.getConnection(dbHost, dbUser, dbPassword);
		
		// Statement 생성
		statement = connection.createStatement();
		
		// 쿼리 실행
		String query = "INSERT INTO board (name, password, subject, content, regdate)";
				query += "VALUES ('"+name+"', '"+password+"', '"+subject+"', '"+content+"', '"+regdate+"')";
		statement.executeUpdate(query);
		
		// 모든 작업을 수행한 후 boardList.jsp 페이지로 이동.
		response.sendRedirect("boardList.jsp");
	} catch(SQLException e){
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>