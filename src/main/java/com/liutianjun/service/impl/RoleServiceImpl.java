package com.liutianjun.service.impl;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liutianjun.dao.RoleDao;
import com.liutianjun.pojo.Role;
import com.liutianjun.pojo.RoleQuery;
import com.liutianjun.pojo.RoleQuery.Criteria;
import com.liutianjun.service.ResourceService;
import com.liutianjun.service.RoleService;

/**
 * 角色服务实现
 * @author Administrator
 *
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;
    
    @Autowired
    private ResourceService resourceService;
    
    @Override
    public int insert(Role record) {
        return roleDao.insert(record);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return roleDao.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKey(Role record) {
        return roleDao.updateByPrimaryKeySelective(record);
    }

    @Override
    public Role selectByPrimaryKey(Integer id) {
        return roleDao.selectByPrimaryKey(id);
    }

    @Override
    public Map<String, Object> findAll() {
        RoleQuery example = new RoleQuery();
        int total = roleDao.countByExample(example);
        List<Role> list = roleDao.selectByExample(example);
        
        Map<String,Object> map = new HashMap<>();
        map.put("total", total);
        map.put("list", list);
        return map;
    }

    @Override
    public Map<String, Object> findAll(Integer page, Integer rows, String role) {
        RoleQuery example = new RoleQuery();
        Criteria criteria = example.createCriteria();
        if(StringUtils.isNotBlank(role)) {
            criteria.andRoleLike("%"+role+"%");
        }
        int total = roleDao.countByExample(example);
        
        example.setPageNo(page);
        example.setPageSize(rows);
        
        List<Role> list = roleDao.selectByExample(example);
        
        Map<String,Object> map = new HashMap<>();
        map.put("total", total);
        map.put("list", list);
        return map;
    }

    @Override
    public Set<String> findPermissions(Integer[] roleIds) {
        Set<Integer> ResourceIds = new HashSet<>();
        for (Integer roleId : roleIds) {
            Role role = selectByPrimaryKey(roleId);
            if(role != null) {
                String resourceIds = role.getResourceIds();
                String[] resourceIdc = resourceIds.split(",");
                for (String resourceId : resourceIdc) {
                    if(StringUtils.isEmpty(resourceId)) {
                        continue;
                    }
                    ResourceIds.add(Integer.valueOf(resourceId));
                }
            }
        }
        return resourceService.findPermissions(ResourceIds);
    }

    @Override
    public Set<String> findRoles(Integer... roleIds) {
        Set<String> roles = new HashSet<String>();
        for(Integer roleId : roleIds) {
            Role role = selectByPrimaryKey(roleId);
            if(role != null) {
                roles.add(role.getRole());
            }
        }
        return roles;
    }

}
