package com.xtkong.controller;

import java.util.List;

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
	 * 说明：首次进入格式数据管理页面，默认显示第一个数据源所有内容； 返回：所有采集源基础信息，第一个采集源字段、采集源所有格式类型
	 * 
	 * @param httpSession
	 * @return 采集源基础信息、采集源字段、采集源所有格式类型
	 */
	@RequestMapping(value = "/formatdata")
	public String formatDataFirstIn(HttpSession httpSession) {
		List<Source>sources=sourceService.getSourcesForAdmin();
		if (sources != null) {
			sources.get(0).setSourceFields(sourceFieldService.getSourceFields(sources.get(0).getCs_id()));
			sources.get(0).setFormatTypes(formatTypeService.getFormatTypes(sources.get(0).getCs_id()));
		}
		httpSession.setAttribute("sources", sources);

		return "redirect:/admin/datamanage.jsp";

	}
	// @RequestMapping(value ="/insertSource")
	// public String insertSource(Source source){
	// sourceService.insertSource(source);
	// return "redirect:/admin/formatdata";
	// }

}
