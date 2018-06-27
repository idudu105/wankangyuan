package com.dzjin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dzjin.service.AdminProjectService;

/**
 * 
 * 项目名称：wankangyuan 
 * 类名称：AdminProjectController 
 * 类描述： 后台项目管理
 * 
 * 创建人：dzjin 
 * 创建时间：2018年6月26日 下午5:11:49 
 * 修改人：dzjin 
 * 修改时间：2018年6月26日 下午5:11:49 
 * 修改备注： 
 * @version 
 *
 */
@Controller
@RequestMapping("/adminProject")
public class AdminProjectController {
	
	@Autowired
	AdminProjectService  adminProjectService;
	
	@RequestMapping("/selectAdminProject")
	public String selectAdminProject(HttpSession session , Integer page , Integer strip , String searchWord , Integer type){
		
		if(page == null){
			page = 1;
		}
		if(strip == null){
			strip = 12;
		}
		if(searchWord == null){
			searchWord = new String("");
			session.setAttribute("adminProjectSearchWord", searchWord);
		}else{
			session.setAttribute("adminProjectSearchWord", searchWord);
		}
		session.setAttribute("adminProjectType", type);
		
		Map<String, Object> map = null;
		if(type == null || type == 2){
			map = adminProjectService.selectProject(page, strip, searchWord);
		}else{
			map = adminProjectService.selectIsShowProject(page, strip, searchWord , type);
		}
		session.setAttribute("adminProjects", map.get("list"));
		session.setAttribute("total", map.get("total"));
		session.setAttribute("page", page);
		session.setAttribute("rows", strip);
		
		return "/admin/promanage.jsp";
	}
	
	@RequestMapping("/updateProjectIsShow1")
	@ResponseBody
	public Map<String, Object> updateProjectIsShow1(HttpSession session , String ids){
		Map<String, Object> map = new HashMap<>();
		String[]idStrings = ids.split(",");
		int num = 0;
		for(int i=0;i<idStrings.length;i++){
			if(adminProjectService.updateProjectIsShow1(Integer.valueOf(idStrings[i])) == 1){
				num++;
			}
		}
		map.put("result", true);
		map.put("message", num+"个项目发布到门户成功，"+(idStrings.length-num)+"个项目发布到门户失败！");
		return map;
	}
	
	@RequestMapping("/updateProjectIsShow0")
	@ResponseBody
	public Map<String, Object> updateProjectIsShow0(HttpSession session , String ids){
		Map<String, Object> map = new HashMap<>();
		String[]idStrings = ids.split(",");
		int num = 0;
		for(int i=0;i<idStrings.length;i++){
			if(adminProjectService.updateProjectIsShow0(Integer.valueOf(idStrings[i])) == 1){
				num++;
			}
		}
		map.put("result", true);
		map.put("message", num+"个项目取消发布到门户成功，"+(idStrings.length-num)+"个项目取消发布到门户失败！");
		return map;
	}

}
