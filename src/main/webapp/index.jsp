<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='style.css'>
</head>
<body>
	<header><h2>서점 매출관리 ver 1.0</h2></header>
	<nav>
		<ul>
			<li><a target='section_page' href='insert.jsp'>도서매출등록</a></li>
			<li><a target='section_page' href='insert_list.jsp'>통합매출조회/수정</a></li>
			<li><a target='section_page' href='insert2.jsp'>출판사별매출조회</a></li>
			<li><a target='section_page' href='insert3.jsp'>도서별매출조회</a></li>
			<li><a target='section_page' href='main.jsp'>홈으로</a></li>
		</ul>
	</nav>
	<section>
		<iframe name='section_page' src='main.jsp'></iframe>
	</section>
	<footer><h4>HREDKOREA copyrightⓒ 2016 All rights reserved. Human Resources Development Services of Korea.</h4></footer>
</body>
</html>