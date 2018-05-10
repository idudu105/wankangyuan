package com.dzjin.service;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dzjin.dao.ProjectFloderFileDao;
import com.dzjin.model.ProjectFloder;

@Service
public class ProjectFloderFileService {
	
	@Autowired
	ProjectFloderFileDao projectFloderFileDao;

	public List<ProjectFloder> selectProjectFloderByProjectId(Integer p_id){
		List<ProjectFloder> projectFloders = projectFloderFileDao.selectProjectFloderByProjectId(p_id);
		Iterator<ProjectFloder> pIterator = projectFloders.iterator();
		while(pIterator.hasNext()){
			ProjectFloder projectFloder = (ProjectFloder) pIterator.next();
			projectFloder.setProjectFloders(getProjectFloders(projectFloder));
		}
		
		return projectFloders;
	}
	
	public List<ProjectFloder> getProjectFloders(ProjectFloder projectFloderParent){
		
		List<ProjectFloder> projectFloders = projectFloderFileDao.selectProjectFloderByParentId(projectFloderParent.getId());
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
		return projectFloderFileDao.insertProjectFloder(projectFloder);
	}
	
	public int deleteProjectFloder(String id){
		return projectFloderFileDao.deleteProjectFloder(id);
	}
	
	public int updateProjectFloder(ProjectFloder projectFloder){
		return projectFloderFileDao.updateProjectFloder(projectFloder);
	}
	
	
}
