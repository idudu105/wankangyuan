package com.dzjin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.dzjin.model.ProjectDataRelation;

/**
 * 
 * 项目名称：wankangyuan 
 * 类名称：ProjectDataDao 
 * 类描述： 项目格式数据dao
 * 创建人：dzjin 
 * 创建时间：2018年6月28日 上午10:06:01 
 * 修改人：dzjin 
 * 修改时间：2018年6月28日 上午10:06:01 
 * 修改备注： 
 * @version 
 *
 */
public interface ProjectDataDao {
	
//	@Insert("insert ignore into project_data_relation(p_id,source_data_id) values(#{p_id},#{source_data_id})")
//	public int insert(ProjectDataRelation projectDataRelation);
	@Insert("insert into project_data_relation(p_id,source_data_id,cs_id) values(#{p_id},#{source_data_id},#{cs_id})")
	public int insertid(@Param("p_id")Integer p_id,@Param("source_data_id")String source_data_id,@Param("cs_id")Integer cs_id);
	
	@Select("select source_data_id from project_data_relation where p_id=#{p_id} and cs_id=#{cs_id}")
	public List<String> select(@Param("p_id")Integer p_id,@Param("cs_id")Integer cs_id);
	@Select("select source_data_id from project_data_relation where p_id=#{p_id}")
	public List<String> select(@Param("p_id")Integer p_id);
	
	@Delete("delete from project_data_relation where p_id=#{p_id} and source_data_id=#{source_data_id}")
	public int remove(ProjectDataRelation projectDataRelation);

}
