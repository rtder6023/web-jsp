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
	request.setCharacterEncoding("UTF-8");
	Connection conn = Util.getConnection();
	Statement stmt = conn.createStatement();
	String sql = "SELECT " +
				 " s.salecode AS orgCode, " + 
			     " '2019' || TO_CHAR(s.salecode, 'FM0000') AS 전표번호, " +
			     " TO_CHAR(s.saledate, 'YYYY-MM-DD') AS 판매일자, " +
			     " b.bcode AS 도서코드, " +
			     " b.bname AS 도서명, " +
			     " TO_CHAR(b.price, 'FM999,999,999') AS 도서가격, " +
			     " s.amount AS 판매수량 " +
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
	while(rs.next()){ %>
	<tr>
		<td><a href="modify.jsp?mod_salecode=<%=rs.getString("orgCode")%>"><%=rs.getString("전표번호") %></a></td>
		<td><%=rs.getString("도서명") %></td>
		<td><%=rs.getString("판매일자") %></td>
		<td><%=rs.getString("도서가격") %></td>
		<td><%=rs.getString("판매수량") %></td>
<%		
	
	}
%>
</table>
</body>
</html>
