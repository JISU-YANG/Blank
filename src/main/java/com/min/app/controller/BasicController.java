package com.min.app.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.min.app.chat.ChatBot;
import com.min.app.info.InfoBot;
import com.min.app.judge.JudgeBot;

@Controller
public class BasicController {
	private ChatBot chat = new ChatBot();
	private InfoBot info = new InfoBot();
	private JudgeBot judge = new JudgeBot();
	
	private static final Logger logger = LoggerFactory.getLogger(BasicController.class);

	@RequestMapping(value="/", method=RequestMethod.GET)
	public String init() {
		return "index";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/send", method=RequestMethod.POST)
	public Map<String, String> send(String question) throws IOException {
		Map<String, String> map = new HashMap<String, String>();
		
		switch (judge.getThink(question)) {
			case "소개": map.put("hello", judge.getHello()); break;
			case "정보": map.put("data", info.getInfo(question)); break;
			case "대화": map.put("answer", chat.send(question)); break;
		}
		
		
		
		return map;
	}
}