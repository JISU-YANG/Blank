var clientIp = "";

$(function() {
	$.getJSON("https://api.ipify.org?format=jsonp&callback=?",
			function(json) {
		clientIp = json.ip;
		$(".chatBadgeImg:first").children("img").attr("alt",clientIp);
	}
	);


	$("#inputText").focus(function() {
		$("#btnBox>button").css("opacity","1");
	});
	$("#inputText").blur(function() {
		$("#btnBox>button").css("opacity","0.5");
	});

	$(".chatBadgeImg").hover(function() {
		tipShow(this,"down");
	},function(){
		tipHide();
	});

	$("#tipArea>div").hover(function() {
		tipShow(this,"up");
	},function(){
		tipHide();
	});

	$("#chatSetting").hover(function() {
		tipShow(this,"down");
	},function(){
		tipHide();
	});

});

function lightOn(who) {
	var target = "";
	switch (who) {
	case 2: target = $('.chatBadgeImg:eq(2)>div'); break;
	case 3: target = $('.chatBadgeImg:eq(1)>div'); break;
	case 5: target = $('.chatBadgeImg:eq(3)>div'); break;
	case 6: target = $('.chatBadgeImg:eq(5)>div'); break;
	case 8: target = $('.chatBadgeImg:eq(4)>div'); break;
	}
	if (target.css("display")=="none") {
		target.show(100);
	}
}

function lightOff() {
	$('.chatBadgeImg>div').hide();
	$('.chatBadgeImg:eq(0)>div').show();
}
function onRefresh() {
	$("#container").html("");
}

function tipHide() {
	$("#toolTip").hide();
	$(".icon").css("opacity","0.5");
}

function tipShow(className,distance) {
	var element = $(className);
	var image = $(className).children("img");
	var toolTip = $("#toolTip");

	var divX = element.offset().left;
	var divY = element.offset().top;

	toolTip.text(image.attr("alt"));

	switch (distance) {
	case "up": divY = divY - element.height() - 10; break;
	case "down": divX = divX - (toolTip.width() / 2); divY = divY + element.height() + 10; break;
	}

	image.css("opacity","1");
	toolTip.css("top",divY);
	toolTip.css("left",divX);

	toolTip.fadeIn(300);
}

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
	case 5: var name = "신문기자"; var imageLink = "./resources/image/profile/profile5.png"; break;
	case 6: var name = "수다쟁이"; var imageLink = "./resources/image/profile/profile6.png"; break;
	case 8: var name = "잡학다식"; var imageLink = "./resources/image/profile/profile8.png"; break;
	}


	var code = "<div class='leftChat'><div class='leftProfileArea'><div class='leftProfileBox'><img src='"+imageLink+"'></div></div><div class='leftChatArea'><div class='leftInfoBox'><div class='leftInfoName'>"+name+"</div><div class='leftInfoTime'>"+date+"</div></div><div class='leftInfoText'><span>"+text+"</span></div></div></div>";
	$("#container").append(code);
	$("#container").scrollTop($("#container")[0].scrollHeight);
}

function send() {
	var msg = $("#inputText").val();

	if (msg != "") {
		sendForm(msg);
		getMsg(msg);

		$("#inputText").val("");
	}else{
		cmmtForm(6,"아무것도 입력 안했는데 ㅋㅋㅋ 바보잖아");
	}

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
				lightOff();
				lightOn(3);
				cmmtForm(3,text);

			}

			if (map.answer != undefined) {
				var text = map.answer;
				lightOff();
				lightOn(6);
				cmmtForm(6,text);
			}

			if(map.data != undefined){
				var data = map.data;
				var arText = data.split("양지수");

				lightOff();
				lightOn(2);
				lightOn(8);
				lightOn(5);

				cmmtForm(2,arText[0]);
				cmmtForm(8,arText[1]);
				var news = "";
				for (var i = 2; i < arText.length-1; i++) {
					news = news + (i-1) + ". " + arText[i]+"<br/>";
				}
				cmmtForm(5,news);

			}

		}
	});
}

function onEnter() {
	if (window.event.keyCode == 13) {
		send();
	}
}