package com.xtkong.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.xtkong.dao.hbase.HBaseFormatNodeDao;
import com.xtkong.model.FormatType;
import com.xtkong.service.FormatFieldService;
import com.xtkong.service.FormatTypeService;
import com.xtkong.service.SourceFieldService;
import com.xtkong.service.SourceService;

@Controller
@RequestMapping("/formatNode")
public class FormatNodeController {

	@Autowired
	SourceService sourceService;
	@Autowired
	SourceFieldService sourceFieldService;
	@Autowired
	FormatTypeService formatTypeService;
	@Autowired
	FormatFieldService formatFieldService;


	/**
	 * 新增数据节点
	 * 
	 * @param cs_id
	 * @param sourceDataId
	 * @param ft_id
	 * @param nodeName
	 * @return
	 */
	@RequestMapping("/insertFormatNode")
	@ResponseBody
	public Map<String, Object> insertFormatNode(String cs_id, String sourceDataId, String ft_id, String nodeName) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (HBaseFormatNodeDao.insertFormatNode(cs_id, sourceDataId, ft_id, nodeName)) {
			map.put("result", true);
			map.put("message", "新增成功");
		} else {
			map.put("result", false);
			map.put("message", "新增失败");
		}
		return map;
	}

	/**
	 * 获取节点树 List<FormatType>
	 * 
	 * formatType.ft_id： 不显示
	 * 
	 * formatType.ft_name：显示
	 * 
	 * formatType.List<FormatDataNode>:formatNodeId（节点id）： 不显示,节点名： 显示
	 * 
	 * @param cs_id
	 * @param sourceDataId
	 * @return
	 */
	@RequestMapping("/getformatTypeFolders")
	@ResponseBody
	public Map<String, Object> getformatTypeFolders(String cs_id, String sourceDataId) {
		Map<String, Object> map = new HashMap<String, Object>();
		HashMap<String, FormatType> formatTypeMap = new HashMap<>();
		List<FormatType> formatTypes = formatTypeService.getFormatTypes(Integer.valueOf(cs_id));
		for (FormatType formatType : formatTypes) {
			formatTypeMap.put(String.valueOf(formatType.getFt_id()), formatType);
		}
		 List<FormatType> formatTypeFolders = HBaseFormatNodeDao.getFormatTypeFolders(cs_id, sourceDataId, formatTypeMap);
		// ------------------------------
	/*	List<FormatType> formatTypeFolders = new ArrayList<>();
		for (FormatType formatType : formatTypeMap.values()) {
			if (!formatType.getFt_name().equals("CT")) {
				formatTypeFolders.add(formatType);
			}
		}

		FormatType formatType1 = new FormatType();
		formatType1.setFt_id(1);
		formatType1.setFt_name("CT");
		HashMap<String, String> formatDataNodes1 = new HashMap<>();
		formatDataNodes1.put("nid1", "CT1");
		formatDataNodes1.put("nid2", "CT2");
		formatDataNodes1.put("nid3", "CT3");
		formatType1.setFormatDataNodes(formatDataNodes1);

		FormatType formatType2 = new FormatType();
		formatType2.setFt_id(1);
		formatType2.setFt_name("CT");
		HashMap<String, String> formatDataNodes2 = new HashMap<>();
		formatDataNodes2.put("nid4", "CT4");
		formatDataNodes2.put("nid5", "CT5");
		formatDataNodes2.put("nid6", "CT6");
		formatType2.setFormatDataNodes(formatDataNodes2);

		if (sourceDataId.equals("id001")) {
			formatTypeFolders.add(formatType1);
		} else {
			formatTypeFolders.add(formatType2);
		}*/
		// --------------------------
		if (formatTypeFolders != null) {
			map.put("result", true);
			map.put("formatTypeFloders", formatTypeFolders);
		} else {
			map.put("result", false);
			map.put("message", "获取失败");
		}
		return map;
	}

	// ----------------------编辑数据节点
	/**
	 * 编辑数据节点
	 * 
	 * @param cs_id
	 * @param formatNodeId
	 * @param ft_id
	 * @param nodeName
	 * @return
	 */
	@RequestMapping("/updateFormatNode")
	@ResponseBody
	public Map<String, Object> updateFormatNode(String cs_id, String formatNodeId, String ft_id, String nodeName) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (HBaseFormatNodeDao.updateFormatNode(cs_id, formatNodeId, ft_id, nodeName)) {
			map.put("result", true);
			map.put("message", "更新成功");
		} else {
			map.put("result", false);
			map.put("message", "更新失败");
		}
		return map;
	}
	// ----------------------编辑数据节点
	
	
	// ----------------------删除数据节点
	/**
	 * 删除数据节点
	 * 
	 * @param cs_id
	 * @param formatNodeId
	 * @return
	 */
	@RequestMapping("/deleteFormatNode")
	@ResponseBody
	public Map<String, Object> deleteFormatNode(String cs_id, String formatNodeId) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (HBaseFormatNodeDao.deleteFormatNode(cs_id, formatNodeId)) {
			map.put("result", true);
			map.put("message", "删除成功");
		} else {
			map.put("result", false);
			map.put("message", "删除失败");
		}
		return map;
	}

	// ----------------------删除数据节点


}
