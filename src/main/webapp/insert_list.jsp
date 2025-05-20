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
	    	 " '2019' || TO_CHAR(s.salecode, 'FM0000') 		AS 전표번호, " +
		     " TO_CHAR(s.saledate, 'YYYY-MM-DD')       		AS 판매일자, " +
		     " b.bname                                      AS 도서명, " +
		     " TO_CHAR(b.price, 'FM999,999,999')            AS 도서가격, " +
		     " s.amount 									AS 수량, " +
		     " TO_CHAR(b.price * s.amount, 'FM999,999,999') AS 총판매금액, "+ 
		     " c.comname 									AS 출판사명 " +
			 " FROM sale_tbl s " +
			 " JOIN book_tbl b ON s.bcode = b.bcode " +
			 " JOIN company_tbl c ON b.comcode = c.comcode " +
			 " ORDER BY s.salecode "; 
ResultSet rs = stmt.executeQuery(sql);
%>
</head>
<body>
	<h2>도서 통합 매출 조회</h2>
	<table border=1>
		<tr>
			<td align=left width=100px>전표번호</td>
			<td align=left width=250px>도서명</td>
			<td align=left width=100px>판매일자</td>
			<td align=left width=110px>도서가격</td>
			<td align=left width=100px>판매수량</td>
		</tr>

<% while(rs.next()){ %>
		<tr>
			<td align=right><a href="modify.jsp?mod_salecode=<%= rs.getString("전표번호") %>"><%=rs.getString("전표번호") %></a></td>
			<td align=left><%=rs.getString("도서명") %></td>
			<td align=left><%=rs.getString("판매일자") %></td>
			<td align=right><%=rs.getString("도서가격") %></td>
			<td align=right><%=rs.getString("수량") %></td>
		</tr>
<%} %>
	</table>
</body>
</html>