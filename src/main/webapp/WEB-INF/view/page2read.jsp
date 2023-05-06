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
<%@include file="/WEB-INF/view/header.jsp" %>

<main class="container-xl">

<article class="bg-light border">
<h3>${board.subject }</h3>
<div class="badge bg-primary text-wrap">작성자 ${board.writer } / 작성일 ${board.regdte } / 글번호 ${board.postid }</div>
<div class="pt-3 pb-5 ">
${board.content }
</div>
<h4>연관게시글</h4>
<ul id="relativePostlist">
</ul>
</article>

<%@include file="/WEB-INF/view/list.jsp" %>
</main>


<%@include file="/WEB-INF/view/footer.jsp" %>

<script>
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
</script>
</body>


</html>