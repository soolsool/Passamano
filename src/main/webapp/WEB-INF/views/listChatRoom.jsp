<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>파사마노PASSAMANO</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/commonStyle.css">
<link rel="stylesheet" href="/resources/css/etc/listChatRoom.css">
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
			  <hr class="bg-success mx-auto pt-0.5 w-100">
			  <c:if test="${empty list}">
			  	<div class="d-flex justify-content-center">
			  		<div class="text-center" id="messageBox">
					  	<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
						  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
						  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
						</svg>
				  		<p class="mt-2 fs-5 fw-light">
					  		현재 대화 중인 채팅방이 없습니다.
					  	</p>
			  		</div>
			  	</div>
			  </c:if>
			  <div class="list-group">
			  <c:if test="${not empty list}">
				  	<c:forEach var="room" items="${list }">
						
						<a href="chat.do?chat_room_no=${room.CHAT_ROOM_NO }" class="list-group-item list-group-item-action"/>
						
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
				</c:if>
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


</body>
</html>