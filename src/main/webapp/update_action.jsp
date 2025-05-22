<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = Util.getConnection();
	Statement stmt = conn.createStatement();
	String salecode = request.getParameter("salecode");
	String saledate = request.getParameter("saledate");
	String bcode = request.getParameter("bcode");
	String amount = request.getParameter("amount");

	String sql = " UPDATE sale_tbl SET " +
				 " bcode =  '" + bcode + "', " + 
				 " amount = '" + amount + "' " +
				 " WHERE salecode =  " + salecode;
	stmt.executeUpdate(sql);
	response.sendRedirect("insert_list.jsp");
%>
