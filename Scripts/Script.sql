DROP TABLE board;

create table board(
      postid number primary key,
      subject varchar2(200),
      content varchar2(2000),
      writer varchar2(100),
      regdte date
   );

DROP sequence board_seq;

create sequence board_seq
      start with 1
      minvalue 1
      maxvalue 999999
      increment by 1;

CREATE TABLE boardvoca (
	postid NUMBER,
	voca varchar2(20)
	);     
     
--sample 데이터 등록
INSERT INTO board (postid,subject,CONTENT,writer,regdte) 
	VALUES (board_seq.nextval,'글 입력하기 제목','본문내용을 입력해주세요. 포도 맛있겠다. 르네상스??바로크?? 옛날 서양 그림에 나오는 포도처럼 생겼음.','김박박',sysdate);

CREATE TABLE boardMEMBER(
	id char(8),
	password varchar2(20),
	username varchar2(20),
	admin number(1)
	);

DROP TABLE boardmember;
