package com.dzjin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.dzjin.model.ProjectFloder;

public interface ProjectFloderDao {
	
	
	@Select("select * from project_floder where parent_id=#{parent_id}")
	public List<ProjectFloder> selectProjectFloderByParentId(@Param("parent_id")Integer parent_id);
	
	
	@Select("select * from project_floder where p_id=#{p_id}")
	public List<ProjectFloder> selectProjectFloderByProjectId(@Param("p_id")Integer p_id);
	
	@Insert("insert into project_floder(floder_name , parent_id , is_root , p_id) "
			+ "values(#{floder_name},#{parent_id},#{is_root},#{p_id})")
	public int insertProjectFloder(ProjectFloder projectFloder);
	
	@Delete("delete from project_floder where id=#{id}")
	public int deleteProjectFloder(@Param("id")String id);
	
	@Update("update project_floder set floder_name=#{floder_name} where id=#{id}")
	public int updateProjectFloder(ProjectFloder projectFloder);
	
	@Select("select count(project_file.id) from project_floder , project_file where "
			+ "project_floder.p_id=#{project_id} "
			+ "and project_floder.id=project_file.floder_id "
			+ "and project_file.creator_id=#{user_id}")
	public int countProjectUserFile(@Param("project_id")Integer project_id , @Param("user_id")Integer user_id);

}
