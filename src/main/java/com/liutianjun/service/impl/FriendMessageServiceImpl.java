package com.liutianjun.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liutianjun.dao.FriendMessageDao;
import com.liutianjun.pojo.FriendMessage;
import com.liutianjun.pojo.FriendMessageQuery;
import com.liutianjun.pojo.FriendMessageQuery.Criteria;
import com.liutianjun.pojo.Friends;
import com.liutianjun.pojo.User;
import com.liutianjun.service.FriendMessageService;
import com.liutianjun.service.FriendsService;
import com.liutianjun.service.UserService;

/**
 * 好友消息Impl
 * @Title: FriendMessageServiceImpl.java  
 * @Package com.liutianjun.service.impl  
 * @Description: TODO
 * @author LiuTianJun  
 * @date 2018年6月7日  
 * @version V1.0
 */
@Service
public class FriendMessageServiceImpl implements FriendMessageService {

	@Autowired
	private UserService userService;
	
	@Autowired
	private FriendMessageDao friendMessageDao;
	
	@Autowired
	private FriendsService  friendsService;
	
	/**
	 * 发送好友消息
	 * <p>Title: sendFriendMessage</p>  
	 * <p>Description: </p>  
	 * @param username
	 * @param objname
	 * @param content
	 * @return
	 */
	@Override
	public int sendFriendMessage(String username, String objname, String content) {
		User sender = userService.selectByUsername(username);
		User receiver = userService.selectByUsername(objname);
		FriendMessage friendMessage = new FriendMessage();
		friendMessage.setSenderId(sender.getId());
		friendMessage.setSenderName(username);
		friendMessage.setSenderHeadimg(sender.getHeadimg());
		friendMessage.setReceiverId(receiver.getId());
		friendMessage.setReceiverName(objname);
		friendMessage.setReceiverHeadimg(receiver.getHeadimg());
		friendMessage.setContent(content);
		friendMessage.setSendTime(new Date());
		return friendMessageDao.insert(friendMessage);
	}


	/**
	 * 获取最新的好友消息
	 * <p>Title: getRecentMessage</p>  
	 * <p>Description: </p>  
	 * @param receiverId
	 * @param senderId
	 * @return
	 */
	@Override
	public List<FriendMessage> getFriendRecentMessageList(Integer receiverId, Integer senderId) {
		FriendMessageQuery example = new FriendMessageQuery();
		Criteria criteria = example.createCriteria();
		criteria.andReceiverIdEqualTo(receiverId);
		criteria.andSenderIdEqualTo(senderId);
		List<FriendMessage> list = friendMessageDao.selectByExample(example);
		return list;
	}

	/**
	 * 获取所有好友的最新消息
	 * <p>Title: findRecentMessageList</p>  
	 * <p>Description: </p>  
	 * @param receiverId
	 * @return
	 */
	@Override
	public List<FriendMessage> findAllRecentMessageList(Integer receiverId) {
		List<Friends> allMyFriends = friendsService.findAllMyFriends(receiverId, null);
		List<FriendMessage> list = new ArrayList<>();
		FriendMessage friendMessage = null;
		for (Friends friends : allMyFriends) {
			if(null != friends && null != friends.getFriendId()) {
				List<FriendMessage> friendRecentMessageList = getFriendRecentMessageList(receiverId, friends.getFriendId());
				if(friendRecentMessageList != null && friendRecentMessageList.size()>0) {
					friendMessage = friendRecentMessageList.get(friendRecentMessageList.size()-1);
					if(null != friendMessage) {
						list.add(friendMessage);
					}
				}
			}
		}
		
		return list;
	}

	/**
	 * 清空我的所有好友消息
	 * <p>Title: cleanAllMyMessages</p>  
	 * <p>Description: </p>  
	 * @param receiverId
	 * @return
	 */
	@Override
	public int cleanAllMyMessages(Integer receiverId) {
		FriendMessageQuery example = new FriendMessageQuery();
		Criteria criteria = example.createCriteria();
		criteria.andReceiverIdEqualTo(receiverId);
		return friendMessageDao.deleteByExample(example);
	}

	/**
	 * 通过主键删除
	 * <p>Title: deleteFriendMessage</p>  
	 * <p>Description: </p>  
	 * @param id
	 * @return
	 */
	@Override
	public int deleteFriendMessage(Integer id) {
		if(null != id) {
			return friendMessageDao.deleteByPrimaryKey(id);
		}
		return 0;
	}

}
