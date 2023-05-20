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
	<h1><a href="selectBoardList.do">연관게시물 제공하는 게시판</a></h1>
	<div class="d-flex">
		<button type="button" class="btn btn-primary m-1" id="writebtn">글쓰기</button>
		<button class="btn btn-light m-1" id="loginbtn">로그인</button>
	</div>
	</nav>
</header>

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
		loginbtn.addEventListener('click',()=>{location.href='${path}/signout.do';})
		writebtn.addEventListener('click',()=>{location.href='${path}/page3write.jsp';})
	}
</script>
</body>
</html>