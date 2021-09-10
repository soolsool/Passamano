<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<link rel="stylesheet" href="../files/css/commonStyle.css">
<style type="text/css">
.profile-area {
	background: #28a745;
}
.profile-area img {
	width:100px;
	height:100px;
	border-radius: 50%;
	
}
.wrapper {
	float: left;
}


.content {
	margin-top:20px;
	float: right;
}

.nav-item:hover {
	background-color: lightgray;
	color: white;
	cursor: pointer;
}

.nav-item:active {
	background-color: lightgray;
	color: white;
}

.clicked {
	background-color: lightgray;
	color: white;
}

.first-card {
	margin: 0px auto;
	border-radius: 12px;
    box-shadow: rgb(0 0 0 / 15%) 0px 2px 4px 0px, rgb(0 0 0 / 30%) 0px 0px 1px 0px;
    display: flex;
    flex-direction: column;
   
}
.first-card-header{
	padding: 20px;
}
#wrap {
    overflow: hidden;
    min-width: 1600px;
}
.btn-input {
	font-size: 18px;
	margin: 0px 50px;
	background-color: white;
	width: 150px;
	height: 50px;
	color: #28a745;
	font-weight: bold;
	border: 1px solid #28a745;
	border-radius: 5px;
}

.btn-input:hover {
	background-color: #28a745;
	color: white;
	cursor: pointer;
}

.btn-input:active {
	background-color: #28a745;
	color: white;
}

.btns {
	display: inline-block;
	width: 500px;
	height: 50px;
	margin: 70px auto 80px auto;
}

input[type=checkbox] {
	zoom: 1.5;
	float: left;
}

.cart-body {
	padding: 0px 25px 25px 25px;
}

.product-price {
	width: 30%;
	border-left: 1px solid #ddd;
	padding: 0px 5%;
}
.product-detail {
	padding: 0px 5%;
	width: 40%;
}
.all-product-select {
	display: flex;
	margin: 0px auto;
	padding: 20px;
}

.all-check-zzim {
	margin: 4px 5px 0px 0px;
}

.all-check-title {
	margin: auto 3px;
	font-size: 18px;
	font-weight: bold;
}
</style>
</head>
<body>
<div id="wrap">
	<!--  헤더 메뉴 부분 시작 -->
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8" >
			<%@ include file="./common/header.jsp"%>
		</div>
		<div class="col-1"></div>
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
								<img src="../files/images/${userInfo.profileFileName}"
									class="my-2">
							</div>
						<!--  회원 이름 보여주기 -->
						<p class="mb-2">${userInfo.name}님</p>
						<a href="/profile.do">
							<p class="mb-2">프로필 관리</p>
						</a>
					</div>

					<nav class="my-3">

						<ul class="nav flex-column">
							<li class="order-title nav-item my-2"><a class="nav-link order-title-link"
								href="#">주문/배송/리뷰</a></li>
							<li class="basket nav-item my-2"><a class="nav-link" href="#">장바구니</a>
							</li>
							<li class="zzim nav-item my-2 clicked"><a class="nav-link" href="#">찜한
									상품</a></li>
							<li class="select-review nav-item my-2"><a class="nav-link" href="#">내가
									쓴 리뷰</a></li>
	
						</ul>
					</nav>
				</div>
			</div>
			

			<div class="col-10 content text-center">
				<!-- 실제 본문 영역 시작 -->
				<div class="mypage-item">
					<br>
	<div class="all-product-select" style="max-width: 80%;">
		<input name="all-check-zzim" class="zzim-checkbox all-check-zzim" type="checkbox"><span
			class="all-check-title">전체선택</span>
	</div>
	<c:forEach var='z' items='${zzim }'>

		<div class="first-card mb-3" name="${z.productNo }"
			style="max-width: 80%;">
			<div class="first-card-header">
				<input name="zzim-checkbox" class="zzim-checkbox" productNo="${z.productNo }" value="${z.zzimNo}"
					type="checkbox">
			</div>
			<div class="cart-body">
				<table>
					<tr class="cart-item">

						<td><a href='detailProduct.do?productNo=${z.productNo }'>
								<img src="../files/products_images/${z.imageName }" width="150"
								height="110">
						</a></td>
						<td class="product-detail"><a href='detailProduct.do?productNo=${z.productNo }'>
								<p class="card-text">
										${z.productName }
									</p>
						</a></td>
						<td class="product-price"><strong>${z.productPrice}원</strong></td>

					</tr>
				</table>
			</div>
		</div>

	</c:forEach>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end btns">

		<input type='button' value='삭제' class="btn-input zzim-cancel-btn">
		<input type="button" value='장바구니 추가' class="btn-input cart-btn">

	</div>
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
			<%@ include file="./common/footer.jsp"%>
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
function sidebarClickEvent(s) {
	s.addEventListener('click', function(e) {
		
		if(s.innerText=="주문/배송/리뷰"){
			$(location).attr("href", "/mypage.do");
		}
		else if(s.innerText=="장바구니"){
			$(location).attr("href", "/cart.do");
		}
		else if(s.innerText=="찜한 상품"){

		}
		else if(s.innerText=="내가 쓴 리뷰"){
			$(location).attr("href", "/selectreview.do");
		}
	});
}

$(".all-check-zzim").click(
		function() {
			if ($(".all-check-zzim").is(':checked')) {
				$("input[type=checkbox][class=zzim-checkbox]").prop("checked", true);
			} else if ($(".all-check-zzim").is(':not(:checked)')) {
				$("input[type=checkbox][class=zzim-checkbox]").prop("checked", false);
			}
		});

$(".zzim-cancel-btn").click(function() {
	var checkedValue = [];
	var result = confirm("선택한 상품을 삭제하시겠습니까?");
	if (result) {
		$("input[name=zzim-checkbox]:checked").each(function(index, item) {

			checkedValue.push($(item).val());
			$(item).closest('.first-card').hide();

		});
		$("input[type=checkbox][name=zzim-checkbox]").prop("checked", false);
		$.get("/deleteZzim.do", {
			zzim : checkedValue
		}, function(data) {
		}, "json")
	}

});
$(".cart-btn").click(function() {
	var checkedValue = [];
	if ($("input[name=zzim-checkbox]:checked").length) {

			$("input[name=zzim-checkbox]:checked").each(function(index, item) {
				checkedValue.push($(item).attr('productNo'));
			});
			$.get("/zzimProcess.do", {
				zzimProductNo : checkedValue,
			}

			, function(data) {
				
			}, "json")
			alert("상품이 장바구니에 담겼습니다.");
		}

		$(location).attr("href", "/cart.do");


});

sidebar.forEach(function(s) {
	sidebarClickEvent(s);
});

$(".zzim").click();
</script>
</html>