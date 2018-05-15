package com.xtkong.controller;

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
	
	@RequestMapping(value ="/insertSource")
	public String insertSource(Source source){
		sourceService.insertSource(source);
		return "redirect:/admin/formatdata";
	}
	
//	@RequestMapping("/selectSource")
//	public String selectSource(HttpSession httpSession){			
//		List<Source> sources = sourceService.selectSource();
//		httpSession.setAttribute("sources", sources);	
//		return "redirect:/pages/project_data.jsp";
//		
//	}

}
