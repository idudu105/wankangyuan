package com.xtkong.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xtkong.dao.SourceDao;
import com.xtkong.model.FormatType;
import com.xtkong.service.FormatFieldService;
import com.xtkong.service.FormatTypeService;

@Controller
@RequestMapping(value = "/formatType")
public class FormatTypeController {
	@Autowired
	SourceDao sourceDao;
	@Autowired
	FormatTypeService formatTypeService;
	@Autowired
	FormatFieldService formatFieldService;

	/**
	 * 	提供：格式类型id
	 * 返回：执行情况，格式类型基础信息、该类型所有格式字段
	 * @param ft_id
	 * @return 执行情况，格式类型基础信息、该类型所有格式字段
	 */
	@RequestMapping(value = "/getFormatFields")
	@ResponseBody
	public Map<String, Object> getFormatFields(Integer ft_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		FormatType formatType = formatTypeService.getFormatType(ft_id);
		if (formatType != null) {
			formatType.setFormatFields(formatFieldService.getFormatFields(ft_id));
			map.put("result", true);
			map.put("formatType", formatType);
		} else {
			map.put("result", false);
			map.put("message", "查询失败");
		}
		return map;
	}
/**
 * 新增一条格式类型
 * @param formatType  待增格式类型
 * @return 执行情况，采集源id
 */ 
	@RequestMapping("/insertFormatType")
	@ResponseBody
	public Map<String, Object> insertFormatType(FormatType formatType) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 设置创建时间
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		formatType.setCreate_datetime(simpleDateFormat.format(new Date()));
		formatType.setCreate_uid(1);

		if (1 == formatTypeService.insertFormatType(formatType)) {
			map.put("result", true);
			map.put("cs_id", formatType.getCs_id());
		} else {
			map.put("result", false);
			map.put("message", "新增失败");
		}
		return map;
	}
	
	/**
	 * 更新一条格式类型
	 * @param formatType 待更新格式类型
	 * @return 执行情况，采集源id
	 */
	@RequestMapping("/updateFormatType")
	@ResponseBody
	public Map<String, Object> updateFormatType(FormatType formatType) {
		Map<String, Object> map = new HashMap<String, Object>();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		formatType.setUpdate_datetime(simpleDateFormat.format(new Date()));
		formatType.setUpdate_uid(1);

		if (1 == formatTypeService.updateFormatType(formatType)) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		
		return map;
	}
	/**
	 * 删除一条格式类型
	 * 
	 * @param ff_id
	 *            待删除格式类型id
	 * @return 执行情况，采集源id
	 */
	@RequestMapping("/deleteFormatType")
	@ResponseBody
	public Map<String, Object> deleteFormatType(Integer ft_id) {
		Integer cs_id = formatTypeService.getFormatType_cs_id(ft_id);
		Map<String, Object> map = new HashMap<String, Object>();
		if (1 == formatTypeService.deleteFormatType(ft_id)) {
			map.put("result", true);
			map.put("cs_id", cs_id);
		} else {
			map.put("result", false);
			map.put("message", "删除失败");
		}
		return map;
	}

	/**
//	 * 选取格式类型列表
//	 * 
//	 * @param httpSession
//	 * @param higher_ft_id
//	 *            上层格式类型
//	 * @return 格式类型列表
//	 */
//	@RequestMapping("/selectFormatType")
//	public String selectFormatType(HttpSession httpSession, String datainname, Integer cs_id) {
//		httpSession.setAttribute("datainname", datainname);
//		List<FormatType> formatTypes = formatTypeService.getFormatTypes(cs_id);
//		for (FormatType formatType : formatTypes) {
//			formatType.setFormatTypeFloders(formatTypeService.getFormatTypes(cs_id));
//		}
//		httpSession.setAttribute("formatTypes", formatTypes);
//		return "redirect:/pages/project_datain.jsp";
//	}

	
}
