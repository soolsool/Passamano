<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/css/commonStyle.css">
<style type="text/css">

#chat{
	overflow: hidden;
	position: relative;
	
}

#chat_input{
	position: fixed;
	width: 90%;
	bottom: 0px;
	z-index: 1;
	position: relative;
	height: 10%;
}	


#chat_list{
	position:relative;
	overflow: auto;
	height: 60%;
	background:#D8D9D7;
	width: 100%;
}

.myMessage{
	
	position:relative;
	background:yellow;
	padding:6px;
	border-radius: 5px;
	width: 100px;
	float: right;
	margin: 3px;
}


.yourMessage{
	position:relative;
	background: white;
	padding:6px;
	border-radius: 5px;
	width: 100px;
	float: left;
	margin: 3px;
	margin-left: 10px;
}

.clear{
	clear: both;
	padding: 0px;
	margin: 0px;
	line-height: 0px;
}

#chat_data{
	visibility: hidden;
	position: relative;
	width: 1px;
	height: 1px;
	padding: 0px;
	margin: 0px;
	overflow: hidden;
}

#message{
	margin-top:10px;
	margin-right:10px;
	width: 90%;
	display: inline-block;
}



#btnSend{
	background-image: url("/resources/images/send.png");
	background-position:center;
	background-repeat:no-repeat;
    background-size: contain;
    border: none;
    background-color: white;
  	width: 50px;
  	height: 50px;
  
  	
  
}

#title{
	background-color: green;
}

.left{
	float: left;
}

</style>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	   
		//윈도의 크기를 읽어옴
		let w = window.innerWidth-100;
		let h = window.innerHeight-100;
		
		
		//윈도 크기가 변경될때 채팅창의 크기에 반영
		$(window).resize(function(){
			w = window.innerWidth-100;
			h = window.innerHeight-100;
			$("#chat").css({
				width:w+"px",
				height:h+"px"
			});
		});
		
		
		//맨처음 실행했을때 채팅창의 크기를 윈도우 크기로 반영
		$("#chat").css({
			width:w+"px",
			height:h+"px"
		});
		
		
		
		//마지막 대화를 기준으로 새로운 대화가 있으면 스크롤을 내리기 위하여 마지막 대화번호를 저장하기 위한 변수
		let last = 0;
		
		//채팅룸번호를 저장하기 위한 변수
		let chat_room_no = 0;
		
		//로그인한 회원의 번호를 저장하기 위한 변수
		let user_no = $("#user_no").val();
		
		//Ajax통신을 통해 채팅목록을 읽어옴.
		//채팅룸번호를 매개변수로 전달함.
		function listChat(){
			chat_room_no = $("#chat_room_no").val();
			user_no = $("#user_no").val();
			
			//마지막 채팅번호를 채팅번호 저장한다.
			$("#chat_no").val(last);
			
			
			//Ajax통신을 수행
			$.ajax({url:"/listChat?chat_room_no="+chat_room_no,success:function(list){
				
				$.each(list, function(i, chat){
					console.log(chat);
					console.log(chat.MESSAGE);
					
					//반복문을 수행하면서 채팅번호가 마지막 채티번호보다 작으면 채팅목록에 추가하지 않는다.
					if(chat.CHAT_NO <= last){
						return;
					}
					else{ // 채팅번호가 last이후이면 채팅목록에 담는다.
						last = chat.CHAT_NO;  // 채팅번호를 last에 저장한다. 마지막 채팅번호를 저장한다.
						
											
						let p = $("<p></p>").html(chat.MESSAGE);
						
						//메세지 길이만큼 박스가로 길이 설정
						//글자 하나당 16필셀로 설정
						let w = (chat.MESSAGE.length*16) + "px"; 
						
						//만약 80자가 넘으면 800픽셀로 고정
						if(chat.MESSAGE.length > 80){
							w = "800px";
						}
						
						//노드의 크기에 적용하기
						$(p).css("width",w);
						
						//말한 사람이 로그인 회원인지, 상대방인지 구분하여 css적용하기
						if(chat.SPEAKER_NO == user_no ){
							$(p).addClass("myMessage");
						}else{
							let your_profile = $("#your_profile").val();
							let img = $("<img class='rounded-circle'></img>").attr({
								"src":"resources/images/userprofile/"+your_profile});
							$(img).css({width:30,height:30,position: "relative",display: "inline-block", float:"left"});
							$("#chat_list").append(img);
							$(p).addClass("yourMessage");
						}
						
						
						
						//생성된 노드를 채팅리스트에 추가하기
						$("#chat_list").append(p);
						
						
						
						//상대방 말하기노드를 표시하기 위한 클래스가 float:right (yourMessage) 을 지워주기.
						$("#chat_list").append($("<br></br>").addClass("clear"));
						
						//현재대화가 추가된 곳으로 스크롤 내리기
						var objDiv = document.getElementById("chat_list"); 
						objDiv.scrollTop = objDiv.scrollHeight;
						
					}
				});
			}});
		}
	
		//0.5초 간격으로 새로운 대화내용 Ajax통신으로 요청하기
		setInterval(function(){
			listChat();
		},500);
	
	
	// 사용자의 입력메세지를 읽어와 Ajax통신으로 데이터 보내기
	$("#btnSend").click(function(event){
		event.preventDefault();
		let data = $("#f").serialize();
		console.log(data);
		$.ajax({url:"/insertChat",data:data, success:function(data){
			
		}});
	});
	
});
</script>
</head>
<body>
<input type="hidden" id="your_profile" value="${your_profile }">

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
		
				<div id="chat" class="container p-3 my-3">
				
					<div id="title" class="container p-3 my-3 text-white">
					  <h3>${your_nickname }</h3>
					  <hr>
					  <div>
					  	<img 
					  		class="rounded" style="margin-right: 20px" src="resources/images/productimage/${image_name }" 
					  		width="50" 
					  		height="50" class="left" align="left">
					  		
							  	 ${product_state }&nbsp;&nbsp;${product_name }<br>
							 	 <b>${product_price }원</b>
					 	   
					 	</div>
					</div>
			
			
					<div id="chat_list" class="container p-3 my-3">
					</div>
					
					<div id="chat_input">
						<form id="f">
							<div id="chat_data"> <!-- 채팅을 위해 chat_no,chat_room_no, speaker_no를 hidden으로 전송 -->
								chat_no:<input type="text" name="chat_no" id="chat_no" value="0">
								chat_room_no:<input type="text" name="chat_room_no" id="chat_room_no" value="${chat_room_no }">
								speaker_no:<input type="text" id="speaker_no" name="speaker_no" value="${speaker_no }">
								user_no:<input type="text" id="user_no" name="user_no" value="${userNo }">
							
							<br>
							</div>
							
							<input type="text" class="form-control input-sm" id="message" name="message" placeholder="메세지를 입력하세요"  aria-describedby="basic-addon1">
							<input type="submit" id="btnSend" value="      ">
						</form>
						</div>
					</div>
			
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