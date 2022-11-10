package com.min.app.chat;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.squareup.okhttp.MediaType;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.RequestBody;
import com.squareup.okhttp.Response;
import com.squareup.okhttp.ResponseBody;

public class ChatBot {
	private final String requestURL = "https://wsapi.simsimi.com/190410/talk";
	private final String key = "Secret";
	private JSONParser parser = new JSONParser();
	
	public String send(String msg) {
		String jsonMessage = "{\"utext\":\""+msg+"?\", \"lang\":\"ko\"}";
		String message = "";
		
		try{
			OkHttpClient client = new OkHttpClient();
			Request request = new Request.Builder()
					.addHeader("x-api-key", key)
					.addHeader("Content-Type", "application/json")
					.url(requestURL)
					.post(RequestBody.create(MediaType.parse("application/json"), jsonMessage)) //POST로 전달할 내용 설정 
					.build();

                        //동기 처리시 execute함수 사용
			Response response = client.newCall(request).execute();  

			//JSON 객체로 변환
			JSONObject jsonBox = (JSONObject) parser.parse(response.body().string());
			message = jsonBox.get("atext").toString();
			
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		
		return message.replaceAll("심심이", "블랭크");
	}
}
