package com.liutianjun.service;

import java.util.Map;

import com.liutianjun.pojo.Application;

/**
 * 应用服务
 * @Title: ApplicationService.java  
 * @Package com.liutianjun.service  
 * @Description: TODO
 * @author LiuTianJun  
 * @date 2018年5月7日  
 * @version V1.0
 */
public interface ApplicationService {

	//添加应用
	int insert(Application record);
	
	//根据主键删除应用
	int deleteByIds(Integer[] ids);
	
	//更新应用
	int updateByPrimaryKey(Application record);
	
	//根据主键查找应用
	Application selectByPrimaryKey(Integer id);
	
	//列出所有应用
	Map<String,Object> findAll();

	//列出所有公共应用带分页
	Map<String,Object> findAllPublic(Integer page, Integer rows, String appName);
	
	//查找自己创建的应用
	Map<String, Object> findAll(Integer page, Integer rows, String appName, String creator);

	//设置应用状态
	int setStatus(String cmd, Integer[] ids);

	//查找我的应用
	Map<String, Object> findMine(Integer page, Integer rows, String appName, String username);
}
