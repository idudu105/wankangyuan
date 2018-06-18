package com.dzjin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dzjin.dao.ProjectAppTaskDao;
import com.dzjin.model.ProjectAppTask;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 
 * 项目名称：wankangyuan 
 * 类名称：ProjectAppTaskService 
 * 类描述： 
 * 创建人：dzjin 
 * 创建时间：2018年6月17日 上午11:13:41 
 * 修改人：dzjin 
 * 修改时间：2018年6月17日 上午11:13:41 
 * 修改备注： 
 * @version 
 *
 */
@Service
public class ProjectAppTaskService {
	
	@Autowired
	ProjectAppTaskDao projectAppTaskDao;
	
	public int insertProjectAppTask(ProjectAppTask projectAppTask){
		return projectAppTaskDao.insertProjectAppTask(projectAppTask);
	}
	
	public Map<String, Object> selectProjectAppTask(Integer page , Integer strip , Integer project_id , String searchWord){
		PageHelper.startPage(page, strip);
		List<ProjectAppTask> projectAppTasks = projectAppTaskDao.selectProjectAppTask(project_id , searchWord);
		PageInfo<ProjectAppTask> pageInfo = new PageInfo<ProjectAppTask>(projectAppTasks);
		Map<String, Object> map = new HashMap<String , Object>();
		map.put("list", projectAppTasks);
		map.put("total", pageInfo.getTotal());
		return map;
	}
	
	public ProjectAppTask getProjectAppTask(Integer id){
		return projectAppTaskDao.getProjectAppTask(id);
	}
	
	public int updateIsRelease(Integer id , Integer isRelease){
		return projectAppTaskDao.updateIsRelease(id, isRelease);
	}
	
	public int deleteProjectAppTask(Integer id){
		return projectAppTaskDao.deleteProjectAppTask(id);
	}

}
