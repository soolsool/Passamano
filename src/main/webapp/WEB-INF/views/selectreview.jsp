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
.thumb {
	border-radius: 50%;
}

.profile-area img {
	max-width: 100%;
	height: auto;
}
.wrapper {
	float: left;
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
.btn-wrap {
	text-align: center;
	display: inline-block;
	width:70px;
	height: 40px;
	margin: 2% 0;
	
}
.content{
	display:inline-block;
	margin-top:20px;
	float: right;
}
.btn-edit,.btn-delete {
	display:inline-block;
	font-size: 12px;
	font-weight: bold;
	color: #28a745;
	width: 60px;
	height:30px;
	background-color: white;
	border: 1px solid #28a745;
	border-radius: 5px;
}

.btn-edit:hover {
	background-color: #28a745;
	color: white;
	cursor: pointer;
}

.btn-edit:active {
	background-color: #28a745;
	color: white;
}

.btn-delete:hover {
	background-color: #28a745;
	color: white;
	cursor: pointer;
}

.btn-delete:active {
	background-color: #28a745;
	color: white;
}

.second-card {
	border: 1px solid rgb(238, 238, 238);
	border-radius: 10px;
	margin: 20px;
	margin-top: 0px;
}

.orderlist-body {
	padding: 25px 0px 25px 25px;
	border-bottom: 1px solid lightgray;
}

.product-detail {
	width: 250px;
	margin-left:20px;
	float:left;
}


.star {
	display: inline-block;
	margin-bottom: 7px;
	font-size:30px;
	color:#ffd633;
}


.title {
	padding: 10px 20px 8px 0px;
}

.select-review-wrapper{
	display:inline-block;
	margin:20px;
	float:left;
}
.product-img{
	display:inline-block;
	width:150px;
	float:left;
}
#wrap{
	 overflow: hidden;
    min-width: 1600px;
}
td{
text-align:left;
}
.button{
	text-align:left;
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
							<li class="zzim nav-item my-2"><a class="nav-link" href="#">찜한
									상품</a></li>
							<li class="select-review nav-item my-2 clicked"><a class="nav-link" href="#">내가
									쓴 리뷰</a></li>
	
						</ul>
					</nav>
				</div>
			</div>
			

			<div class="col-10 content text-center">
				<!-- 실제 본문 영역 시작 -->
				<div class="mypage-item"><%@ include file='/mypage/selectReview.jsp'%></div>
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
			$(location).attr("href", "/zzim.do");
		}
		else if(s.innerText=="내가 쓴 리뷰"){
		}
	});
}

sidebar.forEach(function(s) {
	sidebarClickEvent(s);
});

$(".select-review").click();
</script>
</html>