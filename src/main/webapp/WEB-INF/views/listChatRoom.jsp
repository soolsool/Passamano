<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/css/commonStyle.css">
  <style type="text/css">
  	td{
  		padding: 10px;
  	}
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>

<!--  헤더 메뉴 부분 시작 -->
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-8">	
			<%@ include file="./common/header.jsp" %>
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
		
			<div class="container">
			  <h2>채팅</h2>
			  <div class="list-group">
			  	<c:forEach var="room" items="${list }">
					
					<a href="chat.do?chat_room_no=${room.CHAT_ROOM_NO }" 
		 					class="list-group-item list-group-item-action"/>
					
							 <table>
							 	<tr>
							 		<td>
							 			
							 			<c:if test="${userNo == room.FROM_NO }">
							 					<img class="rounded-circle" src="resources/images/userprofile/${room.TO_PROFILE }" width="50" height="50">
							 			</c:if>
							 			<c:if test="${userNo == room.TO_NO }">
							 					<img class="rounded-circle" src="resources/images/userprofile/${room.FROM_PROFILE }" width="50" height="50">
							 			</c:if>	
							 			
							 			
							 		
							 		 </td>
							 		<td>
							 			<c:if test="${userNo == room.FROM_NO }">
							 					${room.TO_PROFILE }<br>
							 					${room.TO_NICKNAME }
							 			</c:if>
							 			<c:if test="${userNo == room.TO_NO }">
							 					${room.FROM_PROFILE }<br>
							 					${room.FROM_NICKNAME }
							 			</c:if>	
							 		.. ${room.LAST_CHAT_DATE }						 			
							 		${room.PRODUCT_NAME}<br>
									${room.MESSAGE } <br>
									</td>
							 	</tr>
							 </table>
					 </a>
				</c:forEach>
			  </div>
			</div>
			<!-- 
			<ul>
				<c:forEach var="room" items="${list }">
					<li><a href="chat.do?chat_room_no=${room.CHAT_ROOM_NO }">
							${room.PRODUCT_NAME}<br>
							${room.MESSAGE }					
					 </a></li>
				</c:forEach>
			</ul>
			-->
		</div>
		<div class="col-2">
		</div>

	</div>
	<!--  본문 시작 -->
	<!--  풋터 끝부분 시작 -->
	<div class="row">
	
		<div class="col-2">
		</div>
		<div class="col-8">
			<%@ include file="./common/footer.jsp" %>
		</div>
		<div class="col-2">
		</div>

	</div>
	<!--  풋터 끝부분 끝 -->	

<hr>

</body>
</html>