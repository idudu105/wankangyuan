package com.dzjin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dzjin.model.Project;
import com.dzjin.service.ProjectService;

@Controller
@RequestMapping(value = "/project")
public class ProjectController {
	
	@Autowired
	ProjectService projectService;
	
	@RequestMapping("/insertProject")
	@ResponseBody
	public Map<String, Object> insertProject(Project project){
		Map<String , Object> map = new HashMap<String , Object>();
		int num = projectService.insertProject(project);
		if(num == 1){
			map.put("result", true);
		}else{
			map.put("result", false);
		}	
		return map;
	}
	
	@RequestMapping("/selectPublicProject")
	@ResponseBody
	public Map<String, Object> selectPublicProject(HttpSession httpSession){		
		Map<String , Object> map = new HashMap<String , Object>();
		
		List<Project> projects = projectService.selectPublicProject();
		httpSession.setAttribute("projects", projects);	
		
		return map;
	}
	
	@RequestMapping("/selectCreatedProject")
	@ResponseBody
	public Map<String, Object> selectCreatedProject(HttpSession httpSession , Integer creator){
		Map<String , Object> map = new HashMap<String , Object>();
		
		List<Project> projects = projectService.selectCreatedProject(creator);
		httpSession.setAttribute("projects", projects);
		
		return map;
	}
	
	@RequestMapping("/selectPublicProject")
	@ResponseBody
	public Map<String, Object> selectPublicProject(HttpSession httpSession , Integer user_id){
		Map<String , Object> map = new HashMap<String , Object>();
		
		List<Project> projects = projectService.selectMyProject(user_id);
		httpSession.setAttribute("projects", projects);
		
		return map;
	}
	
}
