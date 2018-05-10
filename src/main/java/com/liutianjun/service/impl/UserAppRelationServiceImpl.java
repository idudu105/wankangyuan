package com.liutianjun.service.impl;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liutianjun.dao.UserAppRelationDao;
import com.liutianjun.pojo.UserAppRelation;
import com.liutianjun.service.UserAppRelationService;

/**
 * 用户应用关系
 * @Title: UserAppRelationServiceImpl.java  
 * @Package com.liutianjun.service.impl  
 * @Description: TODO
 * @author LiuTianJun  
 * @date 2018年5月8日  
 * @version V1.0
 */
@Service
public class UserAppRelationServiceImpl implements UserAppRelationService {

	@Autowired
	private UserAppRelationDao userAppRelationDao;
	
	/**
	 * 插入新关系表
	 * <p>Title: insert</p>  
	 * <p>Description: </p>  
	 * @param id
	 * @param username
	 * @return
	 */
	@Override
	public int insert(Integer id, String username) {
		UserAppRelation userAppRelation = new UserAppRelation();
		userAppRelation.setId(id);
		userAppRelation.setUsername(username);
		return userAppRelationDao.insert(userAppRelation);
	}

	/**
	 * 根据主键删除
	 * <p>Title: deleteByPrimaryKey</p>  
	 * <p>Description: </p>  
	 * @param id
	 * @return
	 */
	@Override
	public int deleteByPrimaryKey(Integer id) {
		return userAppRelationDao.deleteByPrimaryKey(id);
	}

	/**
	 * 添加用户应用关系
	 * <p>Title: updateByPrimaryKey</p>  
	 * <p>Description: </p>  
	 * @param record
	 * @return
	 */
	@Override
	public int addToMineById(Integer userId,Integer[] ids) {
		if(ids != null && ids.length > 0) {
			//根据用户id查询关系表
			UserAppRelation userAppRelation = userAppRelationDao.selectByPrimaryKey(userId);
			//获取应用旧ids
			String appIds = userAppRelation.getAppIds();
			
			String[] oldIds =new String[0];
			
			if(StringUtils.isNotBlank(appIds)) {
				//应用旧id转数组
				oldIds = appIds.split(",");
			}
			//合并数组
			String[] newIds = ArrayUtils.addAll(oldIds, ArrayUtils.toStringArray(ids));
			
			//应用id转Set
			Set<String> idSet = new HashSet<String>(Arrays.asList(newIds));
			//去掉空格转字符串
			String idSerStr = idSet.toString().replaceAll(" ", "");
			String substring = StringUtils.substring(idSerStr, 1, idSerStr.length()-1);
			userAppRelation.setAppIds(substring);
			return userAppRelationDao.updateByPrimaryKey(userAppRelation);
			
		}
		return 0;
	}

	/**
	 * 删除用户应用的关系
	 * <p>Title: deleteMineById</p>  
	 * <p>Description: </p>  
	 * @param userId
	 * @param ids
	 * @return
	 */
	@Override
	public int removeFromMineById(Integer userId, Integer[] ids) {
		
		if(ids != null && ids.length > 0) {
			//根据用户id查询关系表
			UserAppRelation userAppRelation = userAppRelationDao.selectByPrimaryKey(userId);
			//获取应用旧ids
			String appIds = userAppRelation.getAppIds();
			
			String[] oldIds =new String[0];
			
			if(StringUtils.isNotBlank(appIds)) {
				//应用旧id转数组
				oldIds = appIds.split(",");
			}
			
			for (Integer id : ids) {
				oldIds = ArrayUtils.removeElement(oldIds,String.valueOf(id));
			}
			
			List<String> newIds = Arrays.asList(oldIds);
			//去掉空格转字符串
			String idSerStr = newIds.toString().replaceAll(" ", "");
			String substring = StringUtils.substring(idSerStr, 1, idSerStr.length()-1);
			userAppRelation.setAppIds(substring);
			return userAppRelationDao.updateByPrimaryKey(userAppRelation);
			
		}
		return 0;
	}

	/**
	 * 查询我的应用
	 * <p>Title: findMine</p>  
	 * <p>Description: </p>  
	 * @param id
	 * @return
	 */
	@Override
	public List<Integer> findMine(Integer id) {
		
		//根据用户id查询关系表
		UserAppRelation userAppRelation = userAppRelationDao.selectByPrimaryKey(id);
		if(StringUtils.isNotBlank(userAppRelation.getAppIds())) {
			//获取用户的应用
			String[] appIdsStr = userAppRelation.getAppIds().replaceAll(" ","").split(",");
			Integer[] appIds = (Integer[]) ConvertUtils.convert(appIdsStr, Integer.class);
			//应用Ids转List
			List<Integer> list =Arrays.asList(appIds);
			return list;
		}
		return null;
	}

}
