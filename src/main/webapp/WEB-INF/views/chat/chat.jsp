<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table { height: 450px; border:none;
		table-layout: fixed; overflow: hidden; }  		/* 넘치면 감춘다 */
	#chatMessage { height: 400px; overflow: scroll; }	/* 넘치면 스크롤기능 */
</style>
<script type="text/javascript">
	var websocket; // 웹소켓 변수, 여러 function에서 공통으로 사용위해 밖에 빼둠(전역변수로 사용위해)
	$(function() {
		$('#enterBtn').click(function () {	connect();			}); // connect 함수 사용
		$('#exitBtn').click(function () {	disconnect();		});
		$('#sendBtn').click(function () {	send();				});
		$('#message').keypress(function () {
			//              IExplorer이면?  IE key값    IE아닌 key값
			var keycode = event.keyCode?event.keyCode:event.which;
			if (keycode==13) { // enter를 눌렀으면
				send();
			}
			event.stopPropagation();	// 이벤트를 전달하지 마라(enter 누른게 아니면)
		});
	});
	function send() {
		var nickname = $('#nickname').val();	//별명
		var msg = $('#message').val();			//메시지
		websocket.send(nickname+"=>"+msg);		//별명과 메시지를 묶어서 보내기
		$('#message').val("");					//입력한 메시지 삭제
	}
	function connect() {
		websocket=new WebSocket("ws://192.168.219.119:8888/chat-ws.html"); //공통 ip, 다같이 채팅위해
		websocket.onopen = onOpen;
		websocket.onmessage = onMessage;
		websocket.onclose = onClose;
	}
	function onOpen() {
		var nickname = $('#nickname').val();
		appendMessage(nickname+"님이 입장하였습니다");
	}
	function onMessage(event) {
		var msg = event.data;	// 메시지는 event의 data로 들어온다
		appendMessage(msg);
	}	
	function onClose() {
		var nickname = $('#nickname').val();
		appendMessage(nickname+"님이 퇴장하였습니다");		
	}
	function appendMessage(msg) {
		$('#chatMessage').append(msg+'<br>');
		// scrollBar를 아래로 내려라
		var objDiv = document.getElementById("chatMessage");
		objDiv.scrollTop = objDiv.scrollHeight;
	}
	function disconnect() {
		websocket.close();
	}
</script></head><body>

<div class="container">
<table class="table table-hover">
	
	<tr><td colspan="3" width="10px;" bgcolor="#00b300" style="color: white">익명 채팅방</td></tr>
	<tr><td colspan="3"><div id="chatMessage"></div></td></tr>	
	<tr><td>별명:</td><td><input type="text" id="nickname"/></td>
		<td>
			<input type="button" id="enterBtn" value="입장" 
				class="btn btn-sm btn-info"/>
			<input type="button" id="exitBtn" value="퇴장" 
				class="btn btn-sm btn-warning"/></td></tr>
	<tr><td>메시지:</td><td><input type="text" id="message" /></td>
		<td><input type="button" id="sendBtn" value="전송"
			class="btn btn-sm btn-success"/></td></tr>			
</table>
</div>

</body>
</html>