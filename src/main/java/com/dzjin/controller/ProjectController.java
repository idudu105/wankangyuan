package com.dzjin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
	
	/**
	 * 插入记录
	 * @param project
	 * @return
	 */
	@RequestMapping("/insertProject")
	public String insertProject(Project project){
		//设置创建时间
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		project.setCreate_datetime(simpleDateFormat.format(new Date()));
		project.setCreator("1");
		projectService.insertProject(project);

		return "redirect:/project/selectCreatedProject?creator=1";
	}
	
	/**
	 * 获取项目基本信息
	 * @param httpSession
	 * @param id
	 * @return
	 */
	@RequestMapping("/getProjectDetail")
	public String getProjectDetail(HttpSession httpSession , Integer id){
		
		Project project = null;
		if(null == id){
			project = (Project) httpSession.getAttribute("project");
			project = projectService.getProjectDetail(project.getId());
		}else{
			project = projectService.getProjectDetail(id);
		}
		
		
		/*
		 * 注意，此处还需要将项目的文件数量，应用数量，应用结果数量以及成员数量放到session中
		 * 
		 * 
		 * 
		 */
		project.setFileNum(100);
		project.setAppNum(100);
		project.setAppResultNum(100);
		project.setMemberNum(100);
		httpSession.setAttribute("project", project);

		return "redirect:/pages/project_detail.jsp";
		
	}
	
	@RequestMapping("/updatePorjectIntroduction")
	@ResponseBody
	public Map<String, Object> updatePorjectIntroduction(HttpSession httpSession , String introduction){
		Map<String, Object> map = new HashMap<String , Object>();
		Project project = (Project) httpSession.getAttribute("project");
		project.setIntroduction(introduction);
		if(1 == projectService.updateProjectIntroduction(project)){
			map.put("result", true);
		}else{
			map.put("result", false);
			map.put("message", "更新项目简介失败");
		}
		return map;
	}
	
	
	@RequestMapping("/editProject")
	@ResponseBody
	public Map<String, Object> editProject(Project project){
		Map<String, Object> map = new HashMap<String , Object>();
		if(1 == projectService.updateProject(project)){
			map.put("result", true);
		}else{
			map.put("result", false);
			map.put("message", "更新记录失败");
		}
		return map;
	}
	
	
	@RequestMapping("/selectPublicProject")
	public String selectPublicProject(HttpSession httpSession){		
		
		List<Project> projects = projectService.selectPublicProject();
		httpSession.setAttribute("projects", projects);	
		
		return "redirect:/pages/project_public.jsp";
	}
	
	@RequestMapping("/selectCreatedProject")
	public String selectCreatedProject(HttpSession httpSession , Integer creator){
		
		List<Project> projects = projectService.selectCreatedProject(creator);
		httpSession.setAttribute("projects", projects);
		
		return "redirect:/pages/project_create.jsp";
	}
	
	@RequestMapping("/selectMyProject")
	public String selectMyProject(HttpSession httpSession , Integer user_id){
		
		List<Project> projects = projectService.selectMyProject(user_id);
		httpSession.setAttribute("projects", projects);
		
		return "redirect:/pages/project_mine.jsp";
	}
	
}
