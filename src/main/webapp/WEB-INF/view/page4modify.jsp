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
<title>글 수정하기</title>

<script type="text/javascript" src="resource/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>


<%@include file="/resource/header.jsp" %>
<main class="container-xl">
	<h1>글 수정하기</h1>
		<form action="${path }/updateBoard.do" class="needs-validation" enctype="multipart/form-data" method="post" id="writeform">
			
			<input name="postid" class="form-control" value="${board.postid }" readonly="readonly">
			<input name="subject" class="form-control" required value="${board.subject }">
			
			<input name="writer" class="form-control" value="${logon.id }" type="hidden" required>
			
			<textarea name="content" id="ir1" rows="20" cols="" class="form-control">${board.content }</textarea>
			
				<div class="attachmentFile border-top p-2">
					<c:forEach items="${boardFileList}" var="each">
					<div class="form-control"> ${each.filename } <span class="badge text-bg-danger" id="${each.fileid }">X</span></div>
					</c:forEach>
				</div>
			<button type="button" class="btn btn-secondary" id="morefileBtn">파일추가</button>
			
			<button class="btn btn-primary" type="submit" id="submitbtn">등록</button>
			
		</form>
</main>
<%@include file="/resource/footer.jsp" %>		
</body>
<script type="text/javascript" src="resource/js/write.js" charset="utf-8"></script>
<script type="text/javascript">
const morefileBtn = document.querySelector("#morefileBtn");
morefileBtn.addEventListener('click',function(){
	$('.attachmentFile').append('<input type="file" name="filelist" class="form-control">')
})
</script>


</html>