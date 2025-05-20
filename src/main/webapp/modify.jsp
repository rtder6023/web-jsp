<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='style.css'>
</head>
<body>
<h2>도서 매출 수정</h2>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = Util.getConnection();
	Statement stmt = conn.createStatement();
%>
<form name='frm' action='action.jsp'>
<table border=1>
	<tr>
		<td width="150px">전표번호</td>
		<td width="450px"><input type='text' name='salecode' id='salecode' value=''></td>
	</tr>
	<tr>
		<td>판매일자</td>
		<td><input type='text' name='saledate' id='saledate' value=''></td>
	</tr>
	<tr>
		<td>신청도서</td>
		<td>
			<select name="bcode" id="bcode">
				<%
					String sql = " SELECT	bcode " +
								 " ,		bname " +
								 " FROM     book_tbl ";
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
				%>
					<option value="<%=rs.getString("bcode") %>"><%=rs.getString("bname") %></option>
				<%
				}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td>판매수량</td>
		<td><input type="text" name="amount" id="amount"></td>
	</tr>
	<tr>
		<td colspan=2>
			<input type="submit" value="수정"></input>
	</tr>
</table>
</form>
</body>
</html>