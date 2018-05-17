package com.liutianjun.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liutianjun.service.UserService;

/**
 * 用户Controller
 * @Title: UserController.java  
 * @Package com.liutianjun.controller  
 * @Description: TODO
 * @author LiuTianJun  
 * @date 2018年5月16日  
 * @version V1.0
 */
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	/**
	 * 登录跳转
	 * @return
	 */
	@RequestMapping(value = "/login")
    public String showLoginForm(HttpServletRequest req, 
    		Model model) {
        String exceptionClassName = (String)req.getAttribute("shiroLoginFailure");
        String error = null;
        if(UnknownAccountException.class.getName().equals(exceptionClassName)) {
            error = "用户名/密码错误";
        } else if(IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
            error = "用户名/密码错误";
        } else if ("kaptchaValidateFailed".equals(exceptionClassName)) {
        	error = "验证码错误";
		} else if(exceptionClassName != null) {
            error = "其他错误：" + exceptionClassName;
        }
        model.addAttribute("error", error);
        return "user/login.jsp";
    }
	
	/**
	 * 注册跳转
	 * @return
	 */
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String register() {
		return "user/register.jsp";
	}
	
}
