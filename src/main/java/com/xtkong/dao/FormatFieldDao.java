package com.xtkong.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.xtkong.model.FormatField;

public interface FormatFieldDao {
	@Insert("insert into format_field(ft_id,ff_name,type,check_rule,enumerated,not_null,is_view,description,error_msg,create_datetime,create_uid) values(#{ft_id},#{ff_name},#{type},#{check_rule},#{enumerated},#{not_null},#{is_view},#{description},#{error_msg},#{create_datetime},#{create_uid})")
	public int insertFormatField(FormatField formatField);

	@Update("update format_field " + "set ff_name=#{ff_name},type=#{type},check_rule=#{check_rule},enumerated=#{enumerated},not_null=#{not_null},is_view=#{is_view},description=#{description},error_msg=#{error_msg},update_datetime=#{update_datetime},update_uid=#{update_uid} " + "where ff_id=#{ff_id}")
	public int updateFormatField(FormatField formatField);

	/**
	 * 
	 * 选取格式字段列表
	 * 
	 * @param ft_id
	 *            格式类别
	 * @return 格式字段列表
	 */
	@Select("select * from format_field where ft_id=#{ft_id} order by ff_id ")
	public List<FormatField> getFormatFields(@Param("ft_id") Integer ft_id);

	@Select("select * from format_field where ff_id=#{ff_id} ")
	public FormatField getFormatField(@Param("ff_id") Integer ff_id);

	@Select("select ft_id from format_field where ff_id=#{ff_id} ")
	public Integer getFormatField_ft_id(@Param("ff_id") Integer ff_id);

	@Delete("delete from format_field where ff_id=#{ff_id}")
	public int deleteFormatField(@Param("ff_id") Integer ff_id);
}
