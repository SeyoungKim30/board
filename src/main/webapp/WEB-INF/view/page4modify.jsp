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
					<!-- 첨부파일 리스트 -->
					<c:forEach items="${boardFileList}" var="each" varStatus="vs">
					<div class="input-group mb-1 div${vs.index}"><span class="form-control"> ${each.filename }</span><button type="button" class="btn btn-danger" id="${each.filename}" name="${vs.index}">삭제</button></div>
					</c:forEach>
				</div>
			<button type="button" class="btn btn-secondary" id="morefileBtn">파일추가</button>
			<button class="btn btn-primary" type="submit" id="submitbtn">등록</button>
			
		</form>
</main>
<%@include file="/resource/footer.jsp" %>		
</body>
<script type="text/javascript" src="resource/js/write.js" charset="utf-8"></script>
<script>
//파일 삭제 버튼
var filecancleBtn=document.querySelectorAll(".attachmentFile .btn-danger")
filecancleBtn.forEach(function(each){
	each.addEventListener('click',function(){
		if(confirm("삭제한 파일은 복구할 수 없습니다.")){
			//파일삭제 컨트롤러 비동기로
			fetch("deleteFile.do?postid="+${board.postid}+"&filename="+each.id).then(res=>res.text()).then(text=>{
				if(text==1)alert("파일이 삭제되었습니다.");
				//화면에서 파일 지우기
				document.querySelector(".attachmentFile .div"+each.name).remove();
			}).catch(error=>{console.error(error)})
			
			}
		})
	})
</script>

</html>