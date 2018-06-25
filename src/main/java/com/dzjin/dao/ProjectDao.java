package com.dzjin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.dzjin.model.Project;
import com.dzjin.model.ProjectUser;

public interface ProjectDao {
	
	@Insert("insert into project(p_name , p_number , creator , create_datetime , is_asy , key_words) "
			+ "values(#{p_name},#{p_number},#{creator},#{create_datetime},#{is_asy},#{key_words})")
	public int insertProject(Project project);
	
	@Select("select * from project where id=#{id}")
	public Project getProjectDetail(@Param("id")Integer id);
	
	@Update("update project set introduction=#{introduction} where id=#{id}")
	public int updateProjectIntroduction(Project project);  
	
	@Update("update project "
			+ "set p_name=#{p_name} , p_number=#{p_number} , is_asy=#{is_asy} , key_words=#{key_words} "
			+ "where id=#{id}")
	public int updateProject(Project project);
	
	/**
	 * 选取公共项目
	 * @return	公共项目列表
	 */
	@Select("select * from project where is_open=1 and p_name like '%${searchWord}%' order by id desc")
	public List<Project> selectPublicProject(@Param("searchWord")String searchWord);
	
	/**
	 * 选取我创建的项目
	 * @return	我创建的项目列表
	 */
	@Select("select * from project where creator=#{creator} and p_name like '%${searchWord}%' order by id desc") 
	public List<Project> selectCreatedProject(@Param("creator")Integer creator , @Param("searchWord")String searchWord);
	
	/**
	 * 选取我加入的项目
	 * @return	我加入的项目列表
	 */
	@Select("select project.* from project , project_user "
			+ "where project.id=project_user.project_id "
			+ "and project_user.user_id=#{user_id} "
			+ "and project.p_name like '%${searchWord}%' "
			+ "order by project.id desc")
	public List<Project> selectMyProject1(@Param("user_id")Integer user_id , @Param("searchWord")String searchWord);
	
	/**
	 * 选取我加入的项目，用于下拉列表中，因此此处不用进行搜索，直接查询，同时也不需要进行分页，直接全部拉取出来。
	 * @return	我加入的项目列表
	 */
	@Select("select project.* from project , project_user "
			+ "where project.id=project_user.project_id "   
			+ "and project_user.user_id=#{user_id} "
			+ "order by project.id desc")
	public List<Project> selectMyProject(@Param("user_id")Integer user_id);
	
	@Update("insert into project_user(project_id,user_id,bind_date_time,role_id,linkman_id) "
			+ "values(#{project_id},#{user_id},#{bind_date_time},#{role_id},#{linkman_id})")
	public int addPublicProjectToMine(ProjectUser projectUser);
	
	@Select("select * from project_user where project_id=#{project_id} and user_id=#{user_id}")
	public ProjectUser getProjectUserByPidAndUid(ProjectUser projectUser);
 	
	@Update("update project set is_open=#{is_open} where id=#{id}")
	public int updateProjectOpenState(@Param("id")Integer id , @Param("is_open")Integer is_open);
	
	@Delete("delete from project where id=#{id}")
	public int deleteProject(@Param("id")Integer id);
	
	@Delete("delete from project_user where project_id=#{project_id} and user_id=#{user_id}")
	public int deleteProjectUser(ProjectUser projectUser);

}
