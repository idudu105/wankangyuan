package com.dzjin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dzjin.dao.ProjectDataDao;
import com.dzjin.model.ProjectDataRelation;

/** 
* @Author dzjin
* @Time 2018年6月4日 上午9:00:41 
* @Version 1.0
* <p>Description:</p>
*/
@Service
public class ProjectDataService {
	
	@Autowired
	ProjectDataDao projectDataDao;
	
	public int insert(ProjectDataRelation projectDataRelation){
		return projectDataDao.insert(projectDataRelation);
	}
	
	public List<String> select(Integer p_id){
		return projectDataDao.select(p_id);
	}
	
	public int remove(ProjectDataRelation projectDataRelation){
		return projectDataDao.remove(projectDataRelation);
	}
}