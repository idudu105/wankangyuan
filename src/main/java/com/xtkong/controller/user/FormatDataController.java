package com.xtkong.controller.user;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dzjin.model.ProjectFile;
import com.xtkong.dao.hbase.HBaseSourceDao;
import com.xtkong.model.Source;
import com.xtkong.model.SourceField;
import com.xtkong.service.FormatTypeService;
import com.xtkong.service.SourceFieldService;
import com.xtkong.service.SourceService;

@Controller
@RequestMapping("/formatData")
public class FormatDataController {

	@Autowired
	SourceService sourceService;
	@Autowired
	SourceFieldService sourceFieldService;
	@Autowired
	FormatTypeService formatTypeService;

	/**
	 * 首次进入
	 * 
	 * @param httpSession
	 * @return
	 */
	@RequestMapping("/firstIn")
	public String firstIn(HttpSession httpSession) {
		int uid = 1;
		// 源数据字段
		List<Source> sources = sourceService.getSourcesForUser();
		List<List<String>> sourceDatas = new ArrayList<>();
		if (sources != null) {
			sources.get(0).setSourceFields(sourceFieldService.getSourceFields(sources.get(0).getCs_id()));
			// sources.get(0).setFormatTypes(formatTypeService.getFormatTypes(sources.get(0).getCs_id()));
			// 源数据字数据，注：每个列表第一个值sourceDataId不显示
			sourceDatas = HBaseSourceDao.getSourceDatasByUid(Integer.toString(sources.get(0).getCs_id()),
					String.valueOf(uid), sources.get(0).getSourceFields());
		}
		List<String> list = new ArrayList<>();
		list.add("李");
		list.add("男");
		list.add("无");
		list.add("个人信息");
		list.add("孙");
		list.add("2018-4-22");
		sourceDatas.add(list);
		httpSession.setAttribute("sources", sources);
		httpSession.setAttribute("sourceDatas", sourceDatas);

		return "redirect:/jsp/formatdata/data_create.jsp";

	}

	/**
	 * 节点树 
	 * List<String>依次为formatDataNodeId（节点id）： 不显示、ft_id： 不显示、ft_name： 显示、节点名： 显示
	 * 
	 * @param cs_id
	 * @param uid
	 * @param sourceDataId
	 * @return
	 */
	@RequestMapping("/formatTypeFloders")
	@ResponseBody
	public Map<String, Object> formatTypeFloders(Integer cs_id, Integer uid, String sourceDataId) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<List<String>> formatTypeFloders = HBaseSourceDao.getFormatTypeFloders(Integer.toString(cs_id),
				sourceDataId);
		if (formatTypeFloders != null) {
			map.put("result", true);
			map.put("formatTypeFloders", formatTypeFloders);
		} else {
			map.put("result", false);
			map.put("message", "获取失败");
		}
		return map;
	}

	@RequestMapping("/project")
	public String testproject(HttpSession httpSession) {
		List<Source> sources = sourceService.getSourcesForUser();
		httpSession.setAttribute("sources", sources);

		List<SourceField> sourceFields = sourceFieldService.getSourceFields(sources.get(0).getCs_id());
		httpSession.setAttribute("sourceFields", sourceFields);

		List<List<String>> sourceDatas = new ArrayList<>();
		// =hBaseSourceDao.getSourceDatasByUid(Integer.toString(sources.get(0).getCs_id()),
		// "1", sourceFields);
		List<String> list1 = new ArrayList<>();
		list1.add("张三");
		list1.add("25");
		list1.add("男");
		list1.add("无");
		list1.add("个人信息");
		list1.add("孙");
		list1.add("2018-4-20");
		sourceDatas.add(list1);
		List<String> list = new ArrayList<>();
		list.add("李");
		list.add("男");
		list.add("无");
		list.add("个人信息");
		list.add("孙");
		list.add("2018-4-22");
		sourceDatas.add(list);

		httpSession.setAttribute("sourceDatas", sourceDatas);

		return "redirect:/pages/project_data.jsp";

	}

	@RequestMapping("/datain")
	public String datain(HttpSession httpSession, String datainname) {
		httpSession.setAttribute("datainname", datainname);
		// /**
		// * 以下为生成Excel操作
		// */
		// // 1.创建一个workbook，对应一个Excel文件
		// HSSFWorkbook wb = new HSSFWorkbook();
		// // 2.在workbook中添加一个sheet，对应Excel中的一个sheet
		// HSSFSheet sheet = wb.createSheet("XXX表");
		// // 3.在sheet中添加表头第0行，老版本poi对excel行数列数有限制short
		// HSSFRow row = sheet.createRow((int) 0);
		// // 4.创建单元格，设置值表头，设置表头居中
		// HSSFCellStyle style = wb.createCellStyle();
		// // 居中格式
		// style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		//
		// // 设置表头
		// HSSFCell cell = row.createCell(0);
		// cell.setCellValue("表头1");
		// cell.setCellStyle(style);
		//
		// cell = row.createCell(1);
		// cell.setCellValue("表头2");
		// cell.setCellStyle(style);
		//
		// cell = row.createCell(2);
		// cell.setCellValue("表头3");
		// cell.setCellStyle(style);
		//
		// cell = row.createCell(3);
		// cell.setCellValue("表头4");
		// cell.setCellStyle(style);
		//
		// cell = row.createCell(4);
		// cell.setCellValue("表头5");
		// cell.setCellStyle(style);

		return "redirect:/pages/project_datain.jsp";

	}

	/**
	 * 文件上传功能
	 * 
	 * @param file
	 * @return
	 */
	@RequestMapping("/upload")
	@ResponseBody
	public Map<String, Object> upload(@RequestParam(value = "file", required = false) MultipartFile file) {
		// 返回结果
		Map<String, Object> map = new HashMap<String, Object>();

		if (file.getSize() > 1024 * 1024) {
			map.put("result", false);
			map.put("message", "文件不能超过10M");
			return map;
		}
		// 文件上传地址
		String path = "G:/projectFiles/";
		String fileName = file.getOriginalFilename();
		String type = "." + fileName.substring(fileName.lastIndexOf(".") + 1);
		String originalFilename = new String(fileName);
		fileName = new Date().getTime() + type;
		File dest = new File(path + "/" + fileName);
		if (!dest.getParentFile().exists()) {// 判断文件父目录是否存在
			dest.getParentFile().mkdir();
		}
		try {
			file.transferTo(dest); // 保存文件
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
		// 向数据库中插入一条记录
		ProjectFile projectFile = new ProjectFile();
		// 这个ID 应该从session中获取
		projectFile.setCreator_id(1);
		projectFile.setFile_location(fileName);
		projectFile.setFile_name(originalFilename);
		projectFile.setFile_size(String.valueOf(file.getSize() / 1024));
		projectFile.setFile_type("类型，不清楚");
		// 这个ID应该是每次传过来的数据
		projectFile.setFloder_id(1);
		projectFile.setCreate_datetime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));

		// if(1 == projectFileService.insertPorjectFile(projectFile)){
		// map.put("result", true);
		// map.put("id", projectFile.getId());
		// map.put("originalFilename", projectFile.getFile_name());
		// map.put("size", projectFile.getFile_size());
		// }else{
		// map.put("result", false);
		// map.put("message", "文件上传失败");
		// }
		return map;
	}

}
