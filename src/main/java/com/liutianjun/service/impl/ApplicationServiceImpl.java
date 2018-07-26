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

import com.liutianjun.dao.ApplicationDao;
import com.liutianjun.pojo.Application;
import com.liutianjun.pojo.ApplicationQuery;
import com.liutianjun.pojo.ApplicationQuery.Criteria;
import com.liutianjun.service.ApplicationService;
import com.liutianjun.service.ProjectAppRelationService;

/**
 * 应用服务实现
 * @Title: ApplicationServiceImpl.java  
 * @Package com.liutianjun.service.impl  
 * @Description: TODO
 * @author LiuTianJun  
 * @date 2018年5月7日  
 * @version V1.0
 */
@Service
public class ApplicationServiceImpl implements ApplicationService {

	@Autowired
	private ApplicationDao applicationDao;
	
	@Autowired
	private ProjectAppRelationService projectAppRelationService;
	
	/**
	 * 插入应用
	 * <p>Title: insert</p>  
	 * <p>Description: </p>  
	 * @param record
	 * @return
	 */
	@Override
	public int insert(Application record) {
		record.setCreateTime(new Date());
		record.setIsDisplay(0);
		return applicationDao.insert(record);
	}

	/**
	 * 根据主键删除应用
	 * <p>Title: deleteByPrimaryKey</p>  
	 * <p>Description: </p>  
	 * @param id
	 * @return
	 */
	@Override
	public int deleteByIds(Integer[] ids) {
		ApplicationQuery example = new ApplicationQuery();
		Criteria criteria = example.createCriteria();
		criteria.andIdIn(Arrays.asList(ids));
		return applicationDao.deleteByExample(example);
	}

	/**
	 * 根据主键修改应用
	 * <p>Title: updateByPrimaryKey</p>  
	 * <p>Description: </p>  
	 * @param record
	 * @return
	 */
	@Override
	public int updateByPrimaryKey(Application record) {
		record.setUpdateTime(new Date());
		return applicationDao.updateByPrimaryKeySelective(record);
	}

	/**
	 * 根据主键查找应用
	 * <p>Title: selectByPrimaryKey</p>  
	 * <p>Description: </p>  
	 * @param id
	 * @return
	 */
	@Override
	public Application selectByPrimaryKey(Integer id) {
		return applicationDao.selectByPrimaryKey(id);
	}

	/**
	 * 列出所有应用
	 * <p>Title: findAll</p>  
	 * <p>Description: </p>  
	 * @return
	 */
	@Override
	public Map<String,Object> findAll() {
		ApplicationQuery example = new ApplicationQuery();
		int total = applicationDao.countByExample(example);
		example.setOrderByClause("id DESC");
		List<Application> list = applicationDao.selectByExample(example);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("total", total);
		return map;
	}

	/**
	 * 带分页和搜索，列出所有应用
	 * <p>Title: findAll</p>  
	 * <p>Description: </p>  
	 * @param page
	 * @param rows
	 * @param appName
	 * @return
	 */
	/*@Override
	public Map<String,Object> findAllPublic(Integer page, Integer rows, String appName, String appType) {
		ApplicationQuery example = new ApplicationQuery();
		Criteria criteria = example.createCriteria();
		if(StringUtils.isNotBlank(appName)) {
			criteria.andAppNameLike("%"+appName+"%");
		}
		if(StringUtils.isNotBlank(appType)) {
			criteria.andAppTypeEqualTo(appType);
		}
		criteria.andIsDisplayEqualTo(1);
		int total = applicationDao.countByExample(example);
		example.setOrderByClause("id DESC");
		example.setPageNo(page);
		example.setPageSize(rows);
		List<Application> list = applicationDao.selectByExample(example);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("total", total);
		return map;
	}*/
	
	/**
	 * 查找公共的应用
	 * <p>Title: findPublic</p>  
	 * <p>Description: </p>  
	 * @param page
	 * @param rows
	 * @param appName
	 * @param appType
	 * @param orderByClause
	 * @param field
	 * @param option
	 * @return
	 */
	@Override
	public Map<String, Object> findPublic(Integer page, Integer rows, String appName, String appType, String orderByClause,
			String[] appNameOption, String[] creatorOption, String[] isAsyncOption, String[] keywordsOption,
			String[] appIntroOption, String[] createTimeOption) {
		ApplicationQuery example = new ApplicationQuery();
		Criteria criteria = example.createCriteria();
		if(StringUtils.isNotBlank(appName)) {
			criteria.andAppNameLike("%"+appName+"%");
		}
		if(StringUtils.isNotBlank(appType)) {
			criteria.andAppTypeEqualTo(appType);
		}
		criteria.andIsDisplayEqualTo(1);
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
    		criteria.andAppIntroIn(Arrays.asList(appIntroOption));
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
		
		int total = applicationDao.countByExample(example);
		example.setOrderByClause(orderByClause);
		example.setPageNo(page);
		example.setPageSize(rows);
		List<Application> list = applicationDao.selectByExample(example);
		Map<String,Object> map = new HashMap<>();
		map.put("page", page);
		map.put("rows", rows);
		map.put("list", list);
		map.put("total", total);
		return map;
	}

	/**
	 * 查找自己创建的应用
	 * <p>Title: findCreate</p>  
	 * <p>Description: </p>  
	 * @param page
	 * @param rows
	 * @param appName
	 * @param creator
	 * @return
	 */
	@Override
	public Map<String, Object> findCreate(Integer page, Integer rows, String appName, String appType, String creator,
			String orderByClause, String[] appNameOption, String[] creatorOption, String[] isAsyncOption, String[] keywordsOption,
			String[] appIntroOption, String[] createTimeOption, String[] isDisplayOption) {
		ApplicationQuery example = new ApplicationQuery();
		Criteria criteria = example.createCriteria();
		if(StringUtils.isNotBlank(appName)) {
			criteria.andAppNameLike("%"+appName+"%");
		}
		if(StringUtils.isNotBlank(appType)) {
			criteria.andAppTypeEqualTo(appType);
		}
		criteria.andCreatorEqualTo(creator);
		
		if(null != appNameOption && appNameOption.length > 0) {
    		criteria.andAppNameIn(Arrays.asList(appNameOption));
    	}
    	if(null != creatorOption && creatorOption.length > 0) {
    		criteria.andCreatorIn(Arrays.asList(creatorOption));
    	}
    	if(null != isAsyncOption && isAsyncOption.length > 0) {
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
    	if(null != isDisplayOption && isDisplayOption.length > 0) {
    		List<String> optionList = Arrays.asList(isDisplayOption);
    		if(optionList.size() == 1) {
    			if("私有".equals(optionList.get(0))) {
    				criteria.andIsDisplayEqualTo(0);
    			} 
    			if("公开".equals(optionList.get(0))) {
    				criteria.andIsDisplayEqualTo(1);
    			}
    		}
    		
    	}
    	
    	if(null != keywordsOption && keywordsOption.length > 0) {
    		criteria.andKeywordsIn(Arrays.asList(keywordsOption));
    	}
    	if(null != appIntroOption && appIntroOption.length > 0) {
    		criteria.andAppIntroIn(Arrays.asList(appIntroOption));
    	}
    	if(null != createTimeOption && createTimeOption.length > 0) {
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
		
		int total = applicationDao.countByExample(example);
		example.setOrderByClause(orderByClause);
		example.setPageNo(page);
		example.setPageSize(rows);
		List<Application> list = applicationDao.selectByExample(example);
		Map<String,Object> map = new HashMap<>();
		map.put("page", page);
		map.put("rows", rows);
		map.put("list", list);
		map.put("total", total);
		return map;
	}


	/**
	 * 设置应用状态
	 * <p>Title: setStatus</p>  
	 * <p>Description: </p>  
	 * @param cmd
	 * @param id
	 */
	@Override
	public int setStatus(Integer cmd, Integer[] ids) {
		Application record = new Application();
		record.setIsDisplay(cmd);
		ApplicationQuery example = new ApplicationQuery();
		Criteria criteria = example.createCriteria();
		criteria.andIdIn(Arrays.asList(ids));
		return applicationDao.updateByExampleSelective(record, example);
		
	}

	/**
	 * 查找我的项目下的应用
	 * <p>Title: findMineProjectApp</p>  
	 * <p>Description: </p>  
	 * @param page
	 * @param rows
	 * @param ProjectId
	 * @return
	 */
	@Override
	public Map<String, Object> findMineProjectApp(Integer page, Integer rows, Integer ProjectId) {
		
		List<Integer> appIdList = projectAppRelationService.findByProjectId(ProjectId);
		
		ApplicationQuery example = new ApplicationQuery();
		Criteria criteria = example.createCriteria();
		if(appIdList != null) {
		criteria.andIdIn(appIdList);
		} else {
			criteria.andIdIsNull();
		}
		int total = applicationDao.countByExample(example);
		example.setOrderByClause("id DESC");
		example.setPageNo(page);
		example.setPageSize(rows);
		List<Application> list = applicationDao.selectByExample(example);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("total", total);
		return map;
	}

	/**
	 * 查询数组里的应用
	 * <p>Title: findByIds</p>  
	 * <p>Description: </p>  
	 * @param ids
	 * @return
	 */
	@Override
	public List<Application> findByIds(Integer[] ids) {
		ApplicationQuery example = new ApplicationQuery();
		Criteria criteria = example.createCriteria();
		criteria.andIdIn(Arrays.asList(ids));
		return applicationDao.selectByExample(example);
	}

	/**
	 * 查看已公开的应用
	 * <p>Title: findPublicByid</p>  
	 * <p>Description: </p>  
	 * @param id
	 * @return
	 */
	@Override
	public Application findPublicByid(Integer id) {
		Application application = applicationDao.selectByPrimaryKey(id);
		if(null != application && 1 == application.getIsDisplay()) {
			return application;
		}
		return null;
	}

	/**
	 * 查找类别列表
	 * <p>Title: findTypeList</p>  
	 * <p>Description: </p>  
	 * @return
	 */
	@Override
	public List<String> findTypeList() {
		ApplicationQuery example = new ApplicationQuery();
		example.setFields("app_type");
		example.setDistinct(true);
		List<Application> list = applicationDao.selectByExample(example);
		List<String> typeList = new ArrayList<>();
		if(null !=list && list.size() > 0) {
			for (Application application : list) {
				if(null != application && null != application.getAppType()) {
					typeList.add(application.getAppType());
				}
			}
		}
		return typeList;
	}
	
	/**
	 * 查询我创建的应用类别列表
	 * <p>Title: findAppTypeList</p>  
	 * <p>Description: </p>  
	 * @param username
	 * @return
	 */
	@Override
	public List<String> findAppTypeList(String username) {
		ApplicationQuery example = new ApplicationQuery();
		Criteria criteria = example.createCriteria();
		criteria.andCreatorEqualTo(username);
		example.setFields("app_type");
		example.setDistinct(true);
		List<Application> list = applicationDao.selectByExample(example);
		List<String> typeList = new ArrayList<>();
		if(null !=list && list.size() > 0) {
			for (Application application : list) {
				if(null != application && null != application.getAppType()) {
					typeList.add(application.getAppType());
				}
			}
		}
		return typeList;
	}
	
	/**
	 * 查询公共的的应用类别列表
	 * <p>Title: findPublicAppTypeList</p>  
	 * <p>Description: </p>  
	 * @return
	 */
	@Override
	public List<String> findPublicAppTypeList() {
		ApplicationQuery example = new ApplicationQuery();
		Criteria criteria = example.createCriteria();
		criteria.andIsDisplayEqualTo(1);
		example.setFields("app_type");
		example.setDistinct(true);
		List<Application> list = applicationDao.selectByExample(example);
		List<String> typeList = new ArrayList<>();
		if(null !=list && list.size() > 0) {
			for (Application application : list) {
				if(null != application && null != application.getAppType()) {
					typeList.add(application.getAppType());
				}
			}
		}
		return typeList;
	}

	/**
	 * 查询我创建的字段列表
	 * <p>Title: findFieldList</p>  
	 * <p>Description: </p>  
	 * @param field
	 * @param content
	 * @param username
	 * @return
	 */
	@Override
	public List<Application> findFieldList(String field, String content, String username, String appName, String appType, 
			String[] appNameOption, String[] creatorOption, String[] isAsyncOption, String[] keywordsOption, 
			String[] appIntroOption, String[] createTimeOption, String[] isDisplayOption) {
		ApplicationQuery example = new ApplicationQuery();
		Criteria criteria = example.createCriteria();
		criteria.andCreatorEqualTo(username);
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
		}else if (field.equals("app_intro")) {
			criteria.andAppIntroLike("%"+content+"%");
		}
		
		if(StringUtils.isNotBlank(appName)) {
			criteria.andAppNameLike("%"+appName+"%");
		}
		if(StringUtils.isNotBlank(appType)) {
			criteria.andAppTypeEqualTo(appType);
		}
		if(null != appNameOption && appNameOption.length > 0 && !field.equals("app_name")) {
    		criteria.andAppNameIn(Arrays.asList(appNameOption));
    	}
    	if(null != creatorOption && creatorOption.length > 0 && !field.equals("creator")) {
    		criteria.andCreatorIn(Arrays.asList(creatorOption));
    	}
    	if(null != isAsyncOption && isAsyncOption.length > 0 && !field.equals("is_async")) {
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
    	if(null != isDisplayOption && isDisplayOption.length > 0 && !field.equals("is_display")) {
    		List<String> optionList = Arrays.asList(isDisplayOption);
    		if(optionList.size() == 1) {
    			if("私有".equals(optionList.get(0))) {
    				criteria.andIsDisplayEqualTo(0);
    			} 
    			if("公开".equals(optionList.get(0))) {
    				criteria.andIsDisplayEqualTo(1);
    			}
    		}
    	}
    	
    	if(null != keywordsOption && keywordsOption.length > 0 && !field.equals("keywords")) {
    		criteria.andKeywordsIn(Arrays.asList(keywordsOption));
    	}
    	if(null != appIntroOption && appIntroOption.length > 0 && !field.equals("app_intro")) {
    		criteria.andAppIntroIn(Arrays.asList(appIntroOption));
    	}
    	if(null != createTimeOption && createTimeOption.length > 0 && !field.equals("create_time")) {
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
		
	    example.setFields(field);
	    example.setDistinct(true);
		
		return applicationDao.selectByExample(example);
	}
	
	/**
	 * 创建公共的字段列表
	 * <p>Title: findPublicFieldList</p>  
	 * <p>Description: </p>  
	 * @param field
	 * @param content
	 * @return
	 */
	@Override
	public List<Application> findPublicFieldList(String field, String content, String appName, String appType, 
			String[] appNameOption, String[] creatorOption, String[] isAsyncOption, String[] keywordsOption, 
			String[] appIntroOption, String[] createTimeOption) {
		ApplicationQuery example = new ApplicationQuery();
		Criteria criteria = example.createCriteria();
		criteria.andIsDisplayEqualTo(1);
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
		}else if (field.equals("app_intro")) {
			criteria.andAppIntroLike("%"+content+"%");
		}
		if(StringUtils.isNotBlank(appName)) {
			criteria.andAppNameLike("%"+appName+"%");
		}
		if(StringUtils.isNotBlank(appType)) {
			criteria.andAppTypeEqualTo(appType);
		}
		if(null != appNameOption && appNameOption.length > 0 && !field.equals("app_name")) {
    		criteria.andAppNameIn(Arrays.asList(appNameOption));
    	}
    	if(null != creatorOption && creatorOption.length > 0 && !field.equals("creator")) {
    		criteria.andCreatorIn(Arrays.asList(creatorOption));
    	}
    	if(null != isAsyncOption && isAsyncOption.length > 0 && !field.equals("is_async")) {
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
    	if(null != keywordsOption && keywordsOption.length > 0 && !field.equals("keywords")) {
    		criteria.andKeywordsIn(Arrays.asList(keywordsOption));
    	}
    	if(null != appIntroOption && appIntroOption.length > 0 && !field.equals("app_intro")) {
    		criteria.andAppIntroIn(Arrays.asList(appIntroOption));
    	}
    	if(null != createTimeOption && createTimeOption.length > 0 && !field.equals("create_time")) {
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
	    example.setFields(field);
	    example.setDistinct(true);
		
		return applicationDao.selectByExample(example);
	}

}
