<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DBPKG.Util" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 매출 조회</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h2>도서 매출 조회</h2>
<%
	Connection conn = Util.getConnection();
	Statement stmt = conn.createStatement();

	String sql = "SELECT " +
	    	     " s.salecode AS salecode_raw, " +
			     " '2019' || TO_CHAR(s.salecode, 'FM0000') AS salecode, " +
			     " TO_CHAR(s.saledate, 'YYYY-MM-DD') AS saledate, " +
			     " b.bname AS bname, " +
			     " TO_CHAR(b.price, 'FM999,999,999') AS price, " +
			     " s.amount AS amount " +
			     " FROM sale_tbl s " +
			     " JOIN book_tbl b ON s.bcode = b.bcode " +
			     " ORDER BY s.salecode";
	ResultSet rs = stmt.executeQuery(sql);
%>
<table border="1">
	<tr>
		<th>전표번호</th>
		<th>도서명</th>
		<th>판매일자</th>
		<th>도서가격</th>
		<th>판매수량</th>
	</tr>
<%
	while(rs.next()) {
%>
	<tr>
		<td>
			<a href="modify.jsp?salecode=<%= rs.getInt("salecode_raw") %>">
				<%= rs.getString("salecode") %>
			</a>
		</td>
		<td><%= rs.getString("bname") %></td>
		<td><%= rs.getString("saledate") %></td>
		<td align="right"><%= rs.getString("price") %></td>
		<td align="right"><%= rs.getInt("amount") %></td>
	</tr>
<%
	}
%>
</table>
</body>
</html>
