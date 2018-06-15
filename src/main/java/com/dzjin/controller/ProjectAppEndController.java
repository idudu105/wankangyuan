package com.dzjin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * 项目名称：wankangyuan 
 * 类名称：ProjectAppEndController 
 * 类描述： 应用结果控制类
 * 创建人：dzjin 
 * 创建时间：2018年6月13日 下午7:50:34 
 * 修改人：dzjin 
 * 修改时间：2018年6月13日 下午7:50:34 
 * 修改备注： 
 * @version 
 *
 */
@Controller
@RequestMapping("/projectAppEnd")
public class ProjectAppEndController {
	
	@RequestMapping("/selectProjectAppEnd")
	public String selectProjectAppEnd(HttpSession httpSession){
		
		return "/jsp/project/project_append.jsp";
	}

}
