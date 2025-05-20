<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.Util" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
<%
Connection conn = Util.getConnection();
Statement stmt = conn.createStatement();
String sql = " SELECT " +
			 " c.comcode 										 AS 출판사코드, " +
			 " c.comname 										 AS 출판사명, " +
			 " SUM(s.amount)  									 AS 판매수량, " +
			 " TO_CHAR(SUM(b.price * s.amount), 'FM999,999,999') AS 총매출액 " +
			 " FROM book_tbl b " +
			 " JOIN sale_tbl s ON s.bcode = b.bcode " +
			 " JOIN company_tbl c ON b.comcode = c.comcode " +
			 " GROUP BY c.comcode, c.comname " +
 			 " ORDER BY SUM(b.price * s.amount) DESC "; 
ResultSet rs = stmt.executeQuery(sql);
%>
</head>
<body>
	<h2>출판사별매출조회</h2>
	<table border=1>
		<tr>
			<td>출판사코드</td><td>출판사명</td><td>판매수량</td><td>총매출액</td>
		</tr>

<% while(rs.next()){ %>
		<tr>
			<td align=right><%=rs.getString("출판사코드") %></td>
			<td align=left><%=rs.getString("출판사명") %></td>
			<td align=right><%=rs.getString("판매수량") %></td>
			<td align=right><%=rs.getString("총매출액") %></td>
		</tr>
<%} %>
	</table>
</body>
</html>