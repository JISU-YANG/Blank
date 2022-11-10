<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hi. I'm Blank.</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap');

*{
  font-family: 'Noto Serif KR', serif;
}
html{
  height: 100%;
}
body {
  height: 100%;
  background: #1D1F20;
}

#motionArea{
  width:80px;
  height:80px;
  margin:0 auto;
  padding-top:100px;
}

#motionArea div{
	margin-bottom:6px;
}

.gradient-border {
  position: relative;
  width: 80px;
  height: 80px;
  border-radius: 100px 100px 100px 0;
  background: #1D1F20;
  --borderWidth: 6px;
  -webkit-transition: background 0.4s ease;
  -moz-transition: background 0.4s ease;
  -o-transition: background 0.4s ease;
  transition: background 0.4s ease;
}
.gradient-border:after {
  content: '';
  position: absolute;
  top: calc(-1 * var(--borderWidth));
  left: calc(-1 * var(--borderWidth));
  height: calc(100% + var(--borderWidth) * 2);
  width: calc(100% + var(--borderWidth) * 2);
  background: linear-gradient(60deg, #f79533, #f37055, #ef4e7b, #a166ab, #5073b8, #1098ad, #07b39b, #6fba82);
  border-radius: 0 100px 100px 0;
  z-index: -1;
  animation: animatedgradient 3s ease alternate infinite;
  background-size: 300% 300%;
}

#circle1{
  width:50px;
  height:50px;
  border-radius: 0 100px 100px 100px;
}

#circle2:after{
  border-radius: 0 100px 100px 0px;
}

@keyframes animatedgradient {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
}

#container{
  position:relative;
  width:500px;
  height:640px;
  margin:auto;
  text-align:center;

}
#aBox{
  position: absolute;
  left:0px;
  top:300px;
  width:100%;
  height: 120px;
}

#aBox span{
  color:#fff;
  font-size:48px;
}

#qBox{
  position: absolute;
  left:0px;
  bottom:0px;
  width:100%;
  height: 120px;
}

#qBox input{
  width:100%;
  height: 10px;
  background: none;
  border:none;
  border-bottom:1px solid #333;
  color:#fff;
  font-size:24px;
  padding:30px 15px;
  text-align: center;
}
#qBox input:focus{
  outline: none;
}

#infoArea{
	position: fixed;
	top:100px;
	left:0px;
	width:100%;
	height: 400px;
}
.infoBox{
	float:left;
	width:35%;
	height:175px;
	margin-bottom:50px;
	margin-left: 10%;
	background: #fff;
	border-radius: 60px;
	box-shadow: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);
}

.infoContent{
	vertical-align: middle;
	width:80%;
	padding: 0 10%;
}

.infoTitle{
	width:100%;
	height: 60px;
	text-align: center;
	padding-top:20px;
	font-size: 24px;
}
</style>
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<body>
	<div id="container">
		<div id="motionArea">
			<div class="gradient-border" id="circle1"></div>
			<div class="gradient-border" id="circle2"></div>
		</div>
		
		<div id="aBox">
			<span id="aText"></span>
		</div>
		
		<div id="qBox">
			<input type="text" id="question" placeholder="어떤 것을 도와드릴까요?" onkeydown="onEnter();">
		</div>
	</div>
	
	<div id="infoArea">
		<div class="infoBox">
			<div class="infoTitle">사전</div>
			<div class="infoContent" id="dictContent">d</div>
		</div>
		
		<div class="infoBox" style="float:right; height: 400px; margin-right:10%;">
			<div class="infoTitle">뉴스</div>
			<div class="infoContent" id="newsContent">s</div>
		</div>
		
		<div class="infoBox">
			<div class="infoTitle">위키</div>
			<div class="infoContent" id="wikiContent">a</div>
		</div>
	</div>


</div>



</body>
<script type="text/javascript">
	
	function send() {
		var msg = $("#question").val();
		
		$(".gradient-border").css("background","none");

		setTimeout(function() { 
			$(".gradient-border").css("background","#1D1F20");
		}, 1000);
		
		getMsg(msg);
		
	}

	function getMsg(msg) {
		$.ajax({
			url : "./send",
			type : "POST",
			data : 'question=' + msg,
			asyn : true,
			success : function(map) {
				alert(map.answer);
				alert(map.data);
				if (map.answer!="undefined") {
					var text = map.answer;
					say(text);
				}
				if(map.data!="undefined"){
					var data = map.data;
					if (data=="blank") {
						say("이해하지 못했어요.");
					}else{
						var arText = data.split("양지수");
						show(arText);
					}
					
				}
				
			}
		});
	}
	
	function say(text) {
		$("#aText").hide();
		$("#aText").text(text);
		$("#aText").fadeIn(600);
	}
	
	function show(text) {
		$("#infoArea").hide();
		$("#dictContent").text(text[0]);
		$("#wikiContent").text(text[1]);
		$("#newsContent").html(text[2]+"<br/>"+text[3]);
		$("#infoArea").fadeIn(600);
	}
	
	function onEnter() {
		if (window.event.keyCode == 13) {
			send();
		}
	}
</script>
</html>