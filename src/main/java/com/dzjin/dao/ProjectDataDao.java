package com.dzjin.dao;

import org.apache.ibatis.annotations.Insert;

import com.dzjin.model.ProjectDataRelation;

/** 
* @Author dzjin
* @Time 2018年6月4日 上午8:57:10 
* @Version 1.0
* <p>Description:</p>
*/
public interface ProjectDataDao {
	
	@Insert("insert ignore into project_data_relation(p_id,source_data_id) values(#{p_id},#{source_data_id})")
	public int insert(ProjectDataRelation projectDataRelation);

}
