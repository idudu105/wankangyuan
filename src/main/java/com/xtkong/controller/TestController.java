package com.xtkong.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xtkong.dao.TestDao;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@Autowired
	TestDao testDao;
	
	public String test(){
		
		String result  = testDao.selectString("2");
		
		
		return "lk";
		
	}

}
