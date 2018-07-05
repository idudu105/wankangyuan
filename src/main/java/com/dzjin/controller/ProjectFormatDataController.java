package com.dzjin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dzjin.service.ProjectDataService;
import com.xtkong.dao.hbase.HBaseFormatNodeDao;
import com.xtkong.dao.hbase.HBaseSourceDataDao;
import com.xtkong.model.FormatField;
import com.xtkong.model.FormatType;
import com.xtkong.model.Source;
import com.xtkong.model.SourceField;
import com.xtkong.service.FormatFieldService;
import com.xtkong.service.FormatTypeService;
import com.xtkong.service.PhoenixClient;
import com.xtkong.service.SourceFieldService;
import com.xtkong.service.SourceService;
import com.xtkong.util.ConstantsHBase;

/**
 * 
 * 项目名称：wankangyuan 类名称：ProjectFormatDataController 类描述： 项目内格式数据controller
 * 创建人：dzjin 创建时间：2018年6月28日 上午9:30:34 修改人：dzjin 修改时间：2018年6月28日 上午9:30:34 修改备注：
 * 
 * @version
 *
 */
@Controller
@RequestMapping("/projectFormatData")
public class ProjectFormatDataController {

	@Autowired
	ProjectDataService projectDataService;

	@Autowired
	SourceService sourceService;
	@Autowired
	SourceFieldService sourceFieldService;
	@Autowired
	FormatTypeService formatTypeService;
	@Autowired
	FormatFieldService formatFieldService;

	@RequestMapping("/insert")
	@ResponseBody
	public Map<String, Object> insert(HttpSession session, Integer p_id, String sourceDataIds, String cs_id) {

		Map<String, Object> map = new HashMap<>();

		String[] source_data_id = sourceDataIds.split(",");

		Map<String, String> sourceFieldDatas = new HashMap<>();
		sourceFieldDatas.put(ConstantsHBase.QUALIFIER_PROJECT, String.valueOf(p_id));
		for (int i = 0; i < source_data_id.length; i++) {
			// projectDataService.insert(new ProjectDataRelation(p_id,
			// source_data_id[i]));
			HBaseSourceDataDao.updateSourceData(cs_id, source_data_id[i], sourceFieldDatas);
		}
		/*
		 * if(num == source_data_id.length){ map.put("result", true);
		 * map.put("message", "关系绑定成功！"); }else{ map.put("result", false);
		 * map.put("message",
		 * "共绑定"+num+"条关系，剩余"+(source_data_id.length-num)+"条关系绑定失败！"); }
		 */
		map.put("result", true);
		map.put("message", "关系绑定成功！");

		return map;
	}

	@RequestMapping("/remove")
	@ResponseBody
	public Map<String, Object> remove(HttpSession session, Integer p_id, String sourceDataIds, String cs_id) {

		Map<String, Object> map = new HashMap<>();

		String[] source_data_id = sourceDataIds.split(",");
		Map<String, String> sourceFieldDatas = new HashMap<>();
		sourceFieldDatas.put(ConstantsHBase.QUALIFIER_PROJECT, String.valueOf("  "));
		for (int i = 0; i < source_data_id.length; i++) {
			// projectDataService.remove(new ProjectDataRelation(p_id,
			// source_data_id[i]));
			HBaseSourceDataDao.updateSourceData(cs_id, source_data_id[i], sourceFieldDatas);
		}
		/*
		 * if(num == source_data_id.length){ map.put("result", true);
		 * map.put("message", "关系绑定成功！"); }else{ map.put("result", false);
		 * map.put("message",
		 * "共绑定"+num+"条关系，剩余"+(source_data_id.length-num)+"条关系绑定失败！"); }
		 */
		map.put("result", true);
		map.put("message", "关系解绑定成功！");

		return map;
	}

	/**
	 * 第一次进入cs_id 为空
	 * 
	 * @param httpSession
	 * @param p_id
	 * @param cs_id
	 * @return
	 */
	@RequestMapping("/getSourceDatas")
	public String getSourceDatas(HttpSession httpSession, Integer p_id, Integer cs_id, Integer page, Integer strip,
			String searchWord) {
		if (page == null) {
			page = 1;
		}
		if (strip == null) {
			strip = 12;
		}
		if (searchWord == null) {
			searchWord = new String("");
			httpSession.setAttribute("searchWord", null);
		} else {
			// 更新关键字
			httpSession.setAttribute("searchWord", searchWord);
		}
		List<Source> sources = sourceService.getSourcesForUser();

		httpSession.setAttribute("sources", sources);// 采集源列表

		if (!sources.isEmpty()) {
			if (cs_id == null) {
				cs_id = sourceService.getSourcesForUserLimit(1).get(0).getCs_id();
			}
			Source source = sourceService.getSourceByCs_id(cs_id);
			source.setSourceFields(sourceFieldService.getSourceFields(cs_id));
			httpSession.setAttribute("source", source);// 采集源字段列表

			/*
			 * List<String> sourceDataIds =
			 * projectDataService.select(p_id,cs_id); // 源数据字段
			 * List<List<String>> sourceDatas = new ArrayList<>(); if
			 * (!sourceDataIds.isEmpty()) { // 源数据字段数据，注：每个列表第一个值sourceDataId不显示
			 * sourceDatas =
			 * HBaseSourceDataDao.getSourceDatasByIds(Integer.toString(cs_id),
			 * sourceDataIds, source.getSourceFields()); }
			 */
			String tableName = ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id;
			String family = ConstantsHBase.FAMILY_INFO;

			List<String> qualifiers = new ArrayList<>();
			for (SourceField sourceField : source.getSourceFields()) {
				qualifiers.add(String.valueOf(sourceField.getCsf_id()));
			}
			Map<String, String> whereEqual = new HashMap<>();
			whereEqual.put(ConstantsHBase.QUALIFIER_PROJECT, String.valueOf(p_id));

			Map<String, String> whereLike = new HashMap<>();
			if (searchWord != null) {
				whereLike.put(String.valueOf(source.getSourceFields().get(0).getCsf_id()), searchWord);
			}

			Map<String, Map<String, Object>> result = PhoenixClient.select(tableName, family, qualifiers, whereEqual,
					whereLike, page, strip);
			String resultMsg = String.valueOf((result.get("msg")).get("msg"));
			for (int j = 0; j < 6; j++) {
				resultMsg = String.valueOf((result.get("msg")).get("msg"));
				if (resultMsg.equals("success")) {
					break;
				} else {
					result = PhoenixClient.reSelectWhere(resultMsg, tableName, family, qualifiers, whereEqual,
							whereLike, page, strip);
				}
			}
			httpSession.setAttribute("sourceDatas", result.get("records").get("data"));// 源数据字段数据，注：每个列表第一个值sourceDataId不显示
			httpSession.setAttribute("total", result.get("page").get("totalCount"));
			httpSession.setAttribute("page", page);
			httpSession.setAttribute("rows", strip);

		}
		return "redirect:/jsp/project/project_data.jsp";
	}

	@RequestMapping("/getAllSourceDatas")
	public String getAllSourceDatas(HttpSession httpSession, Integer p_id, Integer cs_id) {
		List<Source> sources = sourceService.getSourcesForUser();
		httpSession.setAttribute("p_id", p_id);
		httpSession.setAttribute("sources", sources);// 采集源列表

		if (!sources.isEmpty()) {
			if (cs_id == null) {
				cs_id = sourceService.getSourcesForUserLimit(1).get(0).getCs_id();
			}
			Source source = sourceService.getSourceByCs_id(cs_id);
			source.setSourceFields(sourceFieldService.getSourceFields(cs_id));
			httpSession.setAttribute("source", source);// 采集源字段列表

			String tableName = ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id;
			String family = ConstantsHBase.FAMILY_INFO;

			List<String> qualifiers = new ArrayList<>();
			for (SourceField sourceField : source.getSourceFields()) {
				qualifiers.add(String.valueOf(sourceField.getCsf_id()));
			}
			Map<String, String> whereEqual = new HashMap<>();
			whereEqual.put(ConstantsHBase.QUALIFIER_PROJECT, String.valueOf(p_id));

			Map<String, String> whereLike = new HashMap<>();

			Map<String, Map<String, Object>> result = PhoenixClient.select(tableName, qualifiers, whereEqual,
					whereLike, null,  null,null);
			String resultMsg = String.valueOf((result.get("msg")).get("msg"));
			for (int j = 0; j < 6; j++) {
				resultMsg = String.valueOf((result.get("msg")).get("msg"));
				if (resultMsg.equals("success")) {
					break;
				} else {
					result = PhoenixClient.reSelectWhere(resultMsg, tableName, family, qualifiers, whereEqual,
							whereLike, null, null);
				}
			}
			httpSession.setAttribute("sourceDatas", result.get("records").get("data"));// 源数据字段数据，注：每个列表第一个值sourceDataId不显示

		}
		return "/jsp/project/data_reselect.jsp";
	}

	@RequestMapping("/getSourceDataById")
	public String getSourceDataById(HttpSession httpSession, String cs_id, String sourceDataId) {

		Source source = sourceService.getSourceByCs_id(Integer.valueOf(cs_id));
		source.setSourceFields(sourceFieldService.getSourceFields(Integer.valueOf(cs_id)));

		httpSession.setAttribute("source", source);// 采集源字段列表

		List<String> sourceData = HBaseSourceDataDao.getSourceDataById(cs_id, sourceDataId, source.getSourceFields());
		httpSession.setAttribute("sourceData", sourceData);

		HashMap<String, FormatType> formatTypeMap = new HashMap<>();
		List<FormatType> formatTypes = formatTypeService.getFormatTypes(Integer.valueOf(cs_id));
		for (FormatType formatType : formatTypes) {
			formatTypeMap.put(String.valueOf(formatType.getFt_id()), formatType);
		}
		List<FormatType> formatTypeFolders = HBaseFormatNodeDao.getFormatTypeFolders(cs_id, sourceDataId,
				formatTypeMap);
		httpSession.setAttribute("formatTypeFolders", formatTypeFolders);

		return "redirect:/jsp/project/project_datain.jsp";

	}

	@RequestMapping("/getFormatNodeById")
	public String getFormatNodeById(HttpSession httpSession, String cs_id, String sourceDataId, String ft_id,
			String formatNodeId, Integer page, Integer strip) {
		if (page == null) {
			page = 1;
		}
		if (strip == null) {
			strip = 3;
		}
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
		// data数据
		List<FormatField> data = formatFieldService.getFormatFieldsIs_meta(Integer.valueOf(ft_id),
				ConstantsHBase.IS_meta_false);

		String tableName = ConstantsHBase.TABLE_PREFIX_FORMAT_ + cs_id + "_" + ft_id;
		String family = ConstantsHBase.FAMILY_INFO;
		List<String> mateQualifiers = new ArrayList<>();
		for (FormatField formatField : meta) {
			mateQualifiers.add(String.valueOf(formatField.getFf_id()));
		}
		Map<String, String> whereEqual = new HashMap<>();
		whereEqual.put(ConstantsHBase.QUALIFIER_FORMATNODEID, formatNodeId);
		whereEqual.put("ID", formatNodeId);
		Map<String, String> whereLike = new HashMap<>();
		String condition = null;
		Map<String, Map<String, Object>> metaDatas = PhoenixClient.select(tableName, mateQualifiers, whereEqual,
				whereLike, condition, 1, 1);

		List<String> dataQualifiers = new ArrayList<>();
		for (FormatField formatField : data) {
			dataQualifiers.add(String.valueOf(formatField.getFf_id()));
		}
		whereEqual.remove("ID");
		condition = " \"" + tableName + "\".\"ID\"!='" + formatNodeId + "'";
		Map<String, Map<String, Object>> dataDatas = PhoenixClient.select(tableName, dataQualifiers, whereEqual,
				whereLike, condition, page, strip);
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
		@SuppressWarnings("unchecked")
		List<List<String>> metaDataList = (List<List<String>>) metaDatas.get("records").get("data");
		List<List<String>> metaDataListTemp = new ArrayList<>();
		int i = 0;
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
		httpSession.setAttribute("total", dataDatas.get("page").get("totalCount"));
		httpSession.setAttribute("page", page);
		httpSession.setAttribute("rows", strip);
		return "redirect:/jsp/project/project_dataclick.jsp";
	}
}
