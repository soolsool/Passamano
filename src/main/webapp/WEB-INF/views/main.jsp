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
<link rel="stylesheet" href="/resources/css/etc/main.css">

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
		<div class="col-8 text-center" id="searchMenu">
			<select class="d-inline form-select mx-2" id="category" aria-label="ProductCategory" onchange="getByCategory(this.value)">
				<option value="null" selected>카테고리</option>
				<c:forEach var="c" items="${category}">
					<option value="${c.categoryNo}">${c.categoryName}</option>
				</c:forEach>
			</select>
			
			<div class="d-inline mx-2" id="searchBox">
				<form action="/search.do" method="get" class="d-inline" id="searchKeyword">
					<input type="text" class="align-items-end" id="search" name="search" placeholder="검색어를 입력하세요">
					<button type="button" class="btn btn-success btn-sm" onclick="searchProduct()">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
						</svg>
					</button>
				</form>
				
			</div>
							
			<ul class="list-group list-group-horizontal justify-content-center mt-2">
				<li class="mx-2 fs-6">
					<a href="#" onclick="getByKeyword('product_cnt'); return false;">인기상품순</a>
				</li>				
				<li class="mx-2 fs-6">
					<a href="#" onclick="getByKeyword('product_date'); return false;">신상품순</a>
				</li>
				<li class="mx-2 fs-6">
					<a href="#" onclick="getByKeyword('zzim'); return false;">찜하기순</a>
				</li>
				<li class="mx-2 fs-6">
					<a href="#" onclick="getByKeyword('product_price_asc'); return false;">낮은 가격순</a>
				</li>
				<li class="mx-2">
					<a href="#" onclick="getByKeyword('product_price'); return false;">높은 가격순</a>
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
					<ul id="list">
				
				</ul>
				<div class="text-center">
					<button type="button" class="btn btn-success" onclick="getNextList()">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
  							<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  							<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
						</svg>
						더보기
					</button>
				</div>
				<div id="goToTop" onclick="goToTheTop()">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#ffffff" class="bi bi-arrow-up-circle" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
					</svg>
				</div>
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
	var callCount = 1;
	//document.addEventListener("DOMContentLoaded", () => {
	$(document).ready(function() {
		$.ajax({
			url:"/getProductList.do",
			contentType:"application/json; charset=utf-8;",
			dataType:"json",
			success: function(data){
				var page = data.page;
				var start = data.start;
				var end = data.end;
				var list = data.list;
				var category = data.category;
				var products = makeList(list);				
				 $('#list').html(products);
				
			}
		});
	})
	
	//JSON으로 받은 제품 목록을 li로 추가할 수 있도록 문장으로 만들어 줌
	function makeList(list){
		console.log("makeList" + callCount + "번째 옴");
		var content = '';
		$.each(list, function(key, value) {					
			content += '<li class="item mx-3 mt-2 mb-5">';
			content += '<div class="thumbnail">';
			content += '<a href="/product.do?productNo=' + value.productNo + '" class="img" style="background-image: url("resources/images/productimage/' + value.imageName + '"); ">';
			
			if(value.productState==1){
				content += '<div class="soldout">'
				content += '</div>';
				content += '<div class="soldoutMessage">';
				content += '<p class="display-6">';
				content += '판매 종료';
				content += '</p>';
				content += '</div>';
			}
			
			content += '<img src="resources/images/productimage/'+ value.imageName +'">';
			content += '</a>';
			content += '</div>';
			content += '<a class="info g-col-3" href="/product.do?productNo='+ value.productNo +'">';
			content += '<span class="name">';
			content += value.productName;
			content += '</span>';
			content += '<span class="d-block price">';
			content += value.productPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원';
			content += '</span>';
			content += '<span class="d-block seller">'
			content += value.sellerCompany + ' - ' + value.sellerCeo;
			content += '</span>'
			content += '<span class="d-block text-muted like">'
			content += '♡'+ value.zzim
			content += '</span>'
			content += '</a>'
			content += '</li>'
		})
		return content;
	}
	
	
	//더보기를 클릭하면 하단에 상품을 추가한다.
	function getNextList(){
		callCount += 1;
		$.ajax({
			url:"/getProductList.do",
			data: {'page':callCount},
			contentType:"application/json; charset=utf-8;",
			dataType:"json",
			success: function(data){
				if(callCount<=data.endPage){
					var page = data.page;
					var start = data.start;
					var end = data.end;
					var list = data.list;
					var category = data.category;
					var products = makeList(list);
					 $('#list').append(products);
				}else{
					alert("제품 목록의 마지막 제품입니다.");
				}
			}
		});
	}
	
	
	//카테고리 선택시 해당 카테고리에 속하는 제품 검색
	function getByCategory(categoryNo){
		var param = categoryNo!=0?categoryNo:null;
		$('#list').empty();
		$.ajax({
			url:"/getProductList.do",
			data: {'categoryNo':param},
			contentType:"application/json; charset=utf-8;",
			dataType:"json",
			success: function(data){
				if(callCount<=data.endPage){
					var page = data.page;
					var start = data.start;
					var end = data.end;
					var list = data.list;
					var category = data.category;
					var products = makeList(list);
					 $('#list').append(products);
				}else{
					alert("제품 목록의 마지막 제품입니다.");
				}
			}
		});
	}
	
	
	function getByKeyword(data){
		var keyword = data;
		var sortOrder = 'desc';
		
		if(keyword==='product_price_asc'){
			keyword='product_price';
			sortOrder = 'asc';
		}
		
		console.log(keyword);
		console.log(sortOrder);
		
		$('#list').empty();
		
		$.ajax({
			url:"/getProductList.do",
			data: {'orderField':keyword, 'sortOrder': sortOrder },
			contentType:"application/json; charset=utf-8;",
			dataType:"json",
			success: function(data){
				if(callCount<=data.endPage){
					var page = data.page;
					var start = data.start;
					var end = data.end;
					var list = data.list;
					var category = data.category;
					var products = makeList(list);
					 $('#list').append(products);
				}else{
					alert("제품 목록의 마지막 제품입니다.");
				}
			}
		});
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
	
	//스크롤 이동했을 때 상단으로 이동
	function goToTheTop(){
		window.scrollTo(0,0);
	}
</script>
</html>