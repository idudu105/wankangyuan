package com.xtkong.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.xtkong.model.FormatField;

public interface FormatFieldDao {
	@Insert("insert into format_field(ft_id,ff_name) values(#{ft_id},#{ff_name})")
	public int insertFormatField(FormatField FormatField);
//	@Update("update format_field "
//			+ "set ff_name=#{ff_name} "
//			+ "where ff_id=#{ff_id}")
//	public int updateFormatField(FormatField FormatField);
	/**
	 * 
	 * 选取格式字段列表
	 * 
	 * @param ft_id 格式类别
	 * @return 格式字段列表
	 */
	@Select("select * from format_field where ft_id=#{ft_id} order by cs_id desc")
	public List<FormatField> getFormatFields(@Param("ft_id") Integer ft_id);
//	@Delete("delete from format_field where ff_id=#{ff_id}")
//	public int deleteFormatField(@Param("ff_id")Integer ff_id);
}
