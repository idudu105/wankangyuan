package com.xtkong.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.xtkong.dao.FormatTypeViewDao;
import com.xtkong.dao.SourceFiledViewDao;
import com.xtkong.dao.TestDao;
import com.xtkong.model.FormatTypeView;
import com.xtkong.model.Source;
import com.xtkong.model.SourceFiledView;
import com.xtkong.service.SourceService;

@Controller
@RequestMapping(value ="/admin")
public class TestDataManageController {

	@Autowired
	TestDao testDao;
	@Autowired
	SourceService sourceService;
	@Autowired
	SourceFiledViewDao sourceFiledViewDao;
	@Autowired
	FormatTypeViewDao formatTypeViewDao;

	@RequestMapping(value ="/formatdata")
	public String test(HttpSession httpSession) {
		List<Source> sources = sourceService.selectSource();
		httpSession.setAttribute("sources", sources);
		
//		List<SourceFiledView> sourceFiledViews = sourceFiledViewDao.selectSourceFiled(sources.get(0).getCs_id());
//		httpSession.setAttribute("sourceFiledViews", sourceFiledViews);
		List<List<SourceFiledView>> sourceFiledViewLists = new ArrayList<>();
		for (Source source : sources) {
			sourceFiledViewLists.add(sourceFiledViewDao.selectSourceFiled(source.getCs_id()));
		}
		httpSession.setAttribute("sourceFiledViewLists", sourceFiledViewLists);
		
		List<FormatTypeView> formatTypeViews = formatTypeViewDao.selectFormatType(sources.get(0).getCs_id());
		httpSession.setAttribute("formatTypeViews", formatTypeViews);

		return "redirect:/admin/datamanage.jsp";

	}
//	@RequestMapping(value ="/insertSource")
//	public String insertSource(Source source){
//		sourceService.insertSource(source);
//		return "redirect:/admin/formatdata";
//	}
	
}
