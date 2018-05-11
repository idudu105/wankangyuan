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
    
    @Override
    public int insert(User record) {
        //加密密码
        passwordHelper.encryptPassword(record);
        record.setCreateTime(new Date());
        return userDao.insert(record);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return userDao.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKey(User record) {
        return userDao.updateByPrimaryKeySelective(record);
    }

    @Override
    public void changePassword(Integer userId, String newPassword) {
        User user = userDao.selectByPrimaryKey(userId);
        user.setPassword(newPassword);
        passwordHelper.encryptPassword(user);
        userDao.updateByPrimaryKey(user);
    }

    @Override
    public User selectByPrimaryKey(Integer id) {
        return userDao.selectByPrimaryKey(id);
    }

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
