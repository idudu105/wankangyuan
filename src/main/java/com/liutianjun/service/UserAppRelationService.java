package com.liutianjun.service;

import java.util.List;

/**
 * 用户应用关系
 * @Title: UserAppRelationService.java  
 * @Package com.liutianjun.service  
 * @Description: TODO
 * @author LiuTianJun  
 * @date 2018年5月8日  
 * @version V1.0
 */
public interface UserAppRelationService {

	//根据用户id和用户名插入关系表
	int insert(Integer id,String username);
	
	//根据用户id删除关系表
	int deleteByPrimaryKey(Integer id);
	
	//添加用户的应用
	int addToMineById(Integer userId,String username, Integer[] ids);
	
	//删除用户的应用
	int removeFromMineById(Integer userId,Integer[] ids);
	
	//查找用户的应用集合
	List<Integer> findMine(String username);
}
