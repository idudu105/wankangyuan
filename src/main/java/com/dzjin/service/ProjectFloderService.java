package com.dzjin.service;

import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dzjin.dao.ProjectFloderDao;
import com.dzjin.model.ProjectFloder;

@Service
public class ProjectFloderService {
	
	@Autowired
	ProjectFloderDao projectFloderDao;

	public List<ProjectFloder> selectProjectFloderByProjectId(Integer p_id){
		List<ProjectFloder> projectFloders = projectFloderDao.selectProjectFloderByProjectId(p_id);
		Iterator<ProjectFloder> pIterator = projectFloders.iterator();
		while(pIterator.hasNext()){
			ProjectFloder projectFloder = (ProjectFloder) pIterator.next();
			projectFloder.setProjectFloders(getProjectFloders(projectFloder));
		}
		return projectFloders;
	}
	
	public List<ProjectFloder> getProjectFloders(ProjectFloder projectFloderParent){
		
		List<ProjectFloder> projectFloders = projectFloderDao.selectProjectFloderByParentId(projectFloderParent.getId());
		if(projectFloders.size() > 0){
			projectFloderParent.setProjectFloders(projectFloders);
			Iterator<ProjectFloder> pIterator = projectFloders.iterator();
			while(pIterator.hasNext()){
				ProjectFloder projectFloder = (ProjectFloder)pIterator.next();
				projectFloder.setProjectFloders(getProjectFloders(projectFloder));
			}
			return projectFloders;
		}else{
			return null;
		}
	}
	
	public int insertProjectFloder(ProjectFloder projectFloder){
		return projectFloderDao.insertProjectFloder(projectFloder);
	}
	
	public int deleteProjectFloder(String id){
		return projectFloderDao.deleteProjectFloder(id);
	}
	
	public int updateProjectFloder(ProjectFloder projectFloder){
		return projectFloderDao.updateProjectFloder(projectFloder);
	}
	
	public int countProjectUserFile(Integer project_id , Integer user_id){
		return projectFloderDao.countProjectUserFile(project_id, user_id);
	}
	
	
}
