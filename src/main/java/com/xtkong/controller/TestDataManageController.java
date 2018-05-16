package com.xtkong.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xtkong.dao.TestDao;
import com.xtkong.model.Source;
import com.xtkong.service.FormatTypeService;
import com.xtkong.service.SourceFieldService;
import com.xtkong.service.SourceService;

@Controller
@RequestMapping(value = "/admin")
public class TestDataManageController {

	@Autowired
	TestDao testDao;
	@Autowired
	SourceService sourceService;
	@Autowired
	SourceFieldService sourceFieldService;
	@Autowired
	FormatTypeService formatTypeService;

	/**
	 * 说明：首次进入格式数据管理页面，默认显示第一个数据源； 返回：采集源基础信息、采集源字段、采集源所有格式类型
	 * 
	 * @param httpSession
	 * @return 采集源基础信息、采集源字段、采集源所有格式类型
	 */
	@RequestMapping(value = "/formatdata")
	public String formatDataFirstIn(HttpSession httpSession) {
		int num = 1;
		Source source = sourceService.getSourceLimit(num);
		if (source != null) {
			source.setSourceFields(sourceFieldService.getSourceFields(source.getCs_id()));
			source.setFormatTypes(formatTypeService.selectFormatType(source.getCs_id()));
		}
		httpSession.setAttribute("source", source);

		return "redirect:/admin/datamanage.jsp";

	}
	// @RequestMapping(value ="/insertSource")
	// public String insertSource(Source source){
	// sourceService.insertSource(source);
	// return "redirect:/admin/formatdata";
	// }

}
