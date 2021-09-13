<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파사마노:::Passamano</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/commonStyle.css">
<style type="text/css">
	#mainColumn{
		opacity: 1;
	}
	#category{
		width: 10em;
	}
	
	#search{
		width: 15em
	}
	.item_list{
		width:1100px; 
	}
	.thumbnail{
		position: relative;
	}
	
	.thumbnail img{
		overflow: hidden;
		width: 15em;
		height: 20em;
		background-position: center;
		background-size: cover;
	}
	.soldout{
		width: 15em;
		height: 20em;
		float: left;
		position: absolute;
		top: 0;
		left: 0;
		background: gray;
		opacity: 0.7;
		z-index: 1;
	}
	.bg_soldout{
		position: absolute;
		top: 0;
		left: 0;
		z-index:2;		
	}
	.soldoutMessage{
		color: white;
		text-align: center;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate( -50%, -50% );
		z-index: 3;
	}
	.list li{
		display: inline-block;
	}
	.name{
		font-size: 1em;
	}
	.price{
		font-size: 0.9em;
		font-weight: bolder;
	}
	.seller{
		font-size: 0.8em;
	}
	.like{
		font-size: 0.8em;
	}
</style>
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
   	<hr class="bg-success mx-auto pt-0.5 w-75" id="mainColumn">
	
	<!-- 상품 검색 탭 시작 -->
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-8 text-center">
			<select class="d-inline form-select mx-2" id="category" aria-label="ProductCategory" onchange="getByCategory(this.value)">
				<option value="null" selected>카테고리</option>
				<c:forEach var="c" items="${category}">
					<option value="${c.categoryNo}">${c.categoryName}</option>
				</c:forEach>
			</select>
			
			<div class="d-inline mx-2" id="searchBox">
				<form action="/search.do" method="get" class="d-inline" id="searchKeyword">
					<input type="text" id="search" name="search" placeholder="검색어를 입력하세요">
					<button type="button" class="btn btn-success btn-sm" onclick="searchProduct()">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
						</svg>
					</button>
				</form>
				
			</div>
							
			<ul class="list-group list-group-horizontal justify-content-center mt-2">
				<li class="mx-2 fs-6">
					<a href="?orderField=product_cnt">인기상품순</a>
					<div class="vr ml-1"></div>
				</li>
				
				<li class="mx-2 fs-6">
					<a href="?orderField=product_date">신상품순</a>
					<div class="vr ml-1"></div>
				</li>
				<li class="mx-2 fs-6">
					<a href="?orderField=zzim">찜하기순</a>
					<div class="vr ml-1"></div>
				</li>
				<li class="mx-2 fs-6">
					<a href="?orderField=product_price&sortOrder=asc">낮은 가격순</a>
					<div class="vr ml-1"></div>
				</li>
				<li class="mx-2">
					<a href="?orderField=product_price&sortOrder=desc">높은 가격순</a>
				</li>
			</ul>
		</div>
		<div class="col-2">
		</div>
	</div>
	
	<!-- 상품 검색 탭 끝 -->
	
	<hr class="bg-success mx-auto pt-0.5 w-75" id="mainColumn">
	
	<!-- 페이지 본문 시작 -->
	
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-8">
			<div class="item_list mx-auto grid">
				<ul class="list">
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
						<a class="info g-col-3" href="/product.do?productNo=${p.productNo}">
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
				</ul>
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
	//카테고리 선택시 해당 카테고리에 속하는 제품 검색
	function getByCategory(categoryNo){
		var param = categoryNo!=0?"categoryNo="+categoryNo:null;
		$("body").load('/', param);
	}
	
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