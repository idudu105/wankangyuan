package com.liutianjun.service;

import java.util.List;

import com.liutianjun.pojo.Message;

/**
 * 通知管理
 * @Title: MessageService.java  
 * @Package com.liutianjun.service  
 * @Description: TODO
 * @author LiuTianJun  
 * @date 2018年5月31日  
 * @version V1.0
 */
public interface MessageService {

	//发送系统通知
	int sendSysMessage(Integer userId,String content);
	
	//发送好友申请
	int sendFriendRequest(Integer userId, Integer objId);
	
	//发送话题回复
	int sendTopicReply(Integer userId, Integer objId);
	
	//根据类型清空所有通知
	int clearAllMessageByType(Integer userId, Integer type);
	
	//单条删除通知
	int deleteByPrimaryKey(Integer id);
	
	//处理好友申请
	int dealFriendRequest(Integer id, Integer cmd);
	
	//根据类型显示通知列表
	List<Message> findMessageByType(Integer userId, Integer type);
}
