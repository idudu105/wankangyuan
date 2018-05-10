package com.xtkong.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.xtkong.model.FormatType;

public interface FormatTypeDao {
	@Insert("insert into Format_type(higher_ft_id,ft_name , cs_id) "
			+ "values(#{higher_ft_id},#{ft_name},#{cs_id})")
	public int insertFormatType(FormatType formatType);
	@Update("update Format_type "
			+ "set higher_ft_id=#{higher_ft_id} , ft_name=#{ft_name}  "
			+ "where ft_id=#{ft_id}")
	public int updateFormatType(FormatType FormatType);
	/**
	 * 选取格式类型列表
	 * @param higher_ft_id 上层格式类型
	 * @return 格式类型列表
	 */
	@Select("select * from Format_type where higher_ft_id=#{higher_ft_id} order by cs_id desc")
	public List<FormatType> selectFormatType(@Param("higher_ft_id") Integer higher_ft_id);
	@Delete("delete from Format_type where ft_id=#{ft_id}")
	public int deleteFormatType(@Param("ft_id")Integer ft_id);
}

