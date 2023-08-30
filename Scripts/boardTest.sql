
SELECT * FROM BOARDVOCA ;

DELETE boardvoca;
DELETE board WHERE postid <163;

SELECT * FROM board ORDER BY regdte DESC ;

SELECT count(DISTINCT voca),count(voca) FROM boardvoca ;

SELECT * FROM boardvoca WHERE POSTID =237;

--특정글의 40퍼 이하인 키워드
SELECT * 
FROM 
	(SELECT voca, COUNT(postid) countpost FROM boardVoca 
	WHERE VOCA IN (SELECT voca FROM boardVoca WHERE POSTID='210') 
	GROUP BY voca) sub1
WHERE countpost/(SELECT COUNT(DISTINCT postID) FROM boardVoca)<=0.4
	AND countpost>1;
	
--같은 키워드가 2개 이상인 글
SELECT POSTID , voca, frequency
FROM boardVoca
WHERE voca IN (
	SELECT voca
	FROM 
		(SELECT voca, COUNT(postid) countpost FROM boardVoca 
		WHERE VOCA IN (SELECT voca FROM boardVoca WHERE POSTID='200') 
		GROUP BY voca) sub1
	WHERE countpost/(SELECT COUNT(DISTINCT postID) FROM boardVoca)<=0.4
		AND countpost>1
	)
;
--사용가능 단어 중 점수랑 갯수 구하기
SELECT POSTID, voca,frequency FROM boardVoca WHERE voca IN (	--사용가능 단어가 포스트별로 몇개 있는지
			SELECT voca FROM 		--이 글의 단어를 가진 글의 수/ 전체글의 수 = 0.4인 단어만 골라내기
				(SELECT voca, COUNT(postid) countpost FROM boardVoca WHERE VOCA IN (SELECT voca FROM boardVoca WHERE POSTID='200') GROUP BY voca) sub1		--이 글의 단어를 가진 글의 수
			WHERE countpost/(SELECT COUNT(DISTINCT postID) FROM boardVoca)<=0.4		--이 글의 단어를 가진 글의 수/ 전체글의 수 = 0.4인 단어만 골라내기
) ;
--글 별 점수 구하기
SELECT postid, count(voca), sum(frequency) FROM (SELECT POSTID, voca,frequency FROM boardVoca WHERE voca IN (	--사용가능 단어가 포스트별로 몇개 있는지
			SELECT voca FROM 		--이 글의 단어를 가진 글의 수/ 전체글의 수 = 0.4인 단어만 골라내기
				(SELECT voca, COUNT(postid) countpost FROM boardVoca WHERE VOCA IN (SELECT voca FROM boardVoca WHERE POSTID='200') GROUP BY voca) sub1		--이 글의 단어를 가진 글의 수
			WHERE countpost/(SELECT COUNT(DISTINCT postID) FROM boardVoca)<=0.4		--이 글의 단어를 가진 글의 수/ 전체글의 수 = 0.4인 단어만 골라내기
))sub4 GROUP BY postid;


--카운트보카 큰 순서대로 글 찾기
SELECT b.postid, b.SUBJECT, b.REGDTE, countvoca,sumFREQUENCY
FROM BOARD b , 
	(SELECT POSTID, count(voca) countvoca,sum(frequency) sumFREQUENCY  FROM boardVoca WHERE voca IN (	--사용가능 단어가 포스트별로 몇개 있는지
			SELECT voca FROM 		--이 글의 단어를 가진 글의 수/ 전체글의 수 = 0.4인 단어만 골라내기
				(SELECT voca, COUNT(postid) countpost FROM boardVoca WHERE VOCA IN (SELECT voca FROM boardVoca WHERE POSTID='214') GROUP BY voca) sub1		--이 글의 단어를 가진 글의 수
			WHERE countpost/(SELECT COUNT(DISTINCT postID) FROM boardVoca)<=0.4		--이 글의 단어를 가진 글의 수/ 전체글의 수 = 0.4인 단어만 골라내기
	) GROUP BY POSTID ) sub3
WHERE b.POSTID = sub3.postid AND countvoca>=2
ORDER BY sumFREQUENCY desc;

SELECT * FROM boardvoca WHERE postid=233;

SELECT * FROM BOARDFILE b ;
