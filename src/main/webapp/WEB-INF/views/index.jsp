<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hi. I'm Blank.</title>
<link rel="stylesheet" type="text/css" href="./resources/css/style.css">
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<body>
	<header>
		<div id="chatInfo">
			<div id="chatInfoImg">
				<img alt="채팅방" src="./resources/image/profile/profile7.png">
			</div>
			
			<div id="chatInfoTitle">BLANK TEAM</div>
		</div>
		
		<div id="chatBadge">
			<div>
				<div class="chatBadgeImg">
					<div></div>
					<img class="icon" src="./resources/image/profile/profile1.png">
				</div>
				<div class="chatBadgeImg">
					<div></div>
					<img class="icon" alt="인사부장" src="./resources/image/profile/profile3.png">
				</div>
				<div class="chatBadgeImg">
					<div></div>
					<img class="icon" alt="언어교수" src="./resources/image/profile/profile2.png">
				</div>
				<div class="chatBadgeImg">
					<div></div>
					<img class="icon" alt="신문기자" src="./resources/image/profile/profile5.png">
				</div>
				<div class="chatBadgeImg">
					<div></div>
					<img class="icon" alt="박학다식" src="./resources/image/profile/profile8.png">
				</div>
				<div class="chatBadgeImg">
					<div></div>
					<img class="icon" alt="수다쟁이" src="./resources/image/profile/profile6.png">
				</div>
			</div>
			
			<div id="chatSetting" onclick="onRefresh();">
				<img alt="새로고침" src="./resources/image/icon/setting.png">
			</div>
		</div>
		
	</header>
	
	<div id="container">
	</div>
	
		<footer>
			<div id="tipArea">
				<div>
					<img class="icon" alt="'너는 누구니?'와 같이 BLANK에 대해 물어보면 대답해줍니다." src="./resources/image/icon/hello.png">
				</div>
				
				<div>
					<img class="icon" alt="자유롭게 말을 걸면 유명한 수다쟁이가 대화해줍니다." src="./resources/image/icon/chat.png">
				</div>
				
				<div>
					<img class="icon" alt="'김치찌개가 뭐야?', '코로나 알아?' 같이 질문을 하면 정보를 알려줍니다." src="./resources/image/icon/info.png">
				</div>
			</div>
			
			<div id="inputArea">
			
				<div id="inputBox">
					<input type="text" id="inputText" placeholder="type a message here..." onkeydown="onEnter();"/>
				</div>
				
				<div id="btnBox">
					<button onclick="send();">말하기</button>
				</div>
			</div>
		</footer>
		
		<div id="toolTip"></div>
		
</body>
<script type="text/javascript" src="./resources/js/script.js"></script>
</html>