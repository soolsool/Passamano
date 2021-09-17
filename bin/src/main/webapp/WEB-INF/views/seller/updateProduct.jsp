<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		let arr;
		$.ajax({url:"/listCategory.do", success:function(data){
			arr = data;
			//console.log(data);
			$.each(data, function(i, cate){
				if(cate.categoryRef == 0){
					let cate1 = $("<option></option>").html(cate.categoryName).attr("value",cate.categoryNo);
					$(".category1").append(cate1);	
				}
			});
			
		}});
		
		
		$(".category1").change(function(){
			let categoryNo = $(this).val();
			$(".category2").empty();
			$.each(arr,function(i, item){
				if(categoryNo == item.categoryRef){
					let cate2 = $("<option></option>").html(item.categoryName).attr("value",item.categoryNo);
					$(".category2").append(cate2);	
				}
			});
			
		});
	});
	
</script>
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
							<img src="../resources/images/userprofile/${loginUser.profileName}" width="200px" style="border-radius:50%" class="my-2">
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
				<!-- 실제 본문 영역 시작 -->
				<div class="col-10">
					<form action="/seller/updateProduct.do" method="post" enctype="multipart/form-data">
						<input type="hidden" name="productNo" value="${d.productNo }">
						<input type="hidden" name="imageName" value="${d.imageName }">
						<input type="hidden" name="imageSize" value="${d.imageSize }">
						상품 : <input type="text" name="productName" value="${d.productName }"><br>
						가격 : <input type="text" name="productPrice" value="${d.productPrice }"><br>
						<span>1차분류</span>
						<select class="category1">
							<option selected value="">전체</option>
						</select>
						<span>2차분류</span>
						<select class="category2" name="categoryNo">
							<option selected value="">전체</option>
						</select><br>
						수량 : <input type="text" name="productQty" value="${d.productQty }"><br>
						내용 <br>
						<textarea rows="10" cols="80" name="productContent">${d.productContent }</textarea><br>
						첨부파일 : ${d.imageName }<br>
						<input type="file" name="uploadFile"><br>
						<input type="submit" value="등록">
						<input type="reset" value="취소">
					</form>
			<!-- 실제 본문 영역 끝 -->
				</div>
			</div>
		</div>
	</div>
	<div class="col-2">
	</div>
	<!--  본문 끝 -->

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
</html>