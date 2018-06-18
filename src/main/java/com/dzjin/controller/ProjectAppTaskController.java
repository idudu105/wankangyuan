package com.dzjin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dzjin.model.Project;
import com.dzjin.model.ProjectAppTask;
import com.dzjin.service.ProjectAppTaskService;
import com.liutianjun.pojo.Application;
import com.liutianjun.service.ApplicationService;

/**
 * 
 * 项目名称：wankangyuan 
 * 类名称：ProjectAppEndController 
 * 类描述： 应用结果controller
 * 创建人：dzjin 
 * 创建时间：2018年6月13日 下午7:50:34 
 * 修改人：dzjin 
 * 修改时间：2018年6月13日 下午7:50:34 
 * 修改备注： 
 * @version 
 *
 */
@Controller
@RequestMapping("/projectAppEnd")
public class ProjectAppTaskController {
	
	@Autowired
	ProjectAppTaskService projectAppTaskService;
	@Autowired
	ApplicationService applicationService;
	
	/**
	 * 查询应用结果
	 * @param httpSession
	 * @param type
	 * @param page
	 * @param strip
	 * @param searchWord
	 * @return
	 */
	@RequestMapping("/selectProjectAppEnd")
	public String selectProjectAppEnd(HttpSession httpSession , Integer type , Integer page , Integer strip , String searchWord){
		if(page == null){
			page = 1;
		}
		if(strip == null){
			strip = 12;
		}
		if(searchWord == null){
			searchWord = new String("");
			httpSession.setAttribute("projectAppTaskSearchWord", searchWord);
		}else{
			httpSession.setAttribute("projectAppTaskSearchWord", searchWord);
		}
		
		Project project = (Project) httpSession.getAttribute("project");
		Map<String , Object> map = projectAppTaskService.selectProjectAppTask(page, strip, project.getId(),searchWord);
		httpSession.setAttribute("projectAppTasks", map.get("list"));
		httpSession.setAttribute("page", page);
		httpSession.setAttribute("rows", strip);
		httpSession.setAttribute("total", map.get("total"));
		
		if(type == null || type == 1){
			return "/jsp/project/project_append.jsp";
		}else{
			return "/jsp/project/project_append2.jsp";
		}
		
	}
	
	/**
	 * 插入应用运行结果，主要是供甲方调用使用
	 * @param id
	 * @param param 运行参数
	 * @param project_id 项目ID
	 * @param user_id 用户ID
	 * @param app_id 应用ID
	 * @param username 用户名
	 * @param taskDescription 结果介绍
	 * @param taskName 结果名称
	 * @param session 
	 * @return
	 * 
	 * 测试样例：
	 * http://localhost:8098/wankangyuan/projectAppTask/insertProjectAppEnd?param=参数&project.id=69&userid=1&app.id=169&username=admin&taskDescription=应用描述信息&taskName=应用结果名称
	 */
	@RequestMapping("/insertProjectAppEnd")
	@ResponseBody
	public Map<String, Object> insertProjectAppEnd(
			@RequestParam(name = "param")String param ,
			@RequestParam(name = "project.id")String project_id ,
			@RequestParam(name = "userid")String user_id ,
			@RequestParam(name = "app.id")String app_id ,
			@RequestParam(name = "username")String username ,
			@RequestParam(name = "taskDescription")String taskDescription ,
			@RequestParam(name = "taskName")String taskName ,
			HttpSession session ,
			HttpServletRequest request){
		
		ProjectAppTask projectAppTask = new ProjectAppTask();
		projectAppTask.setParam(param);
		projectAppTask.setProject_id(project_id);
		projectAppTask.setUser_id(user_id);
		projectAppTask.setApp_id(app_id);
		projectAppTask.setUsername(username);
		projectAppTask.setTaskDescription(taskDescription);
		projectAppTask.setTaskName(taskName);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		projectAppTask.setCreate_datetime(simpleDateFormat.format(new Date()));
		
		String id = (String)request.getAttribute("taskId");
		Map<String, Object> map = new HashMap<String , Object>();
		if(id == null){
			//首次运行
			if(projectAppTaskService.insertProjectAppTask(projectAppTask) == 1){
				map.put("msg", "success");
				map.put("taskId", "uuid");
			}else{
				map.put("msg", "failure");
			}
		}else{
			//重新运行
			projectAppTask.setId(id);
			
			map.put("msg", "success");
			map.put("taskId", "uuid");
		}
		return map;
	}
	
	/**
	 * 重新运行应用或者查看应用参数
	 * @param httpSession
	 * @param task_id
	 * @param operType query查看参数	update重新运行应用
	 * @return
	 */
	@RequestMapping("/projectAppReRun")
	@ResponseBody
	public Map<String, Object> projectAppReRun(HttpSession httpSession , Integer task_id , String operType){
		
		Map<String, Object> map = new HashMap<>();
		ProjectAppTask projectAppTask = projectAppTaskService.getProjectAppTask(task_id);
		Application application = applicationService.selectByPrimaryKey(
				Integer.valueOf(projectAppTask.getApp_id()));
		String paraAddress = application.getParaAddress();
		//需要对地址进行解析
		if(paraAddress != null && !paraAddress.equals("") && paraAddress.indexOf('?') != -1){
			String head = paraAddress.split("[?]")[0];
			String newParaAddress = 
					head
					+"?project.id="+projectAppTask.getProject_id()
					+"&userid="+projectAppTask.getUser_id()
					+"&username="+projectAppTask.getUsername()
					+"&taskId="+projectAppTask.getId()
					+"&opertype="+operType
					+"&app.id="+projectAppTask.getApp_id();
			
			map.put("result", true);
			map.put("message", newParaAddress);
			
		}else{
			map.put("result", false);
		}
		
		return map;
	}
	
	/**
	 * 生成应用结果地址
	 * @param httpSession
	 * @param task_id
	 * @return
	 */
	@RequestMapping("/projectAppTaskResultEnd")
	@ResponseBody
	public Map<String, Object> projectAppTaskResultEnd(HttpSession httpSession , Integer task_id){
		
		Map<String, Object> map = new HashMap<>();
		ProjectAppTask projectAppTask = projectAppTaskService.getProjectAppTask(task_id);
		Application application = applicationService.selectByPrimaryKey(
				Integer.valueOf(projectAppTask.getApp_id()));
		String resultAddress = application.getResultAddress();
		//需要对地址进行解析
		if(resultAddress != null && !resultAddress.equals("") && resultAddress.indexOf('?') != -1){
			String head = resultAddress.split("[?]")[0];
			String newResultAddress = 
					head
					+"&userid="+projectAppTask.getUser_id()
					+"&username="+projectAppTask.getUsername()
					+"&taskId="+projectAppTask.getId();
			map.put("result", true);
			map.put("message", newResultAddress);
			
		}else{
			map.put("result", false);
		}
		
		return map;
	}
	
	/**
	 * 生成应用结果文件地址
	 * @param httpSession
	 * @param task_id
	 * @return
	 */
	@RequestMapping("/projectAppTaskResultFile")
	@ResponseBody
	public Map<String, Object> projectAppTaskResultFile(HttpSession httpSession , Integer task_id){
		
		Map<String, Object> map = new HashMap<>();
		ProjectAppTask projectAppTask = projectAppTaskService.getProjectAppTask(task_id);
		Application application = applicationService.selectByPrimaryKey(
				Integer.valueOf(projectAppTask.getApp_id()));
		String fileResultAddress = application.getFileResultAddress();
		//需要对地址进行解析
		if(fileResultAddress != null && !fileResultAddress.equals("") && fileResultAddress.indexOf('?') != -1){
			String head = fileResultAddress.split("[?]")[0];
			String newFileResultAddress = 
					head
					+"&userid="+projectAppTask.getUser_id()
					+"&username="+projectAppTask.getUsername()
					+"&taskId="+projectAppTask.getId();
			map.put("result", true);
			map.put("message", newFileResultAddress);
			
		}else{
			map.put("result", false);
		}
		
		return map;
	}
	
	/**
	 * 发布应用结果
	 * @param session
	 * @param taskIds
	 * @return
	 */
	@RequestMapping("/projectAppTaskRelease")
	@ResponseBody
	public Map<String, Object> projectAppTaskRelease(HttpSession session  , String taskIds){
		String[] task_ids = taskIds.split(",");
		int num = 0;
		for(int i  = 0 ; i<task_ids.length ; i++){
			if(projectAppTaskService.updateIsRelease(Integer.valueOf(task_ids[i]), 1) == 1){
				num++;
			}
		}
		Map<String, Object> map = new HashMap<String , Object>();
		map.put("result", true);
		map.put("message", num+"条记录发布成功，"+(task_ids.length - num) +"条记录发布失败！");
		return map;
	}
	
	/**
	 * 取消发布应用结果
	 * @param session
	 * @param taskIds
	 * @return
	 */
	@RequestMapping("/projectAppTaskUnRelease")
	@ResponseBody
	public Map<String, Object> projectAppTaskUnRelease(HttpSession session  , String taskIds){
		String[] task_ids = taskIds.split(",");
		int num = 0;
		for(int i  = 0 ; i<task_ids.length ; i++){
			if(projectAppTaskService.updateIsRelease(Integer.valueOf(task_ids[i]), 0) == 1){
				num++;
			}
		}
		Map<String, Object> map = new HashMap<String , Object>();
		map.put("result", true);
		map.put("message", num+"条记录取消发布成功，"+(task_ids.length - num) +"条记录取消发布失败！");
		return map;
	}
	
	/**
	 * 移除应用结果
	 * @param session
	 * @param taskIds
	 * @return
	 */
	@RequestMapping("/projectAppTaskDelete")
	@ResponseBody
	public Map<String, Object> projectAppTaskDelete(HttpSession session  , String taskIds){
		String[] task_ids = taskIds.split(",");
		int num = 0;
		for(int i  = 0 ; i<task_ids.length ; i++){
			if(projectAppTaskService.deleteProjectAppTask(Integer.valueOf(task_ids[i])) == 1){
				num++;
			}
		}
		Map<String, Object> map = new HashMap<String , Object>();
		map.put("result", true);
		map.put("message", num+"条记录取移除成功，"+(task_ids.length - num) +"条记录移除失败！");
		return map;
	}
	
}
