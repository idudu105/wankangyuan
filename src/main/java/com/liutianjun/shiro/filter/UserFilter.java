package com.liutianjun.shiro.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.web.filter.PathMatchingFilter;
import org.springframework.beans.factory.annotation.Autowired;

import com.liutianjun.pojo.User;
import com.liutianjun.service.ResourceService;
import com.liutianjun.service.UserService;


/**
 * <p>User: Zhang Kaitao
 * <p>Date: 14-2-15
 * <p>Version: 1.0
 */
public class UserFilter extends PathMatchingFilter {

    @Autowired
    private UserService userService;
    
    @Autowired
    private ResourceService resourceService;
    
    @Override
    protected boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {

        String username = (String)SecurityUtils.getSubject().getPrincipal();
        request.setAttribute("user", userService.selectByUsername(username));
        /*
        
        Set<String> permissions = userService.findPermissions(username);
        List<Resource> menus = resourceService.findMenus(permissions);
        HttpServletRequest req = (HttpServletRequest) request;
        req.getSession().setAttribute("menus", menus);
        */
        return true;
    }
}
