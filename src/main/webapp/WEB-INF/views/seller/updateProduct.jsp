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
</body>
</html>