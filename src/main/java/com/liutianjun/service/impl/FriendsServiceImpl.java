package com.liutianjun.service.impl;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liutianjun.dao.FriendsDao;
import com.liutianjun.dao.UserDao;
import com.liutianjun.pojo.Friends;
import com.liutianjun.pojo.FriendsQuery;
import com.liutianjun.pojo.FriendsQuery.Criteria;
import com.liutianjun.pojo.Role;
import com.liutianjun.pojo.User;
import com.liutianjun.service.FriendsService;
import com.liutianjun.service.RoleService;

/**
 * 好友管理Impl
 * @Title: FriendsServiceImpl.java  
 * @Package com.liutianjun.service.impl  
 * @Description: TODO
 * @author LiuTianJun  
 * @date 2018年5月31日  
 * @version V1.0
 */
@Service
public class FriendsServiceImpl implements FriendsService {

	@Autowired
	private FriendsDao friendsDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private RoleService roleService;
	
	/**
	 * 添加好友
	 * <p>Title: insert</p>  
	 * <p>Description: </p>  
	 * @param userId
	 * @param friendsId
	 * @return
	 */
	@Override
	public int insert(Integer userId, Integer friendId) {
		
		Friends friends = new Friends();
		friends.setUserId(userId);
		friends.setFriendId(friendId);
		
		friends.setCreateTime(new Date());
		
		copyUserToFriends(friendId, friends);
		
		return friendsDao.insert(friends);
	}

	/**
	 * 批量删除好友
	 * <p>Title: deleteByUserIdAndFriendsId</p>  
	 * <p>Description: </p>  
	 * @param userId
	 * @param friendsIds
	 * @return
	 */
	@Override
	public int deleteByUserIdAndFriendsId(Integer userId, Integer[] friendsIds) {
		if(null != friendsIds && friendsIds.length > 0) {
			FriendsQuery example = new FriendsQuery();
			Criteria criteria = example.createCriteria();
			criteria.andUserIdEqualTo(userId);
			criteria.andFriendIdIn(Arrays.asList(friendsIds));
			//双向删除
			FriendsQuery example2 = new FriendsQuery();
			Criteria criteria2 = example2.createCriteria();
			criteria2.andUserIdIn(Arrays.asList(friendsIds));
			criteria2.andFriendIdEqualTo(userId);
			friendsDao.deleteByExample(example2);
			
			return friendsDao.deleteByExample(example);
		}
		return 0;
	}

	/**
	 * 获取我的好友列表
	 * <p>Title: findAllMyFriends</p>  
	 * <p>Description: </p>  
	 * @param userId
	 * @return
	 */
	@Override
	public List<Friends> findAllMyFriends(Integer userId,String friendName) {
		FriendsQuery example = new FriendsQuery();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		if(null != friendName) {
			criteria.andFriendNameLike("%"+friendName+"%");
		}
		return friendsDao.selectByExample(example);
	}

	/**
	 * 更新我的好友列表
	 * <p>Title: updateFriendsInfo</p>  
	 * <p>Description: </p>  
	 * @param userId
	 * @return
	 */
	@Override
	public int updateFriendsInfo(Integer userId) {
		List<Friends> list = findAllMyFriends(userId, null);
		int i = 0;
		if(null != list && list.size() > 0) {
			for (Friends friends : list) {
				copyUserToFriends(friends.getFriendId(), friends);
				friends.setUpdateTime(new Date());
				i += friendsDao.updateByPrimaryKey(friends);
			}
		}
		return i;
	}
	
	/**
	 * 拷贝用户基本信息到好友信息
	 * @Title: copyUserToFriends 
	 * @param friendsId
	 * @param friends 
	 * void
	 */
	private void copyUserToFriends(Integer friendsId, Friends friends) {
		User friendUser = userDao.selectByPrimaryKey(friendsId);
		friends.setFriendEmail(friendUser.getEmail());
		friends.setFriendHeadimg(friendUser.getHeadimg());
		friends.setFriendName(friendUser.getUsername());
		friends.setFriendProfile(friendUser.getPersonalProfile());
		
		Role role = roleService.selectByPrimaryKey(Integer.valueOf(friendUser.getRoleIds()));
		friends.setFriendRolename(role.getDescription());
	}

}
