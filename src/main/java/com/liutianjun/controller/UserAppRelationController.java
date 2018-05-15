package com.liutianjun.controller;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.liutianjun.pojo.User;
import com.liutianjun.service.UserAppRelationService;
import com.liutianjun.service.UserService;

/**
 * 用户应用关系
 * @Title: UserAppRelationController.java  
 * @Package com.liutianjun.controller  
 * @Description: TODO
 * @author LiuTianJun  
 * @date 2018年5月9日  
 * @version V1.0
 */
@Controller
@RequestMapping("/userAppRelation")
public class UserAppRelationController {

	@Autowired
	private UserAppRelationService userAppRelationService;
	
	@Autowired
	private UserService userService;
	
	/**
	 * 添加应用到我的
	 * @Title: addToMine 
	 * @param httpSession
	 * @param ids
	 * @return 
	 * String
	 */
	@RequestMapping(value="/addToMine{index}",method=RequestMethod.POST)
	public String addToMine(Integer[] ids,
			@PathVariable String index,
			RedirectAttributes attributes) {
	    String username = (String)SecurityUtils.getSubject().getPrincipal();
	    User user = userService.selectByUsername(username);
	    String msg = "操作失败";
		int i = userAppRelationService.addToMineById(user.getId(), username, ids);
		if(i>0) {
			msg = "添加成功";
		}
		attributes.addFlashAttribute("msg", msg);
		return "redirect:/application/viewMine"+index;
	}
	
	/**
	 * 从我的中删除应用
	 * @Title: removeFromMine 
	 * @param httpSession
	 * @param ids
	 * @return 
	 * String
	 */
	@RequestMapping(value="/removeFromMine{index}",method=RequestMethod.POST)
	public String removeFromMine(Integer[] ids,
			@PathVariable String index,
			RedirectAttributes attributes) {
	    String username = (String)SecurityUtils.getSubject().getPrincipal();
        User user = userService.selectByUsername(username);
		
		String msg = "操作失败";
		int i = userAppRelationService.removeFromMineById(user.getId(), ids);
		if(i>0) {
			msg = "移除成功";
		}
		attributes.addFlashAttribute("msg", msg);
		return "redirect:/application/viewMine"+index;
	}
}
