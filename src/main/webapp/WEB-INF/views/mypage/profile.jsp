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
.profile-area img {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	cursor: pointer;
}

.wrapper {
	float: left;
}

.content {
	margin-top: 20px;
	float: right;
}

.nav-item a:hover {
	background-color: lightgray;
	color: white;
	cursor: pointer;
}

.nav-item a:active {
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

.file {
	display: none;
}

.profile-area p {
	color: white;
	font-weight: bold;
}

.profile-area a p {
	font-size: 12px;
}

.user-info-edit-title {
	margin: 10px;
	font-size: 20px;
	font-weight: bold;
	text-align: center;
}

td {
	text-align: left;
	padding: 2px 20px 5px 0px;
}

.address2, .address3 {
	width: 300px;
}

.address1 {
	width: 100px;
}

.user-info-table {
	display: inline-block;
	float: center;
	padding-bottom: 30px;
}

.btn-profile {
	font-size: 12px;
	font-weight: bold;
	color: #28a745;
	width: 90px;
	height: 30px;
	background-color: white;
	border: 1px solid #28a745;
	float: left;
	border-radius: 5px;
	padding: 0;
}

.btn-post {
	font-size: 12px;
	font-weight: bold;
	color: #28a745;
	width: 90px;
	height: 30px;
	background-color: white;
	border: 1px solid #28a745;
	border-radius: 5px;
	padding: 0;
}

button:hover {
	background-color: #28a745;
	color: white;
	cursor: pointer;
}

button:active {
	background-color: #28a745;
	color: white;
}

.wrong-pwd {
	margin: 0;
	font-size: 12px;
	color: red;
}

.btn-post {
	margin: 2px 0px 2px 8px;
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
						<div class="first-card mb-3" style="max-width: 80%;">
							<div class="first-card-header">
								<p class="user-info-edit-title">회원정보 수정</p>
							</div>
							<div class="cart-body">
								<table class="user-info-table">
									<tr>
										<td>아이디</td>
										<td>${userDetailInfo.id}</td>
									</tr>
									<tr>
										<td>이름</td>
										<td>${userDetailInfo.name}</td>
									</tr>
									<tr>
										<td>닉네임</td>
										<td><input type="text" class="user-nickname"
											required="required" nickname="${userDetailInfo.nickName}"
											value="${userDetailInfo.nickName}"></td>
									</tr>
									<tr>
										<td></td>
										<td><button class="btn-profile btn-nickname">닉네임
												변경</button></td>
									</tr>
									<tr>
										<td>휴대폰 번호</td>
										<td>${userDetailInfo.phone}</td>
									</tr>
									<tr>
										<td>비밀번호 변경</td>
										<td>
											<table>
												<tr>
													<td>현재 비밀번호</td>
													<td class="pwd-td"><input required="required"
														type="password" class="user-password"><br>
														<p class='wrong-pwd now-wrong'>현재 비밀번호가 일치하지 않습니다.</p></td>
												</tr>
												<tr>
													<td>새 비밀번호</td>
													<td><input type="password" required="required"
														class="new-password"></td>
												</tr>
												<tr>
													<td>비밀번호 다시 입력</td>
													<td class="new-pwd2-td"><input type="password"
														required="required" class="new-password2"><br>
														<p class='wrong-pwd new-wrong'>새 비밀번호가 일치하지 않습니다.</p></td>
												</tr>
												<tr>
													<td></td>
													<td><button class="btn-profile btn-password">비밀번호
															변경</button></td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>배송지</td>
										<td>
											<table>
												<tr>
													<td><input type="text" readonly
														class="address address1"
														placeholder="${userDetailInfo.address1}">
														<button class="btn-post" onclick="findAddr()">우편번호
															검색</button></td>
												</tr>
												<tr>
													<td><input type="text" readonly
														class="address address2"
														placeholder="${userDetailInfo.address2}"></td>
												</tr>
												<tr>
													<td><input type="text" class="address address3"
														value="${userDetailInfo.address3}"></td>
												</tr>
												<tr>
													<td><button class="btn-profile btn-address">배송지
															변경</button></td>
												</tr>
												</tr>

											</table>
										</td>
									</tr>
								</table>
							</div>
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
	$(".wrong-pwd").hide();
	$(".profile-img").click(function() {
		$(".file").click();
	});

	function findAddr() {
		new daum.Postcode({
			oncomplete : function(data) {

				console.log(data);

				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var jibunAddr = data.jibunAddress; // 지번 주소 변수
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				$(".address1").val(data.zonecode);
				if (roadAddr !== '') {
					$(".address2").val(roadAddr);
				} else if (jibunAddr !== '') {
					$(".address2").val(jibunAddr);
				}
			}
		}).open();
	}

	function changeValue() {
		$(".img-form").submit();
	}

	$(".btn-address").click(
			function() {
				var address1 = $(".address1").val();
				var address2 = $(".address2").val();
				var address3 = $(".address3").val();
				if ($(".address3").val() == "") {
					alert("공백은 입력이 불가능합니다.");

				} else {
					if (address1 == "" || address2 == "") {
						address1 = $(".address1").attr('placeholder');
						address2 = $(".address2").attr('placeholder');
					}
					$.ajax({

						type : "POST",
						url : "/mypage/updateAddress.do?address1=" + address1
								+ "&address2=" + address2 + "&address3="
								+ address3,
						error : function() {
							alert('error');
						},
						success : function() {
							alert("주소지가 정상적으로 변경되었습니다.");
						}

					});
				}

			});

	$(".btn-nickname").click(function() {
		var nickname = $(".user-nickname").val();
		var origin_nickname = $(".user-nickname").attr('nickname');
		var url_link = "/mypage/nicknameCheck.do?nickname=" + nickname;
		if (nickname == "") {
			alert("공백은 입력이 불가능합니다.");
		} else {
			if (nickname == origin_nickname) {
				alert("현재와 동일한 닉네임입니다.");
			} else {
				$.ajax({

					type : "POST",
					url : url_link,
					dataType : "text",
					error : function() {
						alert('error');
					},
					success : function(data) {
						if (data == 0) {

							alert("닉네임이 변경되었습니다.");
						} else if (data == 1) {
							alert("중복된 닉네임입니다.");
						}
					}

				});
			}
		}

	});

	$(".btn-password").click(
			function() {
				var password = $(".user-password").val();
				var newPassword = $(".new-password").val();
				var newPassword2 = $(".new-password2").val();
				$(".wrong-pwd").hide();
				if (password == "" || newPassword == "" || newPassword2 == "") {
					alert("공백은 입력이 불가능합니다.");
				} else {
					$.ajax({

						type : "POST",
						url : "/mypage/passwordCheck.do?password=" + password,
						dataType : "text",
						error : function() {
							alert('error');
						},
						success : function(data) {
							if (data == 0) {
								if (newPassword == newPassword2) {
									$.ajax({

										type : "POST",
										url : "/mypage/updatePassword.do?newPassword="
												+ newPassword,
										error : function() {
											alert('error');
										},
										success : function() {
											$(".user-password").val("");
											$(".new-password").val("");
											$(".new-password2").val("");
											alert("비밀번호가 정상적으로 변경되었습니다.");
										}

									});

								} else {
									$(".new-password2").val("");
									$(".new-wrong").show();
									$(".new-password2").focus();
								}

							} else if (data == 1) {
								$(".now-wrong").show();
								$(".user-password").val("");
								$(".user-password").focus();

							}
						}
					});

				}
			});


</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>