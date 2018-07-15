package com.dzjin.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dzjin.model.QueryCondition;
import com.dzjin.service.ProjectFilterService;
import com.liutianjun.pojo.User;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * 
 * 项目名称：wankangyuan 
 * 类名称：ProjectFilterController 
 * 类描述： 
 * 创建人：dzjin 
 * 创建时间：2018年7月13日 下午12:34:31 
 * 修改人：dzjin 
 * 修改时间：2018年7月13日 下午12:34:31 
 * 修改备注： 
 * @version 
 *
 */
@Controller
@RequestMapping("/projectFilter")
public class ProjectFilterController {
	
	@Autowired
	ProjectFilterService projectFilterService;
	
	/**
	 * 查询我创建的项目
	 * @param httpSession
	 * @param creator
	 * @param page
	 * @param strip
	 * @param searchWord 查询条件
	 * @return
	 */
	@RequestMapping("/selectCreatedProjectByFilterCondition")
	public String selectCreatedProject(HttpSession httpSession , HttpServletRequest request ,
			Integer page , Integer strip , String searchWord , Integer type , 
			QueryCondition projectQueryCondition){
		if(page == null){
			page = 1;
		}
		if(strip == null){
			strip = 12;
		}
		if(searchWord == null){
			searchWord = new String("");
			httpSession.setAttribute("projectSearchWord", null);
		}else{
			//更新关键字
			httpSession.setAttribute("projectSearchWord", searchWord);
		}
		if(projectQueryCondition == null){
			projectQueryCondition = new QueryCondition();
		}
		projectQueryCondition.setStrings(projectQueryCondition.getValues());//将筛选值的字符串形式切割成list形式，便于操作
		httpSession.setAttribute("projectQueryCondition", projectQueryCondition);//设置筛选条件

		//不需要筛选，直接查询
		Map<String, Object> map = new HashMap<String , Object>();
		User user = (User)request.getAttribute("user");
		map = projectFilterService.selectCreatedProjectByFilterCondition(user.getId(), page, strip, searchWord, projectQueryCondition);
		httpSession.setAttribute("projects", map.get("list"));
		httpSession.setAttribute("total", map.get("total"));
		httpSession.setAttribute("page", page);
		httpSession.setAttribute("rows", strip);
	
		if(type == null || type == 1){
			return "/jsp/project/project_create.jsp";
		}else{
			return "/jsp/project/project_create2.jsp";
		}
	}
	
	/**
	 * 根据筛选条件查询我的项目
	 * @param httpSession
	 * @param request
	 * @param page
	 * @param strip
	 * @param searchWord
	 * @param type
	 * @param projectQueryCondition
	 * @return
	 */
	@RequestMapping("/selectMineProjectByFilterCondition")
	public String selectMyProject(HttpSession httpSession , HttpServletRequest request , 
			Integer page , Integer strip, String searchWord , Integer type , 
			QueryCondition projectQueryCondition){
		if(page == null){
			page = 1;
		}
		if(strip == null){
			strip = 12;
		}
		if(searchWord == null){
			searchWord = new String("");
			httpSession.setAttribute("projectSearchWord", null);
		}else{
			//更新关键字
			httpSession.setAttribute("projectSearchWord", searchWord);
		}
		if(projectQueryCondition == null){
			projectQueryCondition = new QueryCondition();
		}
		projectQueryCondition.setStrings(projectQueryCondition.getValues());//将筛选值的字符串形式切割成list形式，便于操作
		httpSession.setAttribute("projectQueryCondition", projectQueryCondition);//设置筛选条件
		
		User user = (User)request.getAttribute("user");
		Map<String, Object> map = new HashMap<String , Object>();
		map = projectFilterService.selectMineProjectByFilterCondition(user.getId(), page, strip, searchWord, projectQueryCondition);
		httpSession.setAttribute("projects", map.get("list"));
		httpSession.setAttribute("total", map.get("total"));
		httpSession.setAttribute("page", page);
		httpSession.setAttribute("rows", strip);
		if(type == null || type == 1){
			return "/jsp/project/project_mine.jsp";
		}else{
			return "/jsp/project/project_mine2.jsp";
		}
		
	}
	
	/**
	 * 根据筛选条件查询公开的项目
	 * @param httpSession
	 * @param page
	 * @param strip
	 * @param searchWord
	 * @param type
	 * @param projectQueryCondition
	 * @return
	 */
	@RequestMapping("/selectPublicProjectByFilterCondition")
	public String selectPublicProject(HttpSession httpSession ,  Integer page , Integer strip, 
			String searchWord , Integer type , QueryCondition projectQueryCondition){		
		if(page == null){
			page = 1;
		}
		if(strip == null){
			strip = 12;
		}
		if(searchWord == null){
			searchWord = new String("");
			httpSession.setAttribute("projectSearchWord", null);
		}else{
			//更新关键字
			httpSession.setAttribute("projectSearchWord", searchWord);
		}
		if(projectQueryCondition == null){
			projectQueryCondition = new QueryCondition();
		}
		projectQueryCondition.setStrings(projectQueryCondition.getValues());//将筛选值的字符串形式切割成list形式，便于操作
		httpSession.setAttribute("projectQueryCondition", projectQueryCondition);//设置筛选条件
		
		Map<String, Object> map = new HashMap<String , Object>();
		map = projectFilterService.selectPublicProjectByFilterCondition(page, strip, searchWord, projectQueryCondition);
		httpSession.setAttribute("projects", map.get("list"));
		httpSession.setAttribute("total", map.get("total"));
		httpSession.setAttribute("page", page);
		httpSession.setAttribute("rows", strip);
		
		if(type == null || type == 1){
			return "/jsp/project/project_public.jsp";
		}else{
			return "/jsp/project/project_public2.jsp";
		}
		
	}
	
	/**
	 * 根据过滤条件筛选某个字段的值我创建的项目
	 * @param session
	 * @param request
	 * @param projectQueryCondition
	 * @return
	 */
	@RequestMapping("/getDistinctColumnValueByColumnNameAndUidCreated")
	@ResponseBody
	public Map<String, Object> getDistinctColumnValueByColumnNameAndUidCreated(
			HttpSession session , HttpServletRequest request , 
			QueryCondition projectQueryCondition){
		User user = (User)request.getAttribute("user");
		List<String> strings = projectFilterService.selectDistinctColumnValueCreated(
				projectQueryCondition.getColumnName(), user.getId() , projectQueryCondition.getFilter());
		Map<String, Object> map = new HashMap<>();
		map.put("result", true);
		map.put("message", strings);
		return map;
	}
	
	/**
	 * 根据过滤条件筛选某个字段的值我的项目
	 * @param session
	 * @param request
	 * @param projectQueryCondition
	 * @return
	 */
	@RequestMapping("/getDistinctColumnValueByColumnNameAndUidMine")
	@ResponseBody
	public Map<String, Object> getDistinctColumnValueByColumnNameAndUidMine(
			HttpSession session , HttpServletRequest request , 
			QueryCondition projectQueryCondition){
		User user = (User)request.getAttribute("user");
		List<String> strings = projectFilterService.selectDistinctColumnValueMine(
				projectQueryCondition.getColumnName(), user.getId() , projectQueryCondition.getFilter());
		Map<String, Object> map = new HashMap<>();
		map.put("result", true);
		map.put("message", strings);
		return map;
	}
	
	/**
	 * 根据过滤条件筛选某个字段的值公开的项目
	 * @param session
	 * @param request
	 * @param projectQueryCondition
	 * @return
	 */
	@RequestMapping("/getDistinctColumnValueByColumnNameAndUidPublic")
	@ResponseBody
	public Map<String, Object> getDistinctColumnValueByColumnNameAndUidPublic(
			HttpSession session , HttpServletRequest request , 
			QueryCondition projectQueryCondition){
		List<String> strings = projectFilterService.selectDistinctColumnValuePublic(
				projectQueryCondition.getColumnName(), projectQueryCondition.getFilter());
		Map<String, Object> map = new HashMap<>();
		map.put("result", true);
		map.put("message", strings);
		return map;
	}
	
	
}
