package com.dzjin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.omg.PortableInterceptor.INACTIVE;
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
		httpSession.setAttribute("project", project);
		
		/*
		 * 注意，此处还需要将项目的文件数量，应用数量，应用结果数量以及成员数量放到session中
		 * 
		 * 项目文件数量
		 * 
		 * 项目应用数量
		 * 
		 * 项目应用结果数量
		 * 
		 * 项目成员数量
		 * 
		 */
		project.setFileNum(100);
		project.setAppNum(100);
		project.setAppResultNum(100);
		project.setMemberNum(100);

		return "redirect:/jsp/project/project_detail.jsp";
		
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
	
	/**
	 * 查询公开的项目
	 * @param httpSession
	 * @param page
	 * @param strip
	 * @param searchWord 查询过滤条件
	 * @return
	 */
	@RequestMapping("/selectPublicProject")
	public String selectPublicProject(HttpSession httpSession ,  Integer page , Integer strip, String searchWord , Integer type){		
		if(page == null){
			page = 1;
		}
		if(strip == null){
			strip = 12;
		}
		if(searchWord == null){
			searchWord = new String("");
			httpSession.setAttribute("projectSearchWord", null);
		}else{
			//更新关键字
			httpSession.setAttribute("projectSearchWord", searchWord);
		}
		Map<String, Object> map = new HashMap<String , Object>();
		map = projectService.selectPublicProject(page, strip , searchWord);
		httpSession.setAttribute("projects", map.get("list"));
		httpSession.setAttribute("total", map.get("total"));
		httpSession.setAttribute("page", page);
		httpSession.setAttribute("rows", strip);
		if(type == null || type == 1){
			return "redirect:/jsp/project/project_public.jsp";
		}else{
			return "redirect:/jsp/project/project_public2.jsp";
		}
		
	}
	
	/**
	 * 查询我创建的项目
	 * @param httpSession
	 * @param creator
	 * @param page
	 * @param strip
	 * @param searchWord 查询条件
	 * @return
	 */
	@RequestMapping("/selectCreatedProject")
	public String selectCreatedProject(HttpSession httpSession , Integer creator , 
			Integer page , Integer strip , String searchWord , Integer type){
		if(page == null){
			page = 1;
		}
		if(strip == null){
			strip = 12;
		}
		if(searchWord == null){
			searchWord = new String("");
			httpSession.setAttribute("projectSearchWord", null);
		}else{
			//更新关键字
			httpSession.setAttribute("projectSearchWord", searchWord);
		}
		Map<String, Object> map = new HashMap<String , Object>();
		map = projectService.selectCreatedProject(creator , page , strip ,searchWord);
		httpSession.setAttribute("projects", map.get("list"));
		httpSession.setAttribute("total", map.get("total"));
		httpSession.setAttribute("page", page);
		httpSession.setAttribute("rows", strip);
		if(type == null || type == 1){
			return "redirect:/jsp/project/project_create.jsp";
		}else{
			return "redirect:/jsp/project/project_create2.jsp";
		}
		
	}
	
	/**
	 * 查询我的项目
	 * @param httpSession
	 * @param user_id
	 * @param page
	 * @param strip
	 * @param searchWord 查询条件
	 * @return
	 */
	@RequestMapping("/selectMyProject")
	public String selectMyProject(HttpSession httpSession , Integer user_id , Integer page , Integer strip, String searchWord , Integer type){
		if(page == null){
			page = 1;
		}
		if(strip == null){
			strip = 12;
		}
		if(searchWord == null){
			searchWord = new String("");
			httpSession.setAttribute("projectSearchWord", null);
		}else{
			//更新关键字
			httpSession.setAttribute("projectSearchWord", searchWord);
		}
		Map<String, Object> map = new HashMap<String , Object>();
		map = projectService.selectMyProject(user_id, page, strip , searchWord);
		httpSession.setAttribute("projects", map.get("list"));
		httpSession.setAttribute("total", map.get("total"));
		httpSession.setAttribute("page", page);
		httpSession.setAttribute("rows", strip);
		if(type == null || type == 1){
			return "redirect:/jsp/project/project_mine.jsp";
		}else{
			return "redirect:/jsp/project/project_mine2.jsp";
		}
		
	}
	
	@RequestMapping("/addPublicProjectToMine")
	@ResponseBody
	public Map<String, Object> addPublicProjectToMine(HttpSession session , String ids){
		Map<String, Object> map = new HashMap<>();
		if(projectService.addPublicProjectToMine(ids, 1)){
			map.put("result", true);
		}else{
			map.put("result", false);
			map.put("message", "部分项目添加至我的项目失败！");
		}
		return map;
	}
	
	/**
	 * 
	 * @param ids
	 * @param type	0代表取消公开，1代表公开
	 * @return	
	 */
	@RequestMapping("/updateProjectOpenState")
	@ResponseBody
	public Map<String, Object> updateProjectOpenState(String ids , Integer is_open){
		Map<String, Object> map = new HashMap<>();
		if(projectService.updateProjectOpenState(ids, is_open)){
			map.put("result", true);
		}else{
			map.put("result", false);
			map.put("message", "部分项目更新公开状态失败！");
		}
		return map;
	}
	
	/**
	 * 批量删除项目
	 * @param ids
	 * @return
	 */
	@RequestMapping("/deleteProjects")
	@ResponseBody
	public Map<String, Object> deleteProjects(String ids){
		Map<String, Object> map = new HashMap<>();
		if(projectService.deleteProjects(ids)){
			map.put("result", true);
		}else{
			map.put("result", false);
			map.put("message", "部分项目删除失败！");
		}
		return map;
	}
	
	/**
	 * 退出项目
	 * @param ids
	 * @return
	 */
	@RequestMapping("/exit")
	@ResponseBody
	public Map<String, Object> exit(String ids){
		Map<String, Object> map = new HashMap<>();
		if(projectService.exits(ids, 1)){
			map.put("result", true);
		}else{
			map.put("result", false);
			map.put("message", "部分项目退出失败！");
		}
		return map;
	}	
	
}
