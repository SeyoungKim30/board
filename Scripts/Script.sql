DROP TABLE board;

create table board(
      num number primary key,
      refno number,
      subject varchar2(200),
      content varchar2(2000),
      writer varchar2(100),
      readcnt number,
      regdte date,
      uptdte date
   );

CREATE TABLE boardComment (
  id NUMBER PRIMARY KEY,
  refno NUMBER,
  writer varchar2(200),
  COMMENTS varchar2(1000),
  writedate date
  );

create sequence comment_seq
      start with 1
      minvalue 1
      maxvalue 999999
      increment by 1;
 
DROP sequence board_seq;

create sequence board_seq
      start with 1
      minvalue 1
      maxvalue 999999
      increment by 1;

     --sample 데이터 등록
insert into board values(1,0,'첫번째글','내용','홍길동',0, sysdate, sysdate);    
insert into board values(board_seq.nextval,0,'test용 더미입력','내용','박박',0, sysdate, sysdate);    
insert into board values(board_seq.nextval,0,'ㅎㅇㅇ','내용','김김',0, sysdate, sysdate);    

  select * 
    from board 
    WHERE 1=1
    AND subject LIKE '%'||''||'%'
    AND writer LIKE '%'||''||'%'

SELECT * FROM board 
WHERE subject LIKE 
'%'||''||'%' AND 
writer LIKE '%'||''||'%' AND 
1=1;

update board set readcnt = readcnt+1 where no = 21;

--답변수만 표시하는거
SELECT b1.*, b2.recount FROM board b1, (SELECT refno, COUNT(no) recount FROM board b2 GROUP BY refno) b2 
WHERE b1.refno=0 AND b2.refno(+)=b1.NO order by b1.NO DESC ;

UPDATE board SET CONTENT = '안녕햐세요', uptdte=sysdate WHERE NO=1;
 SELECT board_seq.nextval FROM dual;

CREATE TABLE boardfile (
fileno number primary KEY,
refno number,
filename varchar2(200)
)

create sequence file_seq
      start with 1
      minvalue 1
      maxvalue 999999
      increment by 1;
      
SELECT * FROM boardfile;


  select * from board
    START WITH refno=0
    CONNECT BY PRIOR NO=refno;
    ;
    
   	SELECT b1.*,LEVEL , b2.recount 
	FROM board b1, (SELECT refno, COUNT(no) recount FROM board b2 GROUP BY refno) b2 
	WHERE 
	subject LIKE '%'||''||'%' and
	writer LIKE '%'||''||'%' and
	b2.refno(+)=b1.NO
	START WITH b1.refno=0
    CONNECT BY PRIOR NO=b1.refno
	order siblings by b1.no DESC;
	
select * from
(SELECT b1.*, level,rownum rnum,b2.recount 
	FROM board b1, (SELECT refno, COUNT(no) recount FROM board b2 GROUP BY refno) b2 
	WHERE 
	subject LIKE '%'||''||'%' and
	writer LIKE '%'||''||'%' and
	b2.refno(+)=b1.NO
START WITH b1.refno=0
CONNECT BY PRIOR NO=b1.refno
order siblings by b1.no DESC) b
where rnum between 1+(5*(1-1)) and (5*1);

SELECT * FROM BOARDCOMMENT;
INSERT INTO BOARDCOMMENT VALUES (comment_seq.nextval,1,'김박박','우와 첫댓글',sysdate);
