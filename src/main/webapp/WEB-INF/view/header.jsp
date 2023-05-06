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

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


<style>
header{
	text-align: center;
	background-color: darkblue;
	height: 70px;
	}
header h1 a{
	all: unset;
	cursor: pointer;
	font-size:2rem;
	font-weight: bold;
	color:ivory;
	}

article{
	width: 80%;
  	min-width:300px;
  	padding: 15px;
  	margin: 0 auto;
  	}
  	
h1,h2,h3,h4,h5,h6{ font-weight: bold;}
</style>
</head>
<body>

<header class="navbar navbar-expand-lg bd-navbar sticky-top">
<nav class="container-xxl bd-gutter flex-wrap flex-lg-nowrap">
	<h1><a href="selectBoardList.do">글로벌 널리지 강의 정보</a></h1>
	<div class="d-flex">
		<button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-primary m-1" id="writebtn">글쓰기</button>
		<button class="btn btn-light m-1" id="loginbtn">로그인</button>
	</div>
	</nav>
</header>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
    <div class="modal-body">
     		<h1>글쓰기</h1>
			<form action="${path }/insertBoard.do" class="needs-validation" enctype="multipart/form-data" method="post">
			<input name="subject" class="form-control" placeholder="제목을 입력하세요" required>
			<input name="writer" class="form-control" value="${logon.id }" type="hidden" required>
			<textarea name="content" rows="" cols="" class="form-control" required placeholder="내용을 입력하세요"></textarea>
			<button class="btn btn-primary" type="submit">등록</button>
			</form>
	</div>
    </div>
  </div>
</div>

<script>
	const writebtn = document.querySelector("#writebtn");
	const loginbtn = document.querySelector("#loginbtn");
	if('${logon.id}'==''){
		writebtn.remove();
		loginbtn.addEventListener('click',function(){
			location.href='${path}/login.jsp';
		})
	}else{
		loginbtn.innerHTML='로그아웃';
		loginbtn.addEventListener('click',function(){
			location.href='${path}/signout.do'
		})
	}
</script>
</body>
</html>