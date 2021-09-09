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
		<input name="all-check-zzim" class="zzim-checkbox all-check-zzim" type="checkbox"><span
			class="all-check-title">전체선택</span>
	</div>
	<c:forEach var='z' items='${zzim }'>

		<div class="first-card mb-3" name="${z.productNo }"
			style="max-width: 80%;">
			<div class="first-card-header">
				<input name="zzim-checkbox" class="zzim-checkbox" productNo="${z.productNo }" value="${z.zzimNo}"
					type="checkbox">
			</div>
			<div class="cart-body">
				<table>
					<tr class="cart-item">

						<td><a href='detailProduct.do?productNo=${z.productNo }'>
								<img src="../files/products_images/${z.imageName }" width="150"
								height="110">
						</a></td>
						<td class="product-detail"><a href='detailProduct.do?productNo=${z.productNo }'>
								<p class="card-text">
										${z.productName }
									</p>
						</a></td>
						<td class="product-price"><strong>${z.productPrice}원</strong></td>

					</tr>
				</table>
			</div>
		</div>

	</c:forEach>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end btns">

		<input type='button' value='삭제' class="btn-input zzim-cancel-btn">
		<input type="button" value='장바구니 추가' class="btn-input cart-btn">

	</div>
</body>
<script type="text/javascript">
	$(".all-check-zzim").click(
			function() {
				if ($(".all-check-zzim").is(':checked')) {
					$("input[type=checkbox][class=zzim-checkbox]").prop("checked", true);
				} else if ($(".all-check-zzim").is(':not(:checked)')) {
					$("input[type=checkbox][class=zzim-checkbox]").prop("checked", false);
				}
			});

	$(".zzim-cancel-btn").click(function() {
		var checkedValue = [];
		var result = confirm("선택한 상품을 삭제하시겠습니까?");
		if (result) {
			$("input[name=zzim-checkbox]:checked").each(function(index, item) {

				checkedValue.push($(item).val());
				$(item).closest('.first-card').hide();

			});
			$("input[type=checkbox][name=zzim-checkbox]").prop("checked", false);
			$.get("/deleteZzim.do", {
				zzim : checkedValue
			}, function(data) {
			}, "json")
		}

	});
	$(".cart-btn").click(function() {
		var checkedValue = [];
		if ($("input[name=zzim-checkbox]:checked").length) {

				$("input[name=zzim-checkbox]:checked").each(function(index, item) {
					checkedValue.push($(item).attr('productNo'));
				});
				$.get("/zzimProcess.do", {
					zzimProductNo : checkedValue,
				}

				, function(data) {
					
				}, "json")
				alert("상품이 장바구니에 담겼습니다.");
			}

			$(location).attr("href", "/cart.do");

	
	});
</script>
</html>