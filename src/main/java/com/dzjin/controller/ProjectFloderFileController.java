package com.dzjin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
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

import com.dzjin.model.Project;
import com.dzjin.model.ProjectFile;
import com.dzjin.model.ProjectFloder;
import com.dzjin.service.ProjectFileService;
import com.dzjin.service.ProjectFloderService;

/**
 * 
 * 项目名称：wankangyuan 
 * 类名称：ProjectFloderFileController	项目文件相关接口
 * 类描述： 
 * 创建人：dzjin 
 * 创建时间：2018年5月11日 下午3:40:51 
 * 修改人：dzjin 
 * 修改时间：2018年5月11日 下午3:40:51 
 * 修改备注： 
 * @version 
 *
 */
@Controller
@RequestMapping("/projectFloderFile")
public class ProjectFloderFileController {
	
	@Autowired
	ProjectFloderService projectFloderService;
	@Autowired
	ProjectFileService projectFileService;
	
	/**
	 * 查询文件目录结构
	 * @param session
	 * @return
	 */
	@RequestMapping("/selectProjectFloderByProjectId")
	public String selectProjectFloderByProjectId(HttpSession session){
		
		Project project = (Project)session.getAttribute("project");
		session.setAttribute("projectFloders", projectFloderService.selectProjectFloderByProjectId(project.getId()));
		/*
		 * 需要查询出此项目下我的文件数量
		 */
		session.setAttribute("myFileNum", 56);
		
		return "redirect:/jsp/project/project_file.jsp";
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
	public Map<String, Object> addProjectFloder(HttpSession session , ProjectFloder projectFloder , Integer g_y){
		Map<String, Object> map = new HashMap<>();
		projectFloder.setIs_root(Short.valueOf("0"));
		if(g_y == 1){
			//是添加根目录
			projectFloder.setParent_id(null);
			Project project = (Project) session.getAttribute("project");
			projectFloder.setP_id(project.getId());
			projectFloder.setIs_root(Short.valueOf("1"));
		}
		if(projectFloderService.insertProjectFloder(projectFloder) == 1){
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
	public Map<String, Object> deleteProjectFloder(String floder_id){
		Map<String, Object> map = new HashMap<>();
		if(projectFloderService.deleteProjectFloder(floder_id) == 1){
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

	 */
	@RequestMapping("/updateProjectFloder")
	@ResponseBody
	public Map<String, Object> updateProjectFloder(ProjectFloder projectFloder){
		Map<String, Object> map = new HashMap<>();
		if(projectFloderService.updateProjectFloder(projectFloder) == 1){
			map.put("result", true);
		}else{
			map.put("result", false);
		}
		return map;
	}

	
	/**
	 * 批量提交文件，绑定到文件夹，如果没有选中文件夹，那么提交绑定操作将不会执行任何操作
	 * @param session
	 * @return
	 */
	@RequestMapping("/upFiles")
	@ResponseBody
	public Map<String, Object> upFiles(Integer floder_id , String ids){
		Map<String, Object> map = new HashMap<>();
		if(projectFileService.updateFloderId(floder_id, ids)){
			map.put("result", true);	
		}else{
			map.put("result", false);
			map.put("message", "部分文件提交失败，请重新选择上传");
		}
		return map;
	}
	
	
	/**
	 * 查询某个文件夹下面的文件
	 * @param session
	 * @param floder_id	文件夹的ID
	 * @return
	 * 
	 * 请求样例：http://localhost:8080/wankangyuan/projectFloderFile/selectFilesByFloderId?floder_id=1
	 * 
	 */
	@RequestMapping("/selectFilesByFloderId")
	@ResponseBody
	public Map<String, Object> selectFilesByFloderId(HttpSession session , Integer floder_id){
		Map<String, Object> map = new HashMap<>();
		map.put("result", true);
		map.put("projectFiles", projectFileService.selectProjectFileByFloderId(floder_id));
		return map;
	}
	
	/**
	 * 文件上传
	 * @param file
	 * @return
	 */
	@RequestMapping("/upload")
	@ResponseBody
	public Map<String, Object> upload(@RequestParam(value = "file", required = false) MultipartFile file){
		//返回结果
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(file.getSize()>1024*1024*1024) {
			map.put("result", false);
			map.put("message", "文件不能超过10M");
			return map;
		}
		//文件上传地址
		//String path ="/usr/projectFiles/";
		String path ="G:/projectFiles/";
        String fileName = file.getOriginalFilename();
        String type="."+fileName.substring(fileName.lastIndexOf(".")+1);
        String originalFilename = new String(fileName);
	    fileName = new Date().getTime()+type;
	    File dest = new File(path + "/" + fileName);
        if(!dest.getParentFile().exists()){//判断文件父目录是否存在
            dest.getParentFile().mkdir();
        }
        try {
			file.transferTo(dest); //保存文件
		} catch (IllegalStateException e) {
			e.printStackTrace();
			map.put("result", false);
	        map.put("message", "文件保存失败");
	        return map;
		} catch (IOException e) {
			e.printStackTrace();
			map.put("result", false);
	        map.put("message", "文件保存失败");
	        return map;
		}
        //向数据库中插入一条记录
        ProjectFile projectFile = new ProjectFile();
        //这个ID 应该从session中获取
        projectFile.setCreator_id(1);
        projectFile.setFile_location(fileName);
        projectFile.setFile_name(originalFilename);
        projectFile.setFile_size(String.valueOf(file.getSize()/1024));
        projectFile.setFile_type(type);
        //这个ID应该是每次传过来的数据
        projectFile.setFloder_id(1);
        projectFile.setCreate_datetime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        
        if(1 == projectFileService.insertPorjectFile(projectFile)){
        	map.put("result", true);
        	map.put("id",  projectFile.getId());
            map.put("originalFilename", projectFile.getFile_name());
            map.put("size", projectFile.getFile_size());
        }else{
        	map.put("result", false);
        	map.put("message", "文件上传失败");
        }
        return map;
	}
	
	/**
	 * 批量删除文件
	 * @param session
	 * @param ids
	 * @return
	 */
	@RequestMapping("/deleteFiles")
	@ResponseBody
	public Map<String, Object> deleteFiles(HttpSession session , String ids){
		Map<String, Object> map = new HashMap<String, Object>();
		if(projectFileService.deleteFiles(ids)){
			map.put("result", true);
		}else{
			map.put("result", false);
			map.put("message", "部分文件删除失败！");
		}
		session.removeAttribute("projectFiles");
		return map;
	}
	

}
