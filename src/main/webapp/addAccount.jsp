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
<div class="row m-3 p-2 bg-light">
<div class="col"><input class="form-control" placeholder="계정코드"></div>
<div class="col"><select class="form-control"><option>자산</option></select></div>
<div class="col"><input class="form-control" placeholder="계정명"></div>
<div class="col"><input type="submit" class="btn btn-primary form-control" value="계정검색"></div>
</div>
<table class="table m-3">
<thead>
<tr><th>계정코드</th><th>구분</th><th>계정명</th><th>사용여부</th></tr>
</thead>
<tbody>
<tr><td><input class="form-control"></td><td><input class="form-control"></td><td><input class="form-control"></td><td><button class="btn btn-primary">계정등록</button></td></tr>
<tr><td>10100</td><td>자산</td><td>현금</td><td><input type="checkbox"></td></tr>
<tr><td>10100</td><td>자산</td><td>현금</td><td><input type="checkbox"></td></tr>
<tr><td>10100</td><td>자산</td><td>현금</td><td><input type="checkbox"></td></tr>
<tr><td>10100</td><td>자산</td><td>현금</td><td><input type="checkbox"></td></tr>
</tbody>
</table>

</body>
</html>