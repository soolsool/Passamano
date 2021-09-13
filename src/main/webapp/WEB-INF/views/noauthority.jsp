<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파사마노:::</title>
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
	<hr class="bg-success mx-auto pt-1 w-50" id="mainColumn">
	
	<!-- 페이지 본문 시작 -->
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-8">
			<div class="mx-auto">
				<p class="fs-5 fw-light">접근 권한이 없습니다.</p>
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
	
</script>
</html>