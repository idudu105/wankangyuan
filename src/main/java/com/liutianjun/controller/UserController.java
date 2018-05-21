package com.liutianjun.controller;

import java.awt.image.RenderedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
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

import sun.misc.BASE64Decoder;

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
	private static String upPicUrl = UserController.class.getResource("/").getFile().toString()
			.split("WEB-INF/classes/")[0] + "userPic/";

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
	
	/**
	 * 用户信息显示
	 * @Title: userInfo 
	 * @param model
	 * @return 
	 * String
	 */
	@RequestMapping(value="/userInfo",method=RequestMethod.GET)
	public String userInfo(Model model) {
		//获取用户名
	    String username = (String)SecurityUtils.getSubject().getPrincipal();
	    //获取用户
	    User user = userService.selectByUsername(username);
	    
	    model.addAttribute("user", user);
		return "user/user_info.jsp";
	}
	
	/**
	 * 更新用户信息
	 * @Title: updateUserInfo 
	 * @param user
	 * @return 
	 * Map<String,Object>
	 */
	@RequestMapping(value="/updateUserInfo",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateUserInfo(User user) {
		resultMap.put("status", 400);
		if(0 == userService.updateByPrimaryKey(user)) {
			resultMap.put("message", "修改失败");
			return resultMap;
		}
		resultMap.put("message", "修改成功");
		resultMap.put("status", 200);
		return resultMap;
		
	}
	
	/**
	 * 修改手机号
	 * @Title: updateUserPhone 
	 * @param phoneCode
	 * @param phone
	 * @param newPhoneCode
	 * @return 
	 * Map<String,Object>
	 */
	@RequestMapping(value="/updateUserPhone",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateUserPhone(String phoneCode, String phone, String newPhoneCode) {
		resultMap.put("status", 400);
		//检查手机验证码
		String vPhoneCode = (String) SecurityUtils.getSubject().getSession().getAttribute(VerifyCodeUtils.V_PHONECODE);
		if(null ==phoneCode || !phoneCode.equals(vPhoneCode)) {
			resultMap.put("message", "手机验证码错误！");
			return resultMap;
		}
		
		//检查手机号
		if(null != userService.selectByPhone(phone)){
			resultMap.put("message", "手机号已存在！");
			return resultMap;
		}
		
		//检查新手机验证码
		String vNewPhoneCode = (String) SecurityUtils.getSubject().getSession().getAttribute(VerifyCodeUtils.V_NEWPHONECODE);
		if(null ==newPhoneCode || !newPhoneCode.equals(vNewPhoneCode)) {
			resultMap.put("message", "新手机验证码错误！");
			return resultMap;
		}
		
		//获取用户名
	    String username = (String)SecurityUtils.getSubject().getPrincipal();
	    //获取用户
	    User user = userService.selectByUsername(username);
	    user.setPhone(phone);
		
		if(0 == userService.updateByPrimaryKey(user)) {
			resultMap.put("message", "修改失败");
			return resultMap;
		}
		resultMap.put("message", "修改成功");
		resultMap.put("status", 200);
		return resultMap;
		
	}
	
	@RequestMapping(value="/upPic",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateUserPhone(String imgBase) {
		resultMap.put("status", 400);
		imgBase = imgBase.replace("data:image/jpeg;base64,", "");
		
		//获取用户名
	    String name = (String)SecurityUtils.getSubject().getPrincipal();
		String toImagePath = upPicUrl + name+"/"+ name + ".jpg";
		String imageType = "jpg";
		try {
			BASE64Decoder decoder = new sun.misc.BASE64Decoder();
			byte[] bytes1 = decoder.decodeBuffer(imgBase);
			ByteArrayInputStream bais = new ByteArrayInputStream(bytes1);
			RenderedImage bi1 = ImageIO.read(bais);
			File w2 = new File(toImagePath);// 可以是jpg,png,gif格式
			if (!w2.getParentFile().exists()) { // 判断文件父目录是否存在
				w2.getParentFile().mkdir();
			}
			if (!w2.exists()) {
				w2.createNewFile();
			}
			ImageIO.write(bi1, imageType, w2);// 不管输出什么格式图片，此处不需改动
			//获取用户
		    User user = userService.selectByUsername(name);
		    user.setHeadimg(toImagePath);
		    if(0 ==userService.updateByPrimaryKey(user)) {
		    	resultMap.put("message", "修改失败");
		    	return resultMap;
		    }
			resultMap.put("message", "修改成功");
			resultMap.put("status", 200);
			return resultMap;
		} catch (IOException e) {
			e.printStackTrace();
			resultMap.put("message", "修改失败");
			return resultMap;
		}
		
	}
	
}
