package com.dzjin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dzjin.model.Project;
import com.dzjin.service.ProjectAppService;
import com.dzjin.service.ProjectDataService;
import com.liutianjun.pojo.Application;
import com.liutianjun.service.ApplicationService;
import com.xtkong.dao.hbase.HBaseSourceDataDao;
import com.xtkong.model.Source;
import com.xtkong.service.SourceFieldService;
import com.xtkong.service.SourceService;

/**
 * 项目-应用相关操作接口
 * 项目名称：wankangyuan 
 * 类名称：ProjectAppController 
 * 类描述： 
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
	
	//格式数据相关的逻辑处理类
	@Autowired
	SourceService sourceService;
	@Autowired
	SourceFieldService sourceFieldService;
	@Autowired
	ProjectDataService projectDataService;
	
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
			httpSession.setAttribute("projectAppSearchWord", null);
		}else{
			//更新关键字
			httpSession.setAttribute("projectSearchWord", searchWord);
		}
		Map<String, Object> map = projectAppService.selectProjectApp(p_id, page, strip , searchWord);
		httpSession.setAttribute("projectApplications", map.get("list"));
		httpSession.setAttribute("page", page);
		httpSession.setAttribute("rows", strip);
		httpSession.setAttribute("total", map.get("total"));
		if(type == null || type == 1){
			return "redirect:/jsp/project/project_app.jsp";
		}else{
			return "redirect:/jsp/project/project_app2.jsp";
		}
		
	}
	
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
	 * 根据APP_ID获取项目内应用的详细信息，返回到项目内应用运行界面
	 * @param httpSession
	 * @param app_id
	 * @return
	 */
	@RequestMapping("/projectAppRun")
	public String projectAppRun(HttpSession httpSession , Integer app_id , Integer cs_id){
		
		// 从session中取出当前的project
		Project project = (Project)httpSession.getAttribute("project");
		
		// 需要查询出项目内的格式数据
		List<Source> sources = sourceService.getSourcesForUser();
		httpSession.setAttribute("sources", sources);// 采集源列表
		// 源数据字段
		List<List<String>> sourceDatas = new ArrayList<>();
		if (sources != null) {
			if (cs_id == null) {
				cs_id = sourceService.getSourcesForUserLimit(1).get(0).getCs_id();
			}
			Source source = sourceService.getSourceByCs_id(cs_id);
			source.setSourceFields(sourceFieldService.getSourceFields(cs_id));
			httpSession.setAttribute("source", source);// 采集源字段列表
			List<String> sourceDataIds = projectDataService.select(project.getId());
			sourceDatas = HBaseSourceDataDao.getSourceDataByIds(Integer.toString(cs_id), sourceDataIds,
					source.getSourceFields());
			httpSession.setAttribute("sourceDatas", sourceDatas);
		}
		
		Application application = applicationService.findPublicByid(app_id);
		httpSession.setAttribute("application", application);
		return "redirect:/jsp/project/project_apprun.jsp";
	}

}
