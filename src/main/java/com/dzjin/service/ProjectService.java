package com.dzjin.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dzjin.dao.ProjectDao;
import com.dzjin.model.Project;
import com.dzjin.model.ProjectUser;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class ProjectService {
	
	@Autowired
	ProjectDao projectDao;
	
	/**
	 * 插入项目
	 * @param project
	 * @return
	 */
	public int insertProject(Project project){
		return projectDao.insertProject(project);
	}
	
	/**
	 * 获取项目基本信息
	 * @param id
	 * @return
	 */
	public Project getProjectDetail(Integer id){
		return projectDao.getProjectDetail(id);
	}
	
	/**
	 * 更新项目简介
	 * @param project
	 * @return
	 */
	public int updateProjectIntroduction(Project project){
		return projectDao.updateProjectIntroduction(project);
	}
	
	/**
	 * 更新项目的名称，同步异步以及关键字
	 * @param project
	 * @return
	 */
	public int updateProject(Project project){
		return projectDao.updateProject(project);
	}
	
	/**
	 * 选取公共项目
	 * @return	公共项目列表
	 */
	public Map<String, Object> selectPublicProject(Integer page , Integer strip  , String searchWord){
		PageHelper.startPage(page, strip);
		List<Project> projects = projectDao.selectPublicProject(searchWord);
		PageInfo<Project> pageInfo = new PageInfo<Project>(projects);
		Map<String, Object> result = new HashMap<String , Object>();
		result.put("total", pageInfo.getTotal());
		result.put("list", projects);
		return result;
	}
	
	/**
	 * 选取我创建的项目
	 * @return	我创建的项目列表
	 */
	public Map<String, Object> selectCreatedProject(Integer creator ,  Integer page , Integer strip , String searchWord){
		PageHelper.startPage(page, strip);
		List<Project> projects = projectDao.selectCreatedProject(creator , searchWord);
		PageInfo<Project> pageInfo = new PageInfo<Project>(projects);
		Map<String, Object> result = new HashMap<String , Object>();
		result.put("total", pageInfo.getTotal());
		result.put("list", projects);
		return result;
	}
	
	/**
	 * 选取我加入的项目
	 * @return	我加入的项目列表
	 */
	public Map<String, Object> selectMyProject(Integer user_id , Integer page , Integer strip , String searchWord){
		PageHelper.startPage(page, strip);
		List<Project> projects = projectDao.selectMyProject1(user_id , searchWord);
		PageInfo<Project> pageInfo = new PageInfo<Project>(projects);
		Map<String, Object> result = new HashMap<String , Object>();
		result.put("total", pageInfo.getTotal());
		result.put("list", projects);
		return result;
	}
	
	public List<Project> selectMyProject(Integer user_id){
		return projectDao.selectMyProject(user_id);

	}
	
	public boolean addPublicProjectToMine(String idStrings , Integer user_id){
		
		String[] ids = idStrings.split(",");
		boolean result = true;
		for(int i = 0 ; i< ids.length ; i++){
			//构造项目用户关系记录
			ProjectUser projectUser = new ProjectUser();
			projectUser.setProject_id(Integer.valueOf(ids[i]));
			projectUser.setUser_id(user_id);
			//判断项目用户是否已经绑定关系
			if(null == projectDao.getProjectUserByPidAndUid(projectUser)){
				//未绑定关系，设置绑定时间，进行绑定操作
				projectUser.setBind_date_time(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
				if(1 != projectDao.addPublicProjectToMine(projectUser)){
					result = false;
				}
			}
		}
		return result;
	}
	
	public boolean updateProjectOpenState(String idStrings , Integer is_open){
		String[] ids = idStrings.split(",");
		boolean result = true;
		for(int i = 0 ; i< ids.length ; i++){
			if(1 != projectDao.updateProjectOpenState(Integer.valueOf(ids[i]), is_open)){
				result = false;
			}
		}
		return result;
	}
	
	public boolean deleteProjects(String idStrings){
		String[] ids = idStrings.split(",");
		boolean result = true;
		for(int i = 0 ; i< ids.length ; i++){
			if(1 != projectDao.deleteProject(Integer.valueOf(ids[i]))){
				result = false;
			}
		}
		return result;
	}
	
	public boolean exits(String idStrings , Integer user_id){
		String[] ids = idStrings.split(",");
		boolean result = true;
		for(int i = 0 ; i< ids.length ; i++){
			ProjectUser projectUser = new ProjectUser();
			projectUser.setProject_id(Integer.valueOf(ids[i]));
			projectUser.setUser_id(user_id);
			if(1 != projectDao.deleteProjectUser(projectUser)){
				result = false;
			}
		}
		return result;
	}

	public Integer getProjectId(String projectName) {
		// TODO Auto-generated method stub
		return projectDao.getProjectId(projectName);
	}
	

}
