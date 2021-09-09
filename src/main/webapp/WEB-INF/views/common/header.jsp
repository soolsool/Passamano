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
    	   		<a href="/login" class="mx-2">
    	   			<span class="text-success fw-bold">로그인</span>
   	   			</a>
	       		<a href="/member/membertype" class="mx-2">
	       			<span class="text-success fw-bold">회원가입</span>
       			</a>
       		</c:if>
       		<c:if test="${not empty loginUser}">
    	   		<a href="/logout" class="mx-2">
    	   			<span class="text-success fw-bold">로그아웃</span>
   	   			</a>       			
       		</c:if>
		</div>
		<div class="col-4 text-center mt-2 mb-3">
			<a href="/">
				<img src="/resources/images/new.png" id="logo">
			</a>
		</div>
		<div class="col-3 text-end" id="upper-menu">
       		<a href="#" class="mx-2">
       			<span class="text-success fw-bold">주문조회</span>
   			</a>
			<a href="#" class="mx-2">
				<span class="text-success fw-bold">장바구니</span>
			</a>
		</div>
	</div>
	<!-- <nav class="d-flex justify-content-between mt-4 mb-2">
	<div class="dropdown">
		<a class="nav-link dropdown-toggle" href="#" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
			<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
				<path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
			</svg>
			카테고리
		</a>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
	           	<li>
	           		<a class="dropdown-item" href="#">축산</a>
	          		</li>
	           	<li>
	            	<a class="dropdown-item" href="#">농산</a>
	           	</li>
	            <li>
	            	<a class="dropdown-item" href="#">수산</a>
	  	        	</li>
	   	        <li>
	       	    	<a class="dropdown-item" href="#">기타</a>
          		</li>
			</ul>
   		</div>
		<a class="navbar-brand" href="#">신상품</a>
		<a class="navbar-brand" href="#">마감임박</a>
		<a class="navbar-brand" href="#">추천상품</a>
		<a class="navbar-brand" href="#">특가상품</a>
	</nav> -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
</body>
</html>