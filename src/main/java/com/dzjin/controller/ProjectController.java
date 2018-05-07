package com.dzjin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dzjin.model.Project;
import com.dzjin.service.ProjectService;

@Controller
@RequestMapping(value = "/project")
public class ProjectController {
	
	@Autowired
	ProjectService projectService;
	
	@RequestMapping("/insertProject")
	public String insertProject(Project project){
		//设置创建时间
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		project.setCreate_datetime(simpleDateFormat.format(new Date()));
		project.setCreator("1");
		int num = projectService.insertProject(project);

		return "redirect:/project/selectCreatedProject?creator=1";
	}
	
	@RequestMapping("/selectPublicProject")
	public String selectPublicProject(HttpSession httpSession){		
		
		List<Project> projects = projectService.selectPublicProject();
		httpSession.setAttribute("projects", projects);	
		
		return "/pages/project_public.jsp";
	}
	
	@RequestMapping("/selectCreatedProject")
	public String selectCreatedProject(HttpSession httpSession , Integer creator){
		
		List<Project> projects = projectService.selectCreatedProject(creator);
		httpSession.setAttribute("projects", projects);
		
		return "/pages/project_create.jsp";
	}
	
	@RequestMapping("/selectMyProject")
	public String selectMyProject(HttpSession httpSession , Integer user_id){
		
		List<Project> projects = projectService.selectMyProject(user_id);
		httpSession.setAttribute("projects", projects);
		
		return "/pages/project_mine.jsp";
	}
	
}
