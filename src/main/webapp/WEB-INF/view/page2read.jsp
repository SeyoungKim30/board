<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${board.subject }</title>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>

<style>
.comments .border-top{
	padding-left:0.5rem;
	padding-bottom: 0.8rem;
}
.commentinfo{
	font-size:0.8rem;
	color:gray;
}
.commentwriter,.badge{
	cursor: pointer;
}
.commentdate{
	text-align: right;
}
</style>

</head>
<body>
<%@include file="/resource/header.jsp" %>

<main class="container-xl">

<article class="bg-light border">
<h3>${board.subject }</h3>
<div class="badgeBoard">
	<span class="badge bg-primary">작성자 ${board.writer } </span>
	<span class="badge bg-primary">작성일 ${board.regdte }</span>
	<span class="badge bg-primary">글번호 ${board.postid }</span>
</div>
<div class="pt-3 pb-5 ">
${board.content }
</div>

<h4>Comments</h4>
<div class="comments">
	No comments for now.
</div>
	
	<div class="border-top">
		<div class="row">
		<form class="needs-validation" id="commentForm">
			<input type="hidden" name="postid" value="${board.postid }" required="required">
			<div class="col"><input class="form-control" name="comments" maxlength="999" disabled required="required"></div>
			<div class="col-2"><button class="btn btn-primary text-center" id="commentsubmitbtn" disabled>submit</button></div>
		</form>
		</div>
	</div>	
	


</article>

<article class="bg-light border" style="margin-top:2rem;">
	<h4>연관게시글</h4>
	<ul id="relativePostlist">
	</ul>
</article>



<%@include file="/WEB-INF/view/list.jsp" %>
</main>


<%@include file="/resource/footer.jsp" %>

<script type="text/javascript" src="resource/js/comment.js" charset="utf-8"></script>
<script>
//연관글 비동기로 불러오기
const relativePostlist = document.querySelector('#relativePostlist')

fetch("${path}/selectRelative.do?postid=${board.postid }").then(response=>response.json())
.then(json=>{
	const postsArr= json.relativePosts;
	let newlists='';
	postsArr.forEach(function(each){
		newlists+='<li><a href="${path}/selectBoard.do?postid='+each.postid+'">'+each.subject+'</a></li>'
	})
	relativePostlist.innerHTML = newlists;
}).catch(error=>{console.error(error)})


//작성자만 삭제 가능
const logonid='${logon.id}'
if(logonid=='${board.writer }'){
	const badgeBoard = document.querySelector('.badgeBoard')
	badgeBoard.insertAdjacentHTML('beforeend',`<span class="badge bg-warning" id='btnupdate' onclick="modify()">수정하기</span> `
												+`<span class="badge bg-danger" id='btndelete'>삭제하기</span>`);
	const btndelete = document.querySelector('#btndelete');
	const btnupdate = document.querySelector('#btnupdate');
	
	btndelete.addEventListener('click',function(){
		if(confirm('글을 삭제할까요?')){
			location.href='${path}/deleteBoard.do?postid=${board.postid}';
		}
	})
}

//수정
function modify(){
	location.href="${path}/updateBoard.do?postid="+${board.postid };
}


//덧글 쓰기
const commentForm= document.querySelector('#commentForm')
commentForm.addEventListener('submit', (e) => {
	e.preventDefault();
	writeComment(${board.postid});
})

//로그인 했을때만 덧글 가능
if(logonid!=''){
	commentsubmitbtn.disabled=false;
	document.querySelector('[name=comments]').disabled=false;
}
loadComments(${board.postid });

</script>

</body>


</html>