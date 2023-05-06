
SELECT * FROM BOARDVOCA ;

DELETE boardvoca;
DELETE board WHERE postid <163;

SELECT * FROM board ORDER BY regdte DESC ;

SELECT count(DISTINCT voca),count(voca) FROM boardvoca ;

SELECT voca FROM boardvoca WHERE voca='하';

--특정글의 40퍼 이하인 키워드
SELECT * 
FROM 
	(SELECT voca, COUNT(postid) countpost FROM boardVoca 
	WHERE VOCA IN (SELECT voca FROM boardVoca WHERE POSTID='210') 
	GROUP BY voca) sub1
WHERE countpost/(SELECT COUNT(DISTINCT postID) FROM boardVoca)<=0.4
	AND countpost>1;
	
--같은 키워드가 2개 이상인 글
SELECT POSTID, COUNt(voca) countvoca
FROM boardVoca
WHERE voca IN (
	SELECT voca
	FROM 
		(SELECT voca, COUNT(postid) countpost FROM boardVoca 
		WHERE VOCA IN (SELECT voca FROM boardVoca WHERE POSTID='198') 
		GROUP BY voca) sub1
	WHERE countpost/(SELECT COUNT(DISTINCT postID) FROM boardVoca)<=0.4
		AND countpost>1
	)
GROUP BY POSTID 
;
--카운트보카 큰 순서대로 글 찾기
SELECT b.postid, b.SUBJECT, b.REGDTE, countvoca
FROM BOARD b , (SELECT POSTID, COUNt(voca) countvoca
						FROM boardVoca
						WHERE voca IN (
							SELECT voca
							FROM 
								(SELECT voca, COUNT(postid) countpost FROM boardVoca 
								WHERE VOCA IN (SELECT voca FROM boardVoca WHERE POSTID='200') 
								GROUP BY voca) sub1
							WHERE countpost/(SELECT COUNT(DISTINCT postID) FROM boardVoca)<=0.4
							)
						GROUP BY POSTID ) sub3
WHERE b.POSTID = sub3.postid AND countvoca>1
ORDER BY COUNTVOCA desc;

--게시글 순서대로 안떠
select b3.postid, b3.subject,b3.regdte, rn from 
 (SELECT b.*, rownum rn from
	(select b2.* from board b2 
	WHERE subject LIKE '%'||''||'%'
	order by regdte DESC
	) b) b3
	where rn between 1+(30*(2-1)) and (30*2)
order by rn
;

--board 회원

SELECT * FROM boardmember WHERE id='kim' AND password='1234';