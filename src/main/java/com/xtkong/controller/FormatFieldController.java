package com.xtkong.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xtkong.model.FormatField;
import com.xtkong.service.FormatFieldService;

@Controller
@RequestMapping(value = "/source")
public class FormatFieldController {
	@Autowired
	FormatFieldService formatFieldService;
//	@RequestMapping("/insertFormatField")
//	public String insertFormatField(FormatField FormatField){
//		formatFieldService.insertFormatField(FormatField);
//		return "";
//	}
//	public String selectFormatField(HttpSession httpSession,Integer ft_id){
//		List<FormatField> formatFields=formatFieldService.selectFormatField(ft_id);
//		httpSession.setAttribute("formatFields", formatFields);
//		return "redirect:/pages/project_data.html";
//	}
}
