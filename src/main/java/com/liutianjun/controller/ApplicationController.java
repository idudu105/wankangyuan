package com.liutianjun.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.liutianjun.pojo.Application;
import com.liutianjun.service.ApplicationService;

/**
 * 应用控制层
 * @Title: ApplicationController.java  
 * @Package com.liutianjun.controller  
 * @Description: TODO
 * @author LiuTianJun  
 * @date 2018年5月7日  
 * @version V1.0
 */
@Controller
@RequestMapping("/application")
public class ApplicationController {

	@Autowired
	private ApplicationService applicationService;
	
	/**
	 * 我的应用
	 * @Title: viewMine 
	 * @param model
	 * @return 
	 * String
	 */
	@RequestMapping(value="/viewMine",method=RequestMethod.GET)
	public String viewMine(@RequestParam(value="page", defaultValue="1")Integer page, 
            @RequestParam(value="rows", defaultValue="8")Integer rows, 
            @RequestParam(value="appName",required=false)String appName,
            Model model) {
		Map<String, Object> map = applicationService.findAll(page,rows,appName);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("appName", appName);
		return "jsp/application/mine.jsp";
	}
	
	/**
	 * 我的应用2
	 * @Title: viewMine2 
	 * @param model
	 * @return 
	 * String
	 */
	@RequestMapping(value="/viewMine2",method=RequestMethod.GET)
	public String viewMine2(@RequestParam(value="page", defaultValue="1")Integer page, 
            @RequestParam(value="rows", defaultValue="8")Integer rows, 
            @RequestParam(value="appName",required=false)String appName,
            Model model) {
		Map<String, Object> map = applicationService.findAll(page,rows,appName);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("appName", appName);
		return "jsp/application/mine2.jsp";
	}
	
	/**
	 * 我创建的应用
	 * @Title: viewCreate 
	 * @param page
	 * @param rows
	 * @param appName
	 * @param model
	 * @return 
	 * String
	 */
	@RequestMapping(value="/viewCreate",method=RequestMethod.GET)
	public String viewCreate(@RequestParam(value="page", defaultValue="1")Integer page, 
            @RequestParam(value="rows", defaultValue="8")Integer rows, 
            @RequestParam(value="appName",required=false)String appName,
            HttpServletRequest request,
            Model model) {
		//从session中获取当前用户名
		String creator = (String) request.getSession().getAttribute("userName");
		Map<String, Object> map = applicationService.findAll(page,rows,appName,creator);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("appName", appName);
		return "jsp/application/mine.jsp";
	}
	
	/**
	 * 我创建的应用2
	 * @Title: viewCreate2 
	 * @param page
	 * @param rows
	 * @param appName
	 * @param request
	 * @param model
	 * @return 
	 * String
	 */
	@RequestMapping(value="/viewCreate2",method=RequestMethod.GET)
	public String viewCreate2(@RequestParam(value="page", defaultValue="1")Integer page, 
			@RequestParam(value="rows", defaultValue="8")Integer rows, 
			@RequestParam(value="appName",required=false)String appName,
			HttpServletRequest request,
			Model model) {
		//从session中获取当前用户名
		String creator = (String) request.getSession().getAttribute("userName");
		Map<String, Object> map = applicationService.findAll(page,rows,appName,creator);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("appName", appName);
		return "jsp/application/mine2.jsp";
	}
	
	/**
	 * 公共的应用
	 * @Title: viewPublic 
	 * @param page
	 * @param rows
	 * @param appName
	 * @param model
	 * @return 
	 * String
	 */
	@RequestMapping(value="/viewPublic",method=RequestMethod.GET)
	public String viewPublic(@RequestParam(value="page", defaultValue="1")Integer page, 
            @RequestParam(value="rows", defaultValue="8")Integer rows, 
            @RequestParam(value="appName",required=false)String appName,
            Model model) {
		Map<String, Object> map = applicationService.findAll(page,rows,appName);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("appName", appName);
		return "jsp/application/mine.jsp";
	}
	
	/**
	 * 公共的应用2
	 * @Title: viewPublic2 
	 * @param page
	 * @param rows
	 * @param appName
	 * @param model
	 * @return 
	 * String
	 */
	@RequestMapping(value="/viewPublic2",method=RequestMethod.GET)
	public String viewPublic2(@RequestParam(value="page", defaultValue="1")Integer page, 
            @RequestParam(value="rows", defaultValue="8")Integer rows, 
            @RequestParam(value="appName",required=false)String appName,
            Model model) {
		Map<String, Object> map = applicationService.findAll(page,rows,appName);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("appName", appName);
		return "jsp/application/mine2.jsp";
	}
	
	/**
	 * 设置应用状态
	 * @Title: setStatus 
	 * @param cmd
	 * @param id
	 * @return 
	 * String
	 */
	@RequestMapping(value="/setStatus",method=RequestMethod.POST)
	public String setStatus(String cmd,Integer[] ids) {
		applicationService.setStatus(cmd,ids);
		return "redirect:/application/viewCreate2";
	}
	
	/**
	 * 应用添加界面
	 * @Title: ShowCreateForm 
	 * @return 
	 * String
	 */
	@RequestMapping(value="/create",method=RequestMethod.GET)
	public String showCreateForm() {
		
		return "jsp/application/edit.jsp";
	}
	
	/**
	 * 创建新应用
	 * @Title: create 
	 * @param record
	 * @return 
	 * String
	 */
	@RequestMapping(value="/create",method=RequestMethod.POST)
	public String create(Application record) {
		applicationService.insert(record);
		return "redirect:/application/list";
	}
	
	/**
	 * 应用编辑界面
	 * @Title: showUpdateForm 
	 * @return 
	 * String
	 */
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String showUpdateForm() {
		
		return "jsp/application/edit.jsp";
	}
	
	/**
	 * 编辑应用信息
	 * @Title: update 
	 * @return 
	 * String
	 */
	@RequestMapping(value="/create",method=RequestMethod.POST)
	public String update(Application record) {
		applicationService.updateByPrimaryKey(record);
		return "redirect:/application/list";
	}
	
	/**
	 * 删除应用
	 * @Title: delete 
	 * @param id
	 * @return 
	 * String
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String delete(Integer id) {
		applicationService.deleteByPrimaryKey(id);
		return "redirect:/application/list";
	}
	
}
