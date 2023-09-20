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
<link href="${path}/resource/precrackedegg.css" rel="stylesheet">

</head>
<body>

<header class="sticky-top">
<div class="whiteshell">
<nav class="container flex-nowrap flex-lg-nowrap navbar">
	<h1><a href="selectBoardList.do"><span style="color:#42caff;">Pre-Cracked</span> <span style="color:yellow;font-size:3rem;">egg</span></a></h1>
	<div class="d-flex align-items-center">
		<div class="m-1"><a href="${path}/myaccount.do">my account</a></div>
		<div class="m-1"><button type="button" class="row align-items-end " id="writebtn"><div class="col">글쓰기</div></button></div>
		<div class="m-1"><button class="btn btn-eggred" id="loginbtn">Log In</button></div>
	</div>
	</nav>
</div>
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