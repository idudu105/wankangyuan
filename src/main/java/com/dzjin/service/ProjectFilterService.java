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
	 * 根据筛选条件查询我创建的项目
	 * @return	筛选后的我创建的项目
	 */
	public Map<String, Object> selectCreatedProjectByFilterCondition1(Integer creator ,  
			Integer page , Integer strip , 
			String searchWord ,QueryCondition projectQueryCondition, String pName, String pNumber, String pCreator,
			String createDatetime, String keyWords, String isOpen){
		PageHelper.startPage(page, strip);
		Map<String, Object> map = new HashMap<String , Object>();
		//将相关的筛选条件放入到map中，方便动态构造sql语句的时候使用
		map.put("creator", String.valueOf(creator));//项目创建者ID
		map.put("searchWord", searchWord);//搜索关键字，对应前端右上角的搜索框中的值
		map.put("columnName", projectQueryCondition.getColumnName());//筛选的字段名
		map.put("order", projectQueryCondition.getOrder());//筛选字段排序方式
		map.put("filter", projectQueryCondition.getFilter());//筛选字段过滤条件
		map.put("values", projectQueryCondition.getStrings());//筛选值，list形式
		
		String columnName = (String)map.get("columnName");//字段名
		String filter = (String)map.get("filter");//过滤内容
		String order = (String)map.get("order");//是否排序
		@SuppressWarnings("unchecked")
		List<String> valueList = (List<String>)map.get("values");
		
		if(columnName.equals("creator")){//因为搜索值以及过滤值都是真实的姓名，而不是ID，所以此处转换一下，字段改为user表中的username
			columnName = new String("username");
		}
		if(columnName.equals("is_open")){//如果是公开状态，需要将筛选条件转换成对应的数据库中0-1值
			if(filter.contains("公") || filter.contains("开") || filter.contains("已")){
				//如果筛选条件中包含以上三个字，认为是要筛选公开的项目，设置为数据库中is_open的数值1
				filter = "1";
			}
			if(filter.contains("未")){
				//如果筛选条件中包含未，认为是要筛选未公开的项目，设置为数据库中is_open的数值0
				filter = "0";
			}
		}
		
		//构建动态sql
		String sql = "";
		
		sql += "select project.* , user.username as creatorName from project,user where ";
		sql += "project.creator=user.id and creator="+creator+" and p_name like '"+"%"+searchWord+"%' ";//创建者ID以及搜索条件
		sql += "and "+columnName+" like '%"+filter+"%' ";//某字段过滤条件
		
		if(pName != null && !pName.equals("")){
			if(pName.indexOf(",")>-1){
				sql += "and (";
				String[] pname = pName.split(",");
				for(int i=0;i<pname.length;i++){
					//如果筛选字段是is_open，同样需要将可视的字段值转换成数据库中对应的0-1值
						//其他字段不需要进行转换
						sql += "p_name"+"='"+String.valueOf(pname[i])+"'";
						if(i != pname.length-1){
							sql += " or ";	
						}
					
				}
				sql += ")";
			}else{
				sql += " and p_name in('"+pName+"')";
			}
			
		}
		
		if(pNumber != null && !pNumber.equals("")){
			if(pNumber.indexOf(",")>-1){
				sql += "and (";
				String[] pnumber = pNumber.split(",");
				for(int i=0;i<pnumber.length;i++){
					//如果筛选字段是is_open，同样需要将可视的字段值转换成数据库中对应的0-1值
						//其他字段不需要进行转换
						sql += "p_number"+"='"+String.valueOf(pnumber[i])+"'";
						if(i != pnumber.length-1){
							sql += " or ";	
						}
					
				}
				sql += ")";
			}else{
				sql += " and p_number in('"+pNumber+"')";
			}
			
		}
		
		if(pCreator != null && !pCreator.equals("")){
			if(pCreator.indexOf(",")>-1){
				sql += "and (";
				String[] create = pCreator.split(",");
				for(int i=0;i<create.length;i++){
					//如果筛选字段是is_open，同样需要将可视的字段值转换成数据库中对应的0-1值
						//其他字段不需要进行转换
						sql += "username"+"='"+String.valueOf(create[i])+"'";
						if(i != create.length-1){
							sql += " or ";	
						}
					
				}
				sql += ")";
			}else{
				sql += " and username in('"+pCreator+"')";
			}
			
		}
		
		if(createDatetime != null && !createDatetime.equals("")){
			if(createDatetime.indexOf(",")>-1){
				sql += "and (";
				String[] createdatetime = createDatetime.split(",");
				for(int i=0;i<createdatetime.length;i++){
					//如果筛选字段是is_open，同样需要将可视的字段值转换成数据库中对应的0-1值
						//其他字段不需要进行转换
						sql += "create_datetime"+"='"+String.valueOf(createdatetime[i])+"'";
						if(i != createdatetime.length-1){
							sql += " or ";	
						}
					
				}
				sql += ")";
			}else{
				sql += " and create_datetime in('"+createDatetime+"')";
			}
			
		}
		
		if(keyWords != null && !keyWords.equals("")){
			if(keyWords.indexOf(",")>-1){
				sql += "and (";
				String[] keywords = keyWords.split(",");
				for(int i=0;i<keywords.length;i++){
					//如果筛选字段是is_open，同样需要将可视的字段值转换成数据库中对应的0-1值
						//其他字段不需要进行转换
						sql += "key_words"+"='"+String.valueOf(keywords[i])+"'";
						if(i != keywords.length-1){
							sql += " or ";	
						}
					
				}
				sql += ")";
			}else{
				sql += " and key_words in('"+keyWords+"')";
			}
			
		}
		
		if(isOpen != null && !isOpen.equals("")){
			if(isOpen.indexOf(",")>-1){
				sql += "and (";
				String[] isopen = isOpen.split(",");
				for(int i=0;i<isopen.length;i++){
					//如果筛选字段是is_open，同样需要将可视的字段值转换成数据库中对应的0-1值
					if(String.valueOf(isopen[i]).equals("已公开")){
						sql += "is_open=1";
						if(i != isopen.length-1){
							sql += " or ";	
						}
					}
					if(String.valueOf(isopen[i]).equals("未公开")){
						sql += "is_open=1";
						if(i != isopen.length-1){
							sql += " or ";	
						}
					}
				}
				sql += ")";
			}else{
				if(isOpen.equals("已公开")){
					isOpen = "1";
				}else if(isOpen.equals("未公开")){
					isOpen = "0";
				}
				sql += " and is_open ="+isOpen;
			}
			
		}
		
		//字段是否需要排序
		if(order != null && (order.equals("desc") || order.equals("asc"))){
			sql += "order by "+columnName+" "+order;
		}
		
		List<Project> projects = projectFilterDao.selectCreatedProjectByFilterCondition1(sql);
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
	 * 根据筛选条件查询我的项目
	 * @return	筛选后的我的项目
	 */
	public Map<String, Object> selectMineProjectByFilterCondition1(Integer user_id ,  
			Integer page , Integer strip , 
			String searchWord ,QueryCondition projectQueryCondition, String pName, String pNumber, String pCreator,
			String createDatetime, String keyWords, String isOpen){
		PageHelper.startPage(page, strip);
		Map<String, Object> map = new HashMap<String , Object>();
		//将相关的筛选条件放入到map中，方便动态构造sql语句的时候使用
		map.put("user_id", String.valueOf(user_id));//我的ID
		map.put("searchWord", searchWord);//搜索关键字，对应前端右上角的搜索框中的值
		map.put("columnName", projectQueryCondition.getColumnName());//筛选的字段名
		map.put("order", projectQueryCondition.getOrder());//筛选字段排序方式
		map.put("filter", projectQueryCondition.getFilter());//筛选字段过滤条件
		map.put("values", projectQueryCondition.getStrings());//筛选值，list形式
		

		String columnName = (String)map.get("columnName");//字段名
		String filter = (String)map.get("filter");//过滤内容
		String order = (String)map.get("order");//是否排序
		@SuppressWarnings("unchecked")
		List<String> valueList = (List<String>)map.get("values");
		
		if(columnName.equals("creator")){//因为搜索值以及过滤值都是真实的姓名，而不是ID，所以此处转换一下，字段改为user表中的username
			columnName = new String("username");
		}
		if(columnName.equals("is_open")){//如果是公开状态，需要将筛选条件转换成对应的数据库中0-1值
			if(filter.contains("公") || filter.contains("开") || filter.contains("已")){
				//如果筛选条件中包含以上三个字，认为是要筛选公开的项目，设置为数据库中is_open的数值1
				filter = "1";
			}
			if(filter.contains("未")){
				//如果筛选条件中包含未，认为是要筛选未公开的项目，设置为数据库中is_open的数值0
				filter = "0";
			}
		}
		
		//构建动态sql
		String sql = "";
		
		sql += "select project.*,user.username as creatorName from project , project_user,user where ";
		sql += "project.id=project_user.project_id and project.creator=user.id and project_user.user_id="+user_id+" and p_name like '"+"%"+searchWord+"%' ";//创建者ID以及搜索条件
		sql += "and "+columnName+" like '%"+filter+"%' ";//某字段过滤条件
		
		if(pName != null && !pName.equals("")){
			if(pName.indexOf(",")>-1){
				sql += "and (";
				String[] pname = pName.split(",");
				for(int i=0;i<pname.length;i++){
					//如果筛选字段是is_open，同样需要将可视的字段值转换成数据库中对应的0-1值
						//其他字段不需要进行转换
						sql += "p_name"+"='"+String.valueOf(pname[i])+"'";
						if(i != pname.length-1){
							sql += " or ";	
						}
					
				}
				sql += ")";
			}else{
				sql += " and p_name in('"+pName+"')";
			}
			
		}
		
		if(pNumber != null && !pNumber.equals("")){
			if(pNumber.indexOf(",")>-1){
				sql += "and (";
				String[] pnumber = pNumber.split(",");
				for(int i=0;i<pnumber.length;i++){
					//如果筛选字段是is_open，同样需要将可视的字段值转换成数据库中对应的0-1值
						//其他字段不需要进行转换
						sql += "p_number"+"='"+String.valueOf(pnumber[i])+"'";
						if(i != pnumber.length-1){
							sql += " or ";	
						}
					
				}
				sql += ")";
			}else{
				sql += " and p_number in('"+pNumber+"')";
			}
			
		}
		
		if(pCreator != null && !pCreator.equals("")){
			if(pCreator.indexOf(",")>-1){
				sql += "and (";
				String[] create = pCreator.split(",");
				for(int i=0;i<create.length;i++){
					//如果筛选字段是is_open，同样需要将可视的字段值转换成数据库中对应的0-1值
						//其他字段不需要进行转换
						sql += "username"+"='"+String.valueOf(create[i])+"'";
						if(i != create.length-1){
							sql += " or ";	
						}
					
				}
				sql += ")";
			}else{
				sql += " and username in('"+pCreator+"')";
			}
			
		}
		
		if(createDatetime != null && !createDatetime.equals("")){
			if(createDatetime.indexOf(",")>-1){
				sql += "and (";
				String[] createdatetime = createDatetime.split(",");
				for(int i=0;i<createdatetime.length;i++){
					//如果筛选字段是is_open，同样需要将可视的字段值转换成数据库中对应的0-1值
						//其他字段不需要进行转换
						sql += "create_datetime"+"='"+String.valueOf(createdatetime[i])+"'";
						if(i != createdatetime.length-1){
							sql += " or ";	
						}
					
				}
				sql += ")";
			}else{
				sql += " and create_datetime in('"+createDatetime+"')";
			}
			
		}
		
		if(keyWords != null && !keyWords.equals("")){
			if(keyWords.indexOf(",")>-1){
				sql += "and (";
				String[] keywords = keyWords.split(",");
				for(int i=0;i<keywords.length;i++){
					//如果筛选字段是is_open，同样需要将可视的字段值转换成数据库中对应的0-1值
						//其他字段不需要进行转换
						sql += "key_words"+"='"+String.valueOf(keywords[i])+"'";
						if(i != keywords.length-1){
							sql += " or ";	
						}
					
				}
				sql += ")";
			}else{
				sql += " and key_words in('"+keyWords+"')";
			}
			
		}
		
		if(isOpen != null && !isOpen.equals("")){
			if(isOpen.indexOf(",")>-1){
				sql += "and (";
				String[] isopen = isOpen.split(",");
				for(int i=0;i<isopen.length;i++){
					//如果筛选字段是is_open，同样需要将可视的字段值转换成数据库中对应的0-1值
					if(String.valueOf(isopen[i]).equals("已公开")){
						sql += "is_open=1";
						if(i != isopen.length-1){
							sql += " or ";	
						}
					}
					if(String.valueOf(isopen[i]).equals("未公开")){
						sql += "is_open=1";
						if(i != isopen.length-1){
							sql += " or ";	
						}
					}
				}
				sql += ")";
			}else{
				if(isOpen.equals("已公开")){
					isOpen = "1";
				}else if(isOpen.equals("未公开")){
					isOpen = "0";
				}
				sql += " and is_open ="+isOpen;
			}
			
		}
		
		//字段是否需要排序
		if(order != null && (order.equals("desc") || order.equals("asc"))){
			sql += "order by "+columnName+" "+order;
		}
		
	
		
		List<Project> projects = projectFilterDao.selectMineProjectByFilterCondition1(sql);
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
	
	/**
	 * 根据筛选条件查询公开的项目
	 * @return	筛选后的公开的项目
	 */
	public Map<String, Object> selectPublicProjectByFilterCondition1(
			Integer page , Integer strip , 
			String searchWord ,QueryCondition projectQueryCondition, String pName, String pNumber, String pCreator,
			String createDatetime, String keyWords, String isOpen){
		PageHelper.startPage(page, strip);
		Map<String, Object> map = new HashMap<String , Object>();
		//将相关的筛选条件放入到map中，方便动态构造sql语句的时候使用
		map.put("searchWord", searchWord);//搜索关键字，对应前端右上角的搜索框中的值
		map.put("columnName", projectQueryCondition.getColumnName());//筛选的字段名
		map.put("order", projectQueryCondition.getOrder());//筛选字段排序方式
		map.put("filter", projectQueryCondition.getFilter());//筛选字段过滤条件
		map.put("values", projectQueryCondition.getStrings());//筛选值，list形式
		
		String columnName = (String)map.get("columnName");//字段名
		String filter = (String)map.get("filter");//过滤内容
		String order = (String)map.get("order");//是否排序
		@SuppressWarnings("unchecked")
		List<String> valueList = (List<String>)map.get("values");
		
		if(columnName.equals("creator")){//因为搜索值以及过滤值都是真实的姓名，而不是ID，所以此处转换一下，字段改为user表中的username
			columnName = new String("username");
		}
		if(columnName.equals("is_open")){//如果是公开状态，需要将筛选条件转换成对应的数据库中0-1值
			if(filter.contains("公") || filter.contains("开") || filter.contains("已")){
				//如果筛选条件中包含以上三个字，认为是要筛选公开的项目，设置为数据库中is_open的数值1
				filter = "1";
			}
			if(filter.contains("未")){
				//如果筛选条件中包含未，认为是要筛选未公开的项目，设置为数据库中is_open的数值0
				filter = "0";
			}
		}
		
		//构建动态sql
		String sql = "";
		
		sql += "select project.* , user.username as creatorName from project,user ";
		sql += "where project.creator=user.id and is_open=1 and p_name like '"+"%"+searchWord+"%' ";//创建者ID以及搜索条件
		sql += "and "+columnName+" like '%"+filter+"%' ";//某字段过滤条件
		
		if(pName != null && !pName.equals("")){
			if(pName.indexOf(",")>-1){
				sql += "and (";
				String[] pname = pName.split(",");
				for(int i=0;i<pname.length;i++){
					//如果筛选字段是is_open，同样需要将可视的字段值转换成数据库中对应的0-1值
						//其他字段不需要进行转换
						sql += "p_name"+"='"+String.valueOf(pname[i])+"'";
						if(i != pname.length-1){
							sql += " or ";	
						}
					
				}
				sql += ")";
			}else{
				sql += " and p_name in('"+pName+"')";
			}
			
		}
		
		if(pNumber != null && !pNumber.equals("")){
			if(pNumber.indexOf(",")>-1){
				sql += "and (";
				String[] pnumber = pNumber.split(",");
				for(int i=0;i<pnumber.length;i++){
					//如果筛选字段是is_open，同样需要将可视的字段值转换成数据库中对应的0-1值
						//其他字段不需要进行转换
						sql += "p_number"+"='"+String.valueOf(pnumber[i])+"'";
						if(i != pnumber.length-1){
							sql += " or ";	
						}
					
				}
				sql += ")";
			}else{
				sql += " and p_number in('"+pNumber+"')";
			}
			
		}
		
		if(pCreator != null && !pCreator.equals("")){
			if(pCreator.indexOf(",")>-1){
				sql += "and (";
				String[] create = pCreator.split(",");
				for(int i=0;i<create.length;i++){
					//如果筛选字段是is_open，同样需要将可视的字段值转换成数据库中对应的0-1值
						//其他字段不需要进行转换
						sql += "username"+"='"+String.valueOf(create[i])+"'";
						if(i != create.length-1){
							sql += " or ";	
						}
					
				}
				sql += ")";
			}else{
				sql += " and username in('"+pCreator+"')";
			}
			
		}
		
		if(createDatetime != null && !createDatetime.equals("")){
			if(createDatetime.indexOf(",")>-1){
				sql += "and (";
				String[] createdatetime = createDatetime.split(",");
				for(int i=0;i<createdatetime.length;i++){
					//如果筛选字段是is_open，同样需要将可视的字段值转换成数据库中对应的0-1值
						//其他字段不需要进行转换
						sql += "create_datetime"+"='"+String.valueOf(createdatetime[i])+"'";
						if(i != createdatetime.length-1){
							sql += " or ";	
						}
					
				}
				sql += ")";
			}else{
				sql += " and create_datetime in('"+createDatetime+"')";
			}
			
		}
		
		if(keyWords != null && !keyWords.equals("")){
			if(keyWords.indexOf(",")>-1){
				sql += "and (";
				String[] keywords = keyWords.split(",");
				for(int i=0;i<keywords.length;i++){
					//如果筛选字段是is_open，同样需要将可视的字段值转换成数据库中对应的0-1值
						//其他字段不需要进行转换
						sql += "key_words"+"='"+String.valueOf(keywords[i])+"'";
						if(i != keywords.length-1){
							sql += " or ";	
						}
					
				}
				sql += ")";
			}else{
				sql += " and key_words in('"+keyWords+"')";
			}
			
		}
		
		if(isOpen != null && !isOpen.equals("")){
			if(isOpen.indexOf(",")>-1){
				sql += "and (";
				String[] isopen = isOpen.split(",");
				for(int i=0;i<isopen.length;i++){
					//如果筛选字段是is_open，同样需要将可视的字段值转换成数据库中对应的0-1值
					if(String.valueOf(isopen[i]).equals("已公开")){
						sql += "is_open=1";
						if(i != isopen.length-1){
							sql += " or ";	
						}
					}
					if(String.valueOf(isopen[i]).equals("未公开")){
						sql += "is_open=1";
						if(i != isopen.length-1){
							sql += " or ";	
						}
					}
				}
				sql += ")";
			}else{
				if(isOpen.equals("已公开")){
					isOpen = "1";
				}else if(isOpen.equals("未公开")){
					isOpen = "0";
				}
				sql += " and is_open ="+isOpen;
			}
			
		}
		
		//字段是否需要排序
		if(order != null && (order.equals("desc") || order.equals("asc"))){
			sql += "order by "+columnName+" "+order;
		}
		
	
		
		List<Project> projects = projectFilterDao.selectPublicProjectByFilterCondition1(sql);
		PageInfo<Project> pageInfo = new PageInfo<Project>(projects);
		Map<String, Object> result = new HashMap<String , Object>();
		result.put("total", pageInfo.getTotal());
		result.put("list", projects);
		return result;
	}

}
