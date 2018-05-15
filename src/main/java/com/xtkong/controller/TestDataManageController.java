package com.xtkong.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xtkong.dao.FormatTypeDao;
import com.xtkong.dao.TestDao;
import com.xtkong.model.FormatType;
import com.xtkong.model.Source;
import com.xtkong.service.SourceFiledService;
import com.xtkong.service.SourceService;

@Controller
@RequestMapping(value ="/admin")
public class TestDataManageController {

	@Autowired
	TestDao testDao;
	@Autowired
	SourceService sourceService;
	@Autowired
	SourceFiledService sourceFiledService;
	@Autowired
	FormatTypeDao formatTypeDao;

	@RequestMapping(value ="/formatdata")
	public String test(HttpSession httpSession,String cs_id) {
		List<Source> sources = sourceService.selectSourceForAdmin();
		for (Source source : sources) {
			source.setSourceFileds(sourceFiledService.getSourceFileds(source.getCs_id()));
		}
		
		httpSession.setAttribute("sources", sources);
		
//		List<List<SourceFiled>> sourceFiledLists = new ArrayList<>();
//		for (Source source : sources) {
//			sourceFiledLists.add(sourceFiledDao.selectSourceFiled(source.getCs_id()));
//		}
//		httpSession.setAttribute("sourceFiledLists", sourceFiledLists);
		int cs_id0=0;
		try {
			cs_id0=Integer.getInteger(cs_id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		List<FormatType> formatTypes = formatTypeDao.selectFormatType(sources.get(cs_id0).getCs_id());
		httpSession.setAttribute("formatTypes", formatTypes);

		return "redirect:/admin/datamanage.jsp";

	}
//	@RequestMapping(value ="/insertSource")
//	public String insertSource(Source source){
//		sourceService.insertSource(source);
//		return "redirect:/admin/formatdata";
//	}
	
}
