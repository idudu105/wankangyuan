package com.liutianjun.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liutianjun.service.FriendsService;

@Controller
@RequestMapping("/friends")
public class FriendsController {

	@Autowired
	private FriendsService friendsService;
	
	@RequestMapping(value="viewFriendsManage",method=RequestMethod.GET)
	public String viewFriendsManage() {
		
		return "jsp/friends/friend_manage.jsp";
	}
	
}
