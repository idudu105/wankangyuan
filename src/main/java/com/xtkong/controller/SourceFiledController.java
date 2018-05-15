package com.xtkong.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xtkong.model.SourceFiled;
import com.xtkong.service.SourceFiledService;

@Controller
@RequestMapping(value = "/sourceFiled")
public class SourceFiledController {
	@Autowired
	SourceFiledService sourceFiledService;

	@RequestMapping("/insertSourceFiled")
	public String insertSourceFiled(SourceFiled sourceFiled) {
		// 设置创建时间
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sourceFiled.setCreate_datetime(simpleDateFormat.format(new Date()));
//		sourceFiled.setCs_id(2);
		sourceFiled.setCreate_uid(1);
		return "redirect:/admin/formatdata?cs_id="+sourceFiled.getCs_id();
	}

	@RequestMapping("/updateSourceFiled")
	@ResponseBody
	public Map<String, Object> updateSourceFiled(HttpSession httpSession, String csf_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		SourceFiled sourceFiled = (SourceFiled) httpSession.getAttribute("sourceFiled");
		if (1 == sourceFiledService.updateSourceFiled(sourceFiled)) {
			map.put("result", true);
		} else {
			map.put("result", false);
			map.put("message", "更新失败");
		}
		return map;
	}
//
//	/**
//	 * * 选取采集源字段列表
//	 * @param httpSession
//	 * @param cs_id  采集源
//	 * @return 采集源字段列表
//	 */
//	@RequestMapping("/selectSourceFiled")
//	public String selectSourceFiled(HttpSession httpSession, Integer cs_id) {
//
//		List<SourceFiled> sourceFileds = sourceFiledService.selectSourceFiled(cs_id);
//		httpSession.setAttribute("sourceFileds", sourceFileds);
//		return "redirect:/pages/project_data.jsp";
//
//	}
//
//	@RequestMapping("/deleteProjectFloder")
//	public int deleteProjectFloder(Integer cs_id) {
//		return sourceFiledService.deleteProjectFloder(cs_id);
//	}
}
