package com.dzjin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dzjin.model.Project;
import com.dzjin.model.ProjectUser;
import com.dzjin.service.ProjectUserService;
import com.dzjin.service.ProjectRoleService;
import com.liutianjun.pojo.Organization;
import com.liutianjun.pojo.User;
import com.liutianjun.service.OrganizationService;

/**
 * 
 * 项目名称：wankangyuan 
 * 类名称：ProjectMemberController 
 * 类描述： 项目成员controller
 * 创建人：dzjin 
 * 创建时间：2018年6月14日 下午1:07:00 
 * 修改人：dzjin 
 * 修改时间：2018年6月14日 下午1:07:00 
 * 修改备注： 
 * @version 
 *
 */
@Controller
@RequestMapping("/projectMember")
public class ProjectMemberController {
	
	@Autowired
	OrganizationService organizationService;
	@Autowired
	ProjectUserService projectUserService;
	@Autowired
	ProjectRoleService projectRoleService;
	
	@RequestMapping("/selectProjectMember")
	public String selectProjectMember(HttpSession httpSession , Integer page , Integer strip , String searchWord , String type){
		
		if(page == null){
			page = 1;
		}
		if(strip == null){
			strip = 12;
		}
		if(searchWord == null){
			searchWord = new String("");
			httpSession.setAttribute("searchWord", null);
		}else{
			httpSession.setAttribute("searchWord", searchWord);
		}
		
		//组织结构列表
		List<Organization> orgList = organizationService.findOrgList(-1);
		httpSession.setAttribute("orgList", orgList);
		//当前项目信息
		Project project = (Project)httpSession.getAttribute("project");
		
		Map<String, Object> map = projectUserService.selectProjectUsers(project.getId(), page, strip , searchWord);
		httpSession.setAttribute("projectMembers", map.get("list"));
		httpSession.setAttribute("total", map.get("total"));
		httpSession.setAttribute("page", page);
		httpSession.setAttribute("rows", strip);
		
		httpSession.setAttribute("projectRoles", projectRoleService.selectProjectRole());

		if(type == null || !type.equals("2")){
			return "/jsp/project/project_member.jsp";
		}else{
			return "/jsp/project/project_member2.jsp";
		}
		
		
	}
	
	/**
	 * 根据组ID获取组内成员
	 * @Title: getUserByOrg 
	 * @param organizationId
	 * @return 
	 * String
	 */
	@RequestMapping(value="/getUserByOrg",method=RequestMethod.GET, produces="text/html;charset=UTF-8")
	@ResponseBody
	public String getUserByOrg(HttpSession httpSession , Integer organizationId) {
		
		try {
			Project project = (Project)httpSession.getAttribute("project");
			List<User> orgUserList = projectUserService.selectOrganizationNotProjectUser(organizationId, project.getId());

			ObjectMapper objectMapper = new ObjectMapper();
			String jsonOrgUserList = objectMapper.writeValueAsString(orgUserList);
			
			return jsonOrgUserList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 增加项目成员
	 * @param session 
	 * @param projectMember
	 * @return
	 */
	@RequestMapping("/insertProjectMember")
	@ResponseBody
	public Map<String, Object> insertProjectMember(HttpSession session , ProjectUser projectUser){
		Map<String, Object> map = new HashMap<>();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		projectUser.setBind_date_time(simpleDateFormat.format(new Date()));
		projectUser.setRole_id(2);//设置项目成员角色
		if(projectUserService.insertProjectUser(projectUser) == 1){
			map.put("result", true);
			map.put("message", "增加项目成员成功！");
		}else{
			map.put("result", false);
			map.put("message", "增加项目成员失败！");
		}
		return map;
	}
	
	/**
	 * 批量添加项目成员
	 * @param request
	 * @param session
	 * @param ids
	 * @return
	 */
	@RequestMapping("/insertProjectMembers")
	@ResponseBody
	public Map<String, Object> insertProjectMembers(HttpServletRequest request , HttpSession session , String ids){
		User user = (User)request.getAttribute("user");
		Project project = (Project)session.getAttribute("project");
		String[]idString = ids.split(",");
		int num = 0;
		ProjectUser projectMember = null;
		for(int i = 0 ;i<idString.length;i++){
			projectMember = new ProjectUser();
			projectMember.setProject_id(project.getId());
			projectMember.setUser_id(Integer.valueOf(idString[i]));
			projectMember.setLinkman_id(user.getId());	
			projectMember.setBind_date_time(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			projectMember.setRole_id(2);//设置项目成员角色	
			if(projectUserService.insertProjectUser(projectMember) == 1){
				num++;
			}
		}
		Map<String, Object> map = new HashMap<>();
		map.put("result", true);
		map.put("message", num+"位成员添加成功，"+(idString.length-num)+"位成员添加失败！");
		return map;
	}
	
	/**
	 * 批量删除项目成员
	 * @param ids
	 * @return
	 */
	@RequestMapping("/deleteProjectMembers")
	@ResponseBody
	public Map<String, Object> deleteProjectMembers(String ids){
		String[]idString = ids.split(",");
		int num = 0;
		for(int i = 0 ;i<idString.length;i++){
			if(projectUserService.deleteProjectUser(Integer.valueOf(idString[i])) == 1){
				num++;
			}
		}
		Map<String, Object> map = new HashMap<>();
		map.put("result", true);
		map.put("message", num+"位成员移除成功，"+(idString.length-num)+"位成员移除失败！");
		return map;
		
	}
	
	/**
	 * 更新项目成员角色
	 * @param session
	 * @param id
	 * @param role_id
	 * @return
	 */
	@RequestMapping("/updateProjectUserRole")
	@ResponseBody
	public Map<String, Object> updateProjectUserRole(HttpSession session , 
			Integer id , Integer role_id){
		Map<String, Object> map = new HashMap<>();
		if(projectUserService.updateProjectUserRole(id, role_id) == 1){
			map.put("result", true);
			map.put("message", "角色更新成功！");
		}else{
			map.put("result", false);
			map.put("message", "角色更新失败！");
		}
		return map;
	}
	
}
