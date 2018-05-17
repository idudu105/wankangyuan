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
import com.xtkong.model.SourceField;
import com.xtkong.service.SourceFieldService;

@Controller
@RequestMapping(value = "/sourceField")
public class SourceFieldController {
	@Autowired
	SourceDao sourceDao;
	@Autowired
	SourceFieldService sourceFieldService;

	@RequestMapping("/insertSourceField")
	@ResponseBody
	public Map<String, Object> insertSourceField(SourceField sourceField) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 设置创建时间
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sourceField.setCreate_datetime(simpleDateFormat.format(new Date()));

		sourceField.setCreate_uid(1);

		if (1 == sourceFieldService.insertSourceField(sourceField)) {
			map.put("result", true);
			map.put("message", "新增成功");
		} else {
			map.put("result", false);
			map.put("message", "新增失败");
		}
		return map;
	}

	@RequestMapping("/updateSourceField")
	@ResponseBody
	public Map<String, Object> updateSourceField(SourceField sourceField) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 设置创建时间
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sourceField.setCreate_datetime(simpleDateFormat.format(new Date()));

		sourceField.setUpdate_uid(1);

		if (1 == sourceFieldService.updateSourceField(sourceField)) {
			map.put("result", true);
			map.put("message", "更新成功");
		} else {
			map.put("result", false);
			map.put("message", "更新失败");
		}
		return map;
	}

	@RequestMapping("/getSourceField")
	@ResponseBody
	public Map<String, Object> getSourceField(Integer csf_id) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("result", true);
		map.put("sourceField", sourceFieldService.getSourceField(csf_id));

		return map;
	}
	// /**
	// * * 选取采集源字段列表
	// *
	// * @param httpSession
	// * @param cs_id
	// * 采集源
	// * @return 采集源字段列表
	// */
	// @RequestMapping("/selectSourceField")
	// public String selectSourceField(HttpSession httpSession, Integer cs_id) {
	//
	// List<SourceField> sourceFields =
	// sourceFieldService.getSourceFields(cs_id);
	// httpSession.setAttribute("sourceFields", sourceFields);
	// return "redirect:/pages/project_data.jsp";
	//
	// }

	@RequestMapping("/deleteSourceField")
	@ResponseBody
	public Map<String, Object> deleteSourceField(String csf_ids) {
		Map<String, Object> map = new HashMap<String, Object>();
		String[]csf_idStrs= csf_ids.split(",");
		int i = 0;
		for (String csf_id : csf_idStrs) {
			if (1 == sourceFieldService.deleteSourceField(Integer.valueOf(csf_id))) {
				i++;
			}
		}
		if (i==csf_idStrs.length) {
			map.put("result", true);
			map.put("message", "成功删除"+i+"行");
		}else{
			map.put("result", false);
			map.put("message", "已删除："+i+"行，剩余"+(csf_idStrs.length-i)+"行未删除");
		}
		return map;
	}
}
