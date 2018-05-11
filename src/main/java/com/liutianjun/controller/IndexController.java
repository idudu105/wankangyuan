package com.liutianjun.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.liutianjun.pojo.User;
import com.liutianjun.shiro.bind.annotation.CurrentUser;


@Controller
public class IndexController {


    @RequestMapping("/")
    public String index(@CurrentUser User loginUser, HttpSession httpSession) {
        /*Set<String> permissions = sysUserService.findPermissions(loginUser.getUsername());
        List<SysResource> menus = sysResourceService.findMenus(permissions);
        httpSession.setAttribute("menus", menus);*/
        return "/login";
    }

    @RequestMapping("/welcome")
    public String welcome() {
        return "welcome";
    }


}
