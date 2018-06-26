package com.dzjin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dzjin.model.ProjectAuthority;
import com.dzjin.model.ProjectRole;
import com.dzjin.model.ProjectRoleAuthority;
import com.dzjin.service.ProjectRoleService;
import com.liutianjun.pojo.User;

/**
 * 
 * 项目名称：wankangyuan 
 * 类名称：ProjectRoleController 
 * 类描述： 项目内权限controller
 * 创建人：dzjin 
 * 创建时间：2018年6月19日 上午9:41:56 
 * 修改人：dzjin 
 * 修改时间：2018年6月19日 上午9:41:56 
 * 修改备注： 
 * @version 
 *
 */
@Controller
@RequestMapping("/projectRole")
public class ProjectRoleController {
	
	@Autowired
	ProjectRoleService projectRoleService;
	
	/**
	 * 查询项目角色
	 * @param httpSession
	 * @param page
	 * @param stirp
	 * @return
	 */
	@RequestMapping("/selectProjectRole")
	public String selectProjectRole(HttpSession httpSession  , Integer page , Integer stirp){
		if(page == null){
			page=1;
		}
		if(stirp == null){
			stirp=12;
		}
		Map<String, Object> map = projectRoleService.selectProjectRole(page , stirp);
		httpSession.setAttribute("projectRoles", map.get("list"));
		httpSession.setAttribute("total", map.get("total"));
		httpSession.setAttribute("page", page);
		httpSession.setAttribute("rows", stirp);
		List<ProjectAuthority> projectAuthorities = projectRoleService.selectProjectAuthority();
		httpSession.setAttribute("projectAuthorities", projectAuthorities);
		
		return "/admin/projectrolemanage.jsp";
	}
	
	/**
	 * 新增加角色并绑定角色
	 * @param session
	 * @param role_name
	 * @param auth_ids
	 * @return
	 */
	@RequestMapping("/addProjectRole")
	@ResponseBody
	public Map<String, Object> addProjectRole(HttpServletRequest request , HttpSession session , 
			String role_name , String auth_ids){
		
		Map<String, Object> map = new HashMap<String , Object>();
		switch (role_name) {
			case "创建者":
				map.put("result", false);
				map.put("message", "创建者角色为系统配置角色，不能新增！");
				return map;
			case "项目成员":
				map.put("result", false);
				map.put("message", "项目成员角色为系统配置角色，不能新增！");		
				return map;
			case "访问者":
				map.put("result", false);
				map.put("message", "访问者角色为系统配置角色，不能新增！");
				return map;
			default:
				break;
		}
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ProjectRole projectRole = new ProjectRole();
		projectRole.setRole_name(role_name);
		projectRole.setCreate_datetime(simpleDateFormat.format(new Date()));
		projectRole.setUpdate_datetime(simpleDateFormat.format(new Date()));
		if(projectRoleService.insertProjectRole(projectRole) == 1){
			int num = 0;
			User user = (User)request.getAttribute("user");
			if(!auth_ids.equals("")){
				String[] ids = auth_ids.split(",");
				for (int i = 0 ; i<ids.length ; i++){
					ProjectRoleAuthority projectRoleAuthority = new ProjectRoleAuthority();
					projectRoleAuthority.setUser_id(user.getId());
					projectRoleAuthority.setRole_id(projectRole.getId());
					projectRoleAuthority.setAuthority_id(Integer.valueOf(ids[i]));
					
					projectRoleAuthority.setBind_datetime(simpleDateFormat.format(new Date()));
					if(projectRoleService.insertProjectRoleAuthority(projectRoleAuthority) == 1){
						num++;
					}
				}
				map.put("result", true);
				map.put("message", num+"条权限赋予成功，"+(ids.length-num)+"条权限赋予失败！");
			}else{
				map.put("result", true);
				map.put("message", "角色新增成功！");
			}
		}else{
			map.put("result", false);
			map.put("message", "增加角色失败！");
		}
		return map;
	}
	
	/**
	 * 删除项目内角色
	 * @param session
	 * @param ids
	 * @return
	 */
	@RequestMapping("/deleteProjectRoles")
	@ResponseBody
	public Map<String, Object> deleteProjectRoles(HttpSession session , String ids){
		String[] p_role_ids = ids.split(",");
		int num = 0;
		for(int i=0;i<p_role_ids.length;i++){
			//系统默认创建者、项目成员以及访问者角色不能删除
			if(!p_role_ids[i].equals("1") && !p_role_ids[i].equals("2") && !p_role_ids[i].equals("3")){
				//删除允许删除的角色
				if(projectRoleService.deleteProjectRole(Integer.valueOf(p_role_ids[i])) == 1){
					num++;
					//删除权限所包含的权限列表
					projectRoleService.deleteProjectRoleAuthorityByRoleId(Integer.valueOf(p_role_ids[i]));
				}
			}
		}
		Map<String, Object> map = new HashMap<>();
		map.put("result", true);
		map.put("message", num+"位角色成功删除，"+(p_role_ids.length-num)+"位角色删除失败！");
		return map;
	}
	
	/**
	 * 获取角色信息以及对应的权限列表
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping("/getAuthorityByRoleId")
	@ResponseBody
	public Map<String, Object> getAuthorityByRoleId(HttpSession session , Integer id){
		Map<String, Object> map = new HashMap<>();
		ProjectRole projectRole = projectRoleService.getProjectRoleById(id);
		List<ProjectAuthority> projectAuthorities = projectRoleService.selectProjectAuthorityByRoleId(id);
		map.put("id", projectRole.getId());
		map.put("role_name", projectRole.getRole_name());
		map.put("projectAuthorities", projectAuthorities);
		return map;
	}
	
	@RequestMapping("/updateProjectRoleAuthority")
	@ResponseBody
	public Map<String, Object> updateProjectRoleAuthority(HttpServletRequest request , HttpSession session , 
			Integer role_id , String role_name , String auth_ids){
		
		//删除目前所有的所有角色
		projectRoleService.deleteProjectRoleAuthorityByRoleId(role_id);
		//更新角色名称
		ProjectRole projectRole = new ProjectRole();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mmL:ss");
		projectRole.setUpdate_datetime(simpleDateFormat.format(new Date()));
		projectRole.setId(role_id);
		projectRole.setRole_name(role_name);
		Map<String, Object> map = new HashMap<>();
		if(projectRoleService.updateProjectRole(projectRole) == 1){
			//更新权限
			int num = 0;
			User user = (User)request.getAttribute("user");
			if(!auth_ids.equals("")){
				String[] ids = auth_ids.split(",");
				for (int i = 0 ; i<ids.length ; i++){
					ProjectRoleAuthority projectRoleAuthority = new ProjectRoleAuthority();
					projectRoleAuthority.setUser_id(user.getId());
					projectRoleAuthority.setRole_id(projectRole.getId());
					projectRoleAuthority.setAuthority_id(Integer.valueOf(ids[i]));
					projectRoleAuthority.setBind_datetime(simpleDateFormat.format(new Date()));
					if(projectRoleService.insertProjectRoleAuthority(projectRoleAuthority) == 1){
						num++;
					}
				}
				map.put("result", true);
				map.put("message", num+"条权限赋予成功，"+(ids.length-num)+"条权限赋予失败！");
			}else{
				map.put("result", true);
				map.put("message", "角色更新成功！");
			}
		}else{
			map.put("result", false);
			map.put("message", "角色更新失败！");
		}
		return map;
	}

}
