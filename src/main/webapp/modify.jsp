<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = Util.getConnection();
	Statement stmt = conn.createStatement();
	String salecode = request.getParameter("mod_salecode");
	ResultSet rs1 = stmt.executeQuery(" SELECT * FROM sale_tbl WHERE salecode =" + salecode);
	rs1.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 매출 수정</title>
<link rel='stylesheet' type='text/css' href='style.css'>	
<script>
function check_val() {
	var amount = document.frm.amount.value;
	if (amount == ''){
		alert('판매수량이 올바르지 않습니다.');
		frm.amount.focus();
		return false;
	} else if (amount <= 0){
		alert('판매수량이 올바르지 않습니다.');
		frm.amount.focus();
		return false;
	}
	alert("수정이 완료되었습니다.");
	location.href = "insert_list.jsp";
	return true;
</script>
</head>
<body>
<h2>도서 매출 수정</h2>
<form name="frm" action="update_action.jsp">
	<table border="1">
		<tr>
			<td width="150px">전표번호</td>
			<td width="450px"><input name='salecode' id='salecode' value='<%= rs1.getInt("salecode") %>' readonly></td>
		</tr>
		<tr>
			<td>판매일자</td>
			<td><input name='saledate' id='saledate' value='<%= rs1.getString("saledate") %>'></td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input name='amount' id='amount' value='<%= rs1.getString("amount")%>'></td>
		</tr>
		<tr>
			<td>신청도서</td>
			<td>
				<select name="bcode">
				<%
				String sql = " SELECT	bcode " +
						 " ,		bname " +
						 " FROM     book_tbl ";
				ResultSet rs2 = stmt.executeQuery(sql);
					while(rs2.next()) {
				%>
					<option value='<%= rs2.getString("bcode") %>' ><%= rs2.getString("bname") %></option>
				<%
					}
				%>
				</select>
			</td>
		</tr>
		
		<tr>
			<td colspan="2"><input type="submit" value="수정 완료"></td>
		</tr>
	</table>
</form>
</body>
</html>
