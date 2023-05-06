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