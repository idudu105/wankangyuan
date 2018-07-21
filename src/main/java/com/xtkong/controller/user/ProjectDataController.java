package com.xtkong.controller.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xtkong.service.ProjectDataService;
import com.xtkong.service.ProjectNodeDataService;
import com.xtkong.service.ProjectNodeService;
import com.liutianjun.pojo.User;
import com.xtkong.dao.hbase.HBaseFormatNodeDao;
import com.xtkong.dao.hbase.HBaseProjectDataDao;
import com.xtkong.dao.hbase.HBaseSourceDataDao;
import com.xtkong.model.SourceField;
import com.xtkong.service.FormatFieldService;
import com.xtkong.service.FormatTypeService;
import com.xtkong.service.PhoenixClient;
import com.xtkong.service.SourceFieldService;
import com.xtkong.service.SourceService;
import com.xtkong.util.ConstantsHBase;

@Controller
@RequestMapping("/projectFormatData")
public class ProjectDataController {
	@Autowired
	SourceService sourceService;
	@Autowired
	SourceFieldService sourceFieldService;
	@Autowired
	FormatTypeService formatTypeService;
	@Autowired
	FormatFieldService formatFieldService;

	@Autowired
	ProjectDataService projectDataService;
	@Autowired
	ProjectNodeService projectNodeService;
	@Autowired
	ProjectNodeDataService projectNodeDataService;

	@RequestMapping("/insert")
	@ResponseBody
	public Map<String, Object> insert(HttpServletRequest request, HttpSession session, String p_id,
			String sourceDataIds, String cs_id) {
		User user = (User) request.getAttribute("user");
		Integer uid = user.getId();
		Map<String, Object> map = new HashMap<>();
		/*
		 * List<String> old = projectDataService.select(Integer.valueOf(p_id),
		 * Integer.valueOf(cs_id)); List<String> sourceDataIdList = new
		 * ArrayList<>(); for (String sourceDataId : sourceDataIds.split(",")) {
		 * if (!old.contains(sourceDataId)) {
		 * sourceDataIdList.add(sourceDataId);
		 * projectDataService.insert(Integer.valueOf(p_id), sourceDataId,
		 * Integer.valueOf(cs_id)); } } boolean result =
		 * HBaseProjectDataDao.addProjectBySources(String.valueOf(p_id),
		 * String.valueOf(cs_id), String.valueOf(uid), sourceDataIdList,
		 * sourceFieldService.getSourceFields(Integer.valueOf(cs_id)));
		 * 
		 * if (result) { map.put("result", true); map.put("message", "关系绑定成功！");
		 * } else { map.put("result", false); map.put("message", "关系绑定失败！"); }
		 */
		Integer sum = 0;
		Integer count = 0;
		List<SourceField> sourceFields = sourceFieldService.getSourceFields(Integer.valueOf(cs_id));
		for (String sourceDataId : sourceDataIds.split(",")) {
			if (projectDataService.insert(Integer.valueOf(p_id), sourceDataId, Integer.valueOf(cs_id)) == 1) {
				if (HBaseProjectDataDao.addProjectWholeSource(p_id, cs_id, String.valueOf(uid), sourceDataId,
						sourceFields) != null) {
					count++;
				}
			} else {
				count++;
			}
			sum++;
		}

		if (count.equals(sum)) {
			map.put("result", true);
			map.put("message", "添加成功！");
		} else {
			map.put("result", false);
			map.put("message", "成功添加" + count + "条，剩余" + (sum - count) + "条关系添加失败！");
		}
		map.put("count", count);
		map.put("sum", sum);

		return map;
	}

	@RequestMapping("/remove")
	@ResponseBody
	public Map<String, Object> remove(HttpSession session, Integer p_id, String sourceDataIds, String cs_id) {

		Map<String, Object> map = new HashMap<>();

		String[] source_data_id = sourceDataIds.split(",");
		// Map<String, String> sourceFieldDatas = new HashMap<>();
		// sourceFieldDatas.put(ConstantsHBase.QUALIFIER_PROJECT,
		// String.valueOf(" "));
		for (int i = 0; i < source_data_id.length; i++) {
			projectDataService.remove(p_id, source_data_id[i], Integer.valueOf(cs_id));
			
			// HBaseSourceDataDao.updateSourceData(cs_id, source_data_id[i],
			// sourceFieldDatas);
		}
		HBaseSourceDataDao.deleteSourceDatas(cs_id, sourceDataIds);
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

	@SuppressWarnings("unchecked")
	private String getProjectSourceDataId(HttpServletRequest request, String p_id, String cs_id, String sourceDataId) {

		String pSourceDataId = null;
		if (projectDataService.insert(Integer.valueOf(p_id), sourceDataId, Integer.valueOf(cs_id)) == 1) {
			User user = (User) request.getAttribute("user");
			Integer uid = user.getId();
			pSourceDataId = HBaseProjectDataDao.addProjectPartSource(p_id, cs_id, String.valueOf(uid), sourceDataId,
					sourceFieldService.getSourceFields(Integer.valueOf(cs_id)));
		}
		if (pSourceDataId == null) {
			String tableName = ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id;
			Map<String, String> conditionEqual = new HashMap<>();
			conditionEqual.put(ConstantsHBase.QUALIFIER_SOURCEDATAID, sourceDataId);
			conditionEqual.put(ConstantsHBase.QUALIFIER_PROJECT, p_id);
			String phoenixSQL = PhoenixClient.getPhoenixSQL("SELECT ID FROM \"" + tableName + "\" WHERE "
					+ PhoenixClient.getSQLConditionEquals(tableName, conditionEqual, "AND"), null, 1, 1);
			Map<String, Map<String, Object>> result = PhoenixClient.select(phoenixSQL);

			String resultMsg = String.valueOf((result.get("msg")).get("msg"));
			for (int j = 0; j < 6; j++) {
				try {
					resultMsg = String.valueOf((result.get("msg")).get("msg"));
					if (resultMsg.equals("success")) {
						pSourceDataId = ((List<List<String>>) result.get("records").get("data")).get(0).get(j);
						break;
					} else {
						PhoenixClient.undefined(resultMsg, tableName, null, conditionEqual, null);
						result = PhoenixClient.select(phoenixSQL);
					}
				} catch (Exception e) {
					continue;
				}
			}
		}
		return pSourceDataId;
	}

	/**
	 * 添加格式类型数据
	 * 
	 * @param response
	 * @param cs_id
	 * @param sourceDataId
	 * @param ft_ids
	 * @return
	 */
	@RequestMapping("/addFormatType")
	@ResponseBody
	public Map<String, Object> addFormatType(HttpServletRequest request, HttpServletResponse response, String p_id,
			String cs_id, String sourceDataId, String ft_ids) {
		Map<String, Object> map = new HashMap<>();
		String pSourceDataId = getProjectSourceDataId(request, p_id, cs_id, sourceDataId);
		Integer sum = 0;
		Integer count = 0;
		if (pSourceDataId != null) {
			List<String> ft_idList = new ArrayList<>();
			for (String ft_idStr : ft_ids.split(",")) {
				ft_idList.add(ft_idStr);
				sum++;
			}
			List<List<String>> formatNodes = HBaseFormatNodeDao.getFormatNodesByTypes(cs_id, sourceDataId, ft_idList);
			if (pSourceDataId != null && formatNodes != null && !formatNodes.isEmpty()) {
				for (List<String> formatNode : formatNodes) {
					try {
						String nodeId = formatNode.get(0);
						String ft_id = formatNode.get(1);
						String nodeName = formatNode.get(2);
						if (projectNodeService.insert(Integer.valueOf(p_id), nodeId, Integer.valueOf(cs_id),
								Integer.valueOf(ft_id)) == 1) {
							if (HBaseProjectDataDao.addProjectWholeNode(cs_id, pSourceDataId, nodeId, ft_id,
									nodeName) != null) {
								count++;
							}
						} else {
							count++;
						}
					} catch (Exception e) {
						continue;
					}
				}
			}
		}

		if (count.equals(sum)) {
			map.put("result", true);
			map.put("message", "添加成功！");
		} else {
			map.put("result", false);
			map.put("message", "成功添加" + count + "条，剩余" + (sum - count) + "条关系添加失败！");
		}
		map.put("count", count);
		map.put("sum", sum);

		return map;
	}

	@RequestMapping("/addFormatNode")
	@ResponseBody
	public Map<String, Object> addFormatNode(HttpServletRequest request, HttpServletResponse response, String p_id,
			String cs_id, String sourceDataId, String formatNodeIds) {
		Map<String, Object> map = new HashMap<>();
		String pSourceDataId = getProjectSourceDataId(request, p_id, cs_id, sourceDataId);
		List<String> formatNodeIdList = new ArrayList<>();
		for (String formatNodeId : formatNodeIds.split(",")) {
			formatNodeIdList.add(formatNodeId);
		}
		Integer sum = formatNodeIdList.size();
		Integer count = 0;
		if (pSourceDataId != null) {
			List<List<String>> formatNodes = HBaseFormatNodeDao.getFormatNodesByIds(cs_id, formatNodeIdList);
			if (pSourceDataId != null && formatNodes != null && !formatNodes.isEmpty()) {
				for (List<String> formatNode : formatNodes) {
					try {
						String nodeId = formatNode.get(0);
						String ft_id = formatNode.get(1);
						String nodeName = formatNode.get(2);
						if (projectNodeService.insert(Integer.valueOf(p_id), nodeId, Integer.valueOf(cs_id),
								Integer.valueOf(ft_id)) == 1) {
							String pFormatNodeId = HBaseProjectDataDao.addProjectWholeNode(cs_id, pSourceDataId, nodeId,
									ft_id, nodeName);
							if (pFormatNodeId != null) {
								if (projectNodeService.updadaPNodeId(Integer.valueOf(p_id), nodeId,
										Integer.valueOf(cs_id), Integer.valueOf(ft_id), pFormatNodeId) == 1)
									count++;
							}
						} else {
							count++;
						}
					} catch (Exception e) {
						continue;
					}
				}
			}
		}

		if (count.equals(sum)) {
			map.put("result", true);
			map.put("message", "添加成功！");
		} else {
			map.put("result", false);
			map.put("message", "成功添加" + count + "条，剩余" + (sum - count) + "条关系添加失败！");
		}
		map.put("count", count);
		map.put("sum", sum);
		return map;
	}

	@RequestMapping("/addFormatData")
	@ResponseBody
	public Map<String, Object> addFormatData(HttpServletRequest request, HttpServletResponse response, String p_id,
			String cs_id, String sourceDataId, String formatNodeId, String ft_id, String formatDataIds) {
		Map<String, Object> map = new HashMap<>();
		String pSourceDataId = getProjectSourceDataId(request, p_id, cs_id, sourceDataId);
		List<String> dataIds = new ArrayList<>();
		for (String dataId : formatDataIds.split(",")) {
			dataIds.add(dataId);
		}
		Integer sum = dataIds.size();
		Integer count = 0;
		if (pSourceDataId != null) {

			try {
				List<String> formatNode = HBaseFormatNodeDao.getFormatNodeById(cs_id, formatNodeId);
				if (pSourceDataId != null && formatNode != null && !formatNode.isEmpty()) {
					String nodeId = formatNode.get(0);
					// String ft_id = formatNode.get(1);
					String nodeName = formatNode.get(2);
					String pFormatNodeId = null;
					if (projectNodeService.insert(Integer.valueOf(p_id), nodeId, Integer.valueOf(cs_id),
							Integer.valueOf(ft_id)) == 1) {
						pFormatNodeId = HBaseProjectDataDao.addProjectPartNode(cs_id, pSourceDataId, nodeId, ft_id,
								nodeName);
					} else {
						pFormatNodeId = projectNodeService.selectPNoId(Integer.valueOf(p_id), nodeId,
								Integer.valueOf(cs_id), Integer.valueOf(ft_id));
					}
					if (pFormatNodeId != null) {
						for (String dataId : dataIds) {
							if (projectNodeDataService.insert(Integer.valueOf(p_id), dataId, Integer.valueOf(cs_id),
									Integer.valueOf(ft_id)) == 1) {
								String pDataId = HBaseProjectDataDao.addProjectByData(cs_id, pSourceDataId, ft_id,
										pFormatNodeId, nodeId);
								if (pDataId != null) {
									count++;
								}
							} else {
								count++;
							}
						}
					}
				}
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}

		if (count.equals(sum)) {
			map.put("result", true);
			map.put("message", "添加成功！");
		} else {
			map.put("result", false);
			map.put("message", "成功添加" + count + "条，剩余" + (sum - count) + "条关系添加失败！");
		}
		map.put("count", count);
		map.put("sum", sum);
		return map;
	}

}
