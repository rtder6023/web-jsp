<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<%
	request.setCharacterEncoding("UTF-8");

	String salecode = request.getParameter("salecode");
	String saledate = request.getParameter("saledate");
	String bcode = request.getParameter("bcode");
	String amount = request.getParameter("amount");

	Connection conn = Util.getConnection();
	String sql = "UPDATE sale_tbl SET saledate = TO_DATE(?, 'YYYY-MM-DD'), bcode = ?, amount = ? WHERE salecode = ?";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, saledate);
	pstmt.setString(2, bcode);
	pstmt.setInt(3, Integer.parseInt(amount));
	pstmt.setInt(4, Integer.parseInt(salecode));

	int result = pstmt.executeUpdate();

	if(result > 0){
%>
	<script>
		alert("수정이 완료되었습니다.");
		location.href = "main.jsp";
	</script>
<%
	} else {
%>
	<script>
		alert("수정 실패");
		history.back();
	</script>
<%
	}
%>
