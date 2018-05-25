package com.xtkong.controller.user;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
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
import com.xtkong.dao.hbase.HBaseFormatDataDao;
import com.xtkong.model.FormatField;
import com.xtkong.service.FormatFieldService;
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
	@Autowired
	FormatFieldService formatFieldService;

	







	// ----------------------添加一条格式数据
	/**
	 * 添加一条格式数据
	 * 
	 * @param cs_id
	 * @param ft_id
	 *            格式类型id
	 * @param formatNodeId
	 *            节点id
	 * @param formatFieldDatas
	 *            格式数据字段、 数据值
	 * @return
	 */
	@RequestMapping("/insertFormatData")
	@ResponseBody
	public Map<String, Object> insertFormatData(String cs_id, String ft_id, String formatNodeId,
			HashMap<String, String> formatFieldDatas) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (HBaseFormatDataDao.insertFormatData(cs_id, ft_id, formatNodeId, formatFieldDatas)) {
			map.put("result", true);
			map.put("message", "新增成功");
		} else {
			map.put("result", false);
			map.put("message", "新增失败");
		}
		return map;
	}

	// ----------------------添加一条格式数据
	// ----------------------更新一条格式数据
	/**
	 * 更新一条格式数据
	 * 
	 * @param cs_id
	 * @param ft_id
	 *            格式类型id
	 * @param formatDataId
	 * @param formatFieldDatas
	 *            格式数据字段、 数据值
	 * @return
	 */
	@RequestMapping("/updateFormatData")
	@ResponseBody
	public Map<String, Object> updateFormatData(String cs_id, String ft_id, String formatDataId,
			HashMap<String, String> formatFieldDatas) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (HBaseFormatDataDao.updateFormatData(cs_id, ft_id, formatDataId, formatFieldDatas)) {
			map.put("result", true);
			map.put("message", "更新成功");
		} else {
			map.put("result", false);
			map.put("message", "更新失败");
		}
		return map;
	}

	// ----------------------更新一条格式数据
	/**
	 * 获取格式数据明细 List<List<String>>
	 * 
	 * 格式数据明细数据，注：每个列表第一个值formatDataId不显示
	 * 
	 * @param cs_id
	 *            采集源id
	 * @param ft_id
	 *            格式类型id
	 * @param formatNodeId
	 *            节点id
	 * @return
	 */
	@RequestMapping("/getformatDatas")
	@ResponseBody
	public Map<String, Object> getformatDatas(Integer cs_id, Integer ft_id, String formatNodeId) {
		Map<String, Object> map = new HashMap<String, Object>();
		// meta数据
		List<FormatField> meta = formatFieldService.getFormatFieldsIs_meta(ft_id, 1);
		 List<List<String>> metaDatas =		 HBaseFormatDataDao.getFormatDatas(Integer.toString(cs_id),
		 Integer.toString(ft_id), formatNodeId, meta);
		// data数据
		List<FormatField> data = formatFieldService.getFormatFieldsIs_meta(ft_id, 0);
		 List<List<String>> dataDatas =		 HBaseFormatDataDao.getFormatDatas(Integer.toString(cs_id),
		 Integer.toString(ft_id), formatNodeId, data);
		// --------------------------
		/*
		 * List<List<String>> metaDatas = new ArrayList<>(); List<String>
		 * formatData = new ArrayList<>(); formatData.add("fd001");//
		 * 获取行键formatDataId，不显示 for (FormatField formatField : meta) {
		 * formatData.add("test" + formatNodeId); } metaDatas.add(formatData);
		 * 
		 * List<List<String>> dataDatas = new ArrayList<>(); List<String>
		 * formatDatad = new ArrayList<>(); formatDatad.add("fd001");//
		 * 获取行键formatDataId，不显示 for (FormatField formatField : data) {
		 * formatDatad.add("test" + formatNodeId); } dataDatas.add(formatDatad);
		 */
		// --------------------------
		if (metaDatas != null) {
			map.put("result", true);
			map.put("meta", meta);
			map.put("metaDatas", metaDatas);
			map.put("data", data);
			map.put("dataDatas", dataDatas);
		} else {
			map.put("result", false);
			map.put("message", "获取失败");
		}
		return map;
	}

	// ----------------------批量删除格式数据
	/**
	 * 批量删除格式数据
	 * 
	 * @param cs_id
	 * @param ft_id
	 * @param formatDataIds
	 * @return
	 */
	@RequestMapping("/deleteFormatDatas")
	@ResponseBody
	public Map<String, Object> deleteFormatDatas(String cs_id, String ft_id, String formatNodeIds) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (HBaseFormatDataDao.deleteFormatDatas(cs_id, ft_id, formatNodeIds)) {
			map.put("result", true);
			map.put("message", "删除成功");
		} else {
			map.put("result", false);
			map.put("message", "删除失败");
		}
		return map;
	}

	// ----------------------批量删除格式数据
	
	
	// ---------------------------------------------------
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
