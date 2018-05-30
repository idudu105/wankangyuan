package com.liutianjun.service.impl;

import java.util.Arrays;
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
import com.liutianjun.service.UserAppRelationService;

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
	private UserAppRelationService userAppRelationService;
	
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
	@Override
	public Map<String,Object> findAllPublic(Integer page, Integer rows, String appName) {
		ApplicationQuery example = new ApplicationQuery();
		Criteria criteria = example.createCriteria();
		if(StringUtils.isNotBlank(appName)) {
			criteria.andAppNameLike("%"+appName+"%");
		}
		criteria.andStatusEqualTo("公开");
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
	 * 查找自己创建的应用
	 * <p>Title: findAll</p>  
	 * <p>Description: </p>  
	 * @param page
	 * @param rows
	 * @param appName
	 * @param creator
	 * @return
	 */
	@Override
	public Map<String, Object> findAll(Integer page, Integer rows, String appName, String creator) {
		ApplicationQuery example = new ApplicationQuery();
		Criteria criteria = example.createCriteria();
		if(StringUtils.isNotBlank(appName)) {
			criteria.andAppNameLike("%"+appName+"%");
		}
		criteria.andCreatorEqualTo(creator);
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
	 * 设置应用状态
	 * <p>Title: setStatus</p>  
	 * <p>Description: </p>  
	 * @param cmd
	 * @param id
	 */
	@Override
	public int setStatus(String cmd, Integer[] ids) {
		Application record = new Application();
		record.setStatus(cmd);
		ApplicationQuery example = new ApplicationQuery();
		Criteria criteria = example.createCriteria();
		criteria.andIdIn(Arrays.asList(ids));
		return applicationDao.updateByExampleSelective(record, example);
		
	}

	/**
	 * 查找我的应用
	 * <p>Title: findMine</p>  
	 * <p>Description: </p>  
	 * @param page
	 * @param rows
	 * @param appName
	 * @param user
	 * @return
	 */
	@Override
	public Map<String, Object> findMine(Integer page, Integer rows, String appName, Integer userId) {
		return userAppRelationService.findMine(page,rows,appName,userId);
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

	//查看已公开的应用
	@Override
	public Application findPublicByid(Integer id) {
		Application application = applicationDao.selectByPrimaryKey(id);
		if(null != application && "公开".equals(application.getStatus())) {
			return application;
		}
		return null;
	}

}
