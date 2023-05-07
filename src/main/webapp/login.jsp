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
<title>로그인</title>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<style>

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .checkbox {
  font-weight: 400;
}
.form-signin .form-control {
  position: relative;
  box-sizing: border-box;
  height: auto;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>
</head>

<body class="text-center">
<%@include file="/resource/header.jsp" %>
    <form class="form-signin" action="${path }/signin.do" method="post">
      <h1 class="h3 mb-3 font-weight-normal">로그인하세요</h1>
      <label for="inputid" class="sr-only">아이디</label>
      <input id="inputid" class="form-control" placeholder="id" required="" autofocus="" name="id">
      <label for="inputPassword" class="sr-only">비밀번호</label>
      <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="" name="password">
      
      <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
      <button class="btn btn-lg btn-secondary btn-block" type="button" data-bs-toggle="modal" data-bs-target="#signUpModal">회원가입</button>

    </form>

<div class="modal fade" id="signUpModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
    <div class="modal-body">
<h1>회원가입</h1>


<form action="${path }/signup.do" class="needs-validation" enctype="multipart/form-data" method="post">
	<div class="row g-3 align-items-center">
	<div class="col-auto"><label for="newid" class="col-form-label">아이디</label></div>
	<div class="col-auto"><input id="newid" class="form-control" name="id" minlength="8" maxlength="8" required><button class="btn btn-sm btn-primary" type="button" id="duplicationCheck">중복확인</button><span class="form-text">아이디는 8자리만 가능합니다.</span></div>
	</div>
	
	<div class="row g-3 align-items-center mt-1">
	<div class="col-auto"><label for="newpw" class="col-form-label" >비밀번호</label></div>
	<div class="col-auto"><input type="password" id="newpw" class="form-control" name="password" minlength="8" maxlength="20" required><span class="form-text">비밀번호는 8~20자리여야 합니다.</span></div>
	</div>

	<div class="row g-3 align-items-center m-1">
	<div class="col-auto"><label for="newname" class="col-form-label">이름</label></div>
	<div class="col-auto"><input id="newname" name="username" class="form-control" maxlength="8" required></div>
	</div>


<button class="btn btn-primary" type="submit" disabled="disabled" id="signinbtn">등록</button>
</form>

	</div>
    </div>
  </div>
</div>
<%@include file="/resource/footer.jsp" %>
<script>
const duplicationCheck = document.querySelector('#duplicationCheck');
const idinput = document.querySelector('#newid');
const signinbtn = document.querySelector('#signinbtn');

duplicationCheck.addEventListener('click',function(){
	fetch("${path}/id-duplicationCheck.do?id="+idinput.value).then(response=>response.json()).then(result=>{
		if(result=='0'){
			signinbtn.disabled=false;
			duplicationCheck.classList.replace('btn-primary','btn-success');
			duplicationCheck.classList.replace('btn-danger','btn-success');
		}else{
			alert('사용할 수 없는 아이디입니다.');
			signinbtn.disabled=true;
			duplicationCheck.classList.replace('btn-primary','btn-danger');
			duplicationCheck.classList.replace('btn-success','btn-danger');
		}
	}).catch(error=>{reject(error)})
})

idinput.addEventListener('input',function(){
	signinbtn.disabled=true;
	duplicationCheck.classList.replace('btn-success','btn-primary');
	duplicationCheck.classList.replace('btn-danger','btn-primary');
})

if('${param.signinFail}'!=''){
	alert('${param.signinFail}');
}
</script>


</body>
</html>