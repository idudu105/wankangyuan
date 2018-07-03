package com.xtkong.controller.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.hadoop.hbase.util.Bytes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xtkong.dao.hbase.HBaseFormatNodeDao;
import com.xtkong.model.FormatField;
import com.xtkong.model.FormatType;
import com.xtkong.service.FormatFieldService;
import com.xtkong.service.FormatTypeService;
import com.xtkong.service.PhoenixClient;
import com.xtkong.service.SourceFieldService;
import com.xtkong.service.SourceService;
import com.xtkong.util.ConstantsHBase;

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
		Map<String, String> formatFieldDatas = new HashMap<String, String>();
		for (FormatField formatField : formatFieldService.getFormatFieldsIs_meta(Integer.valueOf(ft_id), ConstantsHBase.IS_meta_true)) {
			formatFieldDatas.put(String.valueOf(formatField.getFf_id()), "  ");
		}
		if (HBaseFormatNodeDao.insertFormatNode(cs_id, sourceDataId, ft_id, nodeName, formatFieldDatas)) {
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
		List<FormatType> formatTypeFolders = HBaseFormatNodeDao.getFormatTypeFolders(cs_id, sourceDataId,
				formatTypeMap);
		if (formatTypeFolders != null) {
			map.put("result", true);
			map.put("formatTypeFloders", formatTypeFolders);
		} else {
			map.put("result", false);
			map.put("message", "获取失败");
		}
		return map;
	}

	/**
	 * 通过formatNodeId获取一个数据节点
	 * 
	 * @param httpSession
	 * @param cs_id
	 * @param sourceDataId
	 * @param ft_id
	 * @param formatNodeId
	 * @param type
	 * @param page 
	 * @param strip 
	 * @return
	 */
	@RequestMapping("/getFormatNodeById")
	public String getFormatNodeById(HttpSession httpSession, String cs_id, String sourceDataId, String ft_id,
			String formatNodeId, String type, Integer page, Integer strip) {

		HashMap<String, FormatType> formatTypeMap = new HashMap<>();
		List<FormatType> formatTypes = formatTypeService.getFormatTypes(Integer.valueOf(cs_id));
		for (FormatType formatType : formatTypes) {
			formatTypeMap.put(String.valueOf(formatType.getFt_id()), formatType);
		}
		List<FormatType> formatTypeFolders = HBaseFormatNodeDao.getFormatTypeFolders(cs_id, sourceDataId,
				formatTypeMap);

		// meta数据
		List<FormatField> meta = formatFieldService.getFormatFieldsIs_meta(Integer.valueOf(ft_id),
				ConstantsHBase.IS_meta_true);
//		httpSession.setAttribute("formatNodeId", formatNodeId);
//		List<List<String>> metaDatas = HBaseFormatDataDao.getFormatDataMetas(cs_id, ft_id, formatNodeId, meta);
//		httpSession.setAttribute("metaDatas", metaDatas);
		// data数据
		List<FormatField> data = formatFieldService.getFormatFieldsIs_meta(Integer.valueOf(ft_id),
				ConstantsHBase.IS_meta_false);
//		httpSession.setAttribute("data", data);
//		List<List<String>> dataDatas = HBaseFormatDataDao.getFormatDatas(cs_id, ft_id, formatNodeId, data);
//		httpSession.setAttribute("dataDatas", dataDatas);
//		httpSession.setAttribute("sourceDataId", sourceDataId);
	
		
		String tableName =ConstantsHBase.TABLE_PREFIX_FORMAT_ + cs_id + "_" + ft_id;
		String family = ConstantsHBase.FAMILY_INFO;
		List<String> mateQualifiers = new ArrayList<>();
		for (FormatField formatField : meta) {
			mateQualifiers.add(String.valueOf(formatField.getFf_id()));
		}
		Map<String, String> whereEqual = new HashMap<>();
		whereEqual.put(ConstantsHBase.QUALIFIER_FORMATNODEID, formatNodeId);
		whereEqual.put("ID", formatNodeId);
		Map<String, String> whereLike = new HashMap<>();
		String condition=null;
		Map<String, Map<String, Object>> metaDatas = PhoenixClient.select(tableName,  mateQualifiers,
				whereEqual, whereLike,condition, 1, 1);

		List<String> dataQualifiers = new ArrayList<>();
		for (FormatField formatField : data) {
			dataQualifiers.add(String.valueOf(formatField.getFf_id()));
		}
		whereEqual.remove("ID");
		condition=" \""+tableName+"\".\"ID\"!='"+formatNodeId+"'";
		Map<String, Map<String, Object>> dataDatas = PhoenixClient.select(tableName, dataQualifiers, whereEqual, whereLike, condition, page, strip);
		String metaMsg = String.valueOf((metaDatas.get("msg")).get("msg"));
		String dataMsg = String.valueOf((dataDatas.get("msg")).get("msg"));
		for (int j = 0; j < 6; j++) {
			metaMsg = String.valueOf((metaDatas.get("msg")).get("msg"));
			dataMsg = String.valueOf((dataDatas.get("msg")).get("msg"));
			if ((metaMsg.equals("success")) && (dataMsg.equals("success"))) {
				break;
			}
			if (!(metaMsg.equals("success"))) {
				metaDatas = PhoenixClient.reSelectWhere(metaMsg, tableName, family, mateQualifiers, whereEqual,
						whereLike, 1, 1);
			}
			if (!(dataMsg.equals("success"))) {
				dataDatas = PhoenixClient.reSelectWhere(dataMsg, tableName, family, dataQualifiers, whereEqual,
						whereLike, page, strip);
			}
		}
		List<List<String>>metaDataList=(List<List<String>>) metaDatas.get("records").get("data");
		List<List<String>> metaDataListTemp = new ArrayList<>();
		int i=0;
		for (FormatField formatField : meta) {
				List<String> formatData = new ArrayList<>();
				formatData.add(String.valueOf(formatField.getFf_id()));
				formatData.add(formatField.getFf_name());
				formatData.add(metaDataList.get(0).get(++i));
				metaDataListTemp.add(formatData);
		}
		httpSession.setAttribute("formatTypeFolders", formatTypeFolders);
		httpSession.setAttribute("formatNodeId", formatNodeId);
		httpSession.setAttribute("metaDatas", metaDataListTemp);
		httpSession.setAttribute("data", data);
		httpSession.setAttribute("dataDatas", dataDatas.get("records").get("data"));
		httpSession.setAttribute("sourceDataId", sourceDataId);
		
		
		switch (type) {
		case "1":
			return "redirect:/jsp/formatdata/data_dataclick.jsp";
		case "2":
			return "redirect:/jsp/formatdata/data_dataclick2.jsp";
		case "3":
			return "redirect:/jsp/formatdata/data_dataclick.jsp";
		case "4":
			return "redirect:/jsp/project/project_dataclick.jsp";
		}
		return "redirect:/jsp/formatdata/data_dataclick.jsp";
//		if (type.equals("2")) {
//			return "redirect:/jsp/formatdata/data_dataclick2.jsp";
//		} else {
//			return "redirect:/jsp/formatdata/data_dataclick.jsp";
//		}
	}

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

}
