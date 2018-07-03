package com.dzjin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dzjin.model.Project;
import com.dzjin.model.ProjectAuthority;
import com.dzjin.model.ProjectCustomRole;
import com.dzjin.model.ProjectFile;
import com.dzjin.model.ProjectFloder;
import com.dzjin.model.ProjectRole;
import com.dzjin.model.ProjectUser;
import com.dzjin.service.ProjectCustomRoleService;
import com.dzjin.service.ProjectFileService;
import com.dzjin.service.ProjectFloderService;
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
	@Autowired
	ProjectCustomRoleService projectCustomRoleService;
	@Autowired
	ProjectFileService projectFileService;
	@Autowired
	ProjectFloderService projectFloderService;
	
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
			//创建项目内的默认创建者、项目成员以及访问者权限
			List<ProjectRole> projectRoles = projectRoleService.selectProjectRole();
			Iterator<ProjectRole> iterator = projectRoles.iterator();
			int id = 0;
			while(iterator.hasNext()){
				ProjectRole projectRole = (ProjectRole)iterator.next();
				List<ProjectAuthority> projectAuthorities = 
						projectRoleService.selectProjectAuthorityByRoleId(projectRole.getId());
				Iterator<ProjectAuthority> iterator2 = projectAuthorities.iterator();
				StringBuffer stringBuffer = new StringBuffer();
				while(iterator2.hasNext()){
					ProjectAuthority projectAuthority = (ProjectAuthority)iterator2.next();
					stringBuffer.append(projectAuthority.getAuthority_number()+",");
				}
				ProjectCustomRole projectCustomRole = new ProjectCustomRole();
				projectCustomRole.setRolename(projectRole.getRole_name());
				projectCustomRole.setP_id(project.getId());
				projectCustomRole.setAuthorities(stringBuffer.toString());
				projectCustomRole.setCreator_id(user.getId());
				projectCustomRole.setCreate_datetime(simpleDateFormat.format(new Date()));
				projectCustomRoleService.insertProjectCustomRole(projectCustomRole);
				id = projectCustomRole.getId();
			}
			//设置当前用户为新建项目的成员
			ProjectUser projectUser = new ProjectUser();
			projectUser.setProject_id(project.getId());
			projectUser.setUser_id(user.getId());
			projectUser.setLinkman_id(user.getId());
			ProjectCustomRole projectCustomRole = 
					projectCustomRoleService.getProjectCustomRoleByRolename("创建者", project.getId());
			if(projectCustomRole != null){
				//正常角色
				projectUser.setRole_id(projectCustomRole.getId());
			}else{
				//替代角色
				projectUser.setRole_id(id);
			}
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
	public String getProjectDetail(HttpServletRequest request , HttpSession httpSession , Integer id){
		
		Project project = null;
		if(null == id){
			project = (Project) httpSession.getAttribute("project");
			project = projectService.getProjectDetail(project.getId());
		}else{
			project = projectService.getProjectDetail(id);
		}
		//获取项目内文件列表，统计项目内文件数量
		List<ProjectFloder> projectFloders = 
				projectFloderService.selectProjectFloderByProjectId(project.getId());
		Iterator<ProjectFloder> iterator2 = projectFloders.iterator();
		int num = 0;
		while(iterator2.hasNext()){
			ProjectFloder projectFloder = 
					(ProjectFloder)iterator2.next();
			List<ProjectFile> projectFiles = 
					projectFileService.selectProjectFileByFloderId(projectFloder.getId());
			num+=projectFiles.size();
		}
		project.setFileNum(num);
		//获取项目内应用、应用结果、成员数量
		project.setAppNum(projectService.countProjectApp(project.getId()));
		project.setAppResultNum(projectService.countProjectAppTask(project.getId()));
		project.setMemberNum(projectService.countProjectUser(project.getId()));

		httpSession.setAttribute("project", project);
		
		/*
		 * 此处需要根据项目ID和当前成员的ID查询当前用户在当前项目内的角色，然后放到Session中，供页面上进行显示。
		 */
		Map<String, Object> authoritys = new HashMap<String , Object>();
		User user = (User)request.getAttribute("user");
		ProjectUser projectUser = projectUserService.getProjectUser(project.getId(), user.getId());
		List<ProjectAuthority> projectAuthorities = null;
		if(projectUser == null){
			//如果是访问者，需要查询当前项目自定义的访问者权限
			ProjectCustomRole projectCustomRole = 
					projectCustomRoleService.getProjectCustomRoleByRolename("访问者" , project.getId());
			if(projectCustomRole.getAuthorities() != null){
				String[] auths = projectCustomRole.getAuthorities().split(",");
				for(int i =0;i<auths.length;i++){
					authoritys.put(auths[i], true);
				}
			}
		}else{
			//如果是创建者，系统中创建者的权限是不能进行修改的，默认含有所有的权限，所以直接去查项目内的角色即可。
			if(project.getCreator().equals(String.valueOf(user.getId()))){
				projectAuthorities = projectRoleService.selectProjectAuthorityByRoleId(1);
				Iterator<ProjectAuthority> iterator = projectAuthorities.iterator();
				while(iterator.hasNext()){
					ProjectAuthority projectAuthority = (ProjectAuthority)iterator.next();
					authoritys.put(projectAuthority.getAuthority_number(), true);
				}
			}else{
				//如果是除创建者之外的角色，直接从项目自定义角色中取出权限列表即可。
				ProjectCustomRole projectCustomRole = projectCustomRoleService.getProjectCustomRole(projectUser.getRole_id());
				if(projectCustomRole.getAuthorities() != null){
					String[] auths = projectCustomRole.getAuthorities().split(",");
					for(int i =0;i<auths.length;i++){
						authoritys.put(auths[i], true);
					}
				}
			}
		}
		httpSession.setAttribute("authoritys", authoritys);
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
