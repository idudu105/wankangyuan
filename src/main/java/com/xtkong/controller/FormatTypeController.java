package com.xtkong.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xtkong.model.FormatType;
import com.xtkong.service.FormatTypeService;
@Controller
@RequestMapping(value = "/formatType")
public class FormatTypeController {
	@Autowired
	FormatTypeService formatTypeService;
	@RequestMapping("/insertFormatType")
	public String insertFormatType(FormatType formatType){
		formatType.setCs_id(1);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		formatType.setCreate_datetime(simpleDateFormat.format(new Date()));
		
		formatTypeService.insertFormatType(formatType);
		
		return "redirect:/admin/datamanage.jsp";
	}
//	@RequestMapping("/updateFormatType")
//	public Map<String, Object>  updateFormatType(HttpSession httpSession, String ft_name) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		FormatType formatType = (FormatType) httpSession.getAttribute("formatType");
//		formatType.setFt_name(ft_name);
//		if (1 == formatTypeService.updateFormatType(formatType)) {
//			map.put("result", true);
//		} else {
//			map.put("result", false);
//			map.put("message", "更新失败");
//		}
//		return map;
//	}
	/**
	 * 选取格式类型列表
	 * @param httpSession
	 * @param higher_ft_id 上层格式类型
	 * @return 格式类型列表
	 */
	@RequestMapping("/selectFormatType")
	public String selectFormatType(HttpSession httpSession,String datainname,Integer cs_id) {
		httpSession.setAttribute("datainname", datainname);
		List<FormatType>formatTypes=formatTypeService.selectFormatType(cs_id);
		for (FormatType formatType : formatTypes) {
			formatType.setFormatTypeFloders(formatTypeService.selectFormatType(cs_id));
		}
		httpSession.setAttribute("formatTypes", formatTypes);
		return "redirect:/pages/project_datain.jsp";
	}
//	@RequestMapping("/deleteFormatType")
//	public int deleteFormatType(Integer ft_id){
//		return formatTypeService.deleteFormatType(ft_id);
//	}
}
