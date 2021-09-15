<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/commonStyle.css">
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
#wrap {
	overflow: hidden;
	min-width: 1600px;
}

.first-card {
	margin: 0px auto;
	border-radius: 12px;
	box-shadow: rgb(0 0 0/ 15%) 0px 2px 4px 0px, rgb(0 0 0/ 30%) 0px 0px 1px
		0px;
	display: flex;
	flex-direction: column;
}

.first-card-header {
	padding: 20px;
}

.second-card {
	border: 1px solid rgb(238, 238, 238);
	border-radius: 10px;
	margin: 20px;
	margin-top: 0px;
}

.product-img{
	padding:20px 20px 20px 0px;
}

.product-text{
	margin:0;
	padding:20px 0px 20px 12px;
	}
.first-table{
	margin: 0px 25px 20px 25px;
}
.second-table{
	margin: 20px 25px;
}
.detail-text{
	margin:0;
}
p{
	display:inline-block;
}

.btn-pay {
	font-size: 18px;
	font-weight: bold;
	color: #28a745;
	width: 150px;
	height: 50px;
	background-color: white;
	border: 1px solid #28a745;
	border-radius: 5px;
	padding: 0px;
	margin: 10px 0px;
}
td{
	padding: 3px 10px 3px 5px;
}
button:hover {
	background-color: #28a745;
	color: white;
	cursor: pointer;
}

button:active {
	background-color: #28a745;
	color: white;
}

.address2,.address3{
	width:90%;
}
.btn-pay-wrap{
	display:inline-block;
	width:100%;
	text-align:center;
	margin-bottom:20px;
	
}

.btn-post {
	font-size: 12px;
	font-weight: bold;
	color: #28a745;
	width: 90px;
	height: 30px;
	background-color: white;
	border: 1px solid #28a745;
	border-radius: 5px;
	padding: 0;
	margin: 2px 0px 2px 8px;
}s
</style>
<script type="text/javascript">
	$(function() {
		$("#check_module").click(function() {
			if($("#receiverName").val()==""){
				alert("수령인 이름을 입력하세요.");
			}
			else if($("#receiverPhone").val()==""){
				alert("연락처 정보를 입력하세요.");
			}
			else if($(".address1").val()==""||$(".address2").val()==""||$(".address3").val()==""){
				alert("주소지 정보를 입력하세요.");
			}
			else{
				IMP.init("imp71134967");
				IMP.request_pay({
					pg : 'kcp',
					pay_method : $("select[name=payMethod]").val(),
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : $("#productName").text(),
					amount : $("#payPrice").text(),
					//buyer_email:'tiger@gmail.com',
					buyer_name : $("#receiverName").val(),
					buyer_tel : $("#receiverPhone").val(),
				//buyer_addr:'서울시 마포구 서교동',
				//buyer_postcode:'123-456'
				}, function(rsp) {
					console.log(rsp);
					if (rsp.success) {
						var msg = "결제가 완료되었습니다.";
						msg += '고유ID:' + rsp.imp_uid;
						msg += '상점 거래ID:' + rsp.merchant_uid;
						msg += '결제 금액:' + rsp.paid_amount;
						msg += '카드 승인번호 :' + rsp.apply_num;
						//alert(msg);
						//location.href = "payok.html";
						document.getElementById("orderinput").submit();
					} else {
						var msg = "결제에 실패하였습니다.";
						msg += '에러내용:' + rsp.error_msg;
						alert(msg);
					}
				});
			}
			
		});
	});

	$(function() {
		var tot = 0;
		$(".orderTot").each(function(items) {
			var aa = $(this).text();
			tot = Number(tot) + Number(aa);
		})
		$("#payPrice").text(tot);

	});

	function findAddr() {
		new daum.Postcode({
			oncomplete : function(data) {

				console.log(data);

				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var jibunAddr = data.jibunAddress; // 지번 주소 변수
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				$(".address1").val(data.zonecode);
				if (roadAddr !== '') {
					$(".address2").val(roadAddr);
				} else if (jibunAddr !== '') {
					$(".address2").val(jibunAddr);
				}
			}
		}).open();
	}
</script>

</head>
<body>
	<div id="wrap">
		<!--  헤더 메뉴 부분 시작 -->
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<%@ include file="../common/header.jsp"%>
			</div>
			<div class="col-2"></div>
		</div>
		<!--  헤더 메뉴 부분 끝 -->
		<!--  본문 시작 -->

		<br>
		<div class="first-card mb-3" style="max-width: 60%;">

			<div class="first-card-header">
				<strong>주문 제품정보</strong>
			</div>
			<c:forEach var="c" items="${product }">
			<div class="second-card mb-3" style="max-width: 100%;">
				<form action="/mypage/orderinsert.do" method="post" id="orderinput">
					
					<input type="hidden" name="userNo" value="${userNo }">
					<table class="first-table">
					<tr><td><img class="product-img" width="170px" height="140px" src="../resources/images/productimage/${c.imageName}"></td>
					<td><p class="product-text" id="productName">${c.productName }</p>,</td>
					<td><p class="product-text" name="qty">${c.basketQty }</p>개</td>
					</tr>
					<tr>
					<td>주문가격</td>
					<td><p class="detail-text" name="totalPrice">${c.totalPrice }</p>원</td>
					</tr>
					<tr>
					<td>배송비</td>
					<td><p class="detail-text" name="deliveryFee">${c.deliveryFee }</p>원</td>
					</tr>
					<tr>
					<td>총가격</td>
					<td><p class="orderTot detail-text" name="orderTot">${c.lastprice }</p>원</td>
					</tr>
					</table>

						<!-- <input type="text" readonly="readonly" value="${p.productName }"><br>
 	<input type="hidden" name="productNo" value="${productNo }">-->

						<!-- 결제정보 -->
						</div>
					</c:forEach>
					<div class="second-card mb-3" style="max-width: 100%;">
					
					<table class="second-table">
					<tr><td><strong>배송 정보</strong></td><td></td><td></td></tr>
					<tr><td>수령인</td><td><input type="text" name="receiverName" id="receiverName" required="required"></td><td></td></tr>
					<tr><td>연락처</td><td><input type="text" name="receiverPhone" id="receiverPhone" required="required"></td><td></td></tr>
					<tr><td>주소</td><td><input type="text" name="deliveryAddress1" readonly="readonly"
						class="address1" required="required"></td><td><button type="button" class="btn-post" onclick="findAddr()">우편번호
						검색</button></td></tr>
					<tr><td></td><td colspan="2"><input type="text" name="deliveryAddress2"
						readonly="readonly" class="address2" required="required"></td></tr>
						<tr><td></td><td colspan="2"><input type="text" name="deliveryAddress3" class="address3" required="required"></td></tr>
						<tr><td>배송요청사항</td><td><input type="text" name="deliveryMsg"></td><td></td></tr>
						<tr><td>결제방법</td><td><select name="payMethod">
						<option value="card">신용카드</option>
						<!--  <option value="">실시간계좌이체</option>-->
						<option value="vbank">가상계좌</option>
					</select></td><td></td></tr>
					<!-- 결제금액 -->
						<tr><td>합계</td><td><p id="payPrice"
						name="orderTot" class="detail-text"></p>원</td><td></td></tr>
						
					</table>
						<div class="btn-pay-wrap"><button class="btn-pay" id="check_module" type="button">결제</button></div>
				</form>
				</div>
			
		</div>
		<!--  풋터 끝부분 시작 -->
		<div class="row">

			<div class="col-2"></div>
			<div class="col-8">
				<%@ include file="../common/footer.jsp"%>
			</div>
			<div class="col-2"></div>

		</div>
		<!--  풋터 끝부분 끝 -->
		<script
			src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
			integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"
			integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/"
			crossorigin="anonymous"></script>
	</div>


</body>
</html>