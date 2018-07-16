package com.liutianjun.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
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
			userAppRelation.setAppOverview(application.getAppIntro());
			i += userAppRelationDao.insert(userAppRelation);
		}
		return i;
	}
	
	/**
	 * 更新应用到我的
	 * @Title: copyApplicationtoMine 
	 * @param userId
	 * @param userAppRelation 
	 * void
	 */
	private void copyApplicationtoMine(Integer userId) {
		List<UserAppRelation> list = findMine(userId);
		if(list != null && list.size() > 0) {
			for (UserAppRelation userAppRelation : list) {
				Application application = applicationService.selectByPrimaryKey(userAppRelation.getAppId());
				if(application != null) {
					userAppRelation.setAppName(application.getAppName());
					userAppRelation.setAppType(application.getAppType());
					userAppRelation.setIsAsync(application.getIsAsync());
					userAppRelation.setKeywords(application.getKeywords());
					userAppRelation.setAppOverview(application.getAppIntro());
					userAppRelationDao.updateByPrimaryKey(userAppRelation);
				}else {
					userAppRelationDao.deleteByPrimaryKey(userAppRelation.getAppId());
				}
			}
		}
		
	}
	
	/**
	 * 查找我的应用
	 * <p>Title: findMine</p>  
	 * <p>Description: </p>  
	 * @param userId
	 * @return
	 */
	@Override
	public List<UserAppRelation> findMine(Integer userId) {
		UserAppRelationQuery example = new UserAppRelationQuery();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		return userAppRelationDao.selectByExample(example);
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
	public Map<String,Object> findMine(Integer page, Integer rows, String appName, String appType, Integer userId, String orderByClause, 
			String[] appNameOption, String[] creatorOption, String[] isAsyncOption, String[] keywordsOption, String[] appIntroOption, String[] createTimeOption) {
		copyApplicationtoMine(userId);
		Map<String,Object> map = new HashMap<>();
		//根据用户名查询关系表
	    UserAppRelationQuery example = new UserAppRelationQuery();
	    Criteria criteria = example.createCriteria();
	    criteria.andUserIdEqualTo(userId);
	    if(StringUtils.isNotBlank(appName)) {
	    	criteria.andAppNameLike("%"+appName+"%");
	    }
	    if(StringUtils.isNotBlank(appType)) {
	    	criteria.andAppTypeEqualTo(appType);
	    }
    	if(null != appNameOption && appNameOption.length > 0) {
    		criteria.andAppNameIn(Arrays.asList(appNameOption));
    	}
    	if (null != creatorOption && creatorOption.length > 0) {
    		criteria.andCreatorIn(Arrays.asList(creatorOption));
    	}
    	if (null != isAsyncOption && isAsyncOption.length > 0) {
    		List<String> optionList = Arrays.asList(isAsyncOption);
    		if(optionList.size() == 1) {
    			if("同步".equals(optionList.get(0))) {
    				criteria.andIsAsyncEqualTo(0);
    			} 
    			if("异步".equals(optionList.get(0))) {
    				criteria.andIsAsyncEqualTo(1);
    			}
    		}
    	}
    	if (null != keywordsOption && keywordsOption.length > 0) {
    		criteria.andKeywordsIn(Arrays.asList(keywordsOption));
    	}
    	if (null != appIntroOption && appIntroOption.length > 0) {
    		criteria.andAppOverviewIn(Arrays.asList(appIntroOption));
    	}
    	if (null != createTimeOption && createTimeOption.length > 0) {
    		if(createTimeOption.length == 2) {
    			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
    			Date date1;
    			Date date2;
    			try {
    				date1 = simpleDateFormat.parse(createTimeOption[0].toString());
    				date2 = simpleDateFormat.parse(createTimeOption[1].toString());
    				Calendar cal = Calendar.getInstance();
    				if(date1.before(date2)) {
    					cal.setTime(date2);
    					cal.add(Calendar.DATE, 1);
    					criteria.andCreateTimeBetween(date1, cal.getTime());
    				}else {
    					cal.setTime(date1);
    					cal.add(Calendar.DATE, 1);
    					criteria.andCreateTimeBetween(date2, cal.getTime());
    				}
    			} catch (ParseException e) {
    				e.printStackTrace();
    			}
    		}
    	}
	    
	    int total = userAppRelationDao.countByExample(example);
	    example.setOrderByClause(orderByClause);
	    example.setPageNo(page);
	    example.setPageSize(rows);
	    List<UserAppRelation> list = userAppRelationDao.selectByExample(example);
		map.put("page", page);
		map.put("rows", rows);
	    map.put("total", total);
	    map.put("list", list);
	    
	    return map;
	}

	/**
	 * 查找我的应用字段列表
	 * <p>Title: findFileList</p>  
	 * <p>Description: </p>  
	 * @param filed
	 * @return
	 */
	@Override
	public List<UserAppRelation> findFileList(String field, String content, Integer userId) {
		UserAppRelationQuery example = new UserAppRelationQuery();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		if(field.equals("app_name")) {
			criteria.andAppNameLike("%"+content+"%");
		}else if (field.equals("creator")) {
			criteria.andCreatorLike("%"+content+"%");
		}else if (field.equals("is_async")) {
			if("异步".equals(content)) {
				criteria.andIsAsyncEqualTo(1);
			}
			if("同步".equals(content)) {
				criteria.andIsAsyncEqualTo(0);
			}
		}else if (field.equals("keywords")) {
			criteria.andKeywordsLike("%"+content+"%");
		}else if (field.equals("app_overview")) {
			criteria.andAppOverviewLike("%"+content+"%");
		}
		
	    example.setFields(field);
	    example.setDistinct(true);
		return userAppRelationDao.selectByExample(example);
	}

	/**
	 * 查询我的应用类别列表
	 */
	@Override
	public List<String> findMyTypeList(Integer userId) {
		UserAppRelationQuery example = new UserAppRelationQuery();
		example.setFields("app_type");
		example.setDistinct(true);
		List<UserAppRelation> list = userAppRelationDao.selectByExample(example);
		List<String> typeList = new ArrayList<>();
		if(null !=list && list.size() > 0) {
			for (UserAppRelation userAppRelation : list) {
				if(null != userAppRelation && null != userAppRelation.getAppType()) {
					typeList.add(userAppRelation.getAppType());
				}
			}
		}
		return typeList;
	}

}
