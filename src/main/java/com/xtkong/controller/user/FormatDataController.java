package com.xtkong.controller.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.xtkong.dao.hbase.HBaseFormatDataDao;
import com.xtkong.model.FormatField;
import com.xtkong.service.FormatFieldService;
import com.xtkong.service.FormatTypeService;
import com.xtkong.service.PhoenixClient;
import com.xtkong.service.SourceFieldService;
import com.xtkong.service.SourceService;
import com.xtkong.util.ConstantsHBase;

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
	public Map<String, Object> insertFormatData(String cs_id, String ft_id, String sourceDataId, String formatNodeId,
			String formatFieldDatas) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (HBaseFormatDataDao.insertFormatData(cs_id, ft_id, sourceDataId, formatNodeId,
				new Gson().fromJson(formatFieldDatas, new TypeToken<Map<String, String>>() {
				}.getType()))) {
			map.put("result", true);
			map.put("message", "新增成功");
		} else {
			map.put("result", false);
			map.put("message", "新增失败");
		}
		return map;
	}

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
	public Map<String, Object> updateFormatData(String cs_id, String ft_id, String formatNodeId, String formatDataId,
			String formatFieldDatas) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean b = false;
		if (formatNodeId != null) {
			b = HBaseFormatDataDao.updateFormatDatas(cs_id, ft_id, formatNodeId,
					new Gson().fromJson(formatFieldDatas, new TypeToken<Map<String, String>>() {
					}.getType()));
		} else {
			b = HBaseFormatDataDao.updateFormatData(cs_id, ft_id, formatDataId,
					new Gson().fromJson(formatFieldDatas, new TypeToken<Map<String, String>>() {
					}.getType()));
		}
		if (b) {
			map.put("result", true);
			map.put("message", "更新成功");
		} else {
			map.put("result", false);
			map.put("message", "更新失败");
		}
		return map;
	}

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
	public Map<String, Object> getformatDatas(Integer cs_id, Integer ft_id, String formatNodeId, Integer page,
			Integer strip) {
		Map<String, Object> map = new HashMap<String, Object>();
		// meta数据
		List<FormatField> meta = formatFieldService.getFormatFieldsIs_meta(ft_id, ConstantsHBase.IS_meta_true);
		// List<List<String>> metaDatas =
		// HBaseFormatDataDao.getFormatDatas(Integer.toString(cs_id),
		// Integer.toString(ft_id), formatNodeId, meta);
		// data数据
		List<FormatField> data = formatFieldService.getFormatFieldsIs_meta(ft_id, ConstantsHBase.IS_meta_false);
		// List<List<String>> dataDatas =
		// HBaseFormatDataDao.getFormatDatas(Integer.toString(cs_id),
		// Integer.toString(ft_id), formatNodeId, data, page, strip);

		String tableName = ConstantsHBase.TABLE_PREFIX_FORMAT_ + cs_id + "_" + ft_id;
		String family = ConstantsHBase.FAMILY_INFO;
		List<String> mateQualifiers = new ArrayList<>();
		for (FormatField formatField : meta) {
			mateQualifiers.add(String.valueOf(formatField.getFf_id()));
		}
		Map<String, String> whereEqual = new HashMap<>();
		whereEqual.put(ConstantsHBase.QUALIFIER_FORMATNODEID, formatNodeId);
		Map<String, String> whereLike = new HashMap<>();
		Map<String, Map<String, Object>> metaDatas = PhoenixClient.select(tableName, family, mateQualifiers,
				whereEqual, whereLike, 1, 1);

		List<String> dataQualifiers = new ArrayList<>();
		for (FormatField formatField : data) {
			dataQualifiers.add(String.valueOf(formatField.getFf_id()));
		}
		Map<String, Map<String, Object>> dataDatas = PhoenixClient.select(tableName, family, dataQualifiers,
				whereEqual, whereLike, page, strip);

		if (metaDatas != null) {
			map.put("result", true);
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

		} else {
			map.put("result", false);
			map.put("message", "获取失败");
		}
		map.put("meta", meta);
		map.put("metaDatas", metaDatas.get("records").get("data"));
		map.put("data", data);
		map.put("dataDatas", dataDatas.get("records").get("data"));
		map.put("total", dataDatas.get("page").get("totalCount"));
		map.put("page", page);
		map.put("rows", strip);
		return map;
	}

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

}
