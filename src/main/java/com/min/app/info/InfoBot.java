package com.min.app.info;

import java.io.IOException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.HttpStatusException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;

public class InfoBot {
	private JSONParser parser = new JSONParser();
	
	public String getInfo(String keyword) throws IOException {
		String result = "";
		String [] arFunc = {"은","는","이","가"," "};
		
		System.out.println(keyword);
		for (int i = 0; i < arFunc.length; i++) {
			if (keyword.indexOf(arFunc[i])!=-1) {
				System.out.println(keyword.indexOf(arFunc[i]));
				keyword = keyword.substring(0,keyword.indexOf(arFunc[i]));
				System.out.println(keyword);
				break;
			}
		}
		
		if (keyword=="") {
			return "blank";
		}
		
		result = searchExplain(keyword)+ "양지수" + searchWiki(keyword) + "양지수";
		
		String [] arNews = searchNews(keyword);
		
		for (String news : arNews) {
			result += news + "양지수";
		}
		return result;
	}
	
	private String[] searchNews(String keyword) throws IOException {
		String [] arTitle = new String[10];
		String temp = "";
		
		String requestURL = "https://openapi.naver.com/v1/search/news.json?query="+keyword+"&display=10&start=1&sort=sim";
		final String clientId = "clientId";
		final String clientSecret = "clientSecret";
		
		try {
			OkHttpClient client = new OkHttpClient();
			Request request = new Request.Builder()
					.addHeader("X-Naver-Client-Id", clientId)
					.addHeader("X-Naver-Client-Secret", clientSecret)
					.url(requestURL)
					.build(); //GET Request 
                        
            //동기 처리시 execute함수 사용 
			Response response = client.newCall(request).execute(); 
			
			// JSON 객체로 변환
			JSONObject jsonBox = (JSONObject) parser.parse(response.body().string());
			JSONArray jsonAr = (JSONArray) jsonBox.get("items");
			
			// String 배열에 담기
			for (int i = 0; i < arTitle.length; i++) {
				JSONObject jsonItem = (JSONObject) jsonAr.get(i);
				temp = (String) jsonItem.get("title");
				temp = temp.replaceAll("<b>", "");
				temp = temp.replaceAll("</b>", "");
				temp = temp.replaceAll("&quot;", "");
				arTitle[i] = temp;
			}
			
		} catch (Exception e){
			System.err.println(e.toString());
		}
		
		return arTitle;
	}
	
	
	private String searchWiki(String keyword) throws IOException {
		String url = "http://ko.wikipedia.org/wiki/"+keyword;
		String result = "";
		try {
			Document doc = Jsoup.connect(url).get();
			Elements index = doc.select(".mw-parser-output>p");
			result = index.text();
			result = result.substring(0, result.indexOf("."));
			
			int cnt = 1;
			while(result.indexOf("[")!=-1) {
				result = result.replaceAll("\\["+cnt+"\\]", "");
				cnt++;
			}
			
		} catch (HttpStatusException e) {
			result = "일치하는 정보가 없습니다.";
		}
		
		return result;
	}
	
	private String searchExplain(String keyword) throws IOException {
		String url = "https://dict.naver.com/search.nhn?dicQuery="+keyword+"&query="+keyword+"&target=dic&ie=utf8&query_utf=&isOnlyViewEE=";
		String result = "";
		String temp = "";
		try {
			Document doc = Jsoup.connect(url).get();
			Elements index = doc.select("li>p");
			result = index.text();
			temp = result;
			
			// 단어 포함하는지 체크
			boolean keyChk = result.indexOf(keyword)!=-1?true:false;
			
			if (keyChk) {
				String[] tempA = temp.split(keyword);
				tempA[1] = tempA[1].substring(0,tempA[1].lastIndexOf("."));
				result = keyword + tempA[1];
				
				result = result.replaceAll("play", "");
				result = result.replaceAll("중요", "");
				result = result.replaceAll("  ", " ");
				result = result.replaceAll("  ", " ");
			}else {
				result = "일치하는 정보가 없습니다.";
			}
			
		} catch (HttpStatusException e) {
			result = "일치하는 정보가 없습니다.";
		}
		return result;
	}
}
