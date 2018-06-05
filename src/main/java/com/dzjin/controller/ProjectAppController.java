package com.dzjin.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dzjin.service.ProjectAppService;

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
	
	@RequestMapping("/selectProjectApp")
	public String selectProjectApp(HttpSession httpSession , Integer p_id , Integer page , Integer strip){
		if(page == null){
			page = 1;
		}
		if(strip == null){
			strip = 10;
		}
		Map<String, Object> map = projectAppService.selectProjectApp(p_id, page, strip);
		httpSession.setAttribute("projectApplications", map.get("list"));
		
		return "redirect:/jsp/project/project_app.jsp";
	}

}
