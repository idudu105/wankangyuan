package com.dzjin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dzjin.model.ProjectDataRelation;
import com.dzjin.service.ProjectDataService;

/** 
* @Author dzjin
* @Time 2018年6月4日 上午9:02:04 
* @Version 1.0
* <p>Description:</p>
*/
@Controller
@RequestMapping("/projectData")
public class ProjectDataController {
	
	@Autowired
	ProjectDataService projectDataService;
	
	@RequestMapping("/insert")
	@ResponseBody
	public Map<String, Object> insert(HttpSession session , Integer p_id , String sourceDataIds){

		Map<String, Object> map = new HashMap<>();
		
		String[] source_data_id = sourceDataIds.split(",");

		for(int i = 0 ; i<source_data_id.length ; i++){
			projectDataService.insert(new ProjectDataRelation(p_id, source_data_id[i]));
		}
		/*
		if(num == source_data_id.length){
			map.put("result", true);
			map.put("message", "关系绑定成功！");
		}else{
			map.put("result", false);
			map.put("message", "共绑定"+num+"条关系，剩余"+(source_data_id.length-num)+"条关系绑定失败！");
		}*/
		map.put("result", true);
		map.put("message", "关系绑定成功！");
		
		return map;
	}

}
