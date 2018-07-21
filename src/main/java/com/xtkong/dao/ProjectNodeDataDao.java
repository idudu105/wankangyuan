package com.xtkong.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

public interface ProjectNodeDataDao {
	@Insert("insert ignore into project_nodedata_relation(p_id,data_id,cs_id,ft_id) "
			+ "values(#{p_id},#{data_id},#{cs_id},#{ft_id})")
	public int insert(@Param("p_id") Integer p_id, @Param("data_id") String nodeId,
			@Param("cs_id") Integer cs_id,@Param("ft_id") Integer ft_id);

//	@Select("select data_id from project_nodedata_relation where p_id=#{p_id} and cs_id=#{cs_id} and ft_id=#{ft_id}")
//	public List<String> select(@Param("p_id") Integer p_id, @Param("cs_id") Integer cs_id,@Param("ft_id") Integer ft_id);
//
//	@Delete("delete from project_nodedata_relation where"
//			+ " p_id=#{p_id} and data_id=#{data_id} and cs_id=#{cs_id} and ft_id=#{ft_id}")
//	public int remove(@Param("p_id") Integer p_id, @Param("data_id") String nodeId,
//			@Param("cs_id") Integer cs_id,@Param("ft_id") Integer ft_id);

}
