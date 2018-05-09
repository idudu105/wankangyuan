package com.liutianjun.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liutianjun.service.UserAppRelationService;

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
	
	/**
	 * 添加应用到我的
	 * @Title: addToMine 
	 * @param httpSession
	 * @param ids
	 * @return 
	 * String
	 */
	@RequestMapping(value="/addToMine",method=RequestMethod.POST)
	public String addToMine(HttpSession httpSession, Integer[] ids) {
		Integer userId = (Integer) httpSession.getAttribute("id");
		userAppRelationService.addToMineById(userId, ids);
		return "redirect:/application/viewPublic";
	}
	
	/**
	 * 从我的中删除应用
	 * @Title: removeFromMine 
	 * @param httpSession
	 * @param ids
	 * @return 
	 * String
	 */
	@RequestMapping(value="/removeFromMine",method=RequestMethod.POST)
	public String removeFromMine(HttpSession httpSession, Integer[] ids) {
		Integer userId = (Integer) httpSession.getAttribute("id");
		userAppRelationService.removeFromMineById(userId, ids);
		return "redirect:/application/viewPublic";
	}
}
