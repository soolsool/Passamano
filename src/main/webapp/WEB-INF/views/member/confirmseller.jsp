<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>파사마노PASSAMANO</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/commonStyle.css">
<style type="text/css">
/* css 입력 */
</style>
</head>
<body id="bootstrap-overrides">
	<!--  헤더 메뉴 부분 시작 -->
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-8">
			<%@ include file="../common/header.jsp" %>
		</div>
		<div class="col-2">
		</div>
	</div>
	<!--  헤더 메뉴 부분 끝 -->
	<!--  본문 시작 -->
	<div class="row">
	
		<div class="col-2">
		</div>
		<div class="col-8">
		<!-- 실제 본문 영역 시작 -->
			<div class="p-5 mb-4 bg-light rounded-3">
		      <div class="container-fluid py-5">
		        <h1 class="display-5 fw-bold">회원가입을 환영합니다.</h1>
		        <p class="col-md-8 fs-5">
		        	파사마노는 산지 직송으로 직접 거래할 수 있는 플랫폼입니다.<br>
		        	함께 구매하는 사람이 많으면 많을수록 더 저렴한 가격에 구매할 수 있습니다.<br>
		        	소비자는 직거래로 신선한 상품을, 생산자는 더 많은 수익을<br>
		        	소비자와 생산자가 공생할 수 있는 파사마노에 가입하신 걸 환영합니다.
		        </p>
		        <button type="button" class="btn btn-success btn-lg mt-3" onclick="location.href='/seller/listProduct.do'">상품 등록하러가기</button>
		      </div>
		    </div>
		<!-- 실제 본문 영역 끝 -->
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