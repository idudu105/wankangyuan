package com.xtkong.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.hadoop.hbase.client.Scan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.sql.visitor.functions.If;
import com.dzjin.service.ProjectService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.xtkong.dao.hbase.HBaseFormatDataDao;
import com.xtkong.dao.hbase.HBaseFormatNodeDao;
import com.xtkong.dao.hbase.HBaseSourceDataDao;
import com.xtkong.model.FormatField;
import com.xtkong.model.FormatType;
import com.xtkong.model.Source;
import com.xtkong.service.FormatFieldService;
import com.xtkong.service.FormatTypeService;
import com.xtkong.service.PhoenixClient;
import com.xtkong.service.SourceFieldService;
import com.xtkong.service.SourceService;
import com.xtkong.util.ConstantsHBase;
import com.xtkong.util.HBaseDB;

@Controller
@RequestMapping("/admin")
public class CommonSelect {
	@Autowired
	SourceService sourceService;
	@Autowired
	SourceFieldService sourceFieldService;
	@Autowired
	FormatTypeService formatTypeService;
	@Autowired
	FormatFieldService formatFieldService;
	@Autowired
	ProjectService projectService;

	/**
	 * @param table
	 *            [{ 表类型,采集源,格式类型},{}]
	 * @param tableCol
	 *            [{表,列1,列2},{}]
	 */
	@RequestMapping("/commen1")
	@ResponseBody
	public String commenSelect(List<List<String>> table, List<List<String>> tableCol) {
		for (List<String> list : table) {
			switch (list.get(0)) {
			case "source":

				break;
			case "type":
				break;
			default:
				return "";
			}
		}
		return null;
	}

	@RequestMapping("/commenSelectJson")
	@ResponseBody
	public String commenSelect(String jsonStr) {
		Map<String, Object> gsonMap = new Gson().fromJson(jsonStr, new TypeToken<Map<String, Object>>() {
		}.getType());
		List<String> userid = null;
		if (gsonMap.containsKey("userid")) {
			userid = (List<String>) gsonMap.get("userid");
		}
		List<String> projectid = null;
		if (gsonMap.containsKey("projectid")) {
			projectid = (List<String>) gsonMap.get("projectid");
		}
		String select = null;
		if (gsonMap.containsKey("select")) {
			select = (String) gsonMap.get("select");
		}
		boolean isAddWhere = false;
		if (gsonMap.containsKey("isAddWhere")) {
			isAddWhere = (boolean) gsonMap.get("isAddWhere");
		}
		Map<String, String> conditionEqual = null;
		if (gsonMap.containsKey("conditionEqual")) {
			conditionEqual = (Map<String, String>) gsonMap.get("conditionEqual");
		}
		Map<String, String> conditionLike = null;
		if (gsonMap.containsKey("conditionLike")) {
			conditionLike = (Map<String, String>) gsonMap.get("conditionLike");
		}
		String currPage = null;
		if (gsonMap.containsKey("currPage")) {
			currPage=gsonMap.get("currPage").toString();
		}
		String pageSize = null;
		if (gsonMap.containsKey("pageSize")) {
			pageSize=gsonMap.get("pageSize").toString();
		}

		return commenSelect(userid, projectid, select, isAddWhere, conditionEqual, conditionLike, currPage, pageSize);
	}

	@RequestMapping("/selectContdation")
	@ResponseBody
	public String selectContdation(String cs_id, String sourceDataIds) {
		String selectContdation = "";
		if (sourceDataIds != null) {
			for (String sourceDataId : sourceDataIds.split(",")) {
				selectContdation += ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id + ".id=" + sourceDataId + " OR ";
			}
			selectContdation = selectContdation.substring(0, selectContdation.lastIndexOf("OR"));
		}
		return selectContdation;
	}
	/**
	 * 
	 * @param userid
	 * @param projectid
	 * @param select
	 * @param isAddWhere
	 * @param conditionEqual
	 * @param conditionLike
	 * @param currPage
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/commenSelect1")
	@ResponseBody
	public String commenSelect1(List<String> userid, List<String> projectid, String select, String selectContdation, String currPage, String pageSize) {
		boolean isAddWhere=false;
		boolean and = false;
		if (isAddWhere) {
			select += " WHERE ";
			isAddWhere = false;
		} else {
			select += " AND ";
			and = true;
		}
		if (userid != null && !userid.isEmpty()) {
			select += "(";
			for (String string : userid) {
				select += " \"" + ConstantsHBase.QUALIFIER_USER + "\"= '" + string + "' OR";
			}
			select = select.substring(0, select.lastIndexOf("OR")) + ") AND ";
			and = true;
		}
		if (projectid != null && !projectid.isEmpty()) {
			select += " (";
			for (String string : projectid) {
				select += " \"" + ConstantsHBase.QUALIFIER_PROJECT + "\"= '" + string + "' OR";
			}
			select = select.substring(0, select.lastIndexOf("OR")) + ") AND ";
			and = true;
		}
		if (and) {
			select = select.substring(0, select.lastIndexOf("AND"));
		}
		if (currPage == null) {
			currPage = "0";
		}
		if (pageSize == null) {
			pageSize = "0";
		}
		return new Gson().toJson(PhoenixClient.select(select, Integer.valueOf(currPage), Integer.valueOf(pageSize)))
				.toString();
	}
	/**
	 * 
	 * @param userid
	 * @param projectid
	 * @param select
	 * @param isAddWhere
	 * @param conditionEqual
	 * @param conditionLike
	 * @param currPage
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/commenSelect")
	@ResponseBody
	public String commenSelect(List<String> userid, List<String> projectid, String select, boolean isAddWhere,
			Map<String, String> conditionEqual, Map<String, String> conditionLike, String currPage, String pageSize) {

		boolean and = false;
		if (isAddWhere) {
			select += " WHERE ";
			isAddWhere = false;
		} else {
			select += " AND ";
			and = true;
		}
		if (userid != null && !userid.isEmpty()) {
			select += "(";
			for (String string : userid) {
				select += " \"" + ConstantsHBase.QUALIFIER_USER + "\"= '" + string + "' OR";
			}
			select = select.substring(0, select.lastIndexOf("OR")) + ") AND ";
			and = true;
		}
		if (projectid != null && !projectid.isEmpty()) {
			select += " (";
			for (String string : projectid) {
				select += " \"" + ConstantsHBase.QUALIFIER_PROJECT + "\"= '" + string + "' OR";
			}
			select = select.substring(0, select.lastIndexOf("OR")) + ") AND ";
			and = true;
		}
		if ((conditionEqual != null) && (!conditionEqual.isEmpty())) {
			for (Entry<String, String> eqlual : conditionEqual.entrySet()) {
				select += eqlual.getKey() + "='" + eqlual.getValue() + "' AND ";
				and = true;
			}
		}
		if ((conditionLike != null) && (!conditionLike.isEmpty())) {
			for (Entry<String, String> like : conditionLike.entrySet()) {
				select += like.getKey() + " like '%" + like.getValue() + "%' AND ";
				and = true;
			}
		}
		if (and) {
			select = select.substring(0, select.lastIndexOf("AND"));
		}
		if (currPage == null) {
			currPage = "0";
		}
		if (pageSize == null) {
			pageSize = "0";
		}
		return new Gson().toJson(PhoenixClient.select(select, Integer.valueOf(currPage), Integer.valueOf(pageSize)))
				.toString();
	}

	public static void main(String[] args) {
		CommonSelect commenSl = new CommonSelect();
		List<String> userid = new ArrayList<>();
		// userid.add("45");
		// userid.add("5");
		List<String> projectid = new ArrayList<>();
		// projectid.add("94");
		String select = null;
		select = "SELECT SOURCE_62.PROJECT,SOURCE_62.user,SOURCE_62.\"89\",SOURCE_62.\"90\",SOURCE_62.\"91\","
				+ "SOURCE_62.\"92\",SOURCE_62.\"93\" FROM \"SOURCE_62\" WHERE (		 \"USER\"= '45' OR \"USER\"= '1' ) AND"
				+ " ( \"PROJECT\"= '94' OR \"PROJECT\"= '114' ) AND "
				+ "INFO.\"92\"='value92' AND INFO.\"93\"='value93' AND " + "INFO.\"90\" like '%value90%' " + " LIMIT "
				+ 20 + " OFFSET " + 20 * (1 - 1);
		select = "SELECT * FROM \"FORMAT_62_45\"";
		boolean isAddWhere = false;
		Map<String, String> conditionEqual = new HashMap<>();
		// conditionEqual.put("INFO.PROJECT", "114");
		Map<String, String> conditionLike = new HashMap<>();
		// conditionLike.put("\"89\"", "e");
		String currPage = null;
		String pageSize = null;
		String jsonStr = null;
		jsonStr = "{\"userid\":[\"45\",\"1\"],\"projectid\":[\"94\",\"114\"],\"select\":\"SELECT SOURCE_62.PROJECT,SOURCE_62.user,SOURCE_62.\"89\",SOURCE_62.\"90\",SOURCE_62.\"91\",SOURCE_62.\"92\",SOURCE_62.\"93\",FORMAT_62_45.FORMAT_62_45 FROM \"SOURCE_62\" \",\"isAddWhere\":true,\"conditionEqual\":{\"SOURCE_62.\"92\"\":\"value92\",\"SOURCE_62.\"93\"\":\"SOURCE_62.id\"},\"conditionLike\":{\"SOURCE_62.\"90\"\":\"value91\"},\"currPage\":\"1\",\"pageSize\":\"20\"}";
		String result = null;
		//
		// result = commenSl.commenSelect(userid, projectid, select, isAddWhere,
		// conditionEqual, conditionLike, currPage,
		// pageSize);

		result = commenSl.commenSelect(jsonStr);
		System.out.println("\n" + result + "\n");
	}

	// @RequestMapping("/commenSelect")
	// @ResponseBody
	// public Map<String, Map<String, Object>> commenSelect(List<String> select,
	// List<String> userid,
	// List<String> projectid, Integer currPage, Integer pageSize) {
	// String tableName = null;
	// Map<String, String> whereEqual = new HashMap<>();
	// if (userid != null && !userid.isEmpty()) {
	// for (String string : userid) {
	// whereEqual.put(ConstantsHBase.QUALIFIER_USER, string);
	// }
	// }
	// if (projectid != null && !projectid.isEmpty()) {
	// for (String string : projectid) {
	// whereEqual.put(ConstantsHBase.QUALIFIER_PROJECT, string);
	// }
	// }
	// if (whereEqual != null) {
	//
	// }
	// Map<String, String> whereLike = new HashMap<>();
	// String condition = null;
	// return PhoenixClient.select(tableName, select, whereEqual, whereLike,
	// condition, currPage, pageSize);
	// }

	@RequestMapping("/commenHBaseGetRowkeys")
	@ResponseBody
	public List<String> commenHBaseGetRowkeys(String tableName, String prefixFilter,
			Map<String, String> columnValueFilters) {
		return HBaseDB.getInstance().getRowkeys(tableName, prefixFilter, columnValueFilters);

	}

	@RequestMapping("/commenHBaseScan")
	@ResponseBody
	public List<List<String>> commenHBaseScan(String tableName, Scan scan, List<String> qualifiers) {

		HBaseDB.getInstance();
		return HBaseDB.getQuelifierValues(tableName, scan, qualifiers);
	}

	/**
	 * sources 采集源列表
	 * 
	 * source 选中采集源的字段列表
	 * 
	 * sourceDatas 源数据字数据，注：每个列表第一个值sourceDataId不显示
	 * 
	 * @param httpSession
	 * @param type
	 *            "1":我的 "2":我创建的 "3":公开
	 * @param cs_id
	 * @param page
	 * @param strip
	 * @return
	 */
	@RequestMapping("/getSourceDatas")
	@ResponseBody
	public Map<String, Object> getSourceDatas(String uname, String sourceName, String type, Integer page,
			Integer strip) {
		Map<String, Object> map = new HashMap<String, Object>();

		Integer cs_id = sourceService.getSourceId(sourceName);

		List<Source> sources = sourceService.getSourcesForUser();

		// 源数据字段
		List<List<String>> sourceDatas = new ArrayList<>();
		if (sources != null) {
			Source source = sourceService.getSourceByCs_id(cs_id);
			source.setSourceFields(sourceFieldService.getSourceFields(cs_id));

			map.put("sourceFields", source.getSourceFields());
			// 源数据字段数据，注：每个列表第一个值sourceDataId不显示
			switch (type) {
			case "1":
				sourceDatas = HBaseSourceDataDao.getSourceDatasByUid(Integer.toString(cs_id), String.valueOf(uname),
						source.getSourceFields(), null, page, strip, null);
				map.put("sourceDatas", sourceDatas);

			case "2":
				sourceDatas = HBaseSourceDataDao.getSourceDatasCreated(Integer.toString(cs_id), String.valueOf(uname),
						source.getSourceFields(), page, strip);
				map.put("sourceDatas", sourceDatas);
			case "3":
				sourceDatas = HBaseSourceDataDao.getSourceDatasPublic(Integer.toString(cs_id), source.getSourceFields(),
						page, strip);
				map.put("sourceDatas", sourceDatas);
			}
		}
		return map;

	}

	/**
	 * 通过sourceDataId获取一条源数据
	 * 
	 * @param httpSession
	 * @param cs_id
	 * @param sourceDataId
	 * @return
	 */
	@RequestMapping("/getSourceDataById")
	@ResponseBody
	public Map<String, Object> getSourceDataById(String cs_id, String sourceDataId, String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		Source source = sourceService.getSourceByCs_id(Integer.valueOf(cs_id));
		source.setSourceFields(sourceFieldService.getSourceFields(Integer.valueOf(cs_id)));

		map.put("source", source);// 采集源字段列表

		List<String> sourceData = HBaseSourceDataDao.getSourceDataById(cs_id, sourceDataId, source.getSourceFields());
		map.put("sourceData", sourceData);

		HashMap<String, FormatType> formatTypeMap = new HashMap<>();
		List<FormatType> formatTypes = formatTypeService.getFormatTypes(Integer.valueOf(cs_id));
		for (FormatType formatType : formatTypes) {
			formatTypeMap.put(String.valueOf(formatType.getFt_id()), formatType);
		}
		List<FormatType> formatTypeFolders = HBaseFormatNodeDao.getFormatTypeFolders(cs_id, sourceDataId,
				formatTypeMap);
		map.put("formatTypeFolders", formatTypeFolders);
		return map;
	}

	/**
	 * * 获取节点树 List<FormatType>
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
		map.put("formatTypeFloders", formatTypeFolders);
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
	 * @return
	 */
	@RequestMapping("/getFormatNodeById")
	@ResponseBody
	public Map<String, Object> getFormatNodeById(String cs_id, String sourceDataId, String ft_id, String formatNodeId,
			String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		HashMap<String, FormatType> formatTypeMap = new HashMap<>();
		List<FormatType> formatTypes = formatTypeService.getFormatTypes(Integer.valueOf(cs_id));
		for (FormatType formatType : formatTypes) {
			formatTypeMap.put(String.valueOf(formatType.getFt_id()), formatType);
		}
		List<FormatType> formatTypeFolders = HBaseFormatNodeDao.getFormatTypeFolders(cs_id, sourceDataId,
				formatTypeMap);
		map.put("formatTypeFolders", formatTypeFolders);

		// meta数据
		List<FormatField> meta = formatFieldService.getFormatFieldsIs_meta(Integer.valueOf(ft_id),
				ConstantsHBase.IS_meta_true);
		map.put("formatNodeId", formatNodeId);
		List<List<String>> metaDatas = HBaseFormatDataDao.getFormatDataMetas(cs_id, ft_id, formatNodeId, meta);
		map.put("metaDatas", metaDatas);
		// data数据
		List<FormatField> data = formatFieldService.getFormatFieldsIs_meta(Integer.valueOf(ft_id),
				ConstantsHBase.IS_meta_false);
		map.put("data", data);
		List<List<String>> dataDatas = HBaseFormatDataDao.getFormatDatas(cs_id, ft_id, formatNodeId, data);
		map.put("dataDatas", dataDatas);
		map.put("sourceDataId", sourceDataId);
		return map;

	}

	/**
	 * * 获取格式数据明细 List<List<String>>
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
	public Map<String, Object> getformatDatas(Integer cs_id, Integer ft_id, String formatNodeId, Integer page,
			Integer strip) {
		Map<String, Object> map = new HashMap<String, Object>();
		// meta数据
		List<FormatField> meta = formatFieldService.getFormatFieldsIs_meta(ft_id, ConstantsHBase.IS_meta_true);
		List<List<String>> metaDatas = HBaseFormatDataDao.getFormatDatas(Integer.toString(cs_id),
				Integer.toString(ft_id), formatNodeId, meta);
		// data数据
		List<FormatField> data = formatFieldService.getFormatFieldsIs_meta(ft_id, ConstantsHBase.IS_meta_false);
		List<List<String>> dataDatas = HBaseFormatDataDao.getFormatDatas(Integer.toString(cs_id),
				Integer.toString(ft_id), formatNodeId, data, page, strip);
		map.put("meta", meta);
		map.put("metaDatas", metaDatas);
		map.put("data", data);
		map.put("dataDatas", dataDatas);
		return map;
	}

}
