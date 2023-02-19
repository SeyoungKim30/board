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
<h3>거래내역조회</h3>
<div class="row m-3 p-2 bg-light">
	<div class="col"><label class="form-control">시작일자<input class="form-control" type="date"></label></div>
	<div class="col"><label class="form-control">종료일자<input class="form-control" type="date"></label></div>
	<div class="col"><label class="form-control">거래처<input class="form-control" placeholder="전체"></label></div>
	<div class="col"><label class="form-control">조건<select class="form-control"><option>상품매출</option></select></label></div>
	<div class="col">
		<input type="submit" class="btn btn-secondary form-control m-1" value="일자별 조회">
		<input type="submit" class="btn btn-secondary form-control m-1" value="건별 조회"></div>
</div>
<table class="table m-3">
<thead>
<tr><th>일자</th><th>계정명</th><th>금액</th><th>거래처</th><th>적요</th></tr>
</thead>
<tbody>
<tr class="bg-light" style="font-weight: bold"><td>전체</td><td>상품매출</td><td>452,100</td><td></td><td></td></tr>
<tr><td>2023-02-18</td><td>상품매출</td><td>6,000</td><td>결제대행사</td><td>주문번호 1065132</td></tr>
<tr><td>2023-02-18</td><td>상품매출</td><td>6,000</td><td>결제대행사</td><td>주문번호 1065132</td></tr>
<tr><td>2023-02-18</td><td>상품매출</td><td>6,000</td><td>결제대행사</td><td>주문번호 1065132</td></tr>
<tr><td>2023-02-18</td><td>상품매출</td><td>6,000</td><td>결제대행사</td><td>주문번호 1065132</td></tr>
<tr><td>2023-02-18</td><td>상품매출</td><td>6,000</td><td>결제대행사</td><td>주문번호 1065132</td></tr>
<tr><td>2023-02-18</td><td>상품매출</td><td>6,000</td><td>결제대행사</td><td>주문번호 1065132</td></tr>
<tr><td>2023-02-18</td><td>상품매출</td><td>6,000</td><td>결제대행사</td><td>주문번호 1065132</td></tr>
<tr><td>2023-02-18</td><td>상품매출</td><td>6,000</td><td>결제대행사</td><td>주문번호 1065132</td></tr>
<tr><td>2023-02-18</td><td>상품매출</td><td>6,000</td><td>결제대행사</td><td>주문번호 1065132</td></tr>
<tr><td>2023-02-18</td><td>상품매출</td><td>6,000</td><td>결제대행사</td><td>주문번호 1065132</td></tr>
</tbody>
</table>

</body>
</html>