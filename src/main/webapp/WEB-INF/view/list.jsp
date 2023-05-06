<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.titlelistrow{
	border-bottom-color: lightgray;
	border-bottom-style: solid;
	border-bottom-width: thin;
}

a:link{
	text-decoration: none;
	}
</style>
</head>
<body>

<article class="col">
<div class="row"><div class="col-2 text-bg-primary p-3 text-center">날짜</div><div class="col text-bg-primary p-3">제목</div></div>
<c:forEach items="${boardList}" var="each" >
	<div class="row p-1 titlelistrow">
	<div class="col-2 text-center">${fn:substring(each.regdte,0,10) }</div>
	<div class="col"><a href="${path }/selectBoard.do?postid=${each.postid}&searchSubject=${search.searchSubject }&pageIndex=${search.pageIndex}">${each.subject }</a></div></div>
</c:forEach>
</article>

<div class="d-flex justify-content-center">
	<nav aria-label="Page navigation">
		<ul class="pagination"></ul>
	</nav>
</div>

<form id="selectBoardListform" class="form-inline d-flex justify-content-center" action="${path }/selectBoardList.do">
	<div class="row">
	<div class="col-auto"><input class="form-control " placeholder="제목으로 검색" name="searchSubject" value="${search.searchSubject }"/></div>
	<input name="pageIndex" placeholder="pageIndex" value="0" type="hidden">
	<div class="col-auto"><button class="btn btn-primary" type="submit">검색</button></div>
	</div>
</form>

<script>
var pageIndex=${search.pageIndex }+0 ;
var howmanyInoneblock= 5 ;
var totalPage = ${search.totalPage }+0;
var pageRangeEach= Math.floor(5/2);
var pagination=document.querySelector('.pagination');
var pagenationhtmls="";

for(var i=pageIndex-pageRangeEach;i<=pageIndex+pageRangeEach;i++){
	if(i>0 && i<=totalPage){
		if(i==pageIndex){
			pagenationhtmls+=`<li class="page-item"><a class="page-link active" href="javascript:goPage(`+i+`);" >`+i+`</a></li>`
		}else{
			pagenationhtmls+=`<li class="page-item"><a class="page-link" href="javascript:goPage(`+i+`);" >`+i+`</a></li>`
		}
	}
}
pagination.innerHTML = pagenationhtmls

function goPage(iindex){
	$("[name=pageIndex]").val(iindex);
	$("#selectBoardListform").submit();
}

</script>
</body>
</html>