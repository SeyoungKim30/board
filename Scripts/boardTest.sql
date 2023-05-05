CREATE TABLE boardvoca (
	postid NUMBER,
	voca varchar2(20)
	);

INSERT ALL 
INTO boardvoca(postid,voca) VALUES (123,'234234')
INTO boardvoca(postid,voca) VALUES (2,'asdf')
SELECT * FROM dual;

SELECT * FROM BOARDVOCA ;

DELETE boardvoca;
DELETE board WHERE postid <163;

SELECT * FROM board ORDER BY regdte DESC ;

SELECT count(DISTINCT voca),count(voca) FROM boardvoca ;

SELECT voca FROM boardvoca WHERE postid=184;

--해당 단어가 있는 글의 갯수를 구하기
SELECT * FROM 