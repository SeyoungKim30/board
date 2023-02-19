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
<body class="container">
<div class="row m-3 bg-light">
	<div class="col">
		<button class="btn btn-sm btn-dark">이전전표</button>
		<button class="btn btn-sm btn-dark">다음전표</button></div>
	<div class="col" style="text-align: right;">
		<button class="btn btn-sm btn-secondary">새 전표</button>
		<button class="btn btn-sm btn-danger">삭제하기</button></div>
</div>
<div class="row m-3 p-2 bg-light">
	<div class="col"><label class="form-control">전표일자<input class="form-control" type="date"></label></div>
	<div class="col"><label class="form-control">전표번호<input class="form-control" placeholder="전표번호"></label></div>
	<div class="col-2 p-3"><input type="submit" class="btn btn-secondary form-control" value="검색"></div>
	<div class="col-2 p-3"><input type="submit" class="btn btn-secondary form-control" value="등록"></div>
</div>
<table class="table m-3">
<thead>
<tr><th>계정코드</th><th>차변금액</th><th>계정명</th><th>대변금액</th><th>거래처</th><th>적요</th></tr>
</thead>
<tbody>
<tr><td><input class="form-control" value="10110"></td><td><input class="form-control" value="10,000"></td><td><input class="form-control" value="보통예금"></td><td><input class="form-control" value="0"></td><td><input class="form-control" value="신한은행 주거래통장"></td><td><input class="form-control" value="업무지원수수료"></td></tr>
<tr><td><input class="form-control" value="77230"></td><td><input class="form-control" value=""></td><td><input class="form-control" value="지급수수료"></td><td><input class="form-control" value="10,000"></td><td><input class="form-control" value="본사"></td><td><input class="form-control" value="업무지원수수료"></td></tr>
<tr><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td></tr>
<tr><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td></tr>
<tr><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td></tr>
<tr><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td></tr>
<tr><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td></tr>
<tr><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td></tr>
</tbody>
</table>

</body>
</html>