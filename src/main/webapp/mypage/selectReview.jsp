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
	<c:forEach items="${selectReview}" var="sr">
		<div class="first-card mb-3" style="max-width: 90%;">

			<div class="first-card-header">
				<p></p>
			</div>
			<div class="second-card mb-3" style="max-width: 100%;">
				<div class="orderlist-body">
					<table>
						<tr>
							<td class="product-img"><a
								href='detailProduct.do?productNo=${sr.productNo }'> <img
									src="../files/products_images/${sr.imageName }" width="120"
									height="90">
							</a></td>
							<td class="product-detail"><a
								href='detailProduct.do?productNo=${sr.productNo }'>
									<p class="card-text">
										${sr.productName }, ${sr.detailQty }개<br> <strong>${sr.payPrice }원</strong>
									</p>
							</a></td>
						</tr>
					</table>
				</div>
				<div class="select-review-wrapper">
					<table>
					<tr><td></td><td><c:if test="${not empty sr.reviewImg}"> <img width=400px src="../files/review_images/${sr.reviewImg}"></c:if></td></tr>
						<tr>
							<td class="title">평점</td>
							<td class="eval"><input type="hidden" class="evaluation"
								name="evaluation" value="${sr.reviewEvaluation}">
								<p class="star star1">☆</p>
								<p class="star star2">☆</p>
								<p class="star star3">☆</p>
								<p class="star star4">☆</p>
								<p class="star star5">☆</p></td>

						</tr>
						<tr>
							<td class="title">제목</td>
							<td>${sr.reviewTitle}</td>
						</tr>
						<tr>
							<td class="review-content title">내용</td>
							<td>${sr.reviewContent }</td>

						</tr>

						<tr>
						<td class="button"><div class="btn-wrap">
									<input type="button" class="btn-edit" value="수정하기">
								</div>
								
								</td>
							<td class="button"><div class="btn-wrap">
									<form action="/deleteReview.do" onsubmit="return check()">
									<input type="hidden" name="reviewNo" value="${sr.reviewNo}">
									<input type="submit" class="btn-delete" value="삭제하기">
									</form>
								</div></td>
							
						</tr>
					</table>


					</form>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
<script type="text/javascript">
	var eval=document.querySelectorAll(".evaluation");
	eval.forEach(function(e){
		if(e.value==1){
			$(e).closest(".eval").children(".star1").html("★");
		}
		else if(e.value==2){
			$(e).closest(".eval").children(".star1").html("★");
			$(e).closest(".eval").children(".star2").html("★");
		}
		else if(e.value==3){
			$(e).closest(".eval").children(".star1").html("★");
			$(e).closest(".eval").children(".star2").html("★");
			$(e).closest(".eval").children(".star3").html("★");
		}
		else if(e.value==4){
			$(e).closest(".eval").children(".star").html("★");
			$(e).closest(".eval").children(".star5").html("☆");
		}
		else if(e.value==5){
			$(e).closest(".eval").children(".star").html("★");
		}
	});
	
function check(){
	var re=confirm("정말로 삭제하시겠습니까?");
	if (re) {
		alert("삭제가 완료되었습니다.");
	}
	else{
			return false;
	}
}
</script>
</html>