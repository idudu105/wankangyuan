package com.dzjin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.liutianjun.pojo.Application;

/**
 * 
 * 项目名称：wankangyuan 
 * 类名称：ProjectAppDao 
 * 类描述： 
 * 创建人：dzjin 
 * 创建时间：2018年6月5日 上午8:30:24 
 * 修改人：dzjin 
 * 修改时间：2018年6月5日 上午8:30:24 
 * 修改备注： 
 * @version 
 *
 */
public interface ProjectAppDao {
	
	/*
	 * <result column="app_name" property="appName" jdbcType="VARCHAR" />
    <result column="creator" property="creator" jdbcType="VARCHAR" />
    <result column="app_type" property="appType" jdbcType="VARCHAR" />
    <result column="is_async" property="isAsync" jdbcType="INTEGER" />
    <result column="keywords" property="keywords" jdbcType="VARCHAR" />
    <result column="versions" property="versions" jdbcType="VARCHAR" />
    <result column="create_time" property="createTime" jdbcType="TIMESTAMP" />
    <result column="status" property="status" jdbcType="VARCHAR" />
    <result column="para_a" property="paraA" jdbcType="VARCHAR" />
    <result column="para_b" property="paraB" jdbcType="VARCHAR" />
    <result column="para_c" property="paraC" jdbcType="VARCHAR" />
    <result column="app_overview" property="appOverview" jdbcType="VARCHAR" />
    <result column="data_format" property="dataFormat" jdbcType="VARCHAR" />*/
	
	@Select("select * from application where app_name like '%${keyWord}%' and id in (select app_id from project_app_relation where project_id=#{project_id})")
	@Results({
		@Result(property = "appName" , column = "app_name"),
		@Result(property = "appType" , column = "app_type"),
		@Result(property = "isAsync" , column = "is_async"),
		@Result(property = "createTime" , column = "create_time"),
		@Result(property = "paraA" , column = "para_a"),
		@Result(property = "paraB" , column = "para_b"),
		@Result(property = "paraC" , column = "para_c"),
		@Result(property = "appOverview" , column = "app_overview"),
		@Result(property = "dataFormat" , column = "data_format")
	})
	public List<Application> selectProjectApp(@Param("project_id")Integer project_id , @Param("keyWord")String keyWord);
	
	@Delete("delete from project_app_relation where project_id=#{project_id} and app_id=#{app_id}")
	public int deleteProjectAppRelation(@Param("project_id")Integer project_id , @Param("app_id") Integer app_id);

}
