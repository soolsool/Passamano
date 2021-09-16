<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파사마노:::</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/commonStyle.css">
<link rel="stylesheet" href="/resources/css/ect/notready.css">
</head>
<body>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-8">	
			<%@ include file="./common/header.jsp" %>
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
			<div class="mt-5 mb-3">
				<div class="bg-success mx-auto text-center" id="alertForReady">
					<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" fill="white" class="bi bi-cone-striped  align-middle" viewBox="0 0 16 16">
						<path d="m9.97 4.88.953 3.811C10.159 8.878 9.14 9 8 9c-1.14 0-2.158-.122-2.923-.309L6.03 4.88C6.635 4.957 7.3 5 8 5s1.365-.043 1.97-.12zm-.245-.978L8.97.88C8.718-.13 7.282-.13 7.03.88L6.275 3.9C6.8 3.965 7.382 4 8 4c.618 0 1.2-.036 1.725-.098zm4.396 8.613a.5.5 0 0 1 .037.96l-6 2a.5.5 0 0 1-.316 0l-6-2a.5.5 0 0 1 .037-.96l2.391-.598.565-2.257c.862.212 1.964.339 3.165.339s2.303-.127 3.165-.339l.565 2.257 2.391.598z"/>
					</svg>				
				</div>
			</div>
			<div class="mt-3 text-center">
				<p class="fw-lighter">
					 서비스 준비중입니다.<br>
					 보다 나은 서비스를 제공하기 위해 페이지를 준비하고있습니다.<br>
					 빠른 시일 내에 준비하여 찾아뵙겠습니다.
				</p>
			</div>
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
			<%@ include file="./common/footer.jsp" %>
		</div>
		<div class="col-2">
		</div>
	</div>
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
<script type="text/javascript">
	
</script>
</html>