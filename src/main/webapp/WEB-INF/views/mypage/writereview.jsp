<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<link rel="stylesheet" href="../files/css/commonStyle.css">
<style type="text/css">
.btn-wrap {
	text-align: center;
	display: inline-block;
	width: 100%;
	height: 50px;
	margin: 2% 0;
}

.btn-write {
	font-size: 15px;
	font-weight: bold;
	color: #28a745;
	width: 100px;
	height: 40px;
	background-color: white;
	border: 1px solid #28a745;
	border-radius: 5px;
	float: center;
}

.btn-write:hover {
	background-color: #28a745;
	color: white;
	cursor: pointer;
}

.btn-write:active {
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
	width: 200px;
	margin-left:20px;
	float:left;
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

.star {
	display: inline-block;
	margin-bottom: 7px;
	font-size:30px;
	color:#ffd633;
}

.star:hover {
	cursor: pointer;
}

.content {
	display: inline-block;
	margin-top:20px;
	float:right;
}

.title {
	padding: 10px 20px 8px 60px;
}

.title-input {
	display: inline-block;
	width: 350px;
}

.byte {
display: inline-block;
	padding-left: 10px;
}
.write-review-wrapper{
	display:inline-block;
	margin:20px auto 0px auto;
}
.product-img{
	display:inline-block;
	width:150px;
	float:left;
}
.review-content{
	display: inline-block;
	text-align:top;
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

		<br>
		<div class="first-card mb-3" style="max-width: 60%;">

			<div class="first-card-header">
				<strong>리뷰 작성</strong>
			</div>
			<div class="second-card mb-3" style="max-width: 100%;">
				<div class="orderlist-body">
					<table>
						<tr>
							<td class="product-img"><a href='product.do?productNo=${w.productNo }'>

									<img src="../files/products_images/${w.imageName }" width="120"
									height="90">
							</a></td>
							<td class="product-detail"><a
								href='product.do?productNo=${w.productNo }'>
									<p class="card-text">
										${w.productName }, ${w.detailQty }개<br> <strong>${w.payPrice }원</strong>
									</p>
							</a></td>
						</tr>
					</table>
				</div>
				<div class="write-review-wrapper">
					<form action="/mypage/writeReviewController.do" method="post" onsubmit="return check()"
						enctype="multipart/form-data">
						<input type="hidden" name="ordersNo" value="${w.ordersNo}">
					<table>
						<tr>
							<td class="title">평점</td>
							<td><input type="hidden" class="evaluation"
								name="evaluation" value="0">
								<p class="star star1">☆</p>
								<p class="star star2">☆</p>
								<p class="star star3">☆</p>
								<p class="star star4">☆</p>
								<p class="star star5">☆</p></td>
							<td></td>
						</tr>
						<tr>
							<td class="title">제목</td>
							<td><input type="text" name="reviewTitle" required="required"
								class="title-input" maxlength="20"></td>
							<td></td>
						</tr>
						<tr>
							<td class="title review-content">내용</td>
							<td><textarea maxlength="200" rows="10" cols="80" required="required" class="review-content"
									onkeyup="fn_checkByte(this)" name="reviewContent"></textarea></td>
							<td class="byte"><span id="nowByte">0</span>/250</td>
						</tr>
						<tr><td class="title">파일</td><td> <input type="file" name="uploadFile"></td><td></td></tr>
						
						<tr><td></td><td><div class="btn-wrap write-review-btn">
						<input type="submit" value="작성하기" class="btn-write">
					</div></td><td></td></tr>
					</table>
					
					
				</form>
				</div>
			</div>
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
	var totalByte = 0;
	var textarea= document.querySelector(".review-content");

	$(".star1").click(function() {
		if ($(".evaluation").val() == 1) {
			$(".star").html("☆");
			$(".evaluation").val("0");
		} else {
			$(".star").html("☆");
			$(".star1").html("★");
			$(".evaluation").val("1");
		}
	});
	$(".star2").click(function() {
		$(".star").html("☆");
		$(".star1").html("★");
		$(".star2").html("★");
		$(".evaluation").val("2");
	});
	$(".star3").click(function() {
		$(".star").html("★");
		$(".star4").html("☆");
		$(".star5").html("☆");
		$(".evaluation").val("3");
	});
	$(".star4").click(function() {
		$(".star").html("★");
		$(".star5").html("☆");
		$(".evaluation").val("4");
	});
	$(".star5").click(function() {
		$(".star").html("★");
		$(".evaluation").val("5");
	});
	function check() {
		if (totalByte > 250) {
			alert("최대 250Byte까지만 입력가능합니다.");
			return false;
		}
	}

	function fn_checkByte(obj) {

		var maxByte = 250; //최대 400바이트
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
			alert('최대 250Byte까지만 입력가능합니다.');
			document.getElementById("nowByte").innerText = totalByte;
			document.getElementById("nowByte").style.color = "red";

		} else {
			document.getElementById("nowByte").innerText = totalByte;
			document.getElementById("nowByte").style.color = "green";
		}
	}
	fn_checkByte(textarea);
</script>
</html>