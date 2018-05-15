package com.xtkong.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xtkong.dao.TestDao;
import com.xtkong.model.Source;
import com.xtkong.model.SourceFiled;
import com.xtkong.service.SourceFiledService;
import com.xtkong.service.SourceService;

@Controller
@RequestMapping("/formatData")
public class TestSelectFormatDataController {

	@Autowired
	TestDao testDao;
	@Autowired
	SourceService sourceService;
	@Autowired
	SourceFiledService sourceFiledService;

	@RequestMapping("/select")
	public String test(HttpSession httpSession) {
		List<Source> sources = sourceService.selectSource();
		httpSession.setAttribute("sources", sources);

		List<SourceFiled> sourceFileds = sourceFiledService.selectSourceFiled(sources.get(0).getCs_id());
		httpSession.setAttribute("sourceFileds", sourceFileds);

		List<List<String>> sourceDatas = new ArrayList<>();
		// =hBaseSourceDao.getSourceDatasByUid(Integer.toString(sources.get(0).getCs_id()),
		// "1", sourceFileds);
		List<String> list1 = new ArrayList<>();
		list1.add("张三");
		list1.add("25");
		list1.add("男");
		list1.add("无");
		list1.add("个人信息");
		list1.add("孙");
		list1.add("2018-4-20");
		sourceDatas.add(list1);
		List<String> list = new ArrayList<>();
		list.add("李");
		list.add("男");
		list.add("无");
		list.add("个人信息");
		list.add("孙");
		list.add("2018-4-22");
		sourceDatas.add(list);

		httpSession.setAttribute("sourceDatas", sourceDatas);

		return "redirect:/pages/project_data.jsp";

	}
	@RequestMapping("/datain")
	public String datain(HttpSession httpSession,String datainname) {
		httpSession.setAttribute("datainname", datainname);
		
		return "redirect:/pages/project_datain.jsp";

	}
}
