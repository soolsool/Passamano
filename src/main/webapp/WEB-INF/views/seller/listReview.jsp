<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>파사마노PASSAMANO</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/commonStyle.css">
<link rel="stylesheet" href="/resources/css/seller/productlist.css">
</head>
<body>
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
		<div class="row">

			<div class="col-2">
				<div class="side-menu text-center">
					<div class="profile-area my-1 py-2">
						<!--  실제 판매자 프로필 이미지 들어가는 곳 -->
						<img src="../resources/images/userprofile/${loginUser.profileFilename}" width="100px" style="border-radius:50%" class="my-2">
						<!--  판매자 이름 보여주기 -->
						<p class="mb-2 fs-4 fw-bold">${loginUser.nickName}님</p>
						<p class="mb-2 fs-5 fw-light">
							<a href="/mypage/profile.do">프로필 관리</a>
						</p>
					</div>
					
					<nav class="my-3">
						<div class="dropdown">
							<a class="nav-link dropdown-toggle my-1" href="#" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
								상품 관리
							</a>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						    	<li>
						    		<a class="dropdown-item text-center" href="/seller/insertProduct.do">상품 등록</a>
								</li>
						    	<li>
						    		<a class="dropdown-item text-center" href="/seller/listProduct.do">상품 목록</a>
								</li>
							</ul>
						</div>
						<ul class="nav flex-column">
						  <li class="nav-item my-2">
						    <a class="nav-link" href="/seller/listOrder.do">주문 관리</a>
						  </li>
						  <li class="nav-item my-2">
						    <a class="nav-link" href="/seller/listSales.do">매출 관리</a>
						  </li>
						  <li class="nav-item my-2">
						    <a class="nav-link" href="/seller/listReview.do">리뷰 관리</a>
						  </li>
						</ul>
					</nav>
				</div>
			</div>
			<div class="col-10">
			<!-- 실제 본문 영역 시작 -->
				<div class="productTable">
					<div class="tableTitle mt-5">
						<h4 class="fw-light">
							상품별 리뷰
						</h4>
					</div>
					<hr class="mx-auto pt-0.5">
					<table class="table table-hover">
						<tr class="text-center">
							<th>상품명</th>
							<th>리뷰제목</th>
							<th>평점</th>
							<th>작성일</th>
						</tr>
						<c:if test="${empty list}">
						<tr>
							<td colspan="4">
								<div class="position-relative" style="height:20em;">
								<div class="position-absolute top-50 start-50 translate-middle">
									<div class="text-center">
										<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
										  <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
										</svg>
									</div>
									<br>
									<p class="mt-2 fs-5 fw-light">
								  		작성된 리뷰가 없습니다.
								  	</p>
								</div>
							</div>
							</td>
						</tr>
						</c:if>
						<c:if test="${not empty list}">
						<c:forEach var="r" items="${list}">
							<tr>
								<td class="align-middle">
									<div class="d-inline">
										<img src="/resources/images/productimage/${r.imageName}" style="width:5em;height:5em;">
										<span class="text-center">${r.productName}</span>
									</div>
								</td>
								<td class="text-center align-middle">
									<a href="/seller/detailReview.do?reviewNo=${r.reviewNo}">
										<span>${r.reviewTitle}</span>
									</a>
								</td>
								<td class="text-center align-middle">
									<c:forEach var="s" begin="1" end="${r.reviewEvaluation}">
									★
									</c:forEach>
								</td>
								<td class="text-center align-middle">
									<span>
										<fmt:formatDate value="${r.reviewDate}" pattern="yyyy-MM-dd HH:ss"/>
									</span>
								</td>
							</tr>
						</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
			<!-- 실제 본문 영역 끝 -->
			</div>
		</div>
	</div>
	<div class="col-2">
	</div>
	<!--  본문 끝 -->

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
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
<script type="text/javascript">

</script>
</html>