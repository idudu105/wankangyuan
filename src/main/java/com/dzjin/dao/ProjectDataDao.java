package com.dzjin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

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
	
	@Select("select source_data_id from project_data_relation where p_id=#{p_id}")
	public List<String> select(@Param("p_id")Integer p_id);
	
	@Delete("delete from project_data_relation where p_id=#{p_id} and source_data_id=#{source_data_id}")
	public int remove(ProjectDataRelation projectDataRelation);

}
