CREATE TABLE boardvoca (
	postid NUMBER,
	voca varchar2(20)
	);

SELECT * FROM BOARDVOCA ;

DELETE boardvoca;
DELETE board WHERE postid <163;

SELECT * FROM board ORDER BY regdte DESC ;

SELECT count(DISTINCT voca),count(voca) FROM boardvoca ;

SELECT voca FROM boardvoca WHERE postid=184;

--특정글의 40퍼 이하인 키워드
SELECT * 
FROM 
	(SELECT voca, COUNT(postid) countpost FROM boardVoca 
	WHERE VOCA IN (SELECT voca FROM boardVoca WHERE POSTID='163') 
	GROUP BY voca) sub1
WHERE countpost/(SELECT COUNT(DISTINCT postID) FROM boardVoca)<=0.4
	AND countpost>1;
	
--같은 키워드가 2개 이상인 글
SELECT POSTID, COUNt(voca)
FROM boardVoca
WHERE voca IN (
	SELECT voca
	FROM 
		(SELECT voca, COUNT(postid) countpost FROM boardVoca 
		WHERE VOCA IN (SELECT voca FROM boardVoca WHERE POSTID='163') 
		GROUP BY voca) sub1
	WHERE countpost/(SELECT COUNT(DISTINCT postID) FROM boardVoca)<=0.4
		AND countpost>1
	)
GROUP BY POSTID 
;