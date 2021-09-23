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
<link rel="stylesheet" href="/resources/css/etc/product.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
				<div class="productDetail mx-auto mt-2 mb-5">
					<div class="row my-5">
						<!-- 이미지 슬라이더 시작 -->
						<div class="col">
							<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
								<div class="carousel-inner">
									<c:forEach var="img" items="${list}">
										<c:set var="innerCnt" value="${innerCnt+1}"/>
										<c:if test="${innerCnt==1}">
										    <div class="carousel-item active">
										      <img src="resources/images/productimage/${img.imageName}" class="w-100" style="width:30em;height:25em;overflow:hidden;background-position:center;background-size:cover;">
										    </div>
										</c:if>
										<c:if test="${innerCnt!=1}">
										    <div class="carousel-item">
										      <img src="resources/images/productimage/${img.imageName}" class="w-100" style="width:30em;height:25em;overflow:hidden;background-position:center;background-size:cover;">
										    </div>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
						<!-- 이미지 슬라이더 끝 -->
						<!-- 상품정보 시작 -->
						
						<div class="col">
						<form action="/mypage/goToBasket.do" method="post" id="goBasket">
							<div class="infoContainer mx-5 w-100">
								<input type="hidden" name="productNo" value="${p.productNo}">
								<div class="d-block my-1 name">
									<span class="display-6">
										${p.productName}
									</span>
								</div>
								<div class="d-block my-1 price">
									<span class="fw-bolder">
										<fmt:formatNumber value="${p.productPrice}" pattern="#,###"/>원
										<input type="hidden" name="productPrice">
									</span>
								</div>
								<hr class="mx-auto pt-0.5">
								
								<div class="row">
									<div class="col-sm-3 my-1 text-start ">
										<span class="seller">
											판매자
										</span>
									</div>
									<div class="col-sm-9 my-1 text-end">
										<span class="seller">
											${p.sellerCompany} - ${p.sellerCeo}
											<c:if test="${empty loginUser}">
												<span class="d-inline-block" tabindex="0" data-bs-toggle="tooltip" title="로그인하세요.">
													<button type="button" class="d-inline btn btn-outline-success btn-sm" disabled="disabled">문의하기</button>
												</span>
											</c:if>
											<c:if test="${not empty loginUser}">
												<!-- <button type="button" id="btn_chat" product_no="${p.productNo }" class="d-inline btn btn-outline-success btn-sm">문의하기</button>  -->
												<button type="button" class="d-inline btn btn-outline-success btn-sm" onclick="location.href='makeChatRoom.do?product_no=${p.productNo}'">문의하기</button>
											</c:if>
										</span>
									</div>
								</div>
								
								<hr class="mx-auto pt-0.5">
								
								<div class="row">
									<div class="col-sm-3 my-1 text-start">
										<span class="text-muted like">
											찜하기
										</span>
									</div>
									<div class="col-sm-9 my-1 text-end">
										<span class="text-muted" id="zzimcount">
											♡${p.zzim}
										</span>
										<c:if test="${empty loginUser}">
											<span class="d-inline-block" tabindex="0" data-bs-toggle="tooltip" title="로그인하세요.">
												<button class="btn btn-outline-success btn-sm" type="button" disabled>찜하기</button>
											</span>
							       		</c:if>
							       		<c:if test="${not empty loginUser}">
											<button type="button" class="d-inline btn btn-outline-success btn-sm" onclick="insertZzim()">찜하기</button>
							       		</c:if>
									</div>
								</div>
								
								<hr class="mx-auto pt-0.5">
								
								<div class="row">
									<div class="col-sm-3 my-1 text-start">
										<p class="text-success fw-bold">
											구매수량
										</p>
									</div>
									<div class="col-sm-9 my-1 text-end">
										<div class="qtyControl">
											<button type="button" class="btn btn-light" onclick="addQty()">+</button>
											<input type="text" class="text-center" size="1" id="qty" name="basketQty" readonly="readonly" value="0" style="border:none;">
											<button type="button" class="btn btn-light" onclick="substractQty()">-</button>
										</div>
									</div>
								</div>
								<div class="row my-2">
									<div class="text-end">
										<p>
											<span id="totalPrice">0</span>원
										</p>
									</div>
								</div>
								<div class="d-flex justify-content-center mb-4 buttonArea">
									<c:if test="${p.productState==1}">
										<button type="button" class="btn btn-success mx-1" disabled="disabled">장바구니</button>
										<button type="button" class="btn btn-success mx-1" disabled="disabled">바로구매</button>									
									</c:if>
									<c:if test="${p.productState==0}">
										<button type="button" class="btn btn-success mx-1" onclick="insertBasket()" id="liveToastBtn">장바구니</button>
										<button type="submit" class="btn btn-success mx-1">바로구매</button>
									</c:if>
								</div>
							</div>
						</form>
						</div>
						<!-- 상품 설명 끝 -->
					</div>
					<!-- 이미지와 상품 설명 끝 -->
					<div class="contentArea my-5">
						<p class="text-success mb-0 fw-bold">
							상품 설명
						</p>
						<hr class="mx-auto pt-0.5">
						${p.productContent}
					</div>
					<div class="reviewArea my-5">
						<table class="table table-hover reviews">
							<thead>
								<tr>
									<th class="text-center">
										<span class="text-success fw-border">상품 후기</span>
									</th>
									<th class="text-center">
										<span class="text-dark fw-border">평점</span>
									</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty review}">
									<tr>
										<td colspan="2">
											<p class="text-center">
												작성된 후기가 없습니다.
											</p>
										</td>
									</tr>
								</c:if>
								<c:if test="${not empty review}">
								<c:forEach var="r" items="${review}">
										<tr class="post">
											<td class="text-center">
												${r.reviewTitle}
											</td>
											<td class="text-center">
												<c:forEach var="s" begin="1" end="${r.reviewEvaluation}">
												★
												</c:forEach>
											</td>
										</tr>
										<tr class="hide">
											<td colspan="2">
												<c:if test="${not empty r.reviewImg}">
													<img src="resources/images/reviewimage/${r.reviewImg}" class="reviewImage"/>
												</c:if>
												${r.reviewContent}
											</td>
										</tr>								
								</c:forEach>
								</c:if>
							</tbody>
						</table>
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
	var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
	  return new bootstrap.Tooltip(tooltipTriggerEl)
	})
	
	$(document).ready(function() {
		var productNo = "<c:out value='${p.productNo}'/>";
		var zzim = "<c:out value='${p.zzim}'/>";
		$.ajax({
			url:"/getsamezzim.do",
			data:{"productNo":productNo},
			success: function(data){
				if(data==1){
					document.getElementById('zzimcount').innerHTML = '♥'+zzim;
					document.getElementById('zzimcount').classList.remove('text-muted');
					document.getElementById('zzimcount').className += 'text-success';
				}
			}
		})
	})
	
	//리뷰 제목이나 평점을 클릭하면 해당 리뷰의 내용을 보여준다.
	$(function(){
		var postOpend = $('.show'); 
		$('.reviews .post td').click(function(){
			var post = $(this).parents().next('tr');
			if($(post).hasClass('hide')){
				$(postOpend).removeClass('show').addClass('hide');
				$(post).removeClass('hide').addClass('show');
			}else{
				$(post).removeClass('show').addClass('hide');
			}
		});
	});
	
	//수량의 + 버튼을 클릭하면 수량과 합계 금액이 변한다.
	function addQty(){
		var qty = Number(document.getElementById("qty").value)+1;
		var price = "<c:out value='${p.productPrice}'/>";
		var tot = qty * price;
		document.getElementById("qty").value = qty;
		$("#totalPrice").text(tot);
	}
	
	//수량의 - 버튼을 클릭하면 수량과 합계 금액이 변한다.
	function substractQty(){
		var qty = Number(document.getElementById("qty").value);
		qty = qty==1?1:qty-1;
		var price = "<c:out value='${p.productPrice}'/>";
		var tot = qty * price;
		document.getElementById("qty").value=qty;
		$("#totalPrice").text(tot);
	}
	
	//찜하기 버튼 클릭하면 찜하기 테이블에 데이터를 추가한다.
	function insertZzim(){
		var productNo = "<c:out value='${p.productNo}'/>";
		$.ajax({
			url:"/zzim.do",
			data:{"productNo":productNo},
			success: function(data){
				var result = data.result;
				var zzim = data.zzim;
				
				if(result==1){
					alert("찜 목록에 추가했습니다.");
					document.getElementById('zzimcount').innerHTML = '♥'+zzim;
					document.getElementById('zzimcount').classList.toggle('text-muted');
					document.getElementById('zzimcount').classList.toggle('text-success');
				}else if(result==2){
					var checkCancel = confirm("찜하기를 취소하시겠습니까?")
					
					if(checkCancel){
						$.ajax({
							url:"/cancelzzim.do",
							data:{"productNo":productNo},
							success: function(data){
								var newresult = data.result;
								var newZzim = data.zzim; 
								if(newresult==1){
									alert("찜 목록에서 제거했습니다.");
									document.getElementById('zzimcount').innerHTML = '♡'+newZzim;
									document.getElementById('zzimcount').classList.toggle('text-muted');
									document.getElementById('zzimcount').classList.toggle('text-success');
								}
							}
						});						
					}
				}else{
					alert("찜 목록 추가에 실패했습니다.")
				}
			}
		})
	}
	
	//장바구니 버튼 클릭하면 장바구니에 데이터를 추가한다.
	function insertBasket(){
		var productNo = "<c:out value='${p.productNo}'/>";
		var userNo = "<c:out value='${loginUser.userNo}'/>";
		var qty = Number(document.getElementById("qty").value);
		var check = confirm("상품을 장바구니에 추가하시겠습니까?");
		if(check==true){
			$.ajax({
				url: '/mypage/insertBasket.do',
				data: {"productNo":productNo,"basketQty":qty, "userNo": userNo},
				success: function(data){
					var msg = data==1?"상품을 장바구니에 추가했습니다.":"상품을 장바구니에 추가하는데 실패했습니다.";
					alert(msg);
				}
			});
		}
	}
	
</script>
</html>