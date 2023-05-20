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
<title>글쓰기</title>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>
<body>


<%@include file="/resource/header.jsp" %>
<main class="container-xl">
	<h1>글쓰기</h1>
		<form action="${path }/insertBoard.do" class="needs-validation" enctype="multipart/form-data" method="post">
			<input name="subject" class="form-control" placeholder="제목을 입력하세요" required>
			
			<input name="writer" class="form-control" value="${logon.id }" type="hidden" required>
			
			<textarea name="content" rows="20" cols="" class="form-control" required placeholder="내용을 입력하세요"></textarea>
			
			<p class="attachmentFile"></p>
			<button type="button" class="btn" id="morefileBtn">파일추가</button>
			
			<button class="btn btn-primary" type="submit">등록</button>
			
		</form>
</main>
<%@include file="/resource/footer.jsp" %>		
</body>

<script>
const morefileBtn = document.querySelector("#morefileBtn");
morefileBtn.addEventListener('click',function(){
	$('.attachmentFile').append('<input type="file" name="filelist" class="form-control">')
})

</script>
</html>