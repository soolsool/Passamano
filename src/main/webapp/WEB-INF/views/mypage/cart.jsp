<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>파사마노-PASSAMANO</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/commonStyle.css">
<link rel="stylesheet" href="/resources/css/mypage/cart.css">
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
							<a href="/mypage/profile.do">
								프로필 관리
							</a>
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
						<div class="all-product-select" style="max-width: 80%;">
							<input name="all-check" class="checkbox all-check"
								type="checkbox"><span class="all-check-title">전체선택</span>
						</div>
						<c:forEach var='b' items='${basket }'>

							<div class="first-card mb-3" detailPrice="${b.detailPrice}"
								style="max-width: 80%;">
								<div class="first-card-header">
									<input name="checkbox" class="checkbox""
										productNo="${b.productNo }" type="checkbox">
								</div>
								<div class="cart-body">
									<table>
										<tr class="cart-item">
											<td>
												<a href='product.do?productNo=${b.productNo }'>
													<img src="../resources/images/productimage/${b.imageName }"width="150" height="110">
												</a>
											</td>
											<td class="product-detail">
												<p class="card-text">
													<a href='product.do?productNo=${b.productNo }'>
														${b.productName }, ${b.basketQty }개<br>
													</a>
												</p>
											</td>
											<td class="product-price"><strong>${b.detailPrice}원</strong></td>
											<c:if test='${b.detailPrice>=50000}'>
												<td class="delivery-price"><span>0</span>원
													<p class="card-text delivery-title">(50,000원 이상 구매시 배송비
														무료)</p></td>
											</c:if>
											<c:if test='${b.detailPrice<50000}'>
												<td class="delivery-price"><span>3,000</span>원
													<p class="card-text delivery-title">(50,000원 이상 구매시 배송비
														무료)</p></td>
											</c:if>
										</tr>
									</table>
								</div>
							</div>

						</c:forEach>
						<div class="total-card" style="max-width: 80%;">
							<div>
								총 상품가격
								<p class='total-price'>0</p>
								원 + 총 배송비
								<p class='total-delivery-fee'>0</p>
								원 = 총 주문금액
								<p class='last-price'>0</p>
								원
							</div>
						</div>
						<div class="d-grid gap-2 d-md-flex justify-content-md-end btns">

							<input type='button' value='삭제' class="btn-input cancel-btn">
							<input type="button" value='주문하기' class="btn-input order-btn">

						</div>
					</div>
					<!-- 실제 본문 영역 끝 -->
				</div>
			</div>
			<div class="col-2"></div>
	</div>
	<!--  본문 끝 -->
	<!--  풋터 끝부분 시작 -->
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8">
			<%@ include file="../common/footer.jsp"%>
		</div>
		<div class="col-2"></div>
	</div>
	<!--  풋터 끝부분 끝 -->
</body>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
	integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"
	integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/"
	crossorigin="anonymous"></script>
<script type="text/javascript">
var sidebar = document.querySelectorAll('.nav-item');
var checkedValue = [];
var totalprice = 0;
var totaldeliveryfee = 0;
var lastprice = 0;

$(".profile-img").click(function() {
	$(".file").click();
});

function changeValue() {
	$(".img-form").submit();
}

$(".all-check").click(function(){
	$("input[type=checkbox][name=checkbox]").prop("checked", true);
});

$(".checkbox").click(
		function() {
			if ($(this).hasClass('all-check')&& $(".all-check").is(':checked')) {
				$("input[type=checkbox][name=checkbox]").prop("checked", true);
			} else if ($(this).hasClass('all-check')&& $(".all-check").is(':not(:checked)')) {
				$("input[type=checkbox][name=checkbox]").prop("checked", false);
			}
			checkedValue = [];
			totalprice = 0;
			totaldeliveryfee = 0;
			lastprice = 0;
			$("input[name=checkbox]:checked")
					.each(
							function(index, item) {
								checkedValue.push($(item).val());
								totalprice += Number($(item).closest('.first-card').attr('detailPrice'));
								lastprice += Number($(item).closest('.first-card').attr('detailPrice'));

								if ($(item).closest('.first-card').attr('detailPrice') > 50000) {
									totaldeliveryfee += 0;
									lastprice += 0;
								} else {
									totaldeliveryfee += 3000;
									lastprice += 3000;
								}

							});
			var comma = (totalprice.toString().length) / 4;
			var comma2 = (totaldeliveryfee.toString().length) / 4;
			var comma3 = (lastprice.toString().length) / 4;
			if (comma >= 1) {
				for (var i = 1; i <= comma; i++) {
					totalprice = [
							(totalprice.toString()).slice(0,
									totalprice.toString().length
											- i * 3),
							(totalprice.toString()).slice(
									totalprice.toString().length
											- i * 3, totalprice
											.toString().length) ].join(',');
				}
			}
			if (comma2 >= 1) {
				for (var i = 1; i <= comma2; i++) {
					totaldeliveryfee = [
							(totaldeliveryfee.toString())
									.slice(0, totaldeliveryfee
											.toString().length
											- i * 3),
							(totaldeliveryfee.toString())
									.slice(
											totaldeliveryfee
													.toString().length
													- i * 3,
											totaldeliveryfee
													.toString().length) ].join(',');
				}
			}
			if (comma3 >= 1) {
				for (var i = 1; i <= comma3; i++) {
					lastprice = [
							(lastprice.toString()).slice(0,
									lastprice.toString().length - i
											* 3),
							(lastprice.toString()).slice(lastprice
									.toString().length
									- i * 3,
									lastprice.toString().length) ].join(',');
				}
			}
			$(".total-price").html(totalprice);
			$(".total-delivery-fee").html(totaldeliveryfee);
			$(".last-price").html(lastprice);

		});

	$(".cancel-btn").click(function() {
		var checkedValue = [];
		var result = confirm("선택한 상품을 삭제하시겠습니까?");
		if (result) {
			$("input[name=checkbox]:checked").each(function(index, item) {
	
				checkedValue.push($(item).attr('productNo'));
	
			});
			$("input[type=checkbox][class=checkbox]").prop("checked", false);
			$.get("/mypage/deleteBasket.do", {
				basket : checkedValue
			}, function(data) {
			}, "json")
			$(location).attr("href", "/mypage/cart.do");
		}
	
	});
	
	$(".order-btn").click(function() {
		var checkedValue = [];
		var deliveryFee = [];
		if ($("input[name=checkbox]:checked").length) {
			var result = confirm("선택한 상품을 주문하시겠습니까?");
			if (result) {
				$("input[name=checkbox]:checked").each(function(index, item) {
					checkedValue.push($(item).attr('productNo'));
					if ($(item).closest('.first-card').attr('detailPrice') > 50000) {
						deliveryFee.push('0');
					} else {
						deliveryFee.push('3000');
				}
				});
				console.log("상품번호,"+checkedValue);
				console.log("배송료,"+deliveryFee);
				
				$.get("/mypage/basketProcess.do", {
					basketProductNo : checkedValue,
					deliveryFee : deliveryFee
				}, function(data) {
					console.log("OK");
				}, "json")
				$(location).attr("href", "/mypage/order.do");
			}
			}
		 else {
			alert("선택된 상품이 없습니다.");
		}
	});
</script>
</html>