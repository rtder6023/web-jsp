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
		alert('매출등록이 완료되었습니다.');
		return true;
		
	}
</script>
</head>
<body>
<h2>도서 매출 등록</h2>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = Util.getConnection();
	Statement stmt = conn.createStatement();
	String sql = " SELECT TRIM(TO_CHAR(MAX(salecode)+1, '0000')) AS salecode " +
		  	     " FROM sale_tbl ";
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	String salecode = rs.getString("salecode");
%>
<form name='frm' action='action.jsp'>
<table border=1>
	<tr>
		<td width="150px">전표번호</td>
		<td width="450px"><input type='text' name='salecode' id='salecode' value='<%=salecode%>' readonly></td>
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
					sql = " SELECT	bcode " +
								 " ,		bname " +
								 " FROM     book_tbl ";
				rs = stmt.executeQuery(sql);
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
		<td><input type="text" name="amount" id="amount" value=''></td>
	</tr>
	<tr>
		<td colspan=2>
			<input type="submit" value="매출등록"></input>
			<input type="button" value="다시쓰기" onclick='window.location.reload()'></input>
	</tr>
</table>
</form>
<script>
	document.forms['frm'].onsubmit = check_val;
</script>
</body>
</html>