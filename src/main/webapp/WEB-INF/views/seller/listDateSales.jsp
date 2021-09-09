<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="../files/css/commonStyle.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function(){	
		$("#toDate").change(function(){
			/*
			let toDate = $(this).val();
			let fromDate = $("#fromDate").val();
			console.log(toDate);
			console.log(fromDate);
			*/
			let data = $("#datename").serialize();
			//console.log(data);
			$.ajax({
				url:"/seller/getlistDateSales.do",
				data:data,
				success:function(list){			
				console.log(list);
				$.each(list, function(i,item){
					let tr = $("<tr></tr>");
					let cate = $("<td></td>").html(item.categoryName);
					let cnt = $("<td></<td>").html(item.cnt);
					let tot = $("<td></td>").html(item.tot);
					let odate = $("<td></td>").html(item.orderManageDate);
					$(".salesList").append($(tr).append(cate, cnt, tot, odate));
				});
				}});
			});
		});

	
	
</script>
<style type="text/css">
	.profile-area{
		background: #28a745;
	}
</style>
</head>
<body>
	<!--  헤더 메뉴 부분 시작 -->
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-8">
			<%@ include file="../common/header.jsp" %>
		</div>
		<div class="col-1">
		</div>
	</div>
	<!--  헤더 메뉴 부분 끝 -->
	<!--  본문 시작 -->
	<div class="row">
	
		<div class="col-2">
		</div>
		<div class="col-8">
			<div class="col-2">
				<div class="side-menu text-center">
					<div class="profile-area my-1 py-2">
						<!--  실제 판매자 프로필 이미지 들어가는 곳 -->
						<img src="../files/images/ball1.jpg" width="200px" style="border-radius:50%" class="my-2">
						<!--  판매자 이름 보여주기 -->
						<p class="mb-2">축구공님</p>
							<a href="#" class="">
								프로필 관리
							</a>
					</div>
					
					<nav class="my-3">
						<div class="dropdown">
							<a class="nav-link dropdown-toggle my-1" href="#" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
								상품 관리
							</a>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						    	<li>
						    		<a class="dropdown-item text-center" href="#">상품 등록</a>
								</li>
						    	<li>
						    		<a class="dropdown-item text-center" href="#">상품 목록</a>
								</li>
							</ul>
						</div>
						<ul class="nav flex-column">
						  <li class="nav-item my-2">
						    <a class="nav-link" href="#">주문 관리</a>
						  </li>
						  <li class="nav-item my-2">
						    <a class="nav-link" href="#">매출 관리</a>
						  </li>
						  <li class="nav-item my-2">
						    <a class="nav-link" href="#">정산 관리</a>
						  </li>
						  <li class="nav-item my-2">
						    <a class="nav-link" href="#">리뷰 관리</a>
						  </li>
						  <li class="nav-item my-2">
						    <a class="nav-link" href="#">문의 관리</a>
						  </li>
						  <li class="nav-item my-2">
						    <a class="nav-link" href="#">공지사항</a>
						  </li>
						</ul>
					</nav>
				</div>
			</div>
			<div class="col-10">
			<!-- 실제 본문 영역 시작 -->
			<div>
				
				<form id="datename">
				From : <input type="date" name="fromDate" id="fromDate">&nbsp;&nbsp;
				To : <input type="date" name="toDate" id="toDate">
				</form>
			</div>
			<table class="salesList">
				<tr>
					<th>분류명</th>
					<th>건수</th>
					<th>매출액</th>
					<th>날짜</th>
				</tr>
			</table>
			<!-- 실제 본문 영역 끝 -->
			</div>
		</div>
		<div class="col-2">
		</div>

	</div>
	<!--  본문 시작 -->


	<!--  풋터 끝부분 시작 -->
	<div class="row">
	
		<div class="col-2">
		</div>
		<div class="col-8">
			<%@ include file="../common/footer.jsp" %>
		</div>
		<div class="col-2">
		</div>

	</div>
	<!--  풋터 끝부분 끝 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
</body>
</html>