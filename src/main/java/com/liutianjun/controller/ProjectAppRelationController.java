package com.liutianjun.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	@Autowired
	private ProjectAppRelationService projectAppRelationService;
	
	@RequestMapping(value="/addToProject",method=RequestMethod.POST)
	public String addToProject(Integer projectId,Integer[] ids) {
		projectAppRelationService.insert(projectId, ids);
		
		return "redirect:/project/selectMyProject";
	}
	
	
}
