package com.liutianjun.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.liutianjun.pojo.SysConfig;
import com.liutianjun.service.SysConfigService;

/**
 * 系统配置Controller
 * @Title: SysConfigController.java  
 * @Package com.liutianjun.controller  
 * @Description: TODO
 * @author LiuTianJun  
 * @date 2018年5月25日  
 * @version V1.0
 */
@Controller
@RequestMapping("/admin")
public class SysConfigController {

	@Autowired
	private SysConfigService sysConfigService;
	
	/**
	 * 显示系统配置
	 * @Title: viewSysConfigManage 
	 * @param model
	 * @return 
	 * String
	 */
	@RequestMapping(value="/SysConfigManage",method=RequestMethod.GET)
	public String viewSysConfigManage(Model model) {
		SysConfig sysConfig = sysConfigService.selectByPrimaryKey(1);
		model.addAttribute("sysConfig", sysConfig);
		return "admin/sysmanage.jsp";
	}
	
	/**
	 * 更新系统配置
	 * @Title: updateSysConfigManage 
	 * @param sysConfig
	 * @param attributes
	 * @return 
	 * String
	 */
	@RequestMapping(value="/SysConfigManage",method=RequestMethod.POST)
	public String updateSysConfigManage(SysConfig sysConfig,RedirectAttributes attributes) {
		if(1 == sysConfigService.updateByPrimaryKey(sysConfig)) {
			attributes.addFlashAttribute("msg", "更新成功");
		}else {
			attributes.addFlashAttribute("msg", "更新失败");
		}
		
		return "redirect:/admin/SysConfigManage";
	}
	
	/**
	 * 显示后台首页
	 * @Title: viewIndex 
	 * @return 
	 * String
	 */
	@RequestMapping(value="/viewIndex",method=RequestMethod.GET)
	public String viewIndex() {
		return "/admin/index.jsp";
	}
	
}
