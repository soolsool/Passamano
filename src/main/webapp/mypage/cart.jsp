<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<br>
	<div class="all-product-select" style="max-width: 80%;">
		<input name="all-check" class="checkbox all-check" type="checkbox"><span
			class="all-check-title">전체선택</span>
	</div>
		<c:forEach var='b' items='${basket }'>

			<div class="first-card mb-3" detailPrice="${b.detailPrice}" style="max-width: 80%;">
				<div class="first-card-header">
					<input name="checkbox" class="checkbox" value="${b.basketNo}" productNo="${b.productNo }" type="checkbox">
				</div>
				<div class="cart-body">
					<table>
						<tr class="cart-item">

							<td><a href='detailProduct.do?productNo=${b.productNo }'>
									<img src="../files/products_images/${b.imageName }" width="150"
									height="110">
							</a></td>
							<td class="product-detail"><a
								href='detailProduct.do?productNo=${b.productNo }'>
									<p class="card-text">
										${b.productName }, ${b.basketQty }개<br>
									</p>
							</a></td>
							<td class="product-price"><strong>${b.detailPrice}원</strong></td>
							<c:if test='${b.detailPrice>=50000}'>
								<td class="delivery-price"><span>0</span>원
									<p class="card-text delivery-title">(50,000원 이상 구매시 배송비 무료)</p></td>
							</c:if>
							<c:if test='${b.detailPrice<50000}'>
								<td class="delivery-price"><span>3,000</span>원
									<p class="card-text delivery-title">(50,000원 이상 구매시 배송비 무료)</p></td>
							</c:if>
						</tr>
					</table>
				</div>
			</div>
			
		</c:forEach>
		<div class="total-card" style="max-width: 80%;">
			<div>총 상품가격 <p class='total-price'>0</p> 원 + 총 배송비 <p class='total-delivery-fee'>0</p> 원 = 총 주문금액 <p class='last-price'>0</p> 원</div>
		</div>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end btns">

			<input type='button' value='삭제' class="btn-input cancel-btn">
			<input type="button" value='주문하기' class="btn-input order-btn">

		</div>
</body>
<script type="text/javascript">
var checkedValue = [];
var totalprice=0;
var totaldeliveryfee=0;
var lastprice=0;
	$(".checkbox").click(function(){
		if($(this).hasClass('all-check')&&$(".all-check").is(':checked')){
			$("input[type=checkbox][name=checkbox]").prop("checked", true);
		}
		else if ($(this).hasClass('all-check')&&$(".all-check").is(':not(:checked)')){
			$("input[type=checkbox][name=checkbox]").prop("checked", false);
				}
		checkedValue = [];
		totalprice=0;
		totaldeliveryfee=0;
		lastprice=0;
			$("input[name=checkbox]:checked").each(function(index, item) {
				
				checkedValue.push($(item).val());
				totalprice+=Number($(item).closest('.first-card').attr('detailPrice'));
				lastprice+=Number($(item).closest('.first-card').attr('detailPrice'));
				
				if($(item).closest('.first-card').attr('detailPrice')>50000){
					totaldeliveryfee+=0;
					lastprice+=0;					
				}
				else{
					totaldeliveryfee+=3000;
					lastprice+=3000;
				}
				
			});	
			var comma=(totalprice.toString().length)/4;
			var comma2=(totaldeliveryfee.toString().length)/4;
			var comma3=(lastprice.toString().length)/4;
			if(comma>=1){
				for(var i=1; i<=comma; i++){
			totalprice=[(totalprice.toString()).slice(0,totalprice.toString().length-i*3),(totalprice.toString()).slice(totalprice.toString().length-i*3,totalprice.toString().length)].join(',');
			}
			}
			if(comma2>=1){
				for(var i=1; i<=comma2; i++){
			totaldeliveryfee=[(totaldeliveryfee.toString()).slice(0,totaldeliveryfee.toString().length-i*3),(totaldeliveryfee.toString()).slice(totaldeliveryfee.toString().length-i*3,totaldeliveryfee.toString().length)].join(',');
			}
			}
			if(comma3>=1){
				for(var i=1; i<=comma3; i++){
					lastprice=[(lastprice.toString()).slice(0,lastprice.toString().length-i*3),(lastprice.toString()).slice(lastprice.toString().length-i*3,lastprice.toString().length)].join(',');
			}
			}
			$(".total-price").html(totalprice);
			$(".total-delivery-fee").html(totaldeliveryfee);
			$(".last-price").html(lastprice);
			
	});
	
	$(".cancel-btn").click(function() {
		var checkedValue = [];
		var result = confirm("선택한 상품을 삭제하시겠습니까?");
		if (result) {
			$("input[name=checkbox]:checked").each(function(index, item) {
				
				checkedValue.push($(item).val());
				$(item).closest('.first-card').hide();
				
			});
			$("input[type=checkbox][class=checkbox]").prop("checked", false);
			$.get("/deleteBasket.do", {
				basket : checkedValue
			}, function(data) {
			}, "json")
		}

	});
	$(".order-btn").click(function() {
		var checkedValue = [];
		var deliveryFee = [];
		if($("input[name=checkbox]:checked").length){
		var result = confirm("선택한 상품을 주문하시겠습니까?");
		if (result) {
			$("input[name=checkbox]:checked").each(function(index, item) {
				
				checkedValue.push($(item).attr('productNo'));
				if($(item).closest('.first-card').attr('detailPrice')>50000){
				deliveryFee.push('0');
				}
				else{
					deliveryFee.push('3000');
				}
			});
			$.get("/orderProcess.do", {
				basketProductNo : checkedValue,deliveryFee: deliveryFee}
				
			, function(data) {
			}, "json")
			setTimeout(function() {
				$(location).attr("href", "/order.do");

			}, 200);
		}
		}
		else{
			alert("선택된 상품이 없습니다.");
		}
	});
</script>
</html>