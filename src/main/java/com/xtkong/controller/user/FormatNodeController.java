package com.xtkong.controller.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
		for (FormatField formatField : formatFieldService.getFormatFieldsIs_meta(Integer.valueOf(ft_id),
				ConstantsHBase.IS_meta_true)) {
			formatFieldDatas.put(String.valueOf(formatField.getFf_id()), "  ");
		}
		if (HBaseFormatNodeDao.insertFormatNode(cs_id, sourceDataId, ft_id, nodeName, formatFieldDatas) != null) {
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
	 * @param searchId
	 * @param desc_asc
	 * @param chooseDatas
	 * @param oldCondition
	 * @param searchWord
	 * @param likeSearch
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/getFormatNodeById")
	public String getFormatNodeById(HttpSession httpSession, String cs_id, String sourceDataId, String ft_id,
			String formatNodeId, String type, Integer page, Integer strip, Integer searchId, String desc_asc,
			String chooseDatas, String oldConditionNode8, String searchWord, String searchFirstWord, String fieldIds,
			String likeSearch) {
		if (page == null) {
			page = 1;
		}
		if (strip == null) {
			strip = 12;
		}

		List<FormatType> formatTypeFolders = new ArrayList<>();
		List<List<String>> metaDataListTemp = new ArrayList<>();
		List<FormatField> data = new ArrayList<>();
		List<List<String>> dataDataLists = new ArrayList<>();
		Integer dataCount = 0;
		String oldCondition = null;
		if (cs_id != null && ft_id != null && sourceDataId != null && formatNodeId != null) {

			HashMap<String, FormatType> formatTypeMap = new HashMap<>();
			List<FormatType> formatTypes = formatTypeService.getFormatTypes(Integer.valueOf(cs_id));
			for (FormatType formatType : formatTypes) {
				formatTypeMap.put(String.valueOf(formatType.getFt_id()), formatType);
			}
			formatTypeFolders = HBaseFormatNodeDao.getFormatTypeFolders(cs_id, sourceDataId, formatTypeMap);

			// meta数据
			List<FormatField> meta = formatFieldService.getFormatFieldsIs_meta(Integer.valueOf(ft_id),
					ConstantsHBase.IS_meta_true);
			// httpSession.setAttribute("formatNodeId", formatNodeId);
			// List<List<String>> metaDatas =
			// HBaseFormatDataDao.getFormatDataMetas(cs_id, ft_id, formatNodeId,
			// meta);
			// httpSession.setAttribute("metaDatas", metaDatas);
			// data数据
			data = formatFieldService.getFormatFieldsIs_meta(Integer.valueOf(ft_id), ConstantsHBase.IS_meta_false);
			// httpSession.setAttribute("data", data);
			// List<List<String>> dataDatas =
			// HBaseFormatDataDao.getFormatDatas(cs_id, ft_id, formatNodeId,
			// data);
			// httpSession.setAttribute("dataDatas", dataDatas);
			// httpSession.setAttribute("sourceDataId", sourceDataId);

			String tableName = ConstantsHBase.TABLE_PREFIX_FORMAT_ + cs_id + "_" + ft_id;
			Map<String, String> conditionEqual = new HashMap<>();
			Map<String, String> conditionLike = new HashMap<>();
			String condition = null;

			conditionEqual.put(ConstantsHBase.QUALIFIER_FORMATNODEID, formatNodeId);
			if (!meta.isEmpty()) {
				List<String> mateQualifiers = new ArrayList<>();
				for (FormatField formatField : meta) {
					mateQualifiers.add(String.valueOf(formatField.getFf_id()));
				}
//				condition = " \"" + tableName + "\".\"ID\"='" + formatNodeId + "'";
				String matephoenixSQL = PhoenixClient.getPhoenixSQL(tableName, mateQualifiers, conditionEqual,
						conditionLike, condition, 1, 1);
				Map<String, Map<String, Object>> metaDatas = PhoenixClient.select(matephoenixSQL);
				// select(tableName, mateQualifiers,
				// conditionEqual, conditionLike,condition, 1, 1);
				String metaMsg = String.valueOf((metaDatas.get("msg")).get("msg"));
				List<List<String>> metaDataList = new ArrayList<>();
				for (int j = 0; j < 6; j++) {
					metaMsg = String.valueOf((metaDatas.get("msg")).get("msg"));
					if (metaMsg.equals("success")) {
						metaDataList = (List<List<String>>) metaDatas.get("records").get("data");
						break;
					} else {
						PhoenixClient.undefined(metaMsg, tableName, mateQualifiers, conditionEqual, conditionLike);
						metaDatas = PhoenixClient.select(matephoenixSQL);
					}
				}
				int i = 0;
				for (FormatField formatField : meta) {
					List<String> formatData = new ArrayList<>();
					formatData.add(String.valueOf(formatField.getFf_id()));
					formatData.add(formatField.getFf_name());
					try {
						formatData.add(metaDataList.get(0).get(++i));
					} catch (Exception e) {
						formatData.add("");
					}
					metaDataListTemp.add(formatData);
				}
			}
			if (!data.isEmpty()) {
				condition = null;

				List<String> dataQualifiers = new ArrayList<>();
				for (FormatField formatField : data) {
					dataQualifiers.add(String.valueOf(formatField.getFf_id()));
				}
				if ((type.equals((String) httpSession.getAttribute("oldSourceType")))
						&& (formatNodeId.equals((String) httpSession.getAttribute("formatNodeId")))
						&& (sourceDataId.equals((String) httpSession.getAttribute("sourceDataId")))) {
					oldCondition = (String) httpSession.getAttribute("oldCondition");
				}

				// 头筛选
				if (searchFirstWord != null && !searchFirstWord.trim().isEmpty()) {
					if (oldCondition == null) {
						oldCondition = " ";
					} else if (oldCondition.trim().isEmpty()) {
						oldCondition = " ";
					} else {
						oldCondition += " AND ";
					}
					if (fieldIds != null && !fieldIds.trim().isEmpty()) {
						Map<String, String> like = new HashMap<>();
						for (String fieldId : fieldIds.split(",")) {
							if (dataQualifiers.contains(fieldId)) {
								like.put(fieldId, searchFirstWord);
							}
						}
						oldCondition += PhoenixClient.getSQLConditionLikes(tableName, like, "OR");
					} else if (!data.isEmpty()) {
						Map<String, String> like = new HashMap<>();
						for (String qualifier : dataQualifiers) {
							like.put(qualifier, searchFirstWord);
						}
						oldCondition += PhoenixClient.getSQLConditionLikes(tableName, like, "OR");
					}
				}
				// 筛选
				if (searchId != null) {
					if (oldCondition == null) {
						oldCondition = " ";
					} else if (oldCondition.trim().isEmpty()) {
						oldCondition = " ";
					} else {
						oldCondition += " AND ";
					}
					boolean isnull = false;
					if (chooseDatas != null && !chooseDatas.trim().isEmpty()) {
						oldCondition += "( ";
						for (String csfChooseData : chooseDatas.split(",")) {
							if (csfChooseData.equals("空值")) {
								oldCondition += "\"" + ConstantsHBase.FAMILY_INFO + "\".\"" + String.valueOf(searchId)
										+ "\" IS NULL OR ";
								isnull = true;
							} else {
								oldCondition += "\"" + ConstantsHBase.FAMILY_INFO + "\".\"" + String.valueOf(searchId)
										+ "\"='" + csfChooseData + "' OR ";
							}
						}
						if (oldCondition.trim().endsWith("OR")) {
							oldCondition = oldCondition.substring(0, oldCondition.lastIndexOf("OR")) + " ) AND ";
						}
					}
					if (likeSearch != null && likeSearch.equals("1") && searchWord != null && !isnull) {
						oldCondition += "(\"" + ConstantsHBase.FAMILY_INFO + "\".\"" + String.valueOf(searchId)
								+ "\" LIKE '%" + searchWord + "%') ";
					}
					if (oldCondition.trim().endsWith("AND")) {
						oldCondition = oldCondition.substring(0, oldCondition.lastIndexOf("AND"));
					}

					/*
					 * oldCondition = "( "; if (chooseDatas != null &&
					 * !chooseDatas.trim().isEmpty()) { for (String
					 * csfChooseData : chooseDatas.split(",")) { oldCondition +=
					 * "\"" + ConstantsHBase.FAMILY_INFO + "\".\"" +
					 * String.valueOf(searchId) + "\"='" + csfChooseData +
					 * "' OR "; } } if (searchWord != null) { if
					 * (searchWord.equals("空值")) { oldCondition += "\"" +
					 * ConstantsHBase.FAMILY_INFO + "\".\"" +
					 * String.valueOf(searchId) + "\" IS NULL "; } else {
					 * oldCondition += "\"" + ConstantsHBase.FAMILY_INFO +
					 * "\".\"" + String.valueOf(searchId) + "\" LIKE '%" +
					 * searchWord + "%' OR "; } } if
					 * (oldCondition.trim().endsWith("OR")) { oldCondition =
					 * oldCondition.substring(0, oldCondition.lastIndexOf("OR"))
					 * + " )"; } else { oldCondition = null; }
					 */
				} /*
					 * if (searchId != null && chooseDatas != null &&
					 * !chooseDatas.trim().isEmpty()) { if (searchWord == null)
					 * { searchWord = ""; }
					 * conditionLike.put(String.valueOf(searchId), searchWord);
					 * oldCondition = " ( "; for (String csfChooseData :
					 * chooseDatas.split(",")) { oldCondition += "\"" +
					 * ConstantsHBase.FAMILY_INFO + "\".\"" +
					 * String.valueOf(searchId) + "\"='" + csfChooseData +
					 * "' OR "; } if (oldCondition.trim().endsWith("OR")) {
					 * oldCondition = oldCondition.substring(0,
					 * oldCondition.lastIndexOf("OR")) + " ) "; } }
					 */
				if (oldCondition == null || oldCondition.trim().isEmpty()) {
					condition = " \"" + tableName + "\".\"ID\"!='" + formatNodeId + "' ";
				} else {
					condition = " \"" + tableName + "\".\"ID\"!='" + formatNodeId + "' AND " + oldCondition;
				}
				// conditionEqual.remove("ID");
				String dataphoenixSQL = PhoenixClient.getPhoenixSQL(tableName, dataQualifiers, conditionEqual,
						conditionLike, condition, null, null);
				dataCount = PhoenixClient.count(dataphoenixSQL);
				// 排序
				condition = null;
				/*
				 * if (searchId != null) { switch (desc_asc) { case "DESC":
				 * condition = " ORDER BY " +
				 * PhoenixClient.getSQLFamilyColumn(String.valueOf(searchId)) +
				 * " DESC "; break; case "ASC": condition = " ORDER BY " +
				 * PhoenixClient.getSQLFamilyColumn(String.valueOf(searchId)) +
				 * " ASC "; break; } }
				 */
				try {
					switch (desc_asc) {
					case "DESC":
						break;
					case "ASC":
						break;
					default:
						desc_asc = (String) httpSession.getAttribute("desc_asc");
					}
					if (desc_asc == null) {
						desc_asc = "ASC";
					}
					switch (desc_asc) {
					case "DESC":
						break;
					case "ASC":
						break;
					default:
						desc_asc = "ASC";
					}
				} catch (Exception e) {
					desc_asc = "ASC";
				}
				if (searchId != null) {
					condition = " ORDER BY " + PhoenixClient.getSQLFamilyColumn(String.valueOf(searchId)) + " "
							+ desc_asc + " ";
				} else {
					Integer id = (Integer) httpSession.getAttribute("searchId");
					if (dataQualifiers.contains(String.valueOf(id))) {
						condition = " ORDER BY " + PhoenixClient.getSQLFamilyColumn(String.valueOf(id)) + " " + desc_asc
								+ " ";
					}
				}
				dataphoenixSQL = PhoenixClient.getPhoenixSQL(dataphoenixSQL, condition, page, strip);
				Map<String, Map<String, Object>> dataDatas = PhoenixClient.select(dataphoenixSQL);
				// PhoenixClient.select(tableName, dataQualifiers,
				// conditionEqual,
				// conditionLike, condition, page, strip);
				String dataMsg = String.valueOf((dataDatas.get("msg")).get("msg"));
				for (int j = 0; j < 6; j++) {
					dataMsg = String.valueOf((dataDatas.get("msg")).get("msg"));
					if (dataMsg.equals("success")) {
						dataDataLists = (List<List<String>>) dataDatas.get("records").get("data");
						break;
					} else {
						PhoenixClient.undefined(dataMsg, tableName, dataQualifiers, conditionEqual, conditionLike);
						dataDatas = PhoenixClient.select(dataphoenixSQL);
					}
				}
			}
		}
		httpSession.setAttribute("formatTypeFolders", formatTypeFolders);
		httpSession.setAttribute("formatNodeId", formatNodeId);
		httpSession.setAttribute("metaDatas", metaDataListTemp);
		httpSession.setAttribute("data", data);
		httpSession.setAttribute("dataDatas", dataDataLists);
		httpSession.setAttribute("sourceDataId", sourceDataId);
		httpSession.setAttribute("total", dataCount);
		httpSession.setAttribute("page", page);
		httpSession.setAttribute("rows", strip);
		httpSession.setAttribute("searchId", searchId);
		httpSession.setAttribute("desc_asc", desc_asc);
		httpSession.setAttribute("oldCondition", oldCondition);
		httpSession.setAttribute("cs_id", cs_id);
		httpSession.setAttribute("oldSourceType", type);
		httpSession.setAttribute("searchFirstWordNode", searchFirstWord);

		switch (type) {
		case "1":
			return "redirect:/jsp/formatdata/data_dataclick.jsp";
		case "2":
			return "redirect:/jsp/formatdata/data_dataclick2.jsp";
		case "3":
			return "redirect:/jsp/formatdata/data_dataclick3.jsp";
		case "4":
			return "redirect:/jsp/project/project_dataclick.jsp";
		}
		return "redirect:/jsp/formatdata/data_dataclick.jsp";
		// if (type.equals("2")) {
		// return "redirect:/jsp/formatdata/data_dataclick2.jsp";
		// } else {
		// return "redirect:/jsp/formatdata/data_dataclick.jsp";
		// }
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
