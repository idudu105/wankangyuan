package com.dzjin.service;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dzjin.dao.ProjectFileDao;
import com.dzjin.dao.ProjectFloderDao;
import com.dzjin.model.ProjectFile;
import com.dzjin.model.ProjectFloder;
import com.sun.jersey.core.impl.provider.entity.Inflector;

@Service
public class ProjectFileService {
	
	@Autowired
	ProjectFileDao projectFileDao;
	@Autowired
	ProjectFloderDao projectFloderDao;
	
	/**
	 * 插入一条项目文件记录
	 * @param projectFile
	 * @return
	 */
	public int insertPorjectFile(ProjectFile projectFile){
		return projectFileDao.insertPorjectFile(projectFile);
	}
	
	/**
	 * 更新项目文件的项目ID字段
	 * @param floder_id
	 * @param files
	 * @return
	 */
	public Boolean updateFloderId(Integer floder_id , String files){
		boolean result = true;
		String ids[] = files.split(",");
		for(int i = 0 ; i<ids.length ; i++){
			if(1 != projectFileDao.updateFloderId(floder_id, Integer.valueOf(ids[i]))){
				result = false;
			}
		}
		return result;
	}
	
	public List<ProjectFile> selectProjectFileByFloderId(Integer floder_id){
		List<ProjectFile> projectFiles = new ArrayList<ProjectFile>();
		getProjectFiles(floder_id, projectFiles);
		return projectFiles;
	}
	
	public void getProjectFiles(Integer floder_id , List<ProjectFile> projectFiles){
		
		List<ProjectFloder> projectFloders = projectFloderDao.selectProjectFloderByParentId(floder_id);
		if(projectFloders.size()>0){
			projectFiles.addAll(projectFileDao.selectProjectFileByFloderId(floder_id));
			//然后进行遍历
			Iterator<ProjectFloder> iterator = projectFloders.iterator();
			while(iterator.hasNext()){
				ProjectFloder projectFloder = (ProjectFloder) iterator.next();
				getProjectFiles(projectFloder.getId(), projectFiles);
			}
			
		}else{
			//查看下面包含的文件
			projectFiles.addAll(projectFileDao.selectProjectFileByFloderId(floder_id));
		}
		
		
	}

}
