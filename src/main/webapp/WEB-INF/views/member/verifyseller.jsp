<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파사마노:::판매자 회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/commonStyle.css">
<style type="text/css">
	#invisibleSellerInfo, #alertVerifySellerId{
		display: none;
	}
</style>
</head>
<body>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-8">	
			<%@ include file="../common/header.jsp" %>
				</div>
		<div class="col-2">
		</div>
	</div>
	<!-- 페이지 상단 고정 부분 -->
	<!-- 페이지 본문 시작 -->

		<div class="row">
			<div class="col-2">
			</div>
			<div class="col-8">
				<!-- 메인페이지 슬라이드 배너 시작 -->
				<div class="join-form pt-4 my-5">
					<p class="text-center fs-4 fw-bold my-3 lh-sm">
						<span class="badge bg-success">1</span>
						사업자 등록번호 확인
					</p>
					<hr class="mx-auto pt-0.5 w-50">
					
					<form action="/member/sellerinfo.do" method="post" class="w-50 mx-auto" enctype="multipart/form-data">
					
						<div class="row mb-3 mx-auto">
							<label for="password" class="col-sm-3 col-form-label text-end">사업자등록번호</label>
							<div class="col-sm-9">
								<div class="input-group">
									<input type="text" class="form-control" id="sellerId1" name="sellerId1" maxlength="3" required="required">
									<input type="text" class="form-control" id="sellerId2" name="sellerId2" maxlength="2" required="required">
									<input type="text" class="form-control" id="sellerId3" name="sellerId3" maxlength="5" required="required">
								</div>
								<div class="fs-6 fw-light" id="alertVerifySellerId">
									<p class=my-1>유효하지 않은 사업자 등록번호입니다.</p>
								</div>
							</div>
						</div>
						<div class="text-center mt-4 mb-5">
							<button type="button" class="btn btn-success btn-lg w-50 d-inline" onclick="checkSellerId()">사업자 확인</button>
						</div>
						
						<!-- 판매자정보 입력 시작 -->
						<div id="invisibleSellerInfo">			
							<p class="text-center fs-4 fw-bold my-3 lh-sm">
								<span class="badge bg-success">2</span>
								파사마노 판매자 회원 정보 입력
							</p>
							<div class="row mb-3">
								<label for="company" class="col-sm-3 col-form-label text-end">법인명</label>
								<div class="col-sm-9">
									<input type="text" class="form-control input-my-1" name="sellerCompany" id="company" required="required">
								</div>
							</div>
							<div class="row mb-3">
								<label for="sellerCeo" class="col-sm-3 col-form-label text-end">대표자명</label>
								<div class="col-sm-9">
									<input type="text" class="form-control input-my-1" name="sellerCeo" id="sellerCeo" required="required">
								</div>
							</div>
							<div class="row mb-3">
								<label for="openDate" class="col-sm-3 col-form-label text-end">개업연월일</label>
								<div class="col-sm-9">
									<input type="date" class="form-control input-my-1" name="sellerDate" id="openDate" required="required">
								</div>
							</div>
							<div class="row mb-3">
								<label for="sellerAddress" class="col-sm-3 col-form-label text-end">사업장 소재지</label>
								<div class="col-sm-9">
									<input type="text" class="form-control input-my-1" name="sellerAddress" id="sellerAddress" required="required">
								</div>
							</div>

							<div class="row mb-3">
								<label for="profile" class="col-sm-3 col-form-label text-end">사업자등록증 파일</label>
								<div class="col-sm-9">
									<input type="file" class="form-control input-my-1" name="uploadFile" id="sellerFile" required="required">
								</div>
							</div>

							<div class="text-center mt-5">
								<button type="submit" class="btn btn-success btn-lg w-50 d-inline" onclick="insertsellerInfo()">회원정보 입력</button>
							</div>
						</div>	
					</form>
					<!-- 판매자정보 입력 끝 -->
				</div>
				<!-- 메인페이지 슬라이드 배너 끝 -->
			</div>
			<div class="col-2">
			</div>
		</div>

	<!-- 페이지 본문 종료 -->
	<!-- 페이지 하단 고정 부분 -->
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-8">
			<%@ include file="../common/footer.jsp" %>
		</div>
		<div class="col-2">
		</div>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
<script type="text/javascript">
	//사업자등록번호 유효성 검사
	function checkSellerId(){
		var sellerId1 = document.getElementById("sellerId1").value;
		var sellerId2 = document.getElementById("sellerId2").value;
		var sellerId3 = document.getElementById("sellerId3").value;
		var sellerId = sellerId1 + sellerId2 + sellerId3; 
		
		if(sellerId.length==10){
			var verify = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5);
			var sum = 0;
			
			for(var i=0 ; i<sellerId.length-1 ; i++){
				sum += sellerId[i] * verify[i]; 
			}
			var share = parseInt((sellerId[8] * verify[8]) / 10);
			sum += share;
			
			if(Math.floor(sellerId[9]) == ((10 - (sum%10)) % 10)){
				document.getElementById('invisibleSellerInfo').style.display = 'block';				
				document.getElementById('alertVerifySellerId').style.display = 'none';				
			}else{
				document.getElementById('invisibleSellerInfo').style.display = 'none';				
				document.getElementById('alertVerifySellerId').style.display='block';
			}
		}
	}
	
</script>
</html>