package com.dzjin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * 项目名称：wankangyuan 
 * 类名称：ProjectMemberController 
 * 类描述： 项目成员controller
 * 创建人：dzjin 
 * 创建时间：2018年6月14日 下午1:07:00 
 * 修改人：dzjin 
 * 修改时间：2018年6月14日 下午1:07:00 
 * 修改备注： 
 * @version 
 *
 */
@Controller
@RequestMapping("/projectMember")
public class ProjectMemberController {
	
	@RequestMapping("/selectProjectMember")
	public String selectProjectMember(HttpSession httpSession){
		
		
		return "/jsp/project/project_member.jsp";
	}
	

}
