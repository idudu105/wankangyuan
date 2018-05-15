package com.xtkong.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.xtkong.model.SourceFiled;

public interface SourceFiledDao {
	@Insert("insert into collection_source_field(cs_id , csf_name,type,check,enumerated,not_null,error_msg,create_datetime,create_uid) "
			+ "values(#{cs_id},#{csf_name},#{type},#{check},#{enumerated},#{not_null},#{error_msg},#{create_datetime},#{create_uid})")
	public int insertSourceFiled(SourceFiled sourceFiled);
	@Update("update collection_source_field "
			+ "set csf_name=#{csf_name} , type=#{type} , check=#{check}, enumerated=#{enumerated}, not_null=#{not_null}, error_msg=#{error_msg} "
			+ "where csf_id=#{csf_id}")
	public int updateSourceFiled(SourceFiled sourceFiled);
	/**
	 * * 选取采集源字段列表
	 * 
	 * @param cs_id  采集源
	 * @return 采集源字段列表
	 */	 
	@Select("select * from collection_source_field where cs_id=#{cs_id} order by csf_id ")
	public List<SourceFiled> selectSourceFiled(@Param("cs_id") int cs_id);
	@Delete("delete from collection_source_field where cs_id=#{cs_id}")
	public int deleteProjectFloder(@Param("cs_id")Integer cs_id);
}
