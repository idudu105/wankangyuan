package com.dzjin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dzjin.dao.ProjectFilterDao;
import com.dzjin.model.Project;
import com.dzjin.model.QueryCondition;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 
 * 项目名称：wankangyuan 
 * 类名称：ProjectFilterService 
 * 类描述： 项目表头筛选处理类
 * 创建人：dzjin 
 * 创建时间：2018年7月12日 下午11:43:57 
 * 修改人：dzjin 
 * 修改时间：2018年7月12日 下午11:43:57 
 * 修改备注： 
 * @version 
 *
 */
@Service
public class ProjectFilterService {
	
	@Autowired
	ProjectFilterDao projectFilterDao;
	
	/**
	 * 根据过滤条件筛选我创建的项目的某个字段的值
	 * @param columnName 字段名
	 * @param creator 创建人
	 * @param searchWord 过滤条件
	 * @return
	 */
	public List<String> selectDistinctColumnValueCreated(String columnName , Integer creator , String searchWord){
		switch(columnName){
			case "p_name":
				return projectFilterDao.selectDistinctP_nameCreated(creator, searchWord);
			case "p_number":
				return projectFilterDao.selectDistinctP_numberCreated(creator, searchWord);
			case "creator":
				return projectFilterDao.selectDistinctCreatorCreated(creator, searchWord);
			case "create_datetime":
				return projectFilterDao.selectDistinctCreateDatetimeCreated(creator, searchWord);
			case "is_open":
				List<String> strings = new ArrayList<String>();
				strings.add("已公开");
				strings.add("未公开");
				return strings;
			case "key_words":
				return projectFilterDao.selectDistinctKeyWordsCreated(creator, searchWord);
			default:
				return null;
		}
	}
	
	/**
	 * 根据过滤条件筛选我的项目的某个字段的值
	 * @param columnName 字段名
	 * @param user_id 用户名
	 * @param searchWord 过滤条件
	 * @return
	 */
	public List<String> selectDistinctColumnValueMine(String columnName , Integer user_id , String searchWord){
		switch(columnName){
			case "p_name":
				return projectFilterDao.selectDistinctP_nameMine(user_id, searchWord);
			case "p_number":
				return projectFilterDao.selectDistinctP_numberMine(user_id, searchWord);
			case "creator":
				return projectFilterDao.selectDistinctCreatorMine(user_id, searchWord);
			case "create_datetime":
				return projectFilterDao.selectDistinctCreateDatetimeMine(user_id, searchWord);
			case "is_open":
				List<String> strings = new ArrayList<String>();
				strings.add("已公开");
				strings.add("未公开");
				return strings;
			case "key_words":
				return projectFilterDao.selectDistinctKeyWordsMine(user_id, searchWord);
			default:
				return null;
		}
	}
	
	/**
	 * 根据过滤条件筛选公开项目的某个字段值
	 * @param columnName 字段名
	 * @param searchWord 过滤条件
	 * @return
	 */
	public List<String> selectDistinctColumnValuePublic(String columnName , String searchWord){
		switch(columnName){
			case "p_name":
				return projectFilterDao.selectDistinctP_namePublic(searchWord);
			case "p_number":
				return projectFilterDao.selectDistinctP_numberPublic(searchWord);
			case "creator":
				return projectFilterDao.selectDistinctCreatorPublic(searchWord);
			case "create_datetime":
				return projectFilterDao.selectDistinctCreateDatetimePublic(searchWord);
			case "is_open":
				List<String> strings = new ArrayList<String>();
				strings.add("已公开");
				strings.add("未公开");
				return strings;
			case "key_words":
				return projectFilterDao.selectDistinctKeyWordsPublic(searchWord);
			default:
				return null;
		}
	}
	
	/**
	 * 根据筛选条件查询我创建的项目
	 * @return	筛选后的我创建的项目
	 */
	public Map<String, Object> selectCreatedProjectByFilterCondition(Integer creator ,  
			Integer page , Integer strip , 
			String searchWord ,QueryCondition projectQueryCondition){
		PageHelper.startPage(page, strip);
		Map<String, Object> map = new HashMap<String , Object>();
		//将相关的筛选条件放入到map中，方便动态构造sql语句的时候使用
		map.put("creator", String.valueOf(creator));//项目创建者ID
		map.put("searchWord", searchWord);//搜索关键字，对应前端右上角的搜索框中的值
		map.put("columnName", projectQueryCondition.getColumnName());//筛选的字段名
		map.put("order", projectQueryCondition.getOrder());//筛选字段排序方式
		map.put("filter", projectQueryCondition.getFilter());//筛选字段过滤条件
		map.put("values", projectQueryCondition.getStrings());//筛选值，list形式
		
		List<Project> projects = projectFilterDao.selectCreatedProjectByFilterCondition(map);
		PageInfo<Project> pageInfo = new PageInfo<Project>(projects);
		Map<String, Object> result = new HashMap<String , Object>();
		result.put("total", pageInfo.getTotal());
		result.put("list", projects);
		return result;
	}
	
	/**
	 * 根据筛选条件查询我的项目
	 * @return	筛选后的我的项目
	 */
	public Map<String, Object> selectMineProjectByFilterCondition(Integer user_id ,  
			Integer page , Integer strip , 
			String searchWord ,QueryCondition projectQueryCondition){
		PageHelper.startPage(page, strip);
		Map<String, Object> map = new HashMap<String , Object>();
		//将相关的筛选条件放入到map中，方便动态构造sql语句的时候使用
		map.put("user_id", String.valueOf(user_id));//我的ID
		map.put("searchWord", searchWord);//搜索关键字，对应前端右上角的搜索框中的值
		map.put("columnName", projectQueryCondition.getColumnName());//筛选的字段名
		map.put("order", projectQueryCondition.getOrder());//筛选字段排序方式
		map.put("filter", projectQueryCondition.getFilter());//筛选字段过滤条件
		map.put("values", projectQueryCondition.getStrings());//筛选值，list形式
		
		List<Project> projects = projectFilterDao.selectMineProjectByFilterCondition(map);
		PageInfo<Project> pageInfo = new PageInfo<Project>(projects);
		Map<String, Object> result = new HashMap<String , Object>();
		result.put("total", pageInfo.getTotal());
		result.put("list", projects);
		return result;
	}
	
	/**
	 * 根据筛选条件查询公开的项目
	 * @return	筛选后的公开的项目
	 */
	public Map<String, Object> selectPublicProjectByFilterCondition(
			Integer page , Integer strip , 
			String searchWord ,QueryCondition projectQueryCondition){
		PageHelper.startPage(page, strip);
		Map<String, Object> map = new HashMap<String , Object>();
		//将相关的筛选条件放入到map中，方便动态构造sql语句的时候使用
		map.put("searchWord", searchWord);//搜索关键字，对应前端右上角的搜索框中的值
		map.put("columnName", projectQueryCondition.getColumnName());//筛选的字段名
		map.put("order", projectQueryCondition.getOrder());//筛选字段排序方式
		map.put("filter", projectQueryCondition.getFilter());//筛选字段过滤条件
		map.put("values", projectQueryCondition.getStrings());//筛选值，list形式
		
		List<Project> projects = projectFilterDao.selectPublicProjectByFilterCondition(map);
		PageInfo<Project> pageInfo = new PageInfo<Project>(projects);
		Map<String, Object> result = new HashMap<String , Object>();
		result.put("total", pageInfo.getTotal());
		result.put("list", projects);
		return result;
	}

}
