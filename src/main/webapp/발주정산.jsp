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
<title>발주 정산</title>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>
<body>

<br><br><br>

	<div class="row bg-light">
		<div class="col">정산월 선택<input class="form-control" type="month"></div>
		<div class="col">담당자<select class="form-control"><option>김물류</option><option>전체 보기 &nbsp; &nbsp;&nbsp; &nbsp;</option><option>김박박</option><option>남진</option><option>둘리</option></select></div>
		<div class="col">주문지점으로 검색<input class="form-control" placeholder="-" disabled="disabled"></div>
		<div class="col">발주상태<select class="form-control"><option>전체 보기 &nbsp; &nbsp; &nbsp;</option><option>미완료 포함</option><option>완료</option></select></div>
		<div class="col">결제상태<select class="form-control"><option>전체 보기 &nbsp; &nbsp; &nbsp;</option><option>청구 전</option><option>청구</option><option>결제완료</option></select></div>
		<div class="col-2 p-3"><input type="submit" class="btn btn-primary" value="발주 조회"></div>
	</div>


<table class="table m-3">
<thead>
<tr><th>지점</th><th>담당자</th><th>발주상태</th><th>정산 상태</th><th>총 금액</th><th><button class="btn btn-secondary">정산 변경하기</button></th></tr>
</thead>
<tbody>
<tr><td>홍대역점</td><td>김물류</td><td>완료</td><td>계산서 발행</td><td>1,324,410</td><td><select class="form-control"><option>입금완료</option></select></td></tr>
<tr><td>홍대입구9번출구점</td><td>김물류</td><td>완료</td><td>정산완료</td><td>324,410</td><td><select class="form-control"><option>이월신청</option></select></td></tr>
<tr><td>동교점</td><td>김물류</td><td>완료</td><td>정산완료</td><td>1,300,410</td><td><select class="form-control"><option>미수신청</option></select></td></tr>
<tr><td>서교점</td><td>김물류</td><td>완료</td><td>정산완료</td><td>924,410</td><td><select class="form-control"><option>재정산/취소</option></select></td></tr>
<tr><td>연남센트럴파크점</td><td>김물류</td><td>완료</td><td>청구 전</td><td>1,324,410</td><td><select class="form-control"><option>입금완료</option></select></td></tr>
<tr><td>합정점</td><td>김물류</td><td>완료</td><td>청구 전</td><td>1,324,410</td><td><select class="form-control"><option>입금완료</option></select></td></tr>

</tbody>
</table>



</body>
</html>