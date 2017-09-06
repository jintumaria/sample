<%@page import="java.sql.*"%>
<%
Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/fshdesign?user=root&password=");

// Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/fshdesig_jadmin?user=fshdesig_jadmin&password=try@12345");

%>
<%@ taglib uri="/WEB-INF/lib/pager-taglib.jar" prefix="pg" %>