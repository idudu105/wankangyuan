package com.xtkong.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import com.xtkong.model.Source;

public interface SourceDao {
	
	@Insert("insert into collection_source(cs_name , is_view) "
			+ "values(#{cs_name},#{is_view})")
	public int insertSource(Source source);
	/**
	 * 选取数据源
	 * @return	数据源列表
	 */
	@Select("select * from collection_source where is_view=1 order by cs_id")
	public List<Source> selectSource();
}
