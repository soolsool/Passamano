<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파사마노PASSAMANO</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/commonStyle.css">
<link rel="stylesheet" href="/resources/css/etc/search.css">
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
	<hr class="bg-success mx-auto pt-0.5" id="mainColumn" style="width:67%;">
	<!-- 상품 검색 탭 시작 -->
	<div class="row">
		<div class="col-3">
		</div>
		<div class="col-6">
			<div class="text-center" id="searchBox">
				<form action="/search.do" method="get" id="searchKeyword" class="d-inline">
					<label for="search fw-light ml-2">검색요건</label>
					<input type="text" class="w-25 border-bottom border-success border-2" id="search" name="search" value="${keyword}" style="border:none;">
					<svg xmlns="http://www.w3.org/2000/svg" onclick="searchProduct()" width="25" height="25" fill="#198754" class="bi bi-search" viewBox="0 0 16 16">
						<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
					</svg>
				</form>
			</div>
		</div>
		<div class="col-3">
		</div>
	</div>
	<!-- 상품 검색 탭 끝 -->
	<!-- 검색 본문 시작 -->
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-8">
			<div class="d-inline w-25">  </div>
				<p class="d-inline mt-5 mb-0 ml-5 text-center fw-light fs-6">
					총 <strong>${count}</strong>건의 상품이 검색되었습니다.
				</p>
			<hr class="bg-success mx-auto w-100 pt-0.5"  id="mainColumn">
			<div class="item_list mx-auto grid">
				<ul class="list">
					<c:if test="${empty list}">
						<div class="text-center">
							<p class="fw-bold fs-6">
								검색된 상품이 없습니다.
							</p>														
						</div>
					</c:if>
					<c:if test="${not empty list}">
						<c:forEach var="p" items="${list}">
							<li class="item mx-3 mt-2 mb-5">
								<div class="thumbnail">
									<a href="/product.do?productNo=${p.productNo}" class="img" style="background-image: url('resources/images/productimage/${p.imageName}');">
										<c:if test="${p.productState==1}">
											<div class="soldout">
											</div>
											<div class="soldoutMessage">
												<p class="display-6">
													판매 종료											
												</p>
											</div>
										</c:if>
										<img src="resources/images/productimage/${p.imageName}">
									</a>
								</div>
								<a class="info g-col-3" href="/product?productNo=${p.productNo}">
									<span class="name">
										${p.productName}
									</span>
									<span class="d-block price">
										<fmt:formatNumber value="${p.productPrice}" pattern="#,###"/>원
									</span>
									<span class="d-block seller">
										${p.sellerCompany} - ${p.sellerCeo}
									</span>
									<span class="d-block text-muted like">
										♡${p.zzim}
									</span>
								</a>
							</li>
						</c:forEach>
					</c:if>
				</ul>
			</div>				
		</div>
		<div class="col-2">
		</div>
	</div>

	<!-- 검색 본문 종료 -->
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
//검색할 때 빈칸이나 스페이스바를 검색하면 알림창
	function searchProduct(){
		var keyword = $("#search").val().trim();
		if(!keyword){
			alert("검색할 단어를 입력하세요.");
			return false;
		}
		document.getElementById('searchKeyword').submit();
	}
</script>
</html>