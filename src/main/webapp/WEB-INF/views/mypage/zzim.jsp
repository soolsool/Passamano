<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>파사마노:::찜</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/commonStyle.css">
<link rel="stylesheet" href="/resources/css/mypage/zzim2.css">
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
								<a href="/mypage/profile.do">
									프로필 관리
								</a>
						</div>

						<nav class="my-3">
							<ul class="nav flex-column">
								<li class="order-title nav-item my-2">
									<a href="/mypage/home.do" class="nav-link order-title-link">
										주문/배송/리뷰
									</a>
								</li>
								<li class="basket nav-item my-2 ">
									<a href="/mypage/cart.do" class="nav-link">
										장바구니
									</a>
								</li>
								<li class="zzim nav-item my-2 clicked">
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
							<input name="all-check-zzim" class="zzim-checkbox all-check-zzim"
								type="checkbox"><span class="all-check-title">전체선택</span>
						</div>
						<c:forEach var='z' items='${zzim }'>

							<div class="first-card mb-3" name="${z.productNo }"
								style="max-width: 80%;">
								<div class="first-card-header">
									<input name="zzim-checkbox" class="zzim-checkbox"
										productNo="${z.productNo }" value="${z.zzimNo}"
										type="checkbox">
								</div>
								<div class="cart-body">
									<table>
										<tr class="cart-item">
											<td><a href='/product.do?productNo=${z.productNo }'>
													<img src="../resources/images/productimage/${z.imageName }"
													width="150" height="110">
											</a></td>
											<td class="product-detail">
												<p class="card-text">
													<a href='/product.do?productNo=${z.productNo }'>
														${z.productName }
													</a>
												</p>
											</td>
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
	</div>
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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	var sidebar = document.querySelectorAll('.nav-item');

	$(".profile-img").click(function() {
		$(".file").click();
	});

	function changeValue() {
		$(".img-form").submit();
	}


	$(".all-check-zzim").click(
			function() {
				if ($(".all-check-zzim").is(':checked')) {
					$("input[type=checkbox][class=zzim-checkbox]").prop(
							"checked", true);
				} else if ($(".all-check-zzim").is(':not(:checked)')) {
					$("input[type=checkbox][class=zzim-checkbox]").prop(
							"checked", false);
				}
			});

	$(".zzim-cancel-btn").click(
			function() {
				var checkedValue = [];
				var result = confirm("선택한 상품을 삭제하시겠습니까?");
				if (result) {
					$("input[name=zzim-checkbox]:checked").each(
							function(index, item) {

								checkedValue.push($(item).val());
								$(item).closest('.first-card').hide();

							});
					$("input[type=checkbox][name=zzim-checkbox]").prop(
							"checked", false);
					$.get("/mypage/deleteZzim.do", {
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
			$.get("/mypage/zzimProcess.do", {
				zzimProductNo : checkedValue,
			}

			, function(data) {

			}, "json")
			alert("상품이 장바구니에 담겼습니다.");
		}

		$(location).attr("href", "/mypage/cart.do");

	});


	$(".zzim").click();
</script>
</html>