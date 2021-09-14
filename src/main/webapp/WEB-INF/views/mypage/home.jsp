<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>파사마노:::마이페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/commonStyle.css">
<style type="text/css">
.profile-area img {
	width:100px;
	height:100px;
	border-radius: 50%;
	cursor:pointer;
}

.wrapper {
	float: left;
}

.content {
	margin-top: 20px;
	float: right;
}

.first-card {
	margin: 0px auto;
	border-radius: 12px;
	box-shadow: rgb(0 0 0/ 15%) 0px 2px 4px 0px, rgb(0 0 0/ 30%) 0px 0px 1px
		0px;
	display: flex;
	flex-direction: column;
}

.first-card-header {
	padding: 20px;
}

#wrap {
	overflow: hidden;
	min-width: 1600px;
}

.btn {
	display: inline-block;
	float: left;
	width: 300px;
	height: 50px;
	margin-left: 1%;
	margin-bottom: 2%;
	margin-left: 1%;
}

.btn-order-cancel, .btn-review {
	font-size: 15px;
	font-weight: bold;
	color: #28a745;
	width: 100px;
	height: 40px;
	background-color: white;
	border: 1px solid #28a745;
	float: left;
	margin-left: 10px;
	border-radius: 5px;
}

.btn-cancel-check {
	margin-top: 5px;
	font-size: 12px;
	font-weight: bold;
	color: #28a745;
	width: 70px;
	height: 25px;
	background-color: white;
	border: 1px solid #28a745;
	float: left;
	border-radius: 5px;
}

button:hover, input[type=submit]:hover,input[type=button]:hover {
	background-color: #28a745;
	color: white;
	cursor: pointer;
}

button:active, input[type=submit]:active,input[type=button]:active {
	background-color: #28a745;
	color: white;
}

.cancel-reason-wrapper {
	display: inline-block;
	float: left;
	width: 90%;
	height: 100px;
	margin-left: 2%;
}

.cancel-textarea {
	margin-left: 10px;
	border: 1px solid lightgray;
}

.cancel-title {
	display: inline-block;
	margin-left: 10px;
}

.order-date {
	float: left;
	font-size: 20px;
}

.second-card {
	border: 1px solid rgb(238, 238, 238);
	border-radius: 10px;
	margin: 20px;
	margin-top: 0px;
}

.orderlist-body {
	padding: 25px 0px 25px 25px;
}

.product-detail {
	padding: 0px 45px;
	width: 42.5%;
}

.pay-state {
	width: 32.5%;
	border-left: 1px solid #ddd;
	padding: 0px 40px;
}

.order-state {
	width: 25%;
	border-left: 1px solid #ddd;
	padding: 0px 40px;
}

.byte {
	padding-left: 10px;
}

.btn-month {
	color: #28a745;
	font-size: 14px;
	background-color: white;
	border: 1px solid #28a745;
	border-radius: 10px;
	margin-right: 10px;
	margin-bottom: 30px;
	width: 80px;
}

.month-wrapper {
	display: inline-block;
	float: center;
}

.clicked-month {
	background-color: #28a745;
	color: white;
}

.file {
	display: none;
}
</style>
</head>
<body>
	<div id="wrap">
		<!--  헤더 메뉴 부분 시작 -->
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<%@ include file="../common/header.jsp"%>
			</div>
			<div class="col-2"></div>
		</div>
		<!--  헤더 메뉴 부분 끝 -->
		<!--  본문 시작 -->
		<div class="row">

			<div class="col-2"></div>
			<div class="col-8">
				<div class="col-2 wrapper">
					<div class="side-menu text-center">
						<div class="profile-area my-3 py-2">
							<!--  실제 회원 프로필 이미지 들어가는 곳 -->
							<div class="thumb">
								<img src="../resources/images/userprofile/${userInfo.profileFilename}"
									class="my-2 profile-img">
								<form class="img-form" action="/mypage/updateProfileImg.do"
									method="POST" enctype="multipart/form-data">
									<input type="file" class="file" name="uploadFile"
										onchange="changeValue(this)">
								</form>
							</div>

							<!--  회원 이름 보여주기 -->
							<p class="mb-2 fs-4 fw-bold">${userInfo.nickName}님</p>
							<p class="mb-2 fs-5 fw-light">
								<a href="/mypage/profile.do">프로필 관리</a>
							</p>
						</div>

						<nav class="my-3">
							<ul class="nav flex-column">
								<li class="order-title nav-item my-2">
									<a href="/mypage/home.do" class="nav-link order-title-link">
										주문/배송/리뷰
									</a>
								</li>
								<li class="basket nav-item my-2 clicked">
									<a href="/mypage/cart.do" class="nav-link">
										장바구니
									</a>
								</li>
								<li class="zzim nav-item my-2">
									<a href="/mypage/zzim.do" class="nav-link">
										찜한 상품
									</a>
								</li>
								<li class="select-review nav-item my-2">
									<a href="/mypage/selectreview.do" class="nav-link">
										내가 쓴 리뷰
									</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>


				<div class="col-10 content text-center">
					<!-- 실제 본문 영역 시작 -->
					<div class="mypage-item">
						<br>
	<div class="month-wrapper" style="max-width: 80%;">
		<button class="btn-month all-month">전체</button>
		<button class="btn-month one-month">1개월</button>
		<button class="btn-month three-month">3개월</button>
		<button class="btn-month six-month">6개월</button>
	</div>
	<c:forEach var='o' items='${orderlist }'>
		<div class="first-card mb-3" style="max-width: 80%;">

			<div class="first-card-header">
				<input type="hidden" class="month" value="<fmt:formatDate value='${o.orderDate}' pattern='MM'/>"
					date="<fmt:formatDate value='${o.orderDate}' pattern='dd'/>"
					year="<fmt:formatDate value='${o.orderDate}' pattern='yyyy'/>">
				<strong class="order-date">
					<fmt:formatDate value='${o.orderDate}' pattern='yyyy-MM-dd' /> 주문</strong>
			</div>
			<div class="second-card mb-3" style="max-width: 100%;">
				<div class="orderlist-body">
					<table>
						<tr>
							<td><a href='/product.do?productNo=${o.productNo }'>

									<img src="../resources/images/productimage/${o.imageName }" width="150"
									height="110">
							</a></td>
							<td class="product-detail">
								<p class="card-text">
									<a href='/product.do?productNo=${o.productNo }'>
										${o.productName }, ${o.detailQty }개<br> <strong>${o.payPrice }원</strong>
									</a>
								</p>
							</td>
							<td class="pay-state"><p class="card-text">${o.payMethod}결제
									<c:if test='${o.payState==0}'>(결제전)</c:if>
									<c:if test='${o.payState==1}'>(결제완료)</c:if>
								</p></td>
							<td class="order-state"><p class="card-text">
									<c:if test='${o.orderState==1}'>취소완료</c:if>
									<c:if test='${o.orderState==2}'>환불완료</c:if>
									<c:if test='${o.orderState==3}'>배송준비중</c:if>
									<c:if test='${o.orderState==4}'>배송중</c:if>
									<c:if test='${o.orderState==5}'>배송완료</c:if>
								</p></td>
						</tr>
					</table>
				</div>
				<c:if test='${o.orderState==3}'>
					<div class="btn">
						<input type="button" value="주문 취소" class="btn-order-cancel">
					</div>
					<div class="cancel-reason-wrapper">
						<table>
							<tr>
								<td class="cancel-title">취소/환불 사유</td>
								<td><textarea class="cancel-textarea"
										onkeyup="fn_checkByte(this)" cols="40" rows="2"></textarea></td>
								<td class="byte"><span id="nowByte">0</span>/60<br> <input
									type="button" value="확인" class="btn-cancel-check"
									name="${o.productNo }"></td>
							</tr>
						</table>
					</div>
				</c:if>
				<c:if test='${o.orderState==4||o.orderState==5}'>
					<form action="writereview.do" method="post">
						<div class="btn write-review-btn">
							<input type="hidden" value="${o.productNo }" name="productNo">
							<input type="hidden" name="orderDate"
								value='<fmt:formatDate value="${o.orderDate }" pattern='yyyy/MM/dd' />'>
							<input type="submit" value="리뷰 쓰기" class="btn-review">
						</div>
					</form>
				</c:if>
			</div>
		</div>
	</c:forEach>
					</div>
					<!-- 실제 본문 영역 끝 -->
				</div>
			</div>
			<div class="col-2"></div>
		</div>


		<!--  본문 시작 -->
		<!--  풋터 끝부분 시작 -->
		<div class="row">

			<div class="col-2"></div>
			<div class="col-8">
				<%@ include file="../common/footer.jsp"%>
			</div>
			<div class="col-2"></div>

		</div>
		<!--  풋터 끝부분 끝 -->
		<script
			src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
			integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"
			integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/"
			crossorigin="anonymous"></script>
	</div>
</body>
<script type="text/javascript">
	var sidebar = document.querySelectorAll('.nav-item');
	var ordertitle = document.querySelector('.order-title');
	//var detailPrice=$("#productPrice").value*$("#basketQty").value();
	var reasonWrapper = document.querySelector(".cancel-reason-wrapper");
	var totalByte = 0;
	var textarea = document.querySelector(".cancel-textarea");
	var monthList = document.querySelectorAll(".month");
	
	$(".profile-img").click(function() {
		$(".file").click();
	});

	function changeValue() {
		$(".img-form").submit();
	}
	
	$(".cancel-reason-wrapper").hide();
	$(".btn-order-cancel").click(function() {
		if (reasonWrapper.classList.contains("click")) {
			reasonWrapper.classList.remove('click');
			$(".cancel-reason-wrapper").hide();
			$(".cancel-textarea").val("");
			fn_checkByte(textarea);
		} else {
			reasonWrapper.classList.add('click');
			$(".cancel-reason-wrapper").show();
		}

	});
	$(".btn-cancel-check").click(function() {
		if (totalByte < 60) {
			var result = confirm("정말 취소하시겠습니까?");
			if (result) {
				var productNum = $(this).attr('name');
				var orderManageReason = $(".cancel-textarea").val();
				$.get("/mypage/updateOrder.do", {
					productNum : productNum,
					orderManageReason : orderManageReason
				}, function(data) {
				}, "json")
				setTimeout(function() {
					$(location).attr("href", "/mypage/home.do");

				}, 200);
			}
		else {
			alert("최대 60Byte까지만 입력가능합니다.");
		}
		}
	});

	$(".all-month").click(function(){
		$(".first-card").show();
		$(".btn-month").removeClass("clicked-month");
		$(".all-month").addClass("clicked-month");
	});
	
	$(".one-month").click(function() {
		var d = new Date();
		var date = d.getDate();
		var month = d.getMonth() + 1;
		var year = d.getFullYear();
		
		$(".btn-month").removeClass("clicked-month");
		$(".one-month").addClass("clicked-month");
		$(".first-card").show();
		monthList.forEach(function(m) {
		if(year==$(m).attr('year')||(year-1==$(m).attr('year')&&month-1==0)){
		if(month-1==0){
			if((Number)(m.value)==12){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<12){
				$(m).closest(".first-card").hide();
			}
		}
		else{
			if((Number)(m.value)==month-1){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<month-1){
				$(m).closest(".first-card").hide();
			}
		
		}	
		}
		});
		
	});
	
	$(".three-month").click(function(){
		var d = new Date();
		var date = d.getDate();
		var month = d.getMonth() + 1;
		var year = d.getFullYear();
		
		$(".btn-month").removeClass("clicked-month");
		$(".three-month").addClass("clicked-month");
		$(".first-card").show();
		monthList.forEach(function(m) {
		if(year==$(m).attr('year')||(year-1==$(m).attr('year')&&month-3==0)||(year-1==$(m).attr('year')&&month-3==-1)||(year-1==$(m).attr('year')&&month-3==-2)){
		if(month-3==0){
			if((Number)(m.value)==12){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<12){
				$(m).closest(".first-card").hide();
			}
		}
		else if(month-3==-1){
			if((Number)(m.value)==11){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<11){
				$(m).closest(".first-card").hide();
			}
		}
		else if(month-3==-2){
			if((Number)(m.value)==10){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<10){
				$(m).closest(".first-card").hide();
			}
		}
		else{
			if((Number)(m.value)==month-3){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<month-3){
				$(m).closest(".first-card").hide();
			}
		
		}
		}
		});
		
	});
	
	$(".six-month").click(function(){
		
		var d = new Date();
		var date = d.getDate();
		var month = d.getMonth() + 1;
		var year = d.getFullYear();
		
		$(".btn-month").removeClass("clicked-month");
		$(".six-month").addClass("clicked-month");
		$(".first-card").show();
		monthList.forEach(function(m) {
		if(year==$(m).attr('year')||(year-1==$(m).attr('year')&&month-6==0)||(year-1==$(m).attr('year')&&month-6==-1)||
				(year-1==$(m).attr('year')&&month-6==-2)||(year-1==$(m).attr('year')&&month-6==-3)||(year-1==$(m).attr('year')&&month-6==-4)||
				(year-1==$(m).attr('year')&&month-6==-5)){
		if(month-6==0){
			if((Number)(m.value)==12){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<12){
				$(m).closest(".first-card").hide();
			}
		}
		else if(month-6==-1){
			if((Number)(m.value)==11){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<11){
				$(m).closest(".first-card").hide();
			}
		}
		else if(month-6==-2){
			if((Number)(m.value)==10){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<10){
				$(m).closest(".first-card").hide();
			}
		}
		else if(month-6==-3){
			if((Number)(m.value)==9){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<9){
				$(m).closest(".first-card").hide();
			}
		}
		else if(month-6==-4){
			if((Number)(m.value)==8){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<8){
				$(m).closest(".first-card").hide();
			}
		}
		else if(month-6==-5){
			if((Number)(m.value)==7){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<7){
				$(m).closest(".first-card").hide();
			}
		}
		else{
			if((Number)(m.value)==month-6){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<month-6){
				$(m).closest(".first-card").hide();
			}
		
		}	
		}
		});
	});

	function fn_checkByte(obj) {

		var maxByte = 60; //최대 60바이트
		var text_val = obj.value; //입력한 문자
		var text_len = text_val.length; //입력한 문자수

		totalByte = 0;
		for (let i = 0; i < text_len; i++) {
			var each_char = text_val.charAt(i);
			var uni_char = escape(each_char) //유니코드 형식으로 변환
			if (uni_char.length > 4) {
				// 한글 : 2Byte
				totalByte += 2;
			} else {
				// 영문,숫자,특수문자 : 1Byte
				totalByte += 1;
			}
		}
		if (totalByte > maxByte) {
			alert('최대 60Byte까지만 입력가능합니다.');
			document.getElementById("nowByte").innerText = totalByte;
			document.getElementById("nowByte").style.color = "red";

		} else {
			document.getElementById("nowByte").innerText = totalByte;
			document.getElementById("nowByte").style.color = "green";
		}
	}


	$(".order-title").click();
	$(".all-month").click();
</script>
</html>