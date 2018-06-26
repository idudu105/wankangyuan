package com.dzjin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dzjin.model.Project;
import com.dzjin.model.ProjectUser;
import com.dzjin.service.ProjectRoleService;
import com.dzjin.service.ProjectService;
import com.dzjin.service.ProjectUserService;
import com.liutianjun.pojo.User;

@Controller
@RequestMapping(value = "/project")
public class ProjectController {
	
	@Autowired
	ProjectService projectService;
	@Autowired
	ProjectRoleService projectRoleService;
	@Autowired
	ProjectUserService projectUserService;
	
	/**
	 * 新建项目
	 * @param project
	 * @return
	 */
	@RequestMapping("/insertProject")
	public String insertProject(Project project , HttpServletRequest request){
		//设置创建时间
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		project.setCreate_datetime(simpleDateFormat.format(new Date()));
		User user = (User)request.getAttribute("user");
		project.setCreator(String.valueOf(user.getId()));
		if(projectService.insertProject(project) == 1){
			//设置当前用户在新建项目内的创建者角色
			ProjectUser projectUser = new ProjectUser();
			projectUser.setProject_id(project.getId());
			projectUser.setUser_id(user.getId());
			projectUser.setLinkman_id(user.getId());
			projectUser.setRole_id(1);
			projectUser.setBind_date_time(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			projectUserService.insertProjectUser(projectUser);
		}
		return "/project/selectCreatedProject";
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

		project.setFileNum(projectService.countProjectFile(project.getId()));
		project.setAppNum(projectService.countProjectApp(project.getId()));
		project.setAppResultNum(projectService.countProjectAppTask(project.getId()));
		project.setMemberNum(projectService.countProjectUser(project.getId()));
		
		httpSession.setAttribute("project", project);
		
		/*
		 * 此处需要根据项目ID和当前成员的ID查询当前用户在当前项目内的角色，然后放到Session中，供页面上进行显示。
		 */

		return "/jsp/project/project_detail.jsp";
		
	}
	
	/**
	 * 刚更新项目简介
	 * @param httpSession
	 * @param introduction
	 * @return
	 */
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
	
	/**
	 * 编辑项目基本信息
	 * @param project
	 * @return
	 */
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
			return "/jsp/project/project_public.jsp";
		}else{
			return "/jsp/project/project_public2.jsp";
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
	public String selectCreatedProject(HttpSession httpSession , HttpServletRequest request ,
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
		User user = (User)request.getAttribute("user");
		map = projectService.selectCreatedProject(user.getId() , page , strip ,searchWord);
		httpSession.setAttribute("projects", map.get("list"));
		httpSession.setAttribute("total", map.get("total"));
		httpSession.setAttribute("page", page);
		httpSession.setAttribute("rows", strip);
		if(type == null || type == 1){
			return "/jsp/project/project_create.jsp";
		}else{
			return "/jsp/project/project_create2.jsp";
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
	public String selectMyProject(HttpSession httpSession , HttpServletRequest request , 
			Integer page , Integer strip, String searchWord , Integer type){
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
		User user = (User)request.getAttribute("user");
		Map<String, Object> map = new HashMap<String , Object>();
		map = projectService.selectMyProject(user.getId(), page, strip , searchWord);
		httpSession.setAttribute("projects", map.get("list"));
		httpSession.setAttribute("total", map.get("total"));
		httpSession.setAttribute("page", page);
		httpSession.setAttribute("rows", strip);
		if(type == null || type == 1){
			return "/jsp/project/project_mine.jsp";
		}else{
			return "/jsp/project/project_mine2.jsp";
		}
		
	}
	
	/**
	 * 将公共项目添加到我的项目
	 * @param session
	 * @param request
	 * @param ids
	 * @return
	 */
	@RequestMapping("/addPublicProjectToMine")
	@ResponseBody
	public Map<String, Object> addPublicProjectToMine(HttpSession session , HttpServletRequest request , 
			String ids){
		User user = (User)request.getAttribute("user");
		Map<String, Object> map = new HashMap<>();
		if(projectService.addPublicProjectToMine(ids, user.getId())){
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
	public Map<String, Object> exit(String ids , HttpServletRequest request){
		Map<String, Object> map = new HashMap<>();
		User user = (User)request.getAttribute("user");
		if(projectService.exits(ids, user.getId())){
			map.put("result", true);
		}else{
			map.put("result", false);
			map.put("message", "部分项目退出失败！");
		}
		return map;
	}	
	
}
