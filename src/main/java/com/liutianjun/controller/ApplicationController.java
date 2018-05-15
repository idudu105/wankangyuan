package com.liutianjun.controller;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	@RequestMapping(value="/viewMine{index}",method=RequestMethod.GET)
	public String viewMine(@RequestParam(value="page", defaultValue="1")Integer page, 
            @RequestParam(value="rows", defaultValue="8")Integer rows, 
            @RequestParam(value="appName",required=false)String appName,
            @PathVariable String index,
            Model model) {
	    
	    String username = (String)SecurityUtils.getSubject().getPrincipal();
		
		Map<String, Object> map = applicationService.findMine(page,rows,appName,username);
		@SuppressWarnings("unchecked")
		List<Application> list = (List<Application>) map.get("list");
		Set<String> set =new HashSet<>();
		for (Application application : list) {
			set.add(application.getAppType());
		}
		
		model.addAttribute("typeSet", set);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("page", page);
        model.addAttribute("rows", rows);
        model.addAttribute("appName", appName);
		return "jsp/application/app_mine"+index+".jsp";
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
	@RequestMapping(value="/viewCreate{index}",method=RequestMethod.GET)
	public String viewCreate(@RequestParam(value="page", defaultValue="1")Integer page, 
            @RequestParam(value="rows", defaultValue="8")Integer rows, 
            @RequestParam(value="appName",required=false)String appName,
            @PathVariable String index,
            Model model) {
	    String username = (String)SecurityUtils.getSubject().getPrincipal();
		Map<String, Object> map = applicationService.findAll(page,rows,appName,username);
		@SuppressWarnings("unchecked")
		List<Application> list = (List<Application>) map.get("list");
		Set<String> set =new HashSet<>();
		for (Application application : list) {
			set.add(application.getAppType());
		}
		
		model.addAttribute("typeSet", set);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("page", page);
        model.addAttribute("rows", rows);
        model.addAttribute("appName", appName);
		return "jsp/application/app_create"+index+".jsp";
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
	@RequestMapping(value="/viewPublic{index}",method=RequestMethod.GET)
	public String viewPublic(@RequestParam(value="page", defaultValue="1")Integer page, 
            @RequestParam(value="rows", defaultValue="8")Integer rows, 
            @RequestParam(value="appName",required=false)String appName,
            @PathVariable String index,
            Model model) {
		Map<String, Object> map = applicationService.findAllPublic(page,rows,appName);
		@SuppressWarnings("unchecked")
		List<Application> list = (List<Application>) map.get("list");
		Set<String> set =new HashSet<>();
		for (Application application : list) {
			set.add(application.getAppType());
		}
		
		model.addAttribute("typeSet", set);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("total", map.get("total"));
		
		model.addAttribute("page", page);
		model.addAttribute("rows", rows);
		model.addAttribute("appName", appName);
		return "jsp/application/app_public"+index+".jsp";
	}
	
	/**
	 * 设置应用属性
	 * @Title: setStatus 
	 * @param cmd
	 * @param id
	 * @return 
	 * String
	 */
	@RequestMapping(value="/setStatus{index}",method=RequestMethod.POST)
	public String setStatus(String cmd,Integer[] ids,
			@PathVariable String index,
			RedirectAttributes attributes) {
		int i = applicationService.setStatus(cmd,ids);
		String msg = "操作失败";
		if(i > 0) {
			msg = "操作成功";
		}
		attributes.addFlashAttribute("msg", msg);
		return "redirect:/application/viewCreate"+index;
	}
	
	/**
	 * 创建新应用
	 * @Title: create 
	 * @param record
	 * @return 
	 * String
	 */
	@RequestMapping(value="/create{index}",method=RequestMethod.POST)
	public String create(Application record,@PathVariable String index) {
		String username = (String)SecurityUtils.getSubject().getPrincipal();
		record.setCreator(username);
		record.setCreateTime(new Date());
		record.setStatus("私有");
		applicationService.insert(record);
		return "redirect:/application/viewCreate"+index;
	}
	
	/**
	 * 应用说明界面
	 * @Title: showUpdateForm 
	 * @return 
	 * String
	 */
	@RequestMapping(value="/explain",method=RequestMethod.GET)
	public String showExplain(Integer id, Model model) {
		Application application = applicationService.selectByPrimaryKey(id);
		model.addAttribute("application", application);
		return "jsp/application/app_explain.jsp";
	}
	
	/**
	 * 应用编辑界面
	 * @Title: showUpdateForm 
	 * @return 
	 * String
	 */
	@RequestMapping(value="/updateForm{index}",method=RequestMethod.GET)
	public String viewUpdateForm(Integer id, Model model, @PathVariable String index) {
		Application application = applicationService.selectByPrimaryKey(id);
		String strkewwords = application.getKeywords();
		if(StringUtils.isNotBlank(strkewwords)) {
			String[] keywords = strkewwords.split(",");
			model.addAttribute("keywords", keywords);
		}
		
		model.addAttribute("application", application);
		
		model.addAttribute("index", index);
		return "jsp/application/app_explain2.jsp";
	}
	
	/**
	 * 编辑应用信息
	 * @Title: update 
	 * @return 
	 * String
	 */
	@RequestMapping(value="/update{index}",method=RequestMethod.POST)
	public String update(Application record, 
			RedirectAttributes attributes,
			@PathVariable String index) {
		String msg = "操作失败";
		int i = applicationService.updateByPrimaryKey(record);
		if(i>0) {
			msg = "更新成功";
		}
		attributes.addFlashAttribute("msg", msg);
		return "redirect:/application/viewCreate"+index;
	}
	
	/**
	 * 删除应用
	 * @Title: delete 
	 * @param id
	 * @return 
	 * String
	 */
	@RequestMapping(value="/delete{index}",method=RequestMethod.POST)
	public String delete(Integer[] ids, 
			@PathVariable String index,
			RedirectAttributes attributes) {
		
		int i = applicationService.deleteByIds(ids);
		String msg = "操作失败";
		if(i>0) {
			msg = "删除成功";
		}
		attributes.addFlashAttribute("msg", msg);
		return "redirect:/application/viewCreate"+index;
	}
	
}
