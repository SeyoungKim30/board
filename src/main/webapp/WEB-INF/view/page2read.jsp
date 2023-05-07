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
<h4>연관게시글</h4>
<ul id="relativePostlist">
</ul>
</article>

<%@include file="/WEB-INF/view/list.jsp" %>
</main>


<%@include file="/resource/footer.jsp" %>

<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
    <div class="modal-body">
     		<h1>수정하기</h1>
			<form action="${path }/updateBoard.do" class="needs-validation" enctype="multipart/form-data" method="post">
			<input name="postid" class="form-control" value="${board.postid }" readonly="readonly">
			<input name="subject" class="form-control" value="${board.subject }" required>
			<textarea name="content" rows="" cols="" class="form-control" required>${board.content }</textarea>
			<button class="btn btn-primary" type="submit">등록</button>
			</form>
	</div>
    </div>
  </div>
</div>
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
	badgeBoard.insertAdjacentHTML('beforeend',`<span class="badge bg-warning" id='btnupdate' style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#updateModal">수정하기</span> `
												+`<span class="badge bg-danger" id='btndelete' style="cursor: pointer">삭제하기</span>`);
	const btndelete = document.querySelector('#btndelete');
	const btnupdate = document.querySelector('#btnupdate');
	
	btndelete.addEventListener('click',function(){
		if(confirm('글을 삭제할까요?')){
			location.href='${path}/deleteBoard.do?postid=${board.postid}';
		}
	})
	
}
</script>
</body>


</html>