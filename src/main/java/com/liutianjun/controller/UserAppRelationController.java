package com.liutianjun.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.liutianjun.pojo.User;
import com.liutianjun.pojo.UserAppRelation;
import com.liutianjun.service.UserAppRelationService;
import com.liutianjun.service.UserService;

/**
 * 用户应用关系
 * @Title: UserAppRelationController.java  
 * @Package com.liutianjun.controller  
 * @Description: TODO
 * @author LiuTianJun  
 * @date 2018年5月9日  
 * @version V1.0
 */
@Controller
@RequestMapping("/userAppRelation")
public class UserAppRelationController {

	@Autowired
	private UserAppRelationService userAppRelationService;
	
	@Autowired
	private UserService userService;
	
	/**
	 * 添加应用到我的
	 * @Title: addToMine 
	 * @param httpSession
	 * @param ids
	 * @return 
	 * String
	 */
	@RequestMapping(value="/addToMine{index}",method=RequestMethod.POST)
	public String addToMine(Integer[] ids,
			@PathVariable String index,
			RedirectAttributes attributes) {
	    String username = (String)SecurityUtils.getSubject().getPrincipal();
	    User user = userService.selectByUsername(username);
	    String msg = "操作失败";
		int i = userAppRelationService.addToMineByIds(user.getId(), ids);
		if(i>0) {
			msg = "添加成功";
		}
		attributes.addFlashAttribute("msg", msg);
		return "redirect:/application/viewMine"+index;
	}
	
	/**
	 * 从我的中删除应用
	 * @Title: removeFromMine 
	 * @param httpSession
	 * @param ids
	 * @return 
	 * String
	 */
	@RequestMapping(value="/removeFromMine{index}",method=RequestMethod.POST)
	public String removeFromMine(Integer[] ids,
			@PathVariable String index,
			RedirectAttributes attributes) {
	    String username = (String)SecurityUtils.getSubject().getPrincipal();
        User user = userService.selectByUsername(username);
		
		String msg = "操作失败";
		int i = userAppRelationService.removeFromMineByIds(user.getId(), ids);
		if(i>0) {
			msg = "移除成功";
		}
		attributes.addFlashAttribute("msg", msg);
		return "redirect:/application/viewMine"+index;
	}
	
	/**
	 * 获取我的应用列表
	 * @Title: getMine 
	 * @param page
	 * @param rows
	 * @param appName
	 * @param appType
	 * @param orderName
	 * @param orderDir
	 * @param field
	 * @param option
	 * @return
	 * @throws Exception 
	 * String
	 */
	@RequestMapping(value="/getMine",method=RequestMethod.GET, produces="text/html;charset=UTF-8")
	@ResponseBody
	public String getMine(@RequestParam(value="page", defaultValue="1")Integer page, 
            @RequestParam(value="rows", defaultValue="12")Integer rows, 
            @RequestParam(value="appName",required=false)String appName,
            @RequestParam(value="appType",required=false)String appType,
            @RequestParam(value="orderName",defaultValue="ID")String orderName,
            @RequestParam(value="orderDir",defaultValue="DESC")String orderDir,
            /*@RequestParam(value="field",required=false)String field,
            @RequestParam(value="option",required=false)String[] option*/
            @RequestParam(value="appNameOption",required=false)String[] appNameOption,
            @RequestParam(value="creatorOption",required=false)String[] creatorOption,
            @RequestParam(value="isAsyncOption",required=false)String[] isAsyncOption,
            @RequestParam(value="keywordsOption",required=false)String[] keywordsOption,
            @RequestParam(value="appIntroOption",required=false)String[] appIntroOption,
            @RequestParam(value="createTimeOption",required=false)String[] createTimeOption) throws Exception {
		
		//获取用户名
	    String username = (String)SecurityUtils.getSubject().getPrincipal();
	    //获取用户
	    User user = userService.selectByUsername(username);
		
	    //Map<String, Object> map = userAppRelationService.findMine(page,rows,appName,appType,user.getId(),orderName +" "+ orderDir,field,option);
	    Map<String, Object> map = userAppRelationService.findMine(page,rows,appName,appType,user.getId(),
	    		orderName +" "+ orderDir,appNameOption,creatorOption,isAsyncOption,keywordsOption,appIntroOption,createTimeOption);
		ObjectMapper mapper = new ObjectMapper();
		mapper.setDateFormat(new SimpleDateFormat("YYYY-MM-dd"));
		return mapper.writeValueAsString(map);
	}
	
	/**
	 * 获取应用类别列表
	 * @Title: getAppTypeList 
	 * @return
	 * @throws Exception 
	 * String
	 */
	@RequestMapping(value="/getMyAppTypeList",method=RequestMethod.GET, produces="text/html;charset=UTF-8")
	@ResponseBody
	public String getMyAppTypeList() throws Exception {
		//获取用户名
	    String username = (String)SecurityUtils.getSubject().getPrincipal();
	    //获取用户
	    User user = userService.selectByUsername(username);
		//获取应用筛选列表
		List<String> typeList = userAppRelationService.findMyTypeList(user.getId());
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(typeList);
	}
	
	/**
	 * 获取应用类别列表
	 * @Title: getAppTypeList 
	 * @return
	 * @throws Exception 
	 * String
	 */
	@RequestMapping(value="/getMyAppFieldList",method=RequestMethod.GET, produces="text/html;charset=UTF-8")
	@ResponseBody
	public String getMyAppFiledList(String field,String content) throws Exception {
		String username = (String)SecurityUtils.getSubject().getPrincipal();
        User user = userService.selectByUsername(username);
		//获取应用筛选列表
		List<UserAppRelation> typeList = userAppRelationService.findFileList(field,content,user.getId());
		typeList.remove(null);
		ObjectMapper mapper = new ObjectMapper();
		mapper.setSerializationInclusion(Include.NON_EMPTY);
		mapper.setDateFormat(new SimpleDateFormat("YYYY-MM-dd"));
		return mapper.writeValueAsString(typeList);
	}
}
