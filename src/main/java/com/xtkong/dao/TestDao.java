package com.xtkong.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface TestDao {
	
	@Select("select * from string where id=#{id}")
	public String selectString(@Param("id")String id);

}
