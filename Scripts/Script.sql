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
	voca varchar2(20),
	frequency number
	);     

CREATE TABLE boardMEMBER(
	id char(8),
	password varchar2(20),
	username varchar2(20),
	admin number(1)
	);

DROP TABLE boardmember;

INSERT INTO boardmember VALUES ('sample78','password','글로벌',1);

DROP TABLE boardcomment;

CREATE TABLE BOARDCOMMENT (
	id NUMBER PRIMARY KEY,
	postid NUMBER,
	writer char(8),
	COMMENTS varchar2(1000),
	writedate DATE
);

create sequence comment_seq
      start with 1
      minvalue 1
      maxvalue 999999
      increment by 1;
      
DROP TABLE BOARDFILE ;

CREATE TABLE boardfile(
	postid NUMBER,
	fileid NUMBER,
	filename varchar2(50)
	);
	
SELECT * FROM boardfile;
SELECT * FROM BOARDMEMBER b ;

