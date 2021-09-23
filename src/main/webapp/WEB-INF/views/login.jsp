<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파사마노PASSAMANO</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/commonStyle.css">
<link rel="stylesheet" href="/resources/css/etc/login.css">
</head>
<body>
	<!--  헤더 메뉴 부분 시작 -->
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-8">
			<%@ include file="./common/header.jsp" %>
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
			<div class="login-section my-6 pt-5 pb-5">
				<p class="text-center fs-5 mt-5 mb-4">로그인</p>
				<form class="form-inline w-25 mx-auto" action="login.do" method="post">
					<div class="input-group mb-2">
						<input type="text" class="form-control input-sm" id="id" name="id" placeholder="아이디를 입력하세요" aria-label="Username" aria-describedby="basic-addon1">
					</div>
					<div class="input-group mb-0">
						<input type="password" class="form-control input-sm" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요" aria-label="Username" aria-describedby="basic-addon1">
					</div>
					<div class="login-search mx-auto mb-4 text-end">
						<p class="d-inline">
							<a href="/member/findId.do" class="fs-6 fw-light">아이디 찾기</a>
						</p>
						<div class="vr ml-1"> </div>
						<p class="d-inline">
							<a href="/member/findPwd.do" class="fs-6 fw-light">비밀번호 찾기</a>
						</p>
						
						<c:if test="${msg != null}">
							<div class="alertLogin">
								<p class="text-danger text-start fw-bold">
									${msg}
								</p>
							</div>
						</c:if>
					</div>
					<button type="submit" class="btn btn-success d-block my-2 w-100">로그인</button>
					<button type="button" class="btn btn-outline-success d-block my-1 w-100" onclick="location.href='/member/membertype.do'">회원가입</button>
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
			<%@ include file="./common/footer.jsp" %>
		</div>
		<div class="col-2">
		</div>

	</div>
	<!--  풋터 끝부분 끝 -->	
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
</html>