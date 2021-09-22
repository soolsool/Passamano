<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파사마노:::판매자 회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/commonStyle.css">
<link rel="stylesheet" href="/resources/css/member/verifyseller.css">

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
					
					<form action="/member/verifySeller.do" method="post" class="w-50 mx-auto" enctype="multipart/form-data">
					
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
									<select name="sido1" id="sido1" class="form-select"></select>
									<select name="gugun1" id="gugun1" class="form-select"></select>
									<!-- <input type="text" class="form-control input-my-1" name="sellerAddress" id="sellerAddress" required="required"> -->
								</div>
							</div>

							<div class="row mb-3">
								<label for="profile" class="col-sm-3 col-form-label text-end">사업자등록증 파일</label>
								<div class="col-sm-9">
									<input type="file" class="form-control input-my-1" name="uploadFile" id="sellerFile" required="required">
								</div>
							</div>

							<div class="text-center mt-5">
								<button type="submit" class="btn btn-success btn-lg w-50 d-inline">회원정보 입력</button>
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	//사업자등록번호 유효성 검사
	function checkSellerId(){
		var sellerId1 = document.getElementById("sellerId1").value;
		var sellerId2 = document.getElementById("sellerId2").value;
		var sellerId3 = document.getElementById("sellerId3").value;
		var sellerId = sellerId1 + sellerId2 + sellerId3; 

		if((!sellerId1)||(!sellerId2)||(!sellerId3)){
			alert("사업자 등록번호를 입력하세요.");
		}else if(sellerId.length==10){
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
	
	//사업자 소재지 입력받을 동적 Select문
	$('document').ready(function() {
		var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
		var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
		var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
		var area3 = ["대덕구","동구","서구","유성구","중구"];
		var area4 = ["광산구","남구","동구", "북구","서구"];
		var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
		var area6 = ["남구","동구","북구","중구","울주군"];
		var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
		var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
		var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
		var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
		var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
		var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
		var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
		var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
		var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
		var area16 = ["서귀포시","제주시","남제주군","북제주군"];
	
		// 시/도 선택 박스 초기화
		$("select[name^=sido]").each(function() {
			$selsido = $(this);
			$.each(eval(area0), function() {
			$selsido.append("<option value='"+this+"'>"+this+"</option>");
		});
			$selsido.next().append("<option value=''>구/군 선택</option>");
		});
		
		 // 시/도 선택시 구/군 설정
		$("select[name^=sido]").change(function() {
			var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
			var $gugun = $(this).next(); // 선택영역 군구 객체
			$("option",$gugun).remove(); // 구군 초기화
		
			if(area == "area0")
				$gugun.append("<option value=''>구/군 선택</option>");
			else {
				$.each(eval(area), function() {
					$gugun.append("<option value='"+this+"'>"+this+"</option>");
				});
			}
		 });
	
	});
	
</script>
</html>