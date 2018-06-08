package com.liutianjun.shiro.filter;

import java.util.Set;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

import com.liutianjun.service.UserService;
import com.liutianjun.utils.VerifyCodeUtils;

public class CustomFormAuthenticationFilter extends FormAuthenticationFilter {

	private String loginType;
	
	private UserService userService;
	
	@Override    
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception { 
		
		//判断前后台登录
        this.loginType = request.getParameter("loginType");
		
        // 取出页面的验证码    
        // 输入的验证和session中的验证进行对比    
        String randomcode = request.getParameter("randomcode");
        if (randomcode != null && !VerifyCodeUtils.verifyCode(randomcode,VerifyCodeUtils.V_CODE)) {    
            // 如果校验失败，将验证码错误失败信息，通过shiroLoginFailure设置到request中    
        	request.setAttribute("shiroLoginFailure", "kaptchaValidateFailed");//自定义登录异常    
            // 拒绝访问，不再校验账号和密码    
            return true;    
        }
        
        String username = request.getParameter("username");
        Set<String> roles = null;
        if(null != username) {
        	roles = userService.findRoles(username);
        }
        //禁止普通用户登录后台
        if(null != roles && "adminLogin".equals(loginType) && !roles.contains("admin") ) {
        	request.setAttribute("shiroLoginFailure", "forbidUserLoginFailed");
        	//拒绝访问
        	return true; 
        }
        
        return super.onAccessDenied(request, response);    
    }
	
	@Override
	protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request,
			ServletResponse response) throws Exception {
		//清理原先的地址
		WebUtils.getAndClearSavedRequest(request);
		//根据前后台登录页判断成功跳转页
		if("userLogin".equals(loginType)) {
			WebUtils.redirectToSavedRequest(request, response, "/project/selectMyProject");
		}else {
			WebUtils.redirectToSavedRequest(request, response, "/admin/viewIndex");
		}
		
		return false;
	}
	
	
	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
}
