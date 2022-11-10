<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hi. I'm Blank.</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap');

*{
	font-family: 'Noto Sans KR', sans-serif;
}
header{
	position: fixed;
	top:0;
	left:0;
	width:90%;
	height: 60px;
	padding: 0 5%;
	padding-top:10px;
	border-bottom:1px solid #e2e2e2;
	background: #fff;
}

body{
	position:fixed;
	width: 100%;
	height: 100%;
	padding:0px;
	margin:0px;
}

#chatInfo{
	float:left;
	width:60%;
	height: 30px;
	padding: 15px 0; 
}

#chatInfo div{
	display:inline-block;
}

#chatInfoImg{
	position: relative;
	width:30px;
	height: 30px;
	border-radius: 40px;
}

#chatInfoImg>img{
	position:absolute;
	top:-17px;
	left:-15px;
	width: 60px;
	height: 60px;
	border-radius: 100px;
}
#chatInfoTitle{
	font-size: 16px;
	line-height: 28px;
	vertical-align: top;
	margin-left:10px;
	color:#3DBCD9;
}

#chatBadge{
	float:right;
	width:40%;
	height: 60px;
	padding: 20px 0; 
}

.chatBadgeImg{
	display:inline-block;
	position:relative;
	width:20px;
	height: 20px;
	border-radius: 20px;
	margin-right:6px;
}
.chatBadgeImg div{
	position:absolute;
	top:-1px;
	right:-1px;
	width: 4px;
	height: 4px;
	background: #63E4F2;
	border-radius: 6px;
}

.chatBadgeImg>img{
	position:absolute;
	top:-11px;
	left:-10px;
	width: 40px;
	height: 40px;
	border-radius: 100px;
}
#chatBadge>div{
	display:inline-block;
}
#chatSetting{
	float:right;
}
#chatSetting img{
	width: 20px;
	height: 20px;
}

footer{
	position: fixed;
	bottom:0;
	left:0;
	width:100%;
	height: 130px;
	border-top:1px solid #e2e2e2;
}

#tipArea{
	padding: 10px 5%;
	width: 100%;
	height: 30px;
}
#tipArea div{
	display: inline-block;
	margin-top:10px;
	margin-right:12px;
}
#tipArea>div img{
	width: 20px;
	height: 20px;
	opacity: 0.5;
}
#inputArea{
	width: 90%;
	height: 70px;
	padding: 0 5%;
}
#inputArea>div{
	display: inline-block;
}
#inputBox{
	width: 85%;
}
#inputBox input{
	border:none;
	width:100%;
	height: 30px;
	color: #777;
	background: none;
}
#inputBox input:focus{
	outline: none;
	padding:2px;
	caret-color: #3DBCD9;
}
#inputBox input::placeholder{
	padding-left:10px;
}
#btnBox{
	float: right;
	width: 15%;
}
#btnBox>button{
	width: 100%;
	height: 36px;
	border:none;
	border-radius: 2px;
	background: #3DBCD9;
	color:#fff;
	font-size: 12px;
	opacity: 0.5;
}
#btnBox>button:focus{
	outline:none;
}
#container{
	overflow-y:scroll;
	width: 90%;
	height: calc(100% - 221px);
	margin: 71px 0 130px 0;
	padding:10px 5%;
}
.leftChat{
	width:100%;
	margin-bottom:20px;
}
.leftChat>div{
	display: inline-block;
	max-width:70%;
}
.leftProfileArea{
	width:44px;
	vertical-align: top;
}
.leftProfileBox img{
	width: 50px;
	height: 50px;
	border-radius: 50px;
}
.leftInfoBox>div{
	display: inline-block;
}
.leftInfoName{
	font-size:13px;
	padding-top:15px;
	color: #4b4b4b;
}
.leftInfoTime{
	margin-left:6px;
	font-size:9px;
	padding-top:18px;
	vertical-align: top;
	color: #cbcbcb;
}
.leftInfoText{
	margin-top:6px;
	padding: 10px 25px 15px 25px;
	background: #f0f0f0;
	border-radius: 0 8px 8px 8px;
}
.leftInfoText>span{
	font-size: 11px;
	color: #5b5b5b; 
}
.rightChat{
	position:relative;
	width:100%;
	margin-bottom:20px;
	text-align: right;
}
.rightChat>div{
	display: inline-block;
	max-width:70%;
}
.rightProfileArea{
	width:44px;
	vertical-align: top;
}
.rightProfileBox img{
	position:absolute;
	right:2px;
	width: 50px;
	height: 50px;
	border-radius: 50px;
}
.rightInfoBox>div{
	display: inline-block;
}
.rightInfoName{
	font-size:13px;
	padding-top:15px;
	color: #4b4b4b;
}
.rightInfoTime{
	margin-right:6px;
	font-size:9px;
	padding-top:18px;
	vertical-align: top;
	color: #cbcbcb;
}
.rightInfoText{
	text-align: center;
	margin-top:6px;
	padding: 10px 25px 15px 25px;
	background: #3DBCD9;
	border-radius: 8px 0 8px 8px;
}
.rightInfoText>span{
	font-size: 11px;
	color: #fff; 
}
</style>
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>

<body>
	<header>
		<!-- 채팅방 이름 -->
		<div id="chatInfo">
			<!-- 채팅방 이미지 -->
			<div id="chatInfoImg">
				<img alt="채팅방" src="./resources/image/profile/profile5.png">
			</div>
			
			<!-- 채팅방 이름 -->
			<div id="chatInfoTitle">BLANK TEAM</div>
		</div>
		
		<!-- 뱃지 -->
		<div id="chatBadge">
			<!-- 참여자 -->
			<div>
				<div class="chatBadgeImg" title="참가자">
					<div></div>
					<img alt="참가자" src="./resources/image/profile/profile1.png">
				</div>
				<div class="chatBadgeImg" title="사회학자">
					<img alt="사회학자" src="./resources/image/profile/profile4.png">
				</div>
				<div class="chatBadgeImg" title="신문기자">
					<img alt="신문기자" src="./resources/image/profile/profile8.png">
				</div>
				<div class="chatBadgeImg" title="언어교수">
					<img alt="언어교수" src="./resources/image/profile/profile2.png">
				</div>
				<div class="chatBadgeImg" title="인사부장">
					<img alt="인사부장" src="./resources/image/profile/profile3.png">
				</div>
				<div class="chatBadgeImg" title="수다쟁이">
					<img alt="수다쟁이" src="./resources/image/profile/profile6.png">
				</div>
				<div class="chatBadgeImg" title="대표">
					<img alt="대표" src="./resources/image/profile/profile7.png">
				</div>
			</div>
			
			<!-- 설정 -->
			<div id="chatSetting">
				<img alt="설정" src="./resources/image/icon/setting.png">
			</div>
		</div>
		
	</header>
	
	
	<!-- 메인영역 -->
	<div id="container">
			<!-- 사용자 -->
			<div class="leftChat">
				<div class="leftProfileArea">
					프로필이미지
					<div class="leftProfileBox">
						<img alt="인사부장" src="./resources/image/profile/profile3.png">
					</div>
				</div>
				
				<div class="leftChatArea">
					<div class="leftInfoBox">
						닉네임
						<div class="leftInfoName">수다쟁이</div>
						
						쓴시간
						<div class="leftInfoTime">07.28 06:59</div>
					</div>
					텍스트
					<div class="leftInfoText">
						<span>저희는 BLANK TEAM 입니다. 있는데 없습니다!</span>
					</div>
				</div>
			</div>
			
			<!-- 채팅봇 -->
			<div class="rightChat">
				<div class="rightChatArea">
					<div class="rightInfoBox">
						쓴시간
						<div class="rightInfoTime">07.28 06:59</div>
						
						닉네임
						<div class="leftInfoName">수다쟁이</div>
					
					</div>
					텍스트
					<div class="rightInfoText">
						<span>저희는 BLANK TEAM 입니다. 있는데 없습니다!</span>
					</div>
				</div>
				
				<div class="rightProfileArea">
					프로필이미지
					<div class="rightProfileBox">
						<img alt="인사부장" src="./resources/image/profile/profile3.png">
					</div>
				</div>
			</div>
			
	</div>
	
	<!-- 푸터 -->
		<footer>
			<!-- 도움말 -->
			<div id="tipArea">
				<!-- 소개 -->
				<div>
					<img alt="소개" src="./resources/image/icon/hello.png">
				</div>
				
				<!-- 대화 -->
				<div>
					<img alt="대화" src="./resources/image/icon/chat.png">
				</div>
				
				<!-- 정보 -->
				<div>
					<img alt="정보" src="./resources/image/icon/info.png">
				</div>
			</div>
			<!--  -->
			<div id="inputArea">
				<!-- 입력폼 -->
				<div id="inputBox">
					<input type="text" id="inputText" placeholder="type a message here..." onkeydown="onEnter();"/>
				</div>
				<!-- 버튼 -->
				<div id="btnBox">
					<button onclick="send();">말하기</button>
				</div>
			</div>
		</footer>
</body>


<script type="text/javascript">
	<!-- init -->
	$(function() {
		$.getJSON("https://api.ipify.org?format=jsonp&callback=?",
			function(json) {
				clientIp = json.ip;
			}
		);
		
		$("#inputText").focus(function() {
			$("#btnBox>button").css("opacity","1");
		});
		$("#inputText").blur(function() {
			$("#btnBox>button").css("opacity","0.5");
		});
	});

	function makeTime() {
		var today = new Date();
		var result;
		
		var month = today.getMonth()+1;
		var day = today.getDate();
		var hours = today.getHours();
		var minutes = today.getMinutes();
		
		result = (month>=10?month:"0"+month)+"."+(day>=10?day:"0"+day)+" "+(hours>=10?hours:"0"+hours)+":"+(minutes>=10?minutes:"0"+minutes);
		
		return result;
	}
	
	function sendForm(text) {
		var name = clientIp;
		var date = makeTime();
		var imageLink = "./resources/image/profile/profile1.png";
		
		var code = "<div class='rightChat'><div class='rightChatArea'><div class='rightInfoBox'><div class='rightInfoTime'>"+date+"</div><div class='leftInfoName'>"+name+"</div></div><div class='rightInfoText'><span>"+text+"</span></div></div><div class='rightProfileArea'><div class='rightProfileBox'><img src='"+imageLink+"'></div></div></div>";
		$("#container").append(code);
		$("#container").scrollTop($("#container")[0].scrollHeight);
	}
	
	function cmmtForm(type, text) {
		var date = makeTime();
		switch (type) {
			case 2: var name = "언어교수"; var imageLink = "./resources/image/profile/profile2.png"; break;
			case 3: var name = "인사부장"; var imageLink = "./resources/image/profile/profile3.png"; break;
			case 4: var name = "사회학자"; var imageLink = "./resources/image/profile/profile4.png"; break;
			case 6: var name = "수다쟁이"; var imageLink = "./resources/image/profile/profile6.png"; break;
			case 7: var name = "대표"; var imageLink = "./resources/image/profile/profile7.png"; break;
			case 8: var name = "신문기자"; var imageLink = "./resources/image/profile/profile8.png"; break;
		}
		
		
		var code = "<div class='leftChat'><div class='leftProfileArea'><div class='leftProfileBox'><img src='"+imageLink+"'></div></div><div class='leftChatArea'><div class='leftInfoBox'><div class='leftInfoName'>"+name+"</div><div class='leftInfoTime'>"+date+"</div></div><div class='leftInfoText'><span>"+text+"</span></div></div></div>";
		$("#container").append(code);
		$("#container").scrollTop($("#container")[0].scrollHeight);
	}
	
	function send() {
		var msg = $("#inputText").val();
		sendForm(msg);
		getMsg(msg);
		
	}

	function getMsg(msg) {
		$.ajax({
			url : "./send",
			type : "POST",
			data : 'question=' + msg,
			asyn : true,
			success : function(map) {
				if (map.hello != undefined) {
					var text = map.hello;
					cmmtForm(3,text);
				}
				
				if (map.answer != undefined) {
					var text = map.answer;
					cmmtForm(6,text);
				}
				
				if(map.data != undefined){
					var data = map.data;
					if (data=="blank") {
						cmmtForm(2,"나는 바쁜일이 있네.");
						cmmtForm(4,"잘 모르겠네.");
						cmmtForm(8,"천천히 다시 이야기해봐.");
					}else{
						var arText = data.split("양지수");
						cmmtForm(2,arText[0]);
						cmmtForm(4,arText[1]);
						var news = "";
						for (var i = 2; i < arText.length-1; i++) {
							news = news + (i-1) + ". " + arText[i]+"<br/>";
						}
						cmmtForm(8,news);
					}
					
				}
				
			}
		});
	}
	
	function onEnter() {
		if (window.event.keyCode == 13) {
			send();
		}
	}
</script>
</html>