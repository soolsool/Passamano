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
	<div class="month-wrapper" style="max-width: 80%;">
		<button class="btn-month one-month">1개월</button>
		<button class="btn-month three-month">3개월</button>
		<button class="btn-month six-month">6개월</button>
	</div>
	<c:forEach var='o' items='${orderlist }'>
		<div class="first-card mb-3" style="max-width: 80%;">

			<div class="first-card-header">
				<input type="hidden" class="month"
					value="<fmt:formatDate
						value='${o.orderDate}' pattern='MM'/>"
					date="<fmt:formatDate
						value='${o.orderDate}' pattern='dd'/>"
					year="<fmt:formatDate
						value='${o.orderDate}' pattern='yyyy'/>">
				<strong class="order-date"><fmt:formatDate
						value='${o.orderDate}' pattern='yyyy-MM-dd' /> 주문</strong>
			</div>
			<div class="second-card mb-3" style="max-width: 100%;">
				<div class="orderlist-body">
					<table>
						<tr>
							<td><a href='detailProduct.do?productNo=${o.productNo }'>

									<img src="../files/products_images/${o.imageName }" width="150"
									height="110">
							</a></td>
							<td class="product-detail"><a
								href='detailProduct.do?productNo=${o.productNo }'>
									<p class="card-text">
										${o.productName }, ${o.detailQty }개<br> <strong>${o.payPrice }원</strong>
									</p>
							</a></td>
							<td class="pay-state"><p class="card-text">${o.payMethod}결제
									<c:if test='${o.payState==0}'>(결제전)</c:if>
									<c:if test='${o.payState==1}'>(결제완료)</c:if>
								</p></td>
							<td class="order-state"><p class="card-text">
									<c:if test='${o.orderState==1}'>취소완료</c:if>
									<c:if test='${o.orderState==2}'>환불완료</c:if>
									<c:if test='${o.orderState==3}'>배송준비중</c:if>
									<c:if test='${o.orderState==4}'>배송중</c:if>
									<c:if test='${o.orderState==5}'>배송완료</c:if>
								</p></td>
						</tr>
					</table>
				</div>
				<c:if test='${o.orderState==3}'>
					<div class="btn">
						<input type="button" value="주문 취소" class="btn-order-cancel">
					</div>
					<div class="cancel-reason-wrapper">
						<table>
							<tr>
								<td class="cancel-title">취소/환불 사유</td>
								<td><textarea class="cancel-textarea"
										onkeyup="fn_checkByte(this)" cols="40" rows="2"></textarea></td>
								<td class="byte"><span id="nowByte">0</span>/60<br> <input
									type="button" value="확인" class="btn-cancel-check"
									name="${o.productNo }"></td>
							</tr>
						</table>
					</div>
				</c:if>
				<c:if test='${o.orderState==4||o.orderState==5}'>
					<form action="writereview.do" method="post">
						<div class="btn write-review-btn">
							<input type="hidden" value="${o.productNo }" name="productNo">
							<input type="hidden" name="orderDate"
								value='<fmt:formatDate value="${o.orderDate }" pattern='yyyy/MM/dd' />'>
							<input type="submit" value="리뷰 쓰기" class="btn-review">
						</div>
					</form>
				</c:if>
			</div>
		</div>
	</c:forEach>


</body>
<script type="text/javascript">
	var reasonWrapper = document.querySelector(".cancel-reason-wrapper");
	var totalByte = 0;
	var textarea = document.querySelector(".cancel-textarea");
	var monthList = document.querySelectorAll(".month");

	$(".cancel-reason-wrapper").hide();
	$(".btn-order-cancel").click(function() {
		if (reasonWrapper.classList.contains("click")) {
			reasonWrapper.classList.remove('click');
			$(".cancel-reason-wrapper").hide();
			$(".cancel-textarea").val("");
			fn_checkByte(textarea);
		} else {
			reasonWrapper.classList.add('click');
			$(".cancel-reason-wrapper").show();
		}

	});
	$(".btn-cancel-check").click(function() {
		if (totalByte < 60) {
			var result = confirm("정말 취소하시겠습니까?");
			if (result) {
				var productNum = $(this).attr('name');
				var orderManageReason = $(".cancel-textarea").val();
				$.get("/updateOrder.do", {
					productNum : productNum,
					orderManageReason : orderManageReason
				}, function(data) {
				}, "json")
				setTimeout(function() {
					$(location).attr("href", "/mypage.do");

				}, 200);
			}
		} else {
			alert("최대 60Byte까지만 입력가능합니다.");
		}
	});

	$(".one-month").click(function() {
		var d = new Date();
		var date = d.getDate();
		var month = d.getMonth() + 1;
		var year = d.getFullYear();
		if($(".one-month").hasClass("clicked-month")){
			$(".one-month").removeClass("clicked-month");
			$(".first-card").show();
		}
		else{
		$(".btn-month").removeClass("clicked-month");
		$(".one-month").addClass("clicked-month");
		
		monthList.forEach(function(m) {
		if(year==$(m).attr('year')||(year-1==$(m).attr('year')&&month-1==0)){
		if(month-1==0){
			if((Number)(m.value)==12){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<12){
				$(m).closest(".first-card").hide();
			}
		}
		else{
			if((Number)(m.value)==month-1){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<month-1){
				$(m).closest(".first-card").hide();
			}
		}
		}	
		});
		}
	});
	
	$(".three-month").click(function(){
		var d = new Date();
		var date = d.getDate();
		var month = d.getMonth() + 1;
		var year = d.getFullYear();
		if($(".three-month").hasClass("clicked-month")){
			$(".three-month").removeClass("clicked-month");
			$(".first-card").show();
		}
		else{
		$(".btn-month").removeClass("clicked-month");
		$(".three-month").addClass("clicked-month");
		
		monthList.forEach(function(m) {
		if(year==$(m).attr('year')||(year-1==$(m).attr('year')&&month-3==0)||(year-1==$(m).attr('year')&&month-3==-1)||(year-1==$(m).attr('year')&&month-3==-2)){
		if(month-3==0){
			if((Number)(m.value)==12){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<12){
				$(m).closest(".first-card").hide();
			}
		}
		else if(month-3==-1){
			if((Number)(m.value)==11){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<11){
				$(m).closest(".first-card").hide();
			}
		}
		else if(month-3==-2){
			if((Number)(m.value)==10){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<10){
				$(m).closest(".first-card").hide();
			}
		}
		else{
			if((Number)(m.value)==month-3){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<month-3){
				$(m).closest(".first-card").hide();
			}
		}
		}	
		});
		}
	});
	
	$(".six-month").click(function(){
		
		var d = new Date();
		var date = d.getDate();
		var month = d.getMonth() + 1;
		var year = d.getFullYear();
		if($(".six-month").hasClass("clicked-month")){
			$(".six-month").removeClass("clicked-month");
			$(".first-card").show();
		}
		else{
		$(".btn-month").removeClass("clicked-month");
		$(".six-month").addClass("clicked-month");
		
		monthList.forEach(function(m) {
		if(year==$(m).attr('year')||(year-1==$(m).attr('year')&&month-6==0)||(year-1==$(m).attr('year')&&month-6==-1)||
				(year-1==$(m).attr('year')&&month-6==-2)||(year-1==$(m).attr('year')&&month-6==-3)||(year-1==$(m).attr('year')&&month-6==-4)||
				(year-1==$(m).attr('year')&&month-6==-5)){
		if(month-6==0){
			if((Number)(m.value)==12){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<12){
				$(m).closest(".first-card").hide();
			}
		}
		else if(month-6==-1){
			if((Number)(m.value)==11){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<11){
				$(m).closest(".first-card").hide();
			}
		}
		else if(month-6==-2){
			if((Number)(m.value)==10){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<10){
				$(m).closest(".first-card").hide();
			}
		}
		else if(month-6==-3){
			if((Number)(m.value)==9){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<9){
				$(m).closest(".first-card").hide();
			}
		}
		else if(month-6==-4){
			if((Number)(m.value)==8){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<8){
				$(m).closest(".first-card").hide();
			}
		}
		else if(month-6==-5){
			if((Number)(m.value)==7){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<7){
				$(m).closest(".first-card").hide();
			}
		}
		else{
			if((Number)(m.value)==month-6){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<month-6){
				$(m).closest(".first-card").hide();
			}
		}
		}	
		});
		}
	});

	function fn_checkByte(obj) {

		var maxByte = 60; //최대 60바이트
		var text_val = obj.value; //입력한 문자
		var text_len = text_val.length; //입력한 문자수

		totalByte = 0;
		for (let i = 0; i < text_len; i++) {
			var each_char = text_val.charAt(i);
			var uni_char = escape(each_char) //유니코드 형식으로 변환
			if (uni_char.length > 4) {
				// 한글 : 2Byte
				totalByte += 2;
			} else {
				// 영문,숫자,특수문자 : 1Byte
				totalByte += 1;
			}
		}
		if (totalByte > maxByte) {
			alert('최대 60Byte까지만 입력가능합니다.');
			document.getElementById("nowByte").innerText = totalByte;
			document.getElementById("nowByte").style.color = "red";

		} else {
			document.getElementById("nowByte").innerText = totalByte;
			document.getElementById("nowByte").style.color = "green";
		}
	}
</script>
</html>