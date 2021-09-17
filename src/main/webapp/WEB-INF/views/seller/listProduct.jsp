<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="../files/css/commonStyle.css">
<style type="text/css">
	.profile-area{
		background: #28a745;
	}
</style>
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
						<img src="../resources/images/userprofile/${loginUser.profileFilename}" width="200px" style="border-radius:50%" class="my-2">
						<!--  판매자 이름 보여주기 -->
						<p class="mb-2">${loginUser.name}님</p>
							<a href="#" class="">
								프로필 관리
							</a>
					</div>
					
					<nav class="my-3">
						<div class="dropdown">
							<a class="nav-link dropdown-toggle my-1" href="#" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
								상품 관리
							</a>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						    	<li>
						    		<a class="dropdown-item text-center" href="#">상품 등록</a>
								</li>
						    	<li>
						    		<a class="dropdown-item text-center" href="#">상품 목록</a>
								</li>
							</ul>
						</div>
						<ul class="nav flex-column">
						  <li class="nav-item my-2">
						    <a class="nav-link" href="#">주문 관리</a>
						  </li>
						  <li class="nav-item my-2">
						    <a class="nav-link" href="#">매출 관리</a>
						  </li>
						  <li class="nav-item my-2">
						    <a class="nav-link" href="#">정산 관리</a>
						  </li>
						  <li class="nav-item my-2">
						    <a class="nav-link" href="#">리뷰 관리</a>
						  </li>
						  <li class="nav-item my-2">
						    <a class="nav-link" href="#">문의 관리</a>
						  </li>
						  <li class="nav-item my-2">
						    <a class="nav-link" href="#">공지사항</a>
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
							내가 등록한 상품 목록
						</h4>
					</div>
					<div class="text-end">
						<button type="button" class="btn btn-outline-success" onclick="location.href='/seller/insertProduct.do?sellerNo=${sellerNo}'">
							상품등록
						</button>
					</div>
					<hr class="mx-auto pt-0.5">
					<table class="table table-hover">
						<tr class="text-center">
							<th>상품번호</th>
							<th>상품명</th>
							<th>상품가격</th>
							<th>이미지</th>
							<th>수량</th>
							<th>등록날짜</th>
							<th>상태</th>
						</tr>
						<c:forEach var="p" items="${list}">
							<tr>
								<td class="text-center">
									${p.productNo }
								</td>
								<td class="text-center">
									<c:choose>
										<c:when test="${p.productState != 0 }">
											<a>${p.productName }</a>
										</c:when>
										<c:otherwise>
											<a href="/seller/updateProduct.do?productNo=${p.productNo }">${p.productName }</a>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="text-end">
									<fmt:formatNumber value="${p.productPrice }" pattern="###,###,###"/>
								</td>
								<td class="text-center">
									${p.imageName}
								</td>
								<td class="text-end">
									${p.productQty}
								</td>
								<td class="text-center">
									<fmt:formatDate value="${p.productDate }" pattern="yyyy-MM-dd"/>
								</td>
								<td class="text-center">
									<c:choose>
										<c:when test="${p.productState != 0 }">
											<span class="badge bg-danger">판매완료</span>
										</c:when>
										<c:otherwise>
											<span class="badge bg-success">판매중</span>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
						<c:forEach var="i" begin="1" end="${totalPage }">
						    <li class="page-item">
						    	<a class="page-link" href="/seller/listProduct.do?pageNUM=${i}">
						    		${i}
					    		</a>
				    		</li>
						</c:forEach>
					</ul>
				</nav>
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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
</body>
</html>