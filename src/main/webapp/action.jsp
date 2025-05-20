<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.Util" %>
<%@ page import="java.sql.*" %>


<%
request.setCharacterEncoding("UTF-8");
Connection conn = Util.getConnection();
Statement stmt = conn.createStatement();

String salecode = request.getParameter("salecode");
String saledate = request.getParameter("saledate");
String bcode = request.getParameter("bcode");
String amount = request.getParameter("amount");

String sql = " INSERT INTO sale_tbl VALUES ( 	" +
		   	 " 								'" + salecode + "', " +
		     " 								'" + saledate + "', " +
		     " 								'" + bcode    + "', " +
		     " 								'" + amount   + "')";

ResultSet rs = stmt.executeQuery(sql);
response.sendRedirect("insert_list.jsp");
%>