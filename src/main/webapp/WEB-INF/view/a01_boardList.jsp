<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	td{text-align:center;}
</style>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
 <a href="${path }/selectBoardList.do"><h2>게시판</h2></a>
</div>

<div class="container">
<button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-primary">글쓰기</button>
	<form id="frm01" class="form-inline" action="${path }/selectBoardList.do">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" placeholder="writer" name="writer" value="${search.writer }"/>
	    <input class="form-control mr-sm-2" placeholder="subject" name="subject" value="${search.subject }"/>
	    <button class="btn btn-info" type="submit">검색</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="50%">
   	<col width="15%">
   	<col width="15%">
   	<col width="10%">
    <thead>
    
      <tr class="table-success text-center">
        <th>번호 no</th>
        <th>제목 subject</th>
        <th>작성자 writer</th>
        <th>작성일 regdte</th>
        <th>조회 readcnt</th>
      </tr>
    </thead>	
    <tbody>
    <c:forEach items="${boardList}" var="each" >
    	<tr><td>${each.no}</td>
    		<td><a href="${path }/selectBoard.do?no=${each.no}&writer=${search.writer }&subject=${search.subject }">${each.subject }</a>
    		<span class="badge text-bg-light">${each.recount }</span></td>
    		<td>${each.writer }</td><td>${each.regdte }</td><td>${each.readcnt }</td></tr>
    </c:forEach>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    </tbody>
	</table>    
    
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
    <div class="modal-body">
     		<h1>글쓰기</h1>
			<form action="${path }/insertBoard.do" class="needs-validation" enctype="multipart/form-data" method="post">
			<input name="subject" class="form-control" placeholder="subject" required>
			<input name="writer" class="form-control" placeholder="writer" required>
			<input name="no" class="form-control" placeholder="no" type="hidden" value="0">
			<input name="refno" class="form-control" placeholder="refno" type="hidden" value="0">
			<textarea name="content" rows="" cols="" class="form-control" required></textarea>
			<p class="attachmentFile"></p>
			<button type="button" class="btn" id="morefileBtn">파일추가</button>
			<button class="btn btn-primary" type="submit">등록</button>
			</form>
	</div>
    </div>
  </div>
</div>

<script>
$("#morefileBtn").click(function(){
	$('.attachmentFile').append('<input type="file" name="doc" class="form-control">')
})
</script>
</body>
</html>