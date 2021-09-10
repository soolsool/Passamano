<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/commonStyle.css">
<style type="text/css">
	#logo{
		width: 20em;
	}
</style>
</head>
<body id="bootstrap-overrides">
	<div class="row mt-3 flex-nowrap justify-content-between">
		<div class="col-3 text-start" id="upper-menu">
       		<c:if test="${empty loginUser}">
    	   		<a href="/login.do" class="mx-2">
    	   			<span class="text-success fw-bolder">로그인</span>
   	   			</a>
	       		<a href="/member/membertype.do" class="mx-2">
	       			<span class="text-success fw-bolder">회원가입</span>
       			</a>
       		</c:if>
       		<c:if test="${not empty loginUser}">
    	   		<a href="/mypage/home.do" class="mx-2">
    	   			<span class="text-success fw-bolder">마이페이지</span>
   	   			</a>       			
    	   		<a href="/logout.do" class="mx-2">
    	   			<span class="text-success fw-bolder">로그아웃</span>
   	   			</a>       			
       		</c:if>
		</div>
		<div class="col-4 text-center mt-2 mb-3">
			<a href="/">
				<img src="/resources/images/new.png" id="logo">
			</a>
		</div>
		<div class="col-3 text-end" id="upper-menu">
			<c:if test="${grantNo!=20}">
	       		<a href="/mypage/order.do" class="mx-2">
	       			<span class="text-success fw-bolder">주문조회</span>
	   			</a>
				<a href="/mypage/cart.do" class="mx-2">
					<span class="text-success fw-bolder">장바구니</span>
				</a>
			</c:if>
			<c:if test="${grantNo==20}">
				<a href="/seller/listProduct.do" class="mx-2">
					<span class="text-success fw-bolder">판매자페이지</span>
				</a>
			</c:if>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
</body>
</html>