package com.dzjin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dzjin.model.Project;
import com.dzjin.service.ProjectAppService;
import com.dzjin.service.ProjectDataService;
import com.liutianjun.pojo.Application;
import com.liutianjun.pojo.User;
import com.liutianjun.service.ApplicationService;
import com.xtkong.model.Source;
import com.xtkong.service.SourceFieldService;
import com.xtkong.service.SourceService;

/**
 * 
 * 项目名称：wankangyuan 
 * 类名称：ProjectAppController 
 * 类描述： 项目-应用controller
 * 创建人：dzjin 
 * 创建时间：2018年5月16日 上午10:30:04 
 * 修改人：dzjin 
 * 修改时间：2018年5月16日 上午10:30:04 
 * 修改备注： 
 * @version 
 *
 */

@Controller
@RequestMapping("/projectApp")
public class ProjectAppController {
	
	@Autowired
	ProjectAppService projectAppService;
	@Autowired
	ApplicationService applicationService;
	
	/**
	 * 查询项目内的应用
	 * @param httpSession
	 * @param p_id 项目ID
	 * @param page 页数
	 * @param strip 页面
	 * @param searchWord 查询关键字
	 * @param type 返回页面类型，1或者null代表列表页面，2代表卡片页面
	 * @return 项目内应用显示页面
	 */
	@RequestMapping("/selectProjectApp")
	public String selectProjectApp(HttpSession httpSession , Integer p_id , Integer page , Integer strip ,
			String searchWord , Integer type){
		if(page == null){
			page = 1;
		}
		if(strip == null){
			strip = 12;
		}
		if(searchWord == null){
			searchWord = new String("");
			httpSession.setAttribute("projectAppSearchWord", searchWord);
		}else{
			httpSession.setAttribute("projectAppSearchWord", searchWord);
		}
		Map<String, Object> map = projectAppService.selectProjectApp(p_id, page, strip , searchWord);
		httpSession.setAttribute("projectApplications", map.get("list"));
		httpSession.setAttribute("page", page);
		httpSession.setAttribute("rows", strip);
		httpSession.setAttribute("total", map.get("total"));
		if(type == null || type == 1){
			return "/jsp/project/project_app.jsp";
		}else{
			return "/jsp/project/project_app2.jsp";
		}	
	}
	
	/**
	 * 删除项目内应用
	 * @param session
	 * @param p_id 项目ID
	 * @param ids 应用ID数组，以英逗号分隔
	 * @return 删除结果
	 */
	@RequestMapping("/deleteProjectAppRelation")
	@ResponseBody
	public Map<String, Object> deleteProjectAppRelation(HttpSession session , Integer p_id , String ids){
		String[] appIds = ids.split(",");
		int num = 0 ;
		for(int i = 0 ; i<appIds.length ; i++){
			if(projectAppService.deleteProjectAppRelation(p_id, Integer.valueOf(appIds[i])) > 0){
				num++;
			}
		}	
		Map<String, Object> map = new HashMap<>();
		map.put("result", true);
		map.put("message", "解除"+num+"条项目-应用绑定关系！");
		return map;
	}
	
	/**
	 * 运行项目，解析应用参数地址，并对相关的字段进行替换，返回替换后的链接地址
	 * @param request
	 * @param session
	 * @param app_id 应用ID
	 * @return
	 */
	@RequestMapping("/projectAppRun")
	@ResponseBody
	public Map<String, Object> projectAppRun(HttpServletRequest request , HttpSession session , Integer app_id){
		//应用参数地址样例
		/*http://localhost:8021/bd-visualapps/apps/heatmap/param.html
		 * ?project.id={project.id}
		 * &userid={userid}
		 * &username={username}
		 * &app.id={app.id}*/
		Map<String, Object> map = new HashMap<>();
		User user = (User) request.getAttribute("user");
		Project project = (Project)session.getAttribute("project");
		Application application = applicationService.selectByPrimaryKey(app_id);
		String paraAddress = application.getParaAddress();
		//对地址进行解析
		if(paraAddress != null && !paraAddress.equals("") && paraAddress.indexOf('?') != -1){
			String head = paraAddress.split("[?]")[0];
			String newParaAddress = 
					head
					+"?project.id="+project.getId()
					+"&userid="+user.getId()
					+"&username="+user.getUsername()
					+"&app.id="+app_id;
			map.put("result", true);
			map.put("message", newParaAddress);
			
		}else{
			map.put("result", false);
		}
		return map;
	}
	
	//格式数据相关的逻辑处理类
	@Autowired
	SourceService sourceService;
	@Autowired
	SourceFieldService sourceFieldService;
	@Autowired
	ProjectDataService projectDataService;
	
	/**
	 * 选择项目内格式数据
	 * @param httpSession
	 * @param p_id 项目ID
	 * @param cs_id 源数据ID
	 * @return 甲方选择格式数据列表
	 */
	@RequestMapping("/selectProjectData")
	public String selectProjectData(HttpSession httpSession , Integer p_id , Integer cs_id){
		
		//获取数据源列表并放到session中
		List<Source> sources = sourceService.getSourcesForUser();
		httpSession.setAttribute("sources", sources);
		
		//当采集源列表不为空
		if(!sources.isEmpty()){
			//判断cs_id是不是为空，默认选择第一个采集源
			if(cs_id == null){
				cs_id = sourceService.getSourcesForUserLimit(1).get(0).getCs_id();
			}
			//获取采集源字段列表
			Source source = sourceService.getSourceByCs_id(cs_id);
			source.setSourceFields(sourceFieldService.getSourceFields(cs_id));
			httpSession.setAttribute("source", source);// 采集源字段列表
			
			//遍历源数据列表，并查询对应的格式数据，只查询到格式结点就行，然后设置到源数据记录中
			
			//最后将源数据以及格式数据结点放到session中
			
		}

		return "/jsp/project/data_reselect.jsp";
	}
}
