package com.liutianjun.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liutianjun.dao.UserAppRelationDao;
import com.liutianjun.pojo.Application;
import com.liutianjun.pojo.UserAppRelation;
import com.liutianjun.pojo.UserAppRelationQuery;
import com.liutianjun.pojo.UserAppRelationQuery.Criteria;
import com.liutianjun.service.ApplicationService;
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
	
	@Autowired
	private ApplicationService applicationService;
	
	/**
	 * 插入新关系表
	 * <p>Title: insert</p>  
	 * <p>Description: </p>  
	 * @param id
	 * @param username
	 * @return
	 */
	@Override
	public int insert(Integer userId, List<Application> list) {
		UserAppRelation userAppRelation = new UserAppRelation();
		userAppRelation.setUserId(userId);
		int i = 0;
		for (Application application : list) {
			userAppRelation.setAppId(application.getId());
			userAppRelation.setAppName(application.getAppName());
			userAppRelation.setAppType(application.getAppType());
			userAppRelation.setCreateTime(application.getCreateTime());
			userAppRelation.setCreator(application.getCreator());
			userAppRelation.setIsAsync(application.getIsAsync());
			userAppRelation.setKeywords(application.getKeywords());
			i += userAppRelationDao.insert(userAppRelation);
		}
		return i;
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
	public int addToMineByIds(Integer userId, Integer[] ids) {
		if(ids != null && ids.length > 0) {
			//删除重复的应用
			removeFromMineByIds(userId, ids);
			//查询应用列表
			List<Application> list = applicationService.findByIds(ids);
			return insert(userId,list);
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
	public int removeFromMineByIds(Integer userId, Integer[] ids) {
		if(ids != null && ids.length > 0) {
			UserAppRelationQuery example = new UserAppRelationQuery();
			Criteria criteria = example.createCriteria();
			criteria.andUserIdEqualTo(userId);
			criteria.andAppIdIn(Arrays.asList(ids));
			return userAppRelationDao.deleteByExample(example);
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
	public Map<String,Object> findMine(Integer page, Integer rows, String appName, Integer userId) {
		Map<String,Object> map = new HashMap<>();
		//根据用户名查询关系表
	    UserAppRelationQuery example = new UserAppRelationQuery();
	    Criteria criteria = example.createCriteria();
	    criteria.andUserIdEqualTo(userId);
	    if(StringUtils.isNotBlank(appName)) {
	    	criteria.andAppNameEqualTo(appName);
	    }
	    int total = userAppRelationDao.countByExample(example);
	    example.setPageNo(page);
	    example.setPageSize(rows);
	    
	    List<UserAppRelation> list = userAppRelationDao.selectByExample(example);
	    
	    map.put("total", total);
	    map.put("list", list);
	    
	    return map;
	}

}
