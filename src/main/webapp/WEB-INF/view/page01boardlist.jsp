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
<title>Insert title here</title>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>
<body>
<%@include file="/WEB-INF/view/header.jsp" %>
<main class="container-xxl bd-gutter mt-3 my-md-4 bd-layout">
<div class="col">
<div class="row"><div class="col-2 text-bg-primary p-3 text-center">날짜</div><div class="col text-bg-primary p-3">제목</div></div>
<c:forEach items="${boardList}" var="each" >
	<div class="row p-1">
	<div class="col-2 text-center">${each.regdte }</div>
	<div class="col"><a href="${path }/selectBoard.do?no=${each.no}&searchSubject=${search.searchSubject }&pageIndex=${search.pageIndex}">${each.subject }</a></div></div>
</c:forEach>
</div>

<div class="d-flex justify-content-center border-top">
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

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
    <div class="modal-body">
     		<h1>글쓰기</h1>
			<form action="${path }/insertBoard.do" class="needs-validation" enctype="multipart/form-data" method="post">
			<input name="subject" class="form-control" placeholder="subject" required>
			<input name="writer" class="form-control" placeholder="writer" required>
			<input name="no" class="form-control" placeholder="no" type="hidden" value="0">
			<textarea name="content" rows="" cols="" class="form-control" required></textarea>
			<button class="btn btn-primary" type="submit">등록</button>
			</form>
	</div>
    </div>
  </div>
</div>

</main>
<%@include file="/WEB-INF/view/footer.jsp" %>
</body>
<script>
var pageIndex=${search.pageIndex }
var howmanyInoneblock= ${search.howmanyInoneblock }
var totalPage = ${search.totalPage }
var pageRangeEach= Math.floor(howmanyInoneblock/2)
var pagination=document.querySelector('.pagination');
var pagenationhtmls="";

for(var i=pageIndex-pageRangeEach;i<=pageIndex+pageRangeEach;i++){
	if(i>0 && i<=totalPage){
		if(i==pageIndex){
			pagenationhtmls+=`<li class="page-item"><a class="page-link active" href="javascript:goPage(`+i+`);" >`+i+`</a></li>`
		}else{
			pagenationhtmls+=`<li class="page-item"><a class="page-link" href="javascript:goPage(`+i+`);" >`+i+`</a></li>`
		}
		console.log('실행')
	}
}
pagination.innerHTML = pagenationhtmls

function goPage(iindex){
	$("[name=pageIndex]").val(iindex);
	$("#selectBoardListform").submit();
}

</script>
</html>