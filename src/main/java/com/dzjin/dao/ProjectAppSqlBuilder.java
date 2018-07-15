package com.dzjin.dao;

import java.util.List;
import java.util.Map;

/**
 * 
 * 项目名称：wankangyuan 
 * 类名称：ProjectAppSqlBuilder 
 * 类描述： 项目内应用筛选sql构建
 * 创建人：dzjin 
 * 创建时间：2018年7月15日 下午5:08:23 
 * 修改人：dzjin 
 * 修改时间：2018年7月15日 下午5:08:23 
 * 修改备注： 
 * @version 
 *
 */
public class ProjectAppSqlBuilder {
	
	/**
	 * 根据筛选条件查询项目内应用
	 * @param map
	 * @return
	 */
	public String buildSelectProjectAppByFilterCondition(final Map<String, Object> map){
		
		String project_id = (String)map.get("project_id");//项目ID，用于查询当前项目内应用
		String searchWord = (String)map.get("searchWord");//搜索关键字，搜索的是taskName
		String columnName = (String)map.get("columnName");//字段名
		String filter = (String)map.get("filter");//过滤内容
		String order = (String)map.get("order");//是否排序
		@SuppressWarnings("unchecked")
		List<String> valueList = (List<String>)map.get("values");//筛选值
		
		if(columnName.equals("is_display")){//如果是发布状态，需要将筛选条件转换成对应的数据库中0-1值
			if(filter.contains("公") || filter.contains("开")){
				//如果筛选条件中包含以上两个字，认为是要筛选发布的运行结果，设置为数据库中is_display的数值1
				filter = "1";
			}
			if(filter.contains("私") || filter.contains("有")){
				//如果筛选条件中包含以上两个字，认为是要筛选未发布的运行结果，设置为数据库中is_display的数值0
				filter = "0";
			}
		}
		
		if(columnName.equals("is_async")){//如果是异步、同步，需要将筛选条件转换成对应的数据库中0-1值
			if(filter.contains("异")){
				//如果筛选条件中包含以上两个字，认为是要筛选异步的运行结果，设置为数据库中is_async的数值1
				filter = "1";
			}
			if(filter.contains("同")){
				//如果筛选条件中包含以上两个字，认为是要筛选同步的运行结果，设置为数据库中is_async的数值0
				filter = "0";
			}
		}
		
		//构建动态sql
		String sql = "";
		
		sql += "select * from application "
				+ "where app_name like '%"+searchWord+"%' and id in (select app_id from project_app_relation where project_id="+project_id+")";
		sql += "and "+columnName+" like '%"+filter+"%' ";//某字段过滤条件
		
		
		if(valueList.size() > 0){//值筛选
			sql += "and (";
			for(int i=0;i<valueList.size();i++){
				//如果筛选字段是is_display，同样需要将可视的字段值转换成数据库中对应的0-1值
				if(columnName.equals("is_display")){
					if(String.valueOf(valueList.get(i)).equals("公开")){
						sql += columnName+"=1";
						if(i != valueList.size()-1){
							sql += " or ";	
						}
					}
					if(String.valueOf(valueList.get(i)).equals("私有")){
						sql += columnName+"=0";
						if(i != valueList.size()-1){
							sql += " or ";	
						}
					}
				}else if(columnName.equals("is_async")){
					//如果筛选字段是is_async，同样需要将可视的字段值转换成数据库中对应的0-1值
					if(String.valueOf(valueList.get(i)).equals("异步")){
						sql += columnName+"=1";
						if(i != valueList.size()-1){
							sql += " or ";	
						}
					}
					if(String.valueOf(valueList.get(i)).equals("同步")){
						sql += columnName+"=0";
						if(i != valueList.size()-1){
							sql += " or ";	
						}
					}
				}else{
					//其他字段不需要进行转换
					sql += columnName+"='"+String.valueOf(valueList.get(i))+"'";
					if(i != valueList.size()-1){
						sql += " or ";	
					}
				}
			}
			sql += ")";
		}
		//字段是否需要排序
		if(order != null && (order.equals("desc") || order.equals("asc"))){
			sql += "order by "+columnName+" "+order;
		}
		return sql;
	}	
	
	
	/**
	 * 根据筛选字段名以及过滤条件筛选值
	 * @param map
	 * @return
	 */
	public String buildAppColumnFilterSql(final Map<String, Object> map){
		
		String project_id = (String)map.get("project_id");
		String columnName = (String)map.get("columnName");
		String filter = (String)map.get("filter");	
		
		String sql = "select distinct "+columnName+" from application "
				+ "where id in (select app_id from project_app_relation where project_id="+project_id+") ";
		sql += "and "+columnName+" like '%"+filter+"%' ";//某字段过滤条件
		
		return sql;
	}
	
	

}
