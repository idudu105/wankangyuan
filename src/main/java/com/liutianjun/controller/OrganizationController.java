package com.liutianjun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liutianjun.pojo.Organization;
import com.liutianjun.service.OrganizationService;

/**
 * 组织结构Controller
 * @Title: OrganizationController.java  
 * @Package com.liutianjun.controller  
 * @Description: TODO
 * @author LiuTianJun  
 * @date 2018年6月1日  
 * @version V1.0
 */
@Controller
@RequestMapping("/organization")
public class OrganizationController {

	protected Map<String, Object> resultMap = new HashMap<String, Object>();
	
	@Autowired
	private OrganizationService organizationService;
	
	/**
	 * 添加新组织结构
	 * @Title: addNewOrg 
	 * @param record
	 * @return 
	 * Map<String,Object>
	 */
	@RequestMapping(value="/addNewOrg",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> addNewOrg(Organization record) {
		resultMap.put("status", 400);
		resultMap.put("message", "添加失败!");
		if(0 != organizationService.addNewOrg(record)) {
			resultMap.put("status", 200);
			resultMap.put("message", "已提交申请，请等待审核!");
		}
		
		return resultMap;
	}
	
	/**
	 * 添加新组
	 * @Title: addNewGroup 
	 * @param parentId
	 * @param organizationName
	 * @return 
	 * Map<String,Object>
	 */
	@RequestMapping(value="/addNewGroup",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> addNewGroup(Integer parentId, String organizationName) {
		resultMap.put("status", 400);
		resultMap.put("message", "添加失败!");
		if(null != parentId && 0 != organizationService.addNewGroup(parentId, organizationName)) {
			resultMap.put("status", 200);
			resultMap.put("message", "添加成功!");
		}
		
		return resultMap;
	}
	
	/**
	 * 根据id获取组名
	 * @Title: getGroupName 
	 * @param id
	 * @return 
	 * String
	 */
	@RequestMapping(value="/getGroupName",method=RequestMethod.GET)
	@ResponseBody
	public String getGroupName(Integer id) {
		Organization organization = organizationService.selectByPrimaryKey(id);
		return organization.getOrganizationName();
	}
	
	
	/**
	 * 更新组名
	 * @Title: updateGroup 
	 * @param record
	 * @return 
	 * Map<String,Object>
	 */
	@RequestMapping(value="/updateGroup",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateGroup(Organization record) {
		resultMap.put("status", 400);
		resultMap.put("message", "更新失败!");
		if(0 != organizationService.undateGroup(record)) {
			resultMap.put("status", 200);
			resultMap.put("message", "更新成功!");
		}
		
		return resultMap;
	}
	/**
	 * 删除分组
	 * @Title: deleteGroup 
	 * @param id
	 * @return 
	 * Map<String,Object>
	 */
	@RequestMapping(value="/deleteGroup",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteGroup(Integer id) {
		resultMap.put("status", 400);
		resultMap.put("message", "更新失败!");
		if(0 != organizationService.deleteGroupById(id)) {
			resultMap.put("status", 200);
			resultMap.put("message", "更新成功!");
		}
		
		return resultMap;
	}
	
}
