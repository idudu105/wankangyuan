package com.liutianjun.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liutianjun.service.ProjectAppRelationService;

/**
 * 项目应用关系
 * @Title: ProjectAppRelationController.java  
 * @Package com.liutianjun.controller  
 * @Description: TODO
 * @author LiuTianJun  
 * @date 2018年5月17日  
 * @version V1.0
 */
@Controller
@RequestMapping("/ProjectAppRelation")
public class ProjectAppRelationController {

	protected Map<String, Object> resultMap = new HashMap<String, Object>();
	@Autowired
	private ProjectAppRelationService projectAppRelationService;
	
	/**
	 * 添加应用到项目
	 * @Title: addToProject 
	 * @param projectId
	 * @param ids
	 * @return 
	 * String
	 */
	@RequestMapping(value="/addToProject",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> addToProject(Integer projectId,Integer[] ids) {
		resultMap.put("status", 400);
		resultMap.put("message", "添加失败!");
		if(0 < projectAppRelationService.insert(projectId, ids)) {
			resultMap.put("status", 200);
			resultMap.put("message", "添加成功!");
		}
		return resultMap;
	}
	
	
}
