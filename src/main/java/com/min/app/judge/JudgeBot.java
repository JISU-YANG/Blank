package com.min.app.judge;

import java.util.Random;

public class JudgeBot {
	public String getHello() {
		String [] arHello= {
				"저희는 BLANK 팀 입니다. 있는데 없습니다!?",
				"BLANK는 공백이라는 의미입니다.",
				"맞춰보시겠어요?",
				"블랭크는 블리츠 크랭크가 아니라구요.",
				"그렇게 물어보신다면 대답해주는게 인지상정이지만...",
				"관심이 너무 많으시네요.",
				"아시면서 참.",
				"지수씨한테 물어보면 알려줄지도?"
				};
		Random rd = new Random();
		return arHello[rd.nextInt(arHello.length)];
	}
	
	public String getThink(String query) {
		String isWht = "";
		
		String [] arItr = {"너는","너를","넌","너","blank","블랭크"};
		String [] arCmd = {"알아","알려","누구","뭐","무엇","어디","언제","어느"};
		
		// 자기를 묻는 질문인지 확인
		for (int i = 0; i < arItr.length; i++) {
			if(query.indexOf(arItr[i])!=-1) {
				isWht = "소개";
				return isWht;
			}
		}
		
		// 정보를 찾는 질문인지 확인
		for (int i = 0; i < arCmd.length; i++) {
			if(query.indexOf(arCmd[i])!=-1) {
				isWht = "정보";
				return isWht;
			}
		}
		
		if (isWht=="") {
			isWht = "대화";
		}
		return isWht;
	}
}
