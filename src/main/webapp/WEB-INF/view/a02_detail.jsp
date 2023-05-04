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
<div class="container bg-light rounded p-3">
<h3>${board.subject }</h3>
<div>작성자 ${board.writer } / 작성일 ${board.regdte } / 조회수 ${board.readcnt } / 글번호 ${board.no }</div>
<div>
${board.content }
</div>
<div class="bg-light"><ul>

</ul></div>
	<div class="row">
	<div class="col col-md-4 text-start"><button type="button" class="replybtn btn btn-primary">답변하기</button></div>
	<div class="col col-md-4 ms-auto text-end">
		<button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModal" id="updateBtn">수정하기</button>
		<button type="button" class="btn btn-danger" onclick="location.href='${path}/deleteBoard.do?no=${board.no }'">삭제하기</button>
	</div></div>

<div class="reply bg-light p-3" style="display:none">
			<form action="${path }/insertBoard.do">
			<input name="subject" class="form-control" placeholder="subject" value="re:${board.subject }">
			<input name="writer" class="form-control" placeholder="writer">
			<textarea name="content" rows="" cols="" class="form-control"></textarea>
			<button class="btn btn-primary">등록</button>
			</form>
</div>


<c:if test="${not empty replyList }">
<hr>
<h4>연결된 글</h4>
	<div class="accordion" id="accordionExample">
	<c:forEach items="${replyList }" var="reply">
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="heading${reply.no }">
	      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${reply.no }" aria-expanded="true" aria-controls="collapse${reply.no }">
	        ${reply.subject }
	      </button>
	    </h2>
	    <div id="collapse${reply.no }" class="accordion-collapse collapse" aria-labelledby="heading${reply.no }" data-bs-parent="#accordionExample">
	      <div class="accordion-body">
				<div>작성자 ${reply.writer } / 작성일 ${reply.regdte } / 조회수 ${reply.readcnt } / 글번호 ${reply.no }</div>
				<div>${reply.content }</div>
				<button type="button" onclick="location.href='${path }/selectBoard.do?no='+${reply.no }" class="btn btn-light btn-sm">자세히 보기</button>
	      </div>
	    </div>
	  </div>
	  </c:forEach>
	</div>
</c:if>

</div>


<%@include file="/WEB-INF/view/a01_boardList.jsp" %>
<script>
$(".replybtn").click(function(){
	if($(".reply").css("display")=="none"){
		$(".reply").css("display","")
	}else{
		$(".reply").css("display","none")
	}
})

$('#updateBtn').click(function(){
	$('.modal-body form').attr("action","${path}/updateBoard.do")
	$('.modal-body h1').text("작성글 수정")
	
	$('.modal-body [name=subject]').val('${board.subject }')
	$('.modal-body [name=writer]').val('${board.writer }')
	$('.modal-body [name=writer]').attr("readonly",true)
	$('.modal-body [name=no]').val("${board.no }")
	$('.modal-body [name=content]').val("${board.content }")
	$('.modal-body [type=submit]').text('수정하기')
})

</script>
</body>
</html>