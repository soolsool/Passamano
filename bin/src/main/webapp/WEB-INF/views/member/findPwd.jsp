<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파사마노:::비밀번호찾기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/commonStyle.css">
<link rel="stylesheet" href="/resources/css/member/findPwd.css">
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
			<div class="login-section my-6 pt-5 pb-5">
				<p class="text-center fs-5 mt-5 mb-4">아이디 찾기</p>
				<form class="form-inline w-50 mx-auto" action="" method="post">
					<div class="row mb-3">
						<label for="name" class="col-sm-3 col-form-label text-end">이름</label>
						<div class="col-sm-6">
							<input type="text" class="form-control input-sm" id="name" name="name" aria-label="Username" aria-describedby="basic-addon1" required="required">
						</div>
					</div>
					
					<div class="row mb-3">
						<label for="id" class="col-sm-3 col-form-label text-end">아이디</label>
						<div class="col-sm-6">
							<input type="text" class="form-control input-sm" id="id" name="id" aria-label="UserId" aria-describedby="basic-addon1" required="required">
						</div>
					</div>
					
					<div class="row mb-3">
						<label for="phone" class="col-sm-3 col-form-label text-end">휴대폰</label>
						<div class="col-sm-6">
							<input type="text" class="form-control input-my-1 mb-1" name="phone" id="phone" pattern="[0-9,-]{13}" placeholder="-(하이픈)을 입력해주세요." required="required">
							<div id="alertCode">
							</div>
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn d-inline btn-outline-success w-100" onclick="beforeSending()">회원 확인</button>
						</div>
					</div>
					
					<!-- 인증번호 버튼 클릭시 노출 -->
					<div class="verifyCode">
						<div class="row mb-3">
							<label for="code" class="col-sm-3 col-form-label text-end">인증번호</label>
							<div class="col-sm-6">
								<input type="text" class="form-control input-my-1" name="code" id="code" placeholder="인증번호" required="required">
							</div>
							<div class="col-sm-3">
								<button type="button" class="btn d-inline btn-outline-success w-100" onclick="checkCode()">인증번호 확인</button>
							</div>
						</div>
					</div>

					<div class="row mb-3">
						<div class="col-sm-3">
						</div>
						<div class="col-sm-6">
							<button type="button" class="btn btn-success my-2 w-100" id="btnsetNewPwd" onclick="setNewPwd()" disabled="disabled">비밀번호 재설정</button>
						</div>
						<div class="col-sm-3">
						</div>
					</div>
				</form>
					
					
				<div class="w-50 mx-auto">
					<div class="bg-success text-white text-center" id="alertId">
						
					</div>
				</div>
			</div>
		</div>				
			
		<div class="col-2">
		</div>
	</div>

	<!-- 페이지 본문 종료 -->
	<!-- 페이지 하단 고정 부분 -->
	<div class="row">
		<div class="col-3">
		</div>
		<div class="col-6">
			<%@ include file="../common/footer.jsp" %>
		</div>
		<div class="col-3">
		</div>
	</div>
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
<script type="text/javascript">

	function beforeSending(){
		var name = $('#name').val();
		var id = $('#id').val()
		var phone = $('#phone').val();
		var regPhone = new RegExp(/01[016789]-[^0][0-9]{3,4}-[0-9]{4}/);
		var regSpace = new RegExp(/\s/);
	
		if(regSpace.test(phone)){
			alert("인증을 위해 휴대폰 번호를 입력하세요.");
		}else if(!regPhone.test(phone)){
			alert("휴대폰 번호는 하이픈('-')과 함께 입력해주세요.");
		}
		
		$.ajax({
			type: "POST",
			url: "/member/isMemberById.do",
			contentType: 'application/json; charset=utf-8',
			data: JSON.stringify({'name': name, 'id':id,'phone':phone}),
			success: function(result){
				if(result==1){
					sendCode(phone);
				}else{
					alert("등록되지 않은 전화번호 입니다.");
				}
				
			}
		});
	}
	
	//입력한 휴대폰 인증번호 발송
	function sendCode(phone){
		var to = phone
		$(".verifyCode").css("display", "block")
		var data = {to:to};
		$.ajax({
			url:"sendCode.do",
			data: data,
			success: function(data){
				code=data;
				$("#alertCode").append("인증번호를 발송했습니다.").addClass("fw-bold text-dark");		
			},
			error: function(request, status, error){
				console.log("status : " + request.status + ", message : " + request.responseText + ", error : " + error)
			},
			complete: function(data){
				console.log("complete");
			}
		});
	}
	
	//문자로 발송한 코드와 사용자가 입력한 코드를 비교한다.
	function checkCode(){
		var userCode = $("#code").val();
		
		if(userCode==code){
			//두 코드가 동일하면 인증 완료 알림 후 인증번호 레이어를 숨기고, 아이디 확인 버튼을 활성화한다.
			alert("인증되었습니다.");
			$(".verifyCode").css("display", "none");
			$("#btnsetNewPwd").attr('disabled', false);				
		}else{
			alert("본인 인증에 실패했습니다.");
		}
	}
	
	function setNewPwd(){
		var id = $("#id").val();
		var phone = $("#phone").val();
		
		$.ajax({
			type: "POST",
			url: "/member/setNewPwd.do",
			contentType: 'application/json; charset=utf-8',
			data: JSON.stringify({'id': id, 'phone':phone}),
			success: function(id){
				$("#alertId").append("<p class='fs-6 fw-light'>새로운 비밀번호를 발송했습니다.</p>");
			},complete: function(data){
				console.log("setpwd complete");
			}
		});
	}
</script>
</html>