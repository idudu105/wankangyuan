package com.xtkong.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xtkong.model.Source;
import com.xtkong.service.FormatTypeService;
import com.xtkong.service.SourceFieldService;
import com.xtkong.service.SourceService;

@Controller
@RequestMapping(value = "/source")
public class SourceController {
	@Autowired
	SourceService sourceService;
	@Autowired
	SourceFieldService sourceFieldService;
	@Autowired
	FormatTypeService formatTypeService;

	@RequestMapping(value = "/insertSource")
	public String insertSource(Source source) {
		sourceService.insertSource(source);
		return "redirect:/admin/formatdata";
	}

	// @RequestMapping("/selectSource")
	// public String selectSource(HttpSession httpSession){
	// List<Source> sources = sourceService.selectSource();
	// httpSession.setAttribute("sources", sources);
	// return "redirect:/pages/project_data.jsp";
	//
	// }
	/**
	 * 提供：采集源id 返回：执行状况，采集源基础信息、采集源字段、采集源所有格式类型
	 * 
	 * @param cs_id
	 *            采集源id
	 * @return 执行状况，采集源基础信息、采集源字段、采集源所有格式类型
	 */
	@RequestMapping("/getSourceAll")
	@ResponseBody
	public Map<String, Object> getSourceAll(Integer cs_id) {
		Map<String, Object> map = new HashMap<String, Object>();

		Source source = sourceService.getSourceByCs_id(cs_id);
		if (source != null) {
			source.setSourceFields(sourceFieldService.getSourceFields(cs_id));
			source.setFormatTypes(formatTypeService.selectFormatType(cs_id));
			map.put("result", true);
			map.put("source", source);
		} else {
			map.put("result", false);
			map.put("message", "查询失败");
		}
		return map;
	}
}
