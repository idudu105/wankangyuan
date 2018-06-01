package com.liutianjun.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liutianjun.dao.MessageDao;
import com.liutianjun.dao.UserDao;
import com.liutianjun.pojo.Message;
import com.liutianjun.pojo.MessageQuery;
import com.liutianjun.pojo.MessageQuery.Criteria;
import com.liutianjun.pojo.User;
import com.liutianjun.service.MessageService;

/**
 * 消息服务
 * @Title: MessageServiceimpl.java  
 * @Package com.liutianjun.service.impl  
 * @Description: TODO
 * @author LiuTianJun  
 * @date 2018年5月31日  
 * @version V1.0
 */
@Service
public class MessageServiceimpl implements MessageService {

	@Autowired
	private MessageDao messageDao;
	
	@Autowired
	private UserDao userDao;
	
	/**
	 * 发送系统消息
	 * <p>Title: sendSysMessage</p>  
	 * <p>Description: </p>  
	 * @param userId
	 * @param content
	 * @return
	 */
	@Override
	public int sendSysMessage(Integer userId, String content) {
		Message message = new Message();
		message.setCreateTime(new Date());
		message.setUserId(userId);
		message.setContent(content);
		message.setType(0);
		return messageDao.insert(message);
	}

	/**
	 * 发送好友申请
	 * <p>Title: sendFriendRequest</p>  
	 * <p>Description: </p>  
	 * @param userId
	 * @param objId
	 * @return
	 */
	@Override
	public int sendFriendRequest(Integer userId, Integer objId) {
		User obj = userDao.selectByPrimaryKey(objId);
		Message message = new Message();
		message.setCreateTime(new Date());
		message.setUserId(userId);
		message.setObjId(objId);
		message.setStatus(0);
		message.setType(1);
		message.setContent(obj.getUsername()+"申请加您为好友，请及时处理。");
		return messageDao.insert(message);
	}

	/**
	 * 发送话题回复
	 * <p>Title: sendTopicReply</p>  
	 * <p>Description: </p>  
	 * @param userId
	 * @param objId
	 * @return
	 */
	@Override
	public int sendTopicReply(Integer userId, Integer objId) {
		User obj = userDao.selectByPrimaryKey(objId);
		Message message = new Message();
		message.setCreateTime(new Date());
		message.setUserId(userId);
		message.setObjId(objId);
		message.setType(2);
		message.setContent(obj.getUsername()+"回复了您的话题，请查看。");
		return messageDao.insert(message);
	}

	/**
	 * 根据类型清理消息
	 * <p>Title: clearAllMessageByType</p>  
	 * <p>Description: </p>  
	 * @param userId
	 * @param type
	 * @return
	 */
	@Override
	public int clearAllMessageByType(Integer userId, Integer type) {
		MessageQuery example = new MessageQuery();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		//-1表示所有类型
		if(type != -1) {
			criteria.andTypeEqualTo(type);
		}
		return messageDao.deleteByExample(example);
	}

	/**
	 * 根据消息id单独删除
	 * <p>Title: deleteByPrimaryKey</p>  
	 * <p>Description: </p>  
	 * @param id
	 * @return
	 */
	@Override
	public int deleteByPrimaryKey(Integer id) {
		return messageDao.deleteByPrimaryKey(id);
	}

	/**
	 * 处理好友请求
	 * <p>Title: dealFriendRequest</p>  
	 * <p>Description: </p>  
	 * @param id
	 * @param cmd
	 * @return
	 */
	@Override
	public int dealFriendRequest(Integer id, Integer cmd) {
		Message message = messageDao.selectByPrimaryKey(id);
		message.setStatus(1);
		if(0 == cmd) {
			message.setResult("已拒绝");
		}
		if(1 == cmd) {
			message.setResult("已通过");
		}
		message.setUpdateTime(new Date());
		return messageDao.updateByPrimaryKey(message);
	}

	/**
	 * 根据类型查找通知列表
	 * <p>Title: findMessageByType</p>  
	 * <p>Description: </p>  
	 * @param userId
	 * @param type
	 * @return
	 */
	@Override
	public List<Message> findMessageByType(Integer userId, Integer type) {
		MessageQuery example = new MessageQuery();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		//-1表示所有类型
		if(type != -1) {
			criteria.andTypeEqualTo(type);
		}
		example.setOrderByClause("create_time desc");
		
		return messageDao.selectByExample(example);
	}

}
