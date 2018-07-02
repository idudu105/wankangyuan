package com.dzjin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dzjin.dao.ProjectCustomRoleDao;
import com.dzjin.model.ProjectCustomRole;

/**
 * 
 * 项目名称：wankangyuan 
 * 类名称：ProjectCustomRoleService 
 * 类描述： 项目内实际角色service
 * 创建人：dzjin 
 * 创建时间：2018年6月29日 下午3:10:03 
 * 修改人：dzjin 
 * 修改时间：2018年6月29日 下午3:10:03 
 * 修改备注： 
 * @version 
 *
 */
@Service
public class ProjectCustomRoleService {

	@Autowired
	ProjectCustomRoleDao projectCustomRoleDao;
	
	/**
	 * 新增项目内自定义角色
	 * @param projectCustomRole
	 * @return
	 */
	public int insertProjectCustomRole(ProjectCustomRole projectCustomRole){
		return projectCustomRoleDao.insertProjectCustomRole(projectCustomRole);
	}
	
	public int deleteprojectCustomRole(Integer id){
		return projectCustomRoleDao.deleteprojectCustomRole(id);
	}
	
	public List<ProjectCustomRole> selectProjectCustomRoleByPId(Integer p_id){
		return projectCustomRoleDao.selectProjectCustomRoleByPId(p_id);
	}
	
	public ProjectCustomRole getProjectCustomRole(Integer id){
		return projectCustomRoleDao.getProjectCustomRole(id);
	}
	
	public ProjectCustomRole getProjectCustomRoleByRolename(String rolename , Integer p_id){
		return projectCustomRoleDao.getProjectCustomRoleByRolename(rolename, p_id);
	}
	
	public int updateProjectCustomRole(ProjectCustomRole projectCustomRole){
		return projectCustomRoleDao.updateProjectCustomRole(projectCustomRole);
	}
	
	
}
