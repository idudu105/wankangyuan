package com.xtkong.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xtkong.model.Source;
import com.xtkong.service.SourceService;

@Controller
@RequestMapping(value = "/source")
public class SourceController {
	@Autowired
	SourceService sourceService;
	
	@RequestMapping("/insertSource")
	public String insertSource(Source source){
		source.setCs_name("cs_name");
		sourceService.insertSource(source);

		return "redirect:/admin/datamanage.html";
	}
	
	@RequestMapping("/selectSource")
	public String selectSource(HttpSession httpSession){		
		
		List<Source> sources = sourceService.selectSource();
		httpSession.setAttribute("sources", sources);	
		return "redirect:/pages/project_data.html";
		
	}

}
