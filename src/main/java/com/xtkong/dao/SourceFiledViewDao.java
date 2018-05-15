package com.xtkong.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import com.xtkong.model.SourceFiledView;

public interface SourceFiledViewDao {
	/**
	 * * 选取采集源字段列表
	 * 
	 * @param cs_id  采集源
	 * @return 采集源字段列表
	 */	 
	@Select("select * from view_collection_source_field where cs_id=#{cs_id} order by csf_id ")
	public List<SourceFiledView> selectSourceFiled(@Param("cs_id") int cs_id);
}
