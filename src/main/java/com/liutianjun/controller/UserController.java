package com.liutianjun.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liutianjun.pojo.User;
import com.liutianjun.service.UserService;
import com.liutianjun.utils.VerifyCodeUtils;

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

	protected Map<String, Object> resultMap = new HashMap<String, Object>();
	
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
	
	/**
	 * 注册功能
	 * @Title: subRegister 
	 * @return 
	 * String
	 */
	@RequestMapping(value="/register",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> subRegister(String randomCode, String phoneCode, User user) {
		resultMap.put("status", 400);
		//检查验证码
		if(!VerifyCodeUtils.verifyCode(randomCode)) {
			resultMap.put("message", "验证码不正确！");
			return resultMap;
		}
		//检查邮箱
		if(null != userService.selectByEmail(user.getEmail())){
			resultMap.put("message", "Email已经存在！");
			return resultMap;
		}
		//检查手机号
		if(null != userService.selectByPhone(user.getPhone())){
			resultMap.put("message", "手机号已经存在！");
			return resultMap;
		}
		//检查手机验证码
		String vPhoneCode = (String) SecurityUtils.getSubject().getSession().getAttribute(VerifyCodeUtils.V_PHONECODE);
		if(null ==phoneCode || !phoneCode.equals(vPhoneCode)) {
			resultMap.put("message", "手机验证码错误！");
			return resultMap;
		}
		
		userService.insert(user);
		resultMap.put("message", "注册成功！");
		resultMap.put("status", 200);
		
		return resultMap;
	}
	
	/**
	 * 忘记密码
	 * @Title: forgetPassword 
	 * @return 
	 * String
	 */
	@RequestMapping(value="/forgetPassword",method=RequestMethod.GET)
	public String forgetPassword() {
		return "user/forget_ps.jsp";
	}
	
	/**
	 * 重置密码
	 * @Title: forgetPassword 
	 * @return 
	 * String
	 */
	@RequestMapping(value="/forgetPassword",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> resetPassword(String phone, String phoneCode, String password) {
		resultMap.put("status", 400);
		//检查手机号
		if(null == userService.selectByPhone(phone)){
			resultMap.put("message", "手机号不存在！");
			return resultMap;
		}
		//检查手机验证码
		String vPhoneCode = (String) SecurityUtils.getSubject().getSession().getAttribute(VerifyCodeUtils.V_PHONECODE);
		if(null ==phoneCode || !phoneCode.equals(vPhoneCode)) {
			resultMap.put("message", "手机验证码错误！");
			return resultMap;
		}
		User user = userService.selectByPhone(phone);
		userService.changePassword(user.getId(), password);
		resultMap.put("message", "重置密码成功！");
		resultMap.put("status", 200);
		
		return resultMap;
	}
	
}
