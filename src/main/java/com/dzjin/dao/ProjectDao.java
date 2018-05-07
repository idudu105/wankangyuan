package com.dzjin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.dzjin.model.Project;

public interface ProjectDao {
	
	@Insert("insert into project(p_name , p_number , creator , create_datetime , is_asy , key_words) "
			+ "values(#{p_name},#{p_number},#{creator},#{create_datetime},#{is_asy},#{key_words})")
	public int insertProject(Project project);
	
	/**
	 * 选取公共项目
	 * @return	公共项目列表
	 */
	@Select("select * from project where is_open=1 order by id desc")
	public List<Project> selectPublicProject();
	
	/**
	 * 选取我创建的项目
	 * @return	我创建的项目列表
	 */
	@Select("select * from project where creator=#{creator} order by id desc")
	public List<Project> selectCreatedProject(@Param("creator")Integer creator);
	
	/**
	 * 选取我加入的项目
	 * @return	我加入的项目列表
	 */
	@Select("select * from project , project_user "
			+ "where project.id=project_user.project_id "
			+ "and project_user.user_id=#{user_id} "
			+ "order by project.id desc")
	public List<Project> selectMyProject(@Param("user_id")Integer user_id);
	
	
 	
	

}
