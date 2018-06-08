package com.liutianjun.controller;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.liutianjun.pojo.FriendMessage;
import com.liutianjun.pojo.Friends;
import com.liutianjun.pojo.User;
import com.liutianjun.service.FriendMessageService;
import com.liutianjun.service.FriendsService;
import com.liutianjun.service.UserService;

/**
 * 好友消息Controller
 * @Title: FriendMessageController.java  
 * @Package com.liutianjun.controller  
 * @Description: TODO
 * @author LiuTianJun  
 * @date 2018年6月7日  
 * @version V1.0
 */
@Controller
@RequestMapping("/friendMessage")
public class FriendMessageController {

	@Autowired
	private FriendMessageService friendMessageService;
	
	@Autowired
	private FriendsService friendsService;
	
	@Autowired
	private UserService userService;
	
	/**
	 * 好友消息列表
	 * @Title: viewFriendMessage 
	 * @param model
	 * @return 
	 * String
	 */
	@RequestMapping(value="/viewFriendMessage", method=RequestMethod.GET)
	public String viewFriendMessage(Model model) {
		//获取用户名
	    String username = (String)SecurityUtils.getSubject().getPrincipal();
	    //获取用户
	    User user = userService.selectByUsername(username);
		List<FriendMessage> list = friendMessageService.findAllRecentMessageList(user.getId());
		model.addAttribute("list", list);
		return "jsp/friends/message_list.jsp";
	}
	
	/**
	 * 获取好友的最新消息
	 * @Title: getRecentMessage 
	 * @param senderId
	 * @return 
	 * String
	 */
	@RequestMapping(value="/getRecentMessage",method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String getRecentMessage (Integer senderId) {
		try {
			//获取用户名
			String username = (String)SecurityUtils.getSubject().getPrincipal();
			//获取用户
			User user = userService.selectByUsername(username);
			//获取好友的最新消息
			List<FriendMessage> friendRecentMessageList = friendMessageService.getFriendRecentMessageList(user.getId(), senderId);
			if(null != friendRecentMessageList && friendRecentMessageList.size() > 0) {
				ObjectMapper objectMapper = new ObjectMapper();
				String jsonStr = objectMapper.writeValueAsString(friendRecentMessageList);
				for (FriendMessage friendMessage : friendRecentMessageList) {
					friendMessageService.deleteFriendMessage(friendMessage.getId());
				}
				return jsonStr;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 进入好友聊天页面
	 * @Title: viewSendMessage 
	 * @param objId
	 * @param model
	 * @return 
	 * String
	 */
	@RequestMapping(value="/viewSendMessage", method=RequestMethod.GET)
	public String viewSendMessage(Integer objId, Model model, RedirectAttributes attributes) {
		//获取用户名
	    String username = (String)SecurityUtils.getSubject().getPrincipal();
	    //获取用户
	    User user = userService.selectByUsername(username);
	    Boolean isFriend = false;
		List<Friends> friendsList = friendsService.findAllMyFriends(user.getId(), null);
		for (Friends friends : friendsList) {
			if(objId == friends.getFriendId()) {
				isFriend = true;
			}
		}
		if(isFriend) {
			List<FriendMessage> list = friendMessageService.findAllRecentMessageList(user.getId());
			model.addAttribute("list", list);
			User obj = userService.selectByPrimaryKey(objId);
			model.addAttribute("obj", obj);
			return "jsp/friends/message_send.jsp";
		}
		attributes.addFlashAttribute("msg", "你只能和你的好友聊天");
		return "redirect:/friendMessage/viewFriendMessage";
	}
	
	
	
}
