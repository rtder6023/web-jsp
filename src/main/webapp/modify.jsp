<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<%
	request.setCharacterEncoding("UTF-8");

	String salecodeParam = request.getParameter("salecode");
	Connection conn = Util.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String saledate = "", bcode = "", amount = "";

	if (salecodeParam != null && !salecodeParam.equals("")) {
		String sql = " SELECT TO_CHAR(saledate, 'YYYY-MM-DD') AS saledate, " + 
					 " bcode, amount " + 
					 " FROM sale_tbl WHERE salecode = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(salecodeParam));
		rs = pstmt.executeQuery();

		if (rs.next()) {
			saledate = rs.getString("saledate");
			bcode = rs.getString("bcode");
			amount = rs.getString("amount");
		}
	}

	Statement stmtBook = conn.createStatement();
	ResultSet rsBook = stmtBook.executeQuery("SELECT bcode, bname FROM book_tbl");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서 매출 수정</title>
</head>
<body>
<h2>도서 매출 수정</h2>
<form action="update_action.jsp" method="post">
	<table border="1">
		<tr>
			<td>전표번호</td>
			<td><input type="text" name="salecode" value="<%= salecodeParam %>" readonly></td>
		</tr>
		<tr>
			<td>판매일자</td>
			<td><input type="date" name="saledate" value="<%= saledate %>"></td>
		</tr>
		<tr>
			<td>도서</td>
			<td>
				<select name="bcode">
				<%
					while(rsBook.next()) {
						String code = rsBook.getString("bcode");
						String name = rsBook.getString("bname");
						String selected = code.equals(bcode) ? "selected" : "";
				%>
					<option value="<%= code %>" <%= selected %>><%= name %></option>
				<%
					}
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input type="number" name="amount" value="<%= amount %>"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="수정 완료"></td>
		</tr>
	</table>
</form>
</body>
</html>
