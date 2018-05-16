package com.xtkong.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.xtkong.model.SourceField;

public interface SourceFiledDao {
	@Insert("insert into collection_source_field(csf_name,cs_id,type,check_rule,enumerated,not_null,error_msg,create_datetime,create_uid) "
			+ "values(#{csf_name},#{cs_id},#{type},#{check_rule},#{enumerated},#{not_null},#{error_msg},#{create_datetime},#{create_uid})")
	public int insertSourceFiled(SourceField sourceFiled);

	@Update("update collection_source_field "
			+ "set csf_name=#{csf_name} , type=#{type} , check_rule=#{check_rule}, enumerated=#{enumerated}, not_null=#{not_null}, description=#{description},error_msg=#{error_msg} "
			+ "where csf_id=#{csf_id}")
	public int updateSourceFiled(SourceField sourceFiled);

	/**
	 * * 选取采集源字段列表
	 * 
	 * @param cs_id
	 *            采集源
	 * @return 采集源字段列表
	 */
	@Select("select * from collection_source_field where cs_id=#{cs_id} order by csf_id ")
	public List<SourceField> getSourceFileds(@Param("cs_id") int cs_id);

	@Select("select * from collection_source_field where csf_id=#{csf_id}")
	public SourceField getSourceFiled(Integer csf_id);

	@Delete("delete from collection_source_field where csf_id=#{csf_id}")
	public int deleteSourceFiled(@Param("csf_id") Integer csf_id);

}
