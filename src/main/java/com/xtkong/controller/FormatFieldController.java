package com.xtkong.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xtkong.model.FormatField;
import com.xtkong.service.FormatFieldService;

@Controller
@RequestMapping(value = "/formatField")
public class FormatFieldController {
	@Autowired
	FormatFieldService formatFieldService;

	/**
	 * 新增一条格式字段
	 * 
	 * @param formatField
	 *            待增格式字段
	 * @return 执行情况，格式类型id
	 */
	@RequestMapping("/insertFormatField")
	@ResponseBody
	public Map<String, Object> insertFormatField(FormatField formatField) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (1 == formatFieldService.insertFormatField(formatField)) {
			map.put("result", true);
			map.put("ft_id", formatField.getFt_id());
		} else {
			map.put("result", false);
			map.put("message", "新增失败");
		}
		return map;
	}

	/**
	 * 更新一条格式字段
	 * 
	 * @param formatField
	 *            待更新格式字段
	 * @return 执行情况，格式类型id
	 */
	@RequestMapping("/updateFormatField")
	@ResponseBody
	public Map<String, Object> updateFormatField(FormatField formatField) {
		Integer ft_id = formatFieldService.getFormatField_ft_id(formatField.getFf_id());
		Map<String, Object> map = new HashMap<String, Object>();
		if (1 == formatFieldService.updateFormatField(formatField)) {
			map.put("result", true);
			map.put("ft_id", ft_id);
		} else {
			map.put("result", false);
			map.put("message", "更新失败");
		}
		return map;
	}

	/**
	 * 删除一条格式字段
	 * 
	 * @param ff_id
	 *            待删除格式字段id
	 * @return 执行情况，格式类型id
	 */
	@RequestMapping("/deleteFormatField")
	@ResponseBody
	public Map<String, Object> deleteFormatField(Integer ff_id) {
		Integer ft_id = formatFieldService.getFormatField_ft_id(ff_id);
		Map<String, Object> map = new HashMap<String, Object>();
		if (1 == formatFieldService.deleteFormatField(ff_id)) {
			map.put("result", true);
			map.put("ft_id", ft_id);
		} else {
			map.put("result", false);
			map.put("message", "删除失败");
		}
		return map;
	}

//	public String getFormatFields(HttpSession httpSession, Integer ft_id) {
//		List<FormatField> formatFields = formatFieldService.getFormatFields(ft_id);
//		httpSession.setAttribute("formatFields", formatFields);
//		return "redirect:/pages/project_data.html";
//	}
}
