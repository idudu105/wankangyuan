package com.dzjin.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dzjin.model.ProjectFloder;
import com.dzjin.service.ProjectFloderFileService;

@Controller
@RequestMapping("/projectFloderFile")
public class ProjectFloderFileController {
	
	@Autowired
	ProjectFloderFileService projectFloderFileService;
	
	@RequestMapping("/selectProjectFloderByProjectId")
	public String selectProjectFloderByProjectId(HttpSession session){
		session.setAttribute("projectFloders", projectFloderFileService.selectProjectFloderByProjectId(1));
		/*
		 * 我的文件数量
		 * 
		 * 
		 */
		session.setAttribute("myFileNum", 56);
		return "redirect:/pages/project_file.jsp";
	}
	
	
	
	/**
	 * 增加目录
	 * @param projectFloder
	 * @return
	 * 
	 * 添加根目录请求格式：http://localhost:8080/wankangyuan/projectFloderFile/addProjectFloder?is_root=1&floder_name=5678&p_id=1
	 * 
	 * 添加子目录请求格式：http://localhost:8080/wankangyuan/projectFloderFile/addProjectFloder?is_root=0&floder_name=1235&parent_id=22
	 * 
	 */
	@RequestMapping("/addProjectFloder")
	@ResponseBody
	public Map<String, Object> addProjectFloder(ProjectFloder projectFloder){
		Map<String, Object> map = new HashMap<>();
		if(projectFloderFileService.insertProjectFloder(projectFloder) == 1){
			map.put("result", true);
		}else{
			map.put("result", false);
		}
		return map;
	}
	
	/**
	 * 删除目录
	 * @param id
	 * @return
	 * 
	 * 删除目录请求格式：http://localhost:8080/wankangyuan/projectFloderFile/deleteProjectFloder?id=24
	 * 
	 */
	@RequestMapping("/deleteProjectFloder")
	@ResponseBody
	public Map<String, Object> deleteProjectFloder(String id){
		Map<String, Object> map = new HashMap<>();
		if(projectFloderFileService.deleteProjectFloder(id) == 1){
			map.put("result", true);
		}else{
			map.put("result", false);
		}
		return map;
	}
	
	/**
	 * 修改目录
	 * @param projectFloder
	 * @return
	 * 
	 * 修改目录请求格式：http://localhost:8080/wankangyuan/projectFloderFile/updateProjectFloder?id=23&floder_name=ABCDEFG
	 * 
	 */
	@RequestMapping("/updateProjectFloder")
	@ResponseBody
	public Map<String, Object> updateProjectFloder(ProjectFloder projectFloder){
		Map<String, Object> map = new HashMap<>();
		if(projectFloderFileService.updateProjectFloder(projectFloder) == 1){
			map.put("result", true);
		}else{
			map.put("result", false);
		}
		return map;
	}
	
	/**
	 * 文件上传功能
	 * @param file
	 * @return
	 */
	@RequestMapping("/upload")
	@ResponseBody
	public Map<String, Object> upload(@RequestParam(value = "file", required = false) MultipartFile file){
		//返回结果
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(file.getSize()>1024*1024) {
			map.put("result", false);
			map.put("message", "文件不能超过10M");
			return map;
		}
		//文件上传地址
		String path ="G:/";
        String fileName = file.getOriginalFilename();
        String type="."+fileName.substring(fileName.lastIndexOf(".")+1);
        String originalFilename = new String(fileName);
	    fileName = new Date().getTime()+type;
	    File dest = new File(path + "/" + fileName);
        if(!dest.getParentFile().exists()){ //判断文件父目录是否存在
            dest.getParentFile().mkdir();
        }
        try {
			file.transferTo(dest); //保存文件
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			map.put("result", false);
	        map.put("message", "文件保存失败");
	        return map;
		}
        //向数据库中插入一条记录
        //attachmentService.insertAttachment(originalFilename, fileName);
        map.put("result", true);
        map.put("originalFilename", originalFilename);
        map.put("id",  new Date().getTime());
        map.put("size", file.getSize()/1024);
        
        
        return map;
	}
	
	
	

}
