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
			source.setFormatTypes(formatTypeService.getFormatTypes(cs_id));
			map.put("result", true);
			map.put("source", source);
		} else {
			map.put("result", false);
			map.put("message", "查询失败");
		}
		return map;
	}

	@RequestMapping(value = "/insertSource")
	public String insertSource(Source source) {
		sourceService.insertSource(source);
		return "redirect:/admin/formatdata";
	}
	/*
	 * @RequestMapping("/insertSource")
	 * 
	 * @ResponseBody public Map<String, Object> insertSource(Source source) {
	 * Map<String, Object> map = new HashMap<String, Object>(); if (1 ==
	 * sourceService.insertSource(source)) { map.put("result", true);
	 * map.put("message", "新增成功"); } else { map.put("result", false);
	 * map.put("message", "新增失败"); } return map; }
	 */

	@RequestMapping("/updateSource")
	@ResponseBody
	public Map<String, Object> updateSource(Source source) {
		Map<String, Object> map = new HashMap<String, Object>();

		if (1 == sourceService.updateSource(source)) {
			map.put("result", true);
			map.put("message", "更新成功");
		} else {
			map.put("result", false);
			map.put("message", "更新失败");
		}
		return map;
	}

	@RequestMapping("/deleteSource")
	@ResponseBody
	public Map<String, Object> deleteSource(Integer cs_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (1 == sourceService.deleteSource(cs_id)) {
				map.put("result", true);
				map.put("message", "删除成功");
			} else {
				map.put("result", false);
				map.put("message", "删除失败");
			}
		} catch (Exception e) {
			map.put("result", false);
			map.put("message", "请先删除该采集源所有字段");
		}
		return map;
	}

}
