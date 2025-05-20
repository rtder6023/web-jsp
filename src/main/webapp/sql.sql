DROP TABLE company_tbl;
DROP TABLE book_tbl;
DROP TABLE sale_tbl;

CREATE TABLE company_tbl(
	comcode number(4) primary key not null,
	comname varchar2(50)
)

INSERT INTO company_tbl VALUES (1001, '책그루');
INSERT INTO company_tbl VALUES (1002, '김영사');
INSERT INTO company_tbl VALUES (1003, '문학동네');
INSERT INTO company_tbl VALUES (1004, '루비페이퍼');

CREATE TABLE book_tbl(
	bcode varchar2(5) primary key not null,
	bname varchar2(100),
	price number(8),
	comcode number(4),
	FOREIGN KEY (comcode) REFERENCES company_tbl(comcode)
)

INSERT INTO book_tbl VALUES ('A0001', '공부머리 독서법', 16500, 1001);
INSERT INTO book_tbl VALUES ('A0002', '사피엔스', 22000, 1002);
INSERT INTO book_tbl VALUES ('A0003', '여행의 이유', 13500, 1003);
INSERT INTO book_tbl VALUES ('A0004', '연필로 쓰기', 15500, 1003);
INSERT INTO book_tbl VALUES ('A0005', '팩트풀니스', 19800, 1002);
INSERT INTO book_tbl VALUES ('B0001', '처음 해보는 자바 프로그래밍', 34000, 1004);
INSERT INTO book_tbl VALUES ('B0002', '될 때까지 안드로이드', 40000, 1004);
INSERT INTO book_tbl VALUES ('B0003', '스프링 퀵스타트', 30000, 1004);

CREATE TABLE sale_tbl(
	salecode number(8) primary key not null,
	saledate date,
	bcode varchar2(5),
	amount number(4)
)

INSERT INTO sale_tbl VALUES (0001, '20190101', 'A0001', 4);
INSERT INTO sale_tbl VALUES (0002, '20190101', 'B0001', 3);
INSERT INTO sale_tbl VALUES (0003, '20190101', 'B0003', 2);
INSERT INTO sale_tbl VALUES (0004, '20190101', 'A0001', 1);
INSERT INTO sale_tbl VALUES (0005, '20190101', 'A0002', 5);
INSERT INTO sale_tbl VALUES (0006, '20190101', 'B0002', 3);
INSERT INTO sale_tbl VALUES (0007, '20190101', 'B0003', 2);
INSERT INTO sale_tbl VALUES (0008, '20190101', 'B0001', 2);
INSERT INTO sale_tbl VALUES (0009, '20190101', 'A0003', 1);
INSERT INTO sale_tbl VALUES (0010, '20190101', 'A0004', 1);

SELECT TO_CHAR(salecode, 'FM00000') FROM sale_tbl;

SELECT 
    '2019' || TO_CHAR(s.salecode, 'FM0000') AS 전표번호,
    TO_CHAR(s.saledate, 'YYYY-MM-DD') AS 판매일자,
    b.bname AS 도서명,
    TO_CHAR(b.price, 'FM999,999,999') AS 도서가격,
    s.amount AS 수량,
    TO_CHAR(b.price * s.amount, 'FM999,999,999') AS 총판매금액,
    c.comname AS 출판사명
FROM sale_tbl s
JOIN book_tbl b ON s.bcode = b.bcode
JOIN company_tbl c ON b.comcode = c.comcode
ORDER BY s.salecode;

SELECT TRIM(MAX(salecode)+1) AS sale_no
FROM sale_tbl;

SELECT 
	c.comcode AS 출판사코드,
	c.comname AS 출판사명,
	SUM(s.amount)  AS 판매수량,
	TO_CHAR(SUM(b.price * s.amount), 'FM999,999,999') AS 총매출액
FROM book_tbl b
JOIN sale_tbl s ON s.bcode = b.bcode
JOIN company_tbl c ON b.comcode = c.comcode
GROUP BY c.comcode, c.comname
ORDER BY SUM(b.price * s.amount) DESC;

SELECT 
	b.bname AS 도서명,
	SUM(s.amount) AS 판매수량,
	TO_CHAR(SUM(b.price * s.amount), 'FM999,999,999') AS 총매출액
FROM book_tbl b
JOIN sale_tbl s ON s.bcode = b.bcode
GROUP BY b.bname
ORDER BY SUM(b.price * s.amount) DESC;

SELECT 
		    	 '2019' || TO_CHAR(s.salecode, 'FM0000') 		AS 전표번호, 
			     TO_CHAR(s.saledate, 'YYYY-MM-DD')       		AS 판매일자, 
			     b.bname                                      AS 도서명, 
			     TO_CHAR(b.price, 'FM999,999,999')            AS 도서가격, 
			     s.amount 									AS 수량, 
			     TO_CHAR(b.price * s.amount, 'FM999,999,999') AS 총판매금액, 
			     c.comname 									AS 출판사명 
				 FROM sale_tbl s 
				 JOIN book_tbl b ON s.bcode = b.bcode 
				 JOIN company_tbl c ON b.comcode = c.comcode 
				 ORDER BY s.salecode;