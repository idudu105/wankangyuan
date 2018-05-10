package com.xtkong.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import com.xtkong.model.Source;

public interface SourceDao {
	
	@Insert("insert into Collection_source(cs_name , disabled) "
			+ "values(#{cs_name},#{disabled})")
	public int insertSource(Source source);
	/**
	 * 选取数据源
	 * @return	数据源列表
	 */
	@Select("select * from Collection_source where disabled=1 order by cs_id desc")
	public List<Source> selectSource();
}
