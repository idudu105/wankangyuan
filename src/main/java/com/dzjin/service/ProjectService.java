package com.dzjin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dzjin.dao.ProjectDao;
import com.dzjin.model.Project;

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
	 * 选取公共项目
	 * @return	公共项目列表
	 */
	public List<Project> selectPublicProject(){
		return projectDao.selectPublicProject();
	}
	
	/**
	 * 选取我创建的项目
	 * @return	我创建的项目列表
	 */
	public List<Project> selectCreatedProject(Integer creator){
		return projectDao.selectCreatedProject(creator);
	}
	
	/**
	 * 选取我加入的项目
	 * @return	我加入的项目列表
	 */
	public List<Project> selectMyProject(Integer user_id){
		return projectDao.selectMyProject(user_id);
	}
	

}
