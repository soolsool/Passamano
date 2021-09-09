<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="../files/css/commonStyle.css">

</head>
<body>
	<!--  헤더 메뉴 부분 시작 -->
	<div class="row">
		<div class="col-3">
		</div>
		<div class="col-6">
			<%@ include file="../common/header.jsp" %>
		</div>
		<div class="col-3">
		</div>
	</div>
	<!--  헤더 메뉴 부분 끝 -->
	<!--  본문 시작 -->
	<div class="row">
	
		<div class="col-2">
		</div>
		<div class="col-8">
			<div class="join-form pt-4 my-5">
					
				<p class="text-center fs-4 fw-bold my-3 lh-sm">
					<span class="badge bg-success">2</span>
					회원정보 입력
				</p>
				<!-- 회원정보 입력 시작 -->
				<hr class="mx-auto pt-0.5 w-50">
				<form action="/member/sellersubmit" method="post" class="mx-auto w-50" enctype="multipart/form-data" id="sellerForm">
					
				<div class="row mb-3">
							<label for="id" class="col-sm-3 col-form-label text-end">아이디</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="id" name="id" onchange="checkID()">
								<div id="alertId">
								</div>
							</div>
							<div class="col-sm-3">
								<button type="button" class="btn btn-outline-success w-100 d-inline" id="inputID" onclick="doubleCheck(this.id)">중복확인</button>
							</div>
						</div>
						
						<div class="row mb-3">
							<label for="password" class="col-sm-3 col-form-label text-end">비밀번호</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="password" name="pwd" required="required" onchange="checkPassword()">
								<div id="alertPswd">
								</div>
							</div>
						</div>

						<div class="row mb-3">
							<label for="passwordCheck" class="col-sm-3 col-form-label text-end">비밀번호확인</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="passwordCheck" required="required" onchange="doubleCheckPswd()">						
								<div id="alertPswdCheck">
								</div>
							</div>
						</div>

						<div class="row mb-3">
							<label for="name" class="col-sm-3 col-form-label text-end">이름</label>
							<div class="col-sm-9">
								<input type="text" class="form-control input-my-1" name="name" id="name" required="required" onchange="checkName()">
								<div id="alertName">
								</div>
							</div>
						</div>

						<div class="row mb-3">
							<label for="nickName" class="col-sm-3 col-form-label text-end">별명</label>
							<div class="col-sm-6">
								<input type="text" class="form-control input-my-1" name="nickName" id="nickName" required="required" onchange="checkNickname()">
								<div id="alertNickname">
								</div>
							</div>
							<div class="col-sm-3">
								<button type="button" class="btn btn-outline-success w-100 d-inline" id="inputNickname" onclick="doubleCheck(this.id)">중복확인</button>
							</div>
						</div>

						<div class="row mb-3">
							<label for="profile" class="col-sm-3 col-form-label text-end">프로필 사진</label>
							<div class="col-sm-9">
								<input type="file" class="form-control input-my-1" name="uploadFile" id="profile">
							</div>
						</div>
					
						<div class="row mb-3">
							<label for="phone" class="col-sm-3 col-form-label text-end">휴대폰</label>
							<div class="col-sm-6">
								<input type="text" class="form-control input-my-1 mb-1" name="phone" id="phone" pattern="[0-9]{11}" placeholder="-(하이픈)을 입력해주세요." required="required">
								<!-- 인증번호 버튼 클릭시 노출 -->
								<div class="verifyCode" style="display:none">
										<input type="text" class="form-control input-my-1" name="code" id="code" placeholder="인증번호" required="required">
								</div>
							</div>
							<div class="col-sm-3">
								<button type="button" class="btn d-inline btn-outline-success w-100" onclick="sendCode()">인증번호 전송</button>
								<!-- 인증번호 버튼 클릭시 노출 -->
								<div class="verifyCode" style="display:none">
									<button type="button" class="btn d-inline btn-outline-success w-100" onclick="checkCode()">인증번호 확인</button>
								</div>
							</div>
						</div>
						
						<div class="row mb-3">
							<label for="email" class="col-sm-3 col-form-label text-end">이메일</label>
							<div class="col-sm-9">
								<input type="text" class="form-control input-my-1" name="email" id="email" required="required" onchange="checkEmail()">
								<div id="alertEmail">
								</div>
							</div>
						</div>

						<div class="row mb-3">
							<label for="address" class="col-sm-3 col-form-label text-end">주소</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="address1" id="address1" required="required" readonly="readonly">
								<div class="mt-1">
									<input type="text" class="form-control" name="address2" id="address2" required="required" readonly="readonly">
								</div>
								<div class="mt-1">
									<input type="text" class="form-control" name="address3" id="address3" required="required">
								</div>
							</div>
							
							<div class="col-sm-3">
								<button type="button" class="btn btn-outline-success w-100"  onclick="getAddress_execDaumPostcode()">우편번호</button>
								<div class="mt-1">
									<input type="text" class="form-control input-my-1" style="visibility:hidden">
								</div>
								<div class="mt-1">
									<input type="text" class="form-control input-my-1" name="address4" id="address4" required="required" readonly="readonly">
								</div>
							</div>
						</div>
					
					<hr class="mx-auto mb-5 pt-0.5">
					<!-- 회원정보 입력 끝 -->
										
					<div class="text-center mt-5">
						<button type="button" class="btn btn-success btn-lg w-50 d-inline" onclick="checkAll()">회원가입</button>
					</div>
				</form>
			</div>

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

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//아이디, 별명 중복확인과 휴대폰 인증 여부를 확인하는 변수 
	var idConfirm = false;
	var pwdConfirm = false;
	var nameConfirm = false;
	var nicknameConfirm = false;
	var phoneConfirm = false;
	var emailConfirm = false;
	var regSpace = new RegExp(/\s/);

	//아이디 유효성 검사
	function checkID(){
		var regId = new RegExp(/^[a-z]+[a-z0-9]{5,19}$/);
		var id = $("#id").val();
		if(id==null || id==""){
			$("#alertId").empty();
			$("#alertId").append("아이디를 입력하세요.");
			$("#alertId").addClass("fw-bold text-danger");
			idConfirm = false;
		}else if(regSpace.test(id)){
			$("#alertId").empty();
			$("#alertId").append("아이디에 공백을 입력할 수 없습니다.");
			$("#alertId").addClass("fw-bold text-danger");
			idConfirm = false;
		}else{
			if(!regId.test(id)){
				$("#alertId").empty();
				$("#alertId").append("아이디는 영어 대소문자와 숫자를 조합하여 5~15자리로 입력하세요.");
				$("#alertId").addClass("fw-bold text-danger");
				idConfirm = false;
			}else{
				$("#alertId").empty();
				idConfirm = true;
			}				
		}
	}
	
	//별명 유효성 검사
	function checkNickname(){
		var nickname = $("#nickName").val();

		if(nickname==null || nickname==""){
			$("#alertNickname").empty();
			$("#alertNickname").append("별명을 입력하세요.");
			$("#alertNickname").addClass("fw-bold text-danger");
			nicknameConfirm = false;
		}else if(regSpace.test(nickname)){
			$("#alertNickname").empty();
			$("#alertNickname").append("별명에 공백을 입력할 수 없습니다.");
			$("#alertNickname").addClass("fw-bold text-danger");
			nicknameConfirm = false;
		}else{
			if(nickname.length>10 || nickname.length<3){
				$("#alertNickname").empty();
				$("#alertNickname").append("별명은 3자 이상 10자 이하로 입력하세요.");
				$("#alertNickname").addClass("fw-bold text-danger");
				nicknameConfirm = false;
			}else
			$("#alertNickname").empty();
			nicknameConfirm = true;
		}
	}
	
	//ID나 별명 중복 여부 확인
	function doubleCheck(clickedId){
		var col = clickedId;
		var userInput = col=='inputID'?userInput = $("#id").val():userInput = $("#nickName").val();
		col = col=='inputID'?col='id':col='nickName';
		
		$.ajax({
			type : "POST",
			url : "/member/doubleCheck",
			contentType:'application/json; charset=utf-8',
			data : JSON.stringify({"col": col, "userInput" : userInput }),
			success: function(data){
				var obj = col=="id"?"#alertId":"#alertNickname";
					
				if(data=="fail"){
					$(obj).empty().removeClass();
					$(obj).append("기존 회원이 사용하고있는 값입니다.");
					$(obj).addClass("fw-bold text-danger");
					$("#id").val("");				
					if(obj=='id')
						idConfirm = false;
					else
						nicknameConfirm = false;
				}else{	
					$(obj).empty().removeClass();
					$(obj).append("사용가능합니다.");
					$(obj).addClass("fw-bold text-success");
					if(obj=='id')
						idConfirm = true;
					else
						nicknameConfirm = true;
				}
			},
			error: function(request, status, error){
  				console.log("status : " + request.status + ", message : " + request.responseText + ", error : " + error)
  			}
		});
	}
	
	//비밀번호가 문자, 숫자, 특수문자 포함 8~15자리인지 확인
	function checkPassword(){
		var pswd = $("#password").val();		
		var regPswd = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/);
		if(regSpace.test(pswd)){
			$("#alertPswd").empty();
			$("#alertPswd").append("비밀번호는 공백을 입력할 수 없습니다.");
			$("#alertPswd").addClass("fw-bold text-danger");
		}else if(!regPswd.test(pswd)){
			$("#alertPswd").empty();
			$("#alertPswd").append("비밀번호는 문자, 숫자, 특수문자(!@#$%^&+=)를 포함하여 8~15자리 이내로 입력하세요.");
			$("#alertPswd").addClass("fw-bold text-danger");
		}else{
			$("#alertPswd").hide();		
		}	
	}
	
	//비밀번호와 비밀번호 확인에 입력한 값이 동일한지 확인 
	function doubleCheckPswd(){
    	var pswd = $("#password").val();
    	var pswdCheck = $("#passwordCheck").val();
    	if(pswd!=pswdCheck){
    		$("#alertPswdCheck").empty();
			$("#alertPswdCheck").append("비밀번호가 다릅니다.");
			$("#alertPswdCheck").addClass("fw-bold text-danger");
			pwdConfirm = false;
		}else{
			$("#alertPswdCheck").hide();
			pwdConfirm = true;
		}
	}	
	
  	function checkName(){
		var name = $("#name").val();
  		var regName = new RegExp(/^[가-힣]{2,5}$/);
  		if(regSpace.test(name)) {
			$("#alertName").empty();
			$("#alertName").append("이름은 공백을 입력할 수 없습니다.");
			$("#alertName").addClass("fw-bold text-danger");
		}else if(!regName.test(name)) {
			$("#alertName").empty();
			$("#alertName").append("이름은 한글로 2~4자로 입력할 수 있습니다.");
			$("#alertName").addClass("fw-bold text-danger");
		}else{
			$("#alertName").empty();
			nameConfirm = true;
		}
  	}
  	
  	function checkEmail(){
		var email = $("#email").val();
		console.log(email);
  		var regEmail = new RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/);
  		if(regSpace.test(email)) {
			$("#alertEmail").empty();
			$("#alertEmail").append("이메일은 공백을 입력할 수 없습니다.");
			$("#alertEmail").addClass("fw-bold text-danger");
		}else if(!regEmail.test(email)) {
			$("#alertEmail").empty();
			$("#alertEmail").append("올바른 이메일 양식이 아닙니다.");
			$("#alertEmail").addClass("fw-bold text-danger");
		}else{
			$("#alertEmail").empty();
			emailConfirm = true;
		}
  	}

    //입력한 휴대폰 인증번호 발송
  	function sendCode(){
  		var regPhone = new RegExp(/01[016789]-[^0][0-9]{3,4}-[0-9]{4}/);

  		var to = $("#phone").val();
    	if(regSpace.test(to)){
    		alert("인증을 위해 휴대폰 번호를 입력하세요.");
    	}else if(!regPhone.test(to)){
    		alert("휴대폰 번호는 숫자만 입력해주세요.");
    	}else{
	  		$(".verifyCode").css("display", "block")
	  		var data = {to:to};
	  		$.ajax({
	  			url:"sendCode",
	  			data: data,
	  			success: function(data){
	  				code=data;
	  				$("#code").append("인증번호를 발송했습니다.").addClass("fw-bold text-dark");		
	  			},
	  			error: function(request, status, error){
	  				console.log("status : " + request.status + ", message : " + request.responseText + ", error : " + error)
	  			
	  			},
	  			complete: function(data){
	  				console.log("complete");
	  			}
	  		});
    	}
  	}
    
  	//문자로 발송한 코드와 사용자가 입력한 코드를 비교한다.
  	function checkCode(){
  		var userCode = $("#code").val();
  		if(userCode==code){
  			//두 코드가 동일하면 인증 완료 알림 후 인증번호 레이어를 숨긴다.
  			alert("인증되었습니다.");
  			$(".verifyCode").css("display", "none");
  			phoneConfirm = true;
  		}else{
  			alert("본인 인증에 실패했습니다.");
  			phoneConfirm = false;
  		}
  	}

	//우편번호 클릭시 우편번호 검색 후 주소 입력 - 다음 우편 API
	function getAddress_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("address4").value = extraAddr;
                
                } else {
                    document.getElementById("address4").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('address1').value = data.zonecode;
                document.getElementById("address2").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address3").focus();
            }
		}).open();
	}

  	//사용자가 작성한 폼을 검사 후 InsertMemberController로 전송한다.
  	function checkAll(){
  		if(idConfirm==true && pwdConfirm==true && nicknameConfirm==true && phoneConfirm==true && nameConfirm==true && emailConfirm==true)
  			document.getElementById('sellerForm').submit();
  		else{
  			if(idConfirm==false){
  				alert("아이디의 중복여부를 확인하세요.");
  				document.getElementById('id').focus();
  			}else if(pwdConfirm==false){
  				
  			}else if(nicknameConfirm==false){
  				alert("별명의 중복여부를 확인하세요.");
  				document.getElementById('nickName').focus();
  			}else if(phoneConfirm==false){
  				alert("휴대폰 인증여부를 확인하세요.");
  				document.getElementById('phone').focus();
  			}else if(nameConfirm==false){
  				alert("입력한 이름이 올바른지 확인하세요.");
  				document.getElementById('name').focus();
  			}else if(emailConfirm==false){
  				alert("입력한 이메일의 형식이 올바른지 확인하세요.");
  				document.getElementById('email').focus();
  			}
  		}
  	}
</script>
</body>
</html>