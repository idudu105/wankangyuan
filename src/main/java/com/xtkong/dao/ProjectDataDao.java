package com.xtkong.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface ProjectDataDao {
	@Insert("insert ignore into project_data_relation(p_id,source_data_id,cs_id) "
			+ "values(#{p_id},#{source_data_id},#{cs_id})")
	public int insert(@Param("p_id") Integer p_id, @Param("source_data_id") String sourceDataId,
			@Param("cs_id") Integer cs_id);

	@Select("select source_data_id from project_data_relation where p_id=#{p_id} and cs_id=#{cs_id}")
	public List<String> select(@Param("p_id") Integer p_id, @Param("cs_id") Integer cs_id);

	@Delete("delete from project_data_relation where"
			+ " p_id=#{p_id} and source_data_id=#{source_data_id} and cs_id=#{cs_id}")
	public int remove(@Param("p_id") Integer p_id, @Param("source_data_id") String sourceDataId,
			@Param("cs_id") Integer cs_id);

}
