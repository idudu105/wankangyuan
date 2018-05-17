package com.xtkong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xtkong.model.FormatField;
import com.xtkong.service.FormatFieldService;

@Controller
@RequestMapping(value = "/formatField")
public class FormatFieldController {
	@Autowired
	FormatFieldService formatFieldService;
	@RequestMapping("/insertFormatField")
	@ResponseBody
	public  Map<String, Object>  insertFormatField(FormatField formatField){
		formatFieldService.insertFormatField(formatField);
		Map<String, Object> map = new HashMap<String, Object>();
		if (1 == formatFieldService.insertFormatField(formatField)) {
			map.put("result", true);
			map.put("url", "/wankangyuan/admin/formatdata?ft_id=" + formatField.getFt_id());
		} else {
			map.put("result", false);
			map.put("message", "新增失败");
		}
		return map;
	}
	@RequestMapping("/updateFormatField")
	@ResponseBody
	public  Map<String, Object>  updateFormatField(FormatField formatField){
		formatFieldService.insertFormatField(formatField);
		Map<String, Object> map = new HashMap<String, Object>();
		if (1 == formatFieldService.updateFormatField(formatField)) {
			map.put("result", true);
			map.put("url", "/wankangyuan/admin/formatdata?ft_id=" + formatField.getFt_id());
		} else {
			map.put("result", false);
			map.put("message", "新增失败");
		}
		return map;
	}
	
	@RequestMapping("/deleteFormatField")
	@ResponseBody
	public String deleteFormatField(Integer ft_id) {
		FormatField formatField = formatFieldService.getFormatField(ft_id);
		formatFieldService.deleteFormatField(ft_id);
		return "redirect:/admin/formatdata?ft_id=" + formatField.getFt_id();
	}
	public String selectFormatField(HttpSession httpSession,Integer ft_id){
		List<FormatField> formatFields=formatFieldService.getFormatFields(ft_id);
		httpSession.setAttribute("formatFields", formatFields);
		return "redirect:/pages/project_data.html";
	}
}
