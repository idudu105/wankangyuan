package com.liutianjun.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liutianjun.dao.UserDao;
import com.liutianjun.pojo.User;
import com.liutianjun.pojo.UserQuery;
import com.liutianjun.pojo.UserQuery.Criteria;
import com.liutianjun.service.PasswordHelper;
import com.liutianjun.service.RoleService;
import com.liutianjun.service.UserService;

/**
 * 用户服务实现
 * @author Administrator
 *
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;
    
    @Autowired
    private RoleService roleService;
    
    @Autowired
    private PasswordHelper passwordHelper;
    
    /**
     * 注册新用户
     * <p>Title: insert</p>  
     * <p>Description: </p>  
     * @param record
     * @return
     */
    @Override
    public int insert(User record) {
        //加密密码
        passwordHelper.encryptPassword(record);
        //设置注册时间
        record.setCreateTime(new Date());
        //状态设为有效
        record.setStatus(1);
        return userDao.insert(record);
    }

    /**
     * 根据主键删除用户
     * <p>Title: deleteByPrimaryKey</p>  
     * <p>Description: </p>  
     * @param id
     * @return
     */
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return userDao.deleteByPrimaryKey(id);
    }

    /**
     * 更新用户信息
     * <p>Title: updateByPrimaryKey</p>  
     * <p>Description: </p>  
     * @param record
     * @return
     */
    @Override
    public int updateByPrimaryKey(User record) {
        return userDao.updateByPrimaryKeySelective(record);
    }

    /**
     * 修改密码
     * <p>Title: changePassword</p>  
     * <p>Description: </p>  
     * @param userId
     * @param newPassword
     */
    @Override
    public void changePassword(Integer userId, String newPassword) {
        User user = userDao.selectByPrimaryKey(userId);
        user.setPassword(newPassword);
        passwordHelper.encryptPassword(user);
        userDao.updateByPrimaryKey(user);
    }

    /**
     * 根据主键查找用户
     * <p>Title: selectByPrimaryKey</p>  
     * <p>Description: </p>  
     * @param id
     * @return
     */
    @Override
    public User selectByPrimaryKey(Integer id) {
        return userDao.selectByPrimaryKey(id);
    }

    /**
     * 根据用户名查找用户
     * <p>Title: selectByUsername</p>  
     * <p>Description: </p>  
     * @param username
     * @return
     */
    @Override
    public User selectByUsername(String username) {
        UserQuery example = new UserQuery();
        Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(username);
        List<User> list = userDao.selectByExample(example);
        if(list != null && list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    /**
     * 根据手机号查找用户
     * <p>Title: selectByPhone</p>  
     * <p>Description: </p>  
     * @param phone
     * @return
     */
	@Override
	public User selectByPhone(String phone) {
		UserQuery example = new UserQuery();
        Criteria criteria = example.createCriteria();
        criteria.andPhoneEqualTo(phone);
        List<User> list = userDao.selectByExample(example);
        if(list != null && list.size() > 0) {
            return list.get(0);
        }
		return null;
	}

	/**
	 * 根据邮箱查找用户
	 * <p>Title: selectByEmail</p>  
	 * <p>Description: </p>  
	 * @param email
	 * @return
	 */
	@Override
	public User selectByEmail(String email) {
		UserQuery example = new UserQuery();
        Criteria criteria = example.createCriteria();
        criteria.andEmailEqualTo(email);
        List<User> list = userDao.selectByExample(example);
        if(list != null && list.size() > 0) {
            return list.get(0);
        }
		return null;
	}


    /**
     * 查找所有用户
     * <p>Title: findAll</p>  
     * <p>Description: </p>  
     * @return
     */
    @Override
    public Map<String,Object> findAll() {
        UserQuery example = new UserQuery();
        int total = userDao.countByExample(example);
        List<User> list = userDao.selectByExample(example);
        Map<String,Object> map = new HashMap<>();
        map.put("list", list);
        map.put("total", total);
        return map;
    }

    /**
     * 查找所有用户，带分页
     * <p>Title: findAll</p>  
     * <p>Description: </p>  
     * @param page
     * @param rows
     * @param username
     * @return
     */
    @Override
    public Map<String,Object> findAll(Integer page, Integer rows, String username) {
        UserQuery example = new UserQuery();
        Criteria criteria = example.createCriteria();
        if(StringUtils.isNotBlank(username)) {
            criteria.andUsernameLike("%"+username+"%");
        }
        
        int total = userDao.countByExample(example);
        example.setPageNo(page);
        example.setPageSize(rows);
        
        List<User> list = userDao.selectByExample(example);
        Map<String,Object> map = new HashMap<>();
        map.put("list", list);
        map.put("total", total);
        return map;
    }

    /**
     * 根据用户名查找权限
     * <p>Title: findPermissions</p>  
     * <p>Description: </p>  
     * @param username
     * @return
     */
    @Override
    public Set<String> findPermissions(String username) {
        User user = selectByUsername(username);
        if(user == null) {
            return Collections.emptySet();
        }
        String roleIdsStr = user.getRoleIds();
        
        List<Integer> list = new ArrayList<>();
        
        String[] roleIdStrs = roleIdsStr.split(",");
        for(String roleIdStr : roleIdStrs) {
            if(StringUtils.isEmpty(roleIdStr)) {
                continue;
            }
            list.add(Integer.valueOf(roleIdStr));
        }
        
        return roleService.findPermissions(list.toArray(new Integer[0]));
    }

    /**
     * 根据用户名查找角色
     * <p>Title: findRoles</p>  
     * <p>Description: </p>  
     * @param username
     * @return
     */
    @Override
    public Set<String> findRoles(String username) {
        User user = selectByUsername(username);
        if(user == null) {
            return Collections.emptySet();
        }
        
        String roleIdsStr = user.getRoleIds();
        List<Integer> list = new ArrayList<>();
        String[] roleIdStrs = roleIdsStr.split(",");
        for(String roleIdStr : roleIdStrs) {
            if(StringUtils.isEmpty(roleIdStr)) {
                continue;
            }
            list.add(Integer.valueOf(roleIdStr));
        }
        
        return roleService.findRoles(list.toArray(new Integer[0]));
    }

}
