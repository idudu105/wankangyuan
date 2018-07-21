package com.xtkong.controller.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.dzjin.model.Project;
import com.dzjin.service.ProjectService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.liutianjun.pojo.User;
import com.xtkong.dao.hbase.HBaseFormatNodeDao;
import com.xtkong.dao.hbase.HBaseSourceDataDao;
import com.xtkong.model.FormatType;
import com.xtkong.model.Source;
import com.xtkong.model.SourceField;
import com.xtkong.service.FormatFieldService;
import com.xtkong.service.FormatTypeService;
import com.xtkong.service.PhoenixClient;
import com.xtkong.service.SourceFieldService;
import com.xtkong.service.SourceService;
import com.xtkong.service.UserDataService;
import com.xtkong.util.ConstantsHBase;

@Controller
@RequestMapping("/sourceData")
public class SourceDataController {

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
	@Autowired
	UserDataService userDataService;

	/**
	 * 首次进入 格式数据页面
	 * 
	 * @param httpSession
	 * @param type
	 *            "1":我的 "2":我创建的 "3":公共
	 * @param user_id
	 */
	@RequestMapping("/firstIn")
	public String firstIn(HttpServletRequest request, HttpSession httpSession, String type, Integer page,
			Integer strip) {

		return getSourceDatas(request, httpSession, type, null, page, strip, null, null, null, null, null, null, null,
				null, null);
	}

	/**
	 * 获取源数据
	 * 
	 * @param request
	 * @param httpSession
	 * @param type
	 *            "1":我的 "2":我创建的 "3":公开"4":项目
	 * @param cs_id
	 * @param page
	 * @param strip
	 * @param searchId
	 * @param desc_asc
	 * @param searchWord
	 * @param chooseDatas
	 * @param oldCondition
	 * @param p_id
	 * @param searchFirstWord
	 * @return sources 采集源列表 source 选中采集源的字段列表 sourceDatas
	 *         源数据字数据，注：每个列表第一个值sourceDataId不显示
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/getSourceDatas")
	public String getSourceDatas(HttpServletRequest request, HttpSession httpSession, String type, Integer cs_id,
			Integer page, Integer strip, Integer searchId, String desc_asc, String searchWord, String chooseDatas,
			String oldCond8ition, Integer p_id, String searchFirstWord, String fieldIds, String likeSearch) {
		User user = (User) request.getAttribute("user");

		if (page == null) {
			page = 1;
		}
		if (strip == null) {
			strip = 12;
		}
		List<Project> projects;
		List<Source> sources = sourceService.getSourcesForUser();
		List<List<String>> sourceDatas = new ArrayList<>();
		Integer total = 0;
		Source source = null;
		String oldCondition = null;
		if (!sources.isEmpty()) {
			try {
				if ((type.equals((String) httpSession.getAttribute("oldSourceType")))
						&& (cs_id.equals((Integer) httpSession.getAttribute("thiscs_id")))) {
					oldCondition = (String) httpSession.getAttribute("oldCondition");
				}
			} catch (Exception e1) {
			}
			if (cs_id == null) {
				cs_id = sourceService.getSourcesForUserLimit(1).get(0).getCs_id();
				oldCondition = null;
			}

			source = sourceService.getSourceByCs_id(cs_id);
			source.setSourceFields(sourceFieldService.getSourceFields(cs_id));

			Map<String, Map<String, Object>> result = new HashMap<>();
			String tableName = ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id;
			List<String> qualifiers = new ArrayList<>();
			Map<String, String> conditionEqual = new HashMap<>();
			Map<String, String> conditionLike = new HashMap<>();
			String condition = "";
			for (SourceField sourceField : source.getSourceFields()) {
				qualifiers.add(String.valueOf(sourceField.getCsf_id()));
			}
			// 源数据字段数据，注：每个列表第一个值sourceDataId不显示
			switch (type) {
			case "1":
				// conditionEqual.put(ConstantsHBase.QUALIFIER_CREATE,
				// String.valueOf(user.getId()));
				condition = "(" + PhoenixClient.getSQLFamilyColumn(ConstantsHBase.QUALIFIER_CREATE) + "='"
						+ String.valueOf(user.getId()) + "' ";
				List<String> sourceDataIds = userDataService.selects(user.getId(), cs_id);
				if (!sourceDataIds.isEmpty()) {
					condition += " OR (";
					for (String sourceDataId : sourceDataIds) {
						condition += "ID='" + sourceDataId + "' OR ";
					}
					if (condition.trim().endsWith("OR")) {
						condition = condition.substring(0, condition.lastIndexOf("OR")) + " ) ";
					}
				}
				condition += ")";
				break;
			case "2":
				SourceField publicStatus = new SourceField();
				publicStatus.setCs_id(cs_id);
				publicStatus.setCsf_name("公开状态");
				source.getSourceFields().add(publicStatus);
				qualifiers.add(ConstantsHBase.QUALIFIER_PUBLIC);
				conditionEqual.put(ConstantsHBase.QUALIFIER_CREATE, String.valueOf(user.getId()));
				break;
			case "3":
				conditionEqual.put(ConstantsHBase.QUALIFIER_PUBLIC, String.valueOf(ConstantsHBase.VALUE_PUBLIC_TRUE));
				break;
			case "4":
				conditionEqual.put(ConstantsHBase.QUALIFIER_PROJECT, String.valueOf(p_id));
				break;
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
						if (qualifiers.contains(fieldId)) {
							like.put(fieldId, searchFirstWord);
						}
					}
					oldCondition += PhoenixClient.getSQLConditionLikes(tableName, like, "OR");
				} else if (!source.getSourceFields().isEmpty()) {
					Map<String, String> like = new HashMap<>();
					for (String qualifier : qualifiers) {
						like.put(qualifier, searchFirstWord);
					}
					oldCondition += PhoenixClient.getSQLConditionLikes(tableName, like, "OR");
				}
			}
			// 筛选
			// oldCondition = (String) httpSession.getAttribute("oldCondition");
			if (searchId != null) {
				if (oldCondition == null) {
					oldCondition = " ";
				} else if (oldCondition.trim().isEmpty()) {
					oldCondition = " ";
				} else {
					oldCondition += " AND ";
				}
				if (chooseDatas != null && !chooseDatas.trim().isEmpty()) {
					oldCondition += "( ";
					for (String csfChooseData : chooseDatas.split(",")) {
						if (csfChooseData.equals("空值")) {
							oldCondition += "\"" + ConstantsHBase.FAMILY_INFO + "\".\"" + String.valueOf(searchId)
									+ "\" IS NULL OR ";
						} else {
							oldCondition += "\"" + ConstantsHBase.FAMILY_INFO + "\".\"" + String.valueOf(searchId)
									+ "\"='" + csfChooseData + "' OR ";
						}
					}
					if (oldCondition.trim().endsWith("OR")) {
						oldCondition = oldCondition.substring(0, oldCondition.lastIndexOf("OR")) + " ) ";
					}
				} else if (likeSearch != null && likeSearch.equals("1") && searchWord != null) {
					oldCondition += "(\"" + ConstantsHBase.FAMILY_INFO + "\".\"" + String.valueOf(searchId)
							+ "\" LIKE '%" + searchWord + "%') ";
				}
				if (oldCondition.trim().endsWith("AND")) {
					oldCondition = oldCondition.substring(0, oldCondition.lastIndexOf("AND"));
				}
			}
			// if (csfCondition != null&& !csfCondition.trim().isEmpty()) {
			// condition = oldCondition;
			// }
			if (oldCondition != null && !oldCondition.trim().isEmpty()) {
				if (type.equals("1")) {
					condition = condition + " AND " + oldCondition;
				} else {
					condition = oldCondition;
				}
			}

			String phoenixSQL = PhoenixClient.getPhoenixSQL(tableName, qualifiers, conditionEqual, conditionLike,
					condition, null, null);
			total = PhoenixClient.count(phoenixSQL);

			// 排序
			condition = null;

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
				condition = " ORDER BY " + PhoenixClient.getSQLFamilyColumn(String.valueOf(searchId)) + " " + desc_asc
						+ " ";
			} else {
				Integer id = (Integer) httpSession.getAttribute("searchId");
				if (qualifiers.contains(String.valueOf(id))) {
					condition = " ORDER BY " + PhoenixClient.getSQLFamilyColumn(String.valueOf(id)) + " " + desc_asc
							+ " ";
				}
			}
			phoenixSQL = PhoenixClient.getPhoenixSQL(phoenixSQL, condition, page, strip);

			result = PhoenixClient.select(phoenixSQL);

			String resultMsg = String.valueOf((result.get("msg")).get("msg"));
			for (int j = 0; j < 6; j++) {
				resultMsg = String.valueOf((result.get("msg")).get("msg"));
				if (resultMsg.equals("success")) {
					sourceDatas = (List<List<String>>) result.get("records").get("data");
					break;
				} else {
					PhoenixClient.undefined(resultMsg, tableName, qualifiers, conditionEqual, conditionLike);
					result = PhoenixClient.select(phoenixSQL);
				}
			}
			httpSession.setAttribute("sources", sources);// 采集源列表
			httpSession.setAttribute("thiscs_id", cs_id);
			httpSession.setAttribute("source", source);// 采集源字段列表
			httpSession.setAttribute("sourceDatas", sourceDatas);// 源数据字段数据，注：每个列表第一个值sourceDataId不显示
			httpSession.setAttribute("total", total);
			httpSession.setAttribute("page", page);
			httpSession.setAttribute("rows", strip);
			httpSession.setAttribute("searchId", searchId);
			httpSession.setAttribute("desc_asc", desc_asc);
			httpSession.setAttribute("oldCondition", oldCondition);
			httpSession.setAttribute("oldSourceType", type);
			httpSession.setAttribute("searchFirstWord", searchFirstWord);
		}
		switch (type) {
		case "1":
			projects = projectService.selectMyProject(user.getId());
			httpSession.setAttribute("projects", projects);// 项目列表
			return "redirect:/jsp/formatdata/data_mine.jsp";
		case "2":
			projects = projectService.selectMyProject(user.getId());
			httpSession.setAttribute("projects", projects);// 项目列表
			return "redirect:/jsp/formatdata/data_create.jsp";
		case "3":
			return "redirect:/jsp/formatdata/data_public.jsp";
		case "4":
			return "redirect:/jsp/project/project_data.jsp";
		default:
			return "redirect:/jsp/formatdata/data_public.jsp";
		}

	}

	@RequestMapping("/reset")
	@ResponseBody
	public Map<String, Object> reset(HttpSession httpSession) {
		Map<String, Object> map = new HashMap<String, Object>();
		httpSession.setAttribute("oldCondition", null);
		map.put("result", true);
		map.put("message", "重置成功");
		return map;

	}

	/**
	 * 获取某字段数据
	 * 
	 * @param request
	 * @param type
	 * @param cs_id
	 * @param searchId
	 *            字段id
	 * @param searchWord
	 * @param oldCondition
	 * @param p_id
	 * @param searchFirstWord
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/getSourceFieldDatas")
	@ResponseBody
	public Map<String, Object> getSourceFieldDatas(HttpServletRequest request, HttpSession httpSession, String type,
			Integer cs_id, Integer searchId, String searchWord, String oldCondition, Integer p_id,
			String searchFirstWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (cs_id == null || searchId == null || type == null) {
			map.put("result", false);
			map.put("message", "查询失败");
			return map;
		}
		Source source = sourceService.getSourceByCs_id(cs_id);
		if (source != null) {
			User user = (User) request.getAttribute("user");
			Map<String, Map<String, Object>> result = new HashMap<>();
			String tableName = ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id;
			List<String> qualifiers = new ArrayList<>();
			Map<String, String> conditionEqual = new HashMap<>();
			Map<String, String> conditionLike = new HashMap<>();
			String condition = (String) httpSession.getAttribute("oldCondition");
			String phoenixSQL = null;

			qualifiers.add(String.valueOf(searchId));
			switch (type) {
			case "1":
				conditionEqual.put(ConstantsHBase.QUALIFIER_USER, String.valueOf(user.getId()));
				break;
			case "2":
				conditionEqual.put(ConstantsHBase.QUALIFIER_CREATE, String.valueOf(user.getId()));
				break;
			case "3":
				conditionEqual.put(ConstantsHBase.QUALIFIER_PUBLIC, String.valueOf(ConstantsHBase.VALUE_PUBLIC_TRUE));
				break;
			case "4":
				if (searchFirstWord == null) {
					searchFirstWord = new String("");
				}
				conditionEqual.put(ConstantsHBase.QUALIFIER_PROJECT, String.valueOf(p_id));
				List<SourceField> csfs = sourceFieldService.getSourceFields(cs_id);
				if (csfs != null && !csfs.isEmpty()) {
					conditionLike.put(String.valueOf(csfs.get(0).getCsf_id()), searchFirstWord);
				}
				break;
			}
			if (searchWord == null) {
				searchWord = "";
			}
			conditionLike.put(String.valueOf(searchId), searchWord);

			// phoenixSQL = PhoenixClient.getPhoenixSQL(tableName, qualifiers,
			// conditionEqual, conditionLike, condition,
			// null, null);
			// phoenixSQL = "SELECT DISTINCT
			// "+phoenixSQL.substring(phoenixSQL.indexOf("SELECT ID ,"));
			if (condition == null || condition.trim().isEmpty()) {
				phoenixSQL = "SELECT DISTINCT " + PhoenixClient.getSQLFamilyColumn(String.valueOf(searchId))
						+ " FROM \"" + tableName + "\"  WHERE  "
						+ PhoenixClient.getSQLConditionEquals(tableName, conditionEqual, "AND") + " AND "
						+ PhoenixClient.getSQLConditionLikes(tableName, conditionLike, "AND") + " ORDER BY "
						+ PhoenixClient.getSQLFamilyColumn(String.valueOf(searchId));

			} else {
				phoenixSQL = "SELECT DISTINCT " + PhoenixClient.getSQLFamilyColumn(String.valueOf(searchId))
						+ " FROM \"" + tableName + "\"  WHERE  "
						+ PhoenixClient.getSQLConditionEquals(tableName, conditionEqual, "AND") + " AND "
						+ PhoenixClient.getSQLConditionLikes(tableName, conditionLike, "AND") + " AND " + condition
						+ " ORDER BY " + PhoenixClient.getSQLFamilyColumn(String.valueOf(searchId));
			}
			result = PhoenixClient.select(phoenixSQL);

			List<String> csfDatas = new ArrayList<>();

			String resultMsg = String.valueOf((result.get("msg")).get("msg"));
			for (int j = 0; j < 6; j++) {
				resultMsg = String.valueOf((result.get("msg")).get("msg"));
				if (resultMsg.equals("success")) {
					try {
						for (List<String> datas : (List<List<String>>) result.get("records").get("data")) {
							csfDatas.add(datas.get(0));
						}
					} catch (Exception e) {
						continue;
					}
					break;
				} else {
					PhoenixClient.undefined(resultMsg, tableName, qualifiers, conditionEqual, conditionLike);
					result = PhoenixClient.select(phoenixSQL);
				}
			}
			map.put("result", true);
			map.put("csfDatas", csfDatas);
		} else {
			map.put("result", false);
			map.put("message", "查询失败");
		}
		return map;
	}

	/**
	 * 获取添加源数据表单
	 * 
	 * @param httpSession
	 * @param type
	 * @param cs_id
	 * @return
	 */
	@RequestMapping("/getInsertSourceDataForm")
	@ResponseBody
	public Map<String, Object> getInsertSourceDataForm(Integer cs_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		Source source = sourceService.getSourceByCs_id(cs_id);
		if (source != null) {
			source.setSourceFields(sourceFieldService.getSourceFields(cs_id));
			map.put("result", true);
			map.put("source", source);
		} else {
			map.put("result", false);
			map.put("message", "查询失败");
		}
		return map;
	}

	/**
	 * 添加一条源数据
	 * 
	 * @param cs_id
	 *            采集源
	 * @param sourceFieldDatas
	 *            采集源字段id、 数据值
	 */
	@RequestMapping("/insertSourceData")
	@ResponseBody
	public Map<String, Object> insertSourceData(HttpServletRequest request, String cs_id, String sourceFieldDatas) {
		User user = (User) request.getAttribute("user");
		Map<String, Object> map = new HashMap<String, Object>();

		if (HBaseSourceDataDao.insertSourceData(cs_id, String.valueOf(user.getId()),
				new Gson().fromJson(sourceFieldDatas, new TypeToken<Map<String, String>>() {
				}.getType())) != null) {
			map.put("result", true);
			map.put("message", "新增成功");
		} else {
			map.put("result", false);
			map.put("message", "新增失败");
		}
		return map;
	}

	/**
	 * 更新一条源数据
	 * 
	 * @param cs_id
	 *            采集源
	 * @param sourceDataId
	 * @param sourceFieldDatas
	 *            采集源字段id、 数据值
	 */
	@RequestMapping("/updateSourceData")
	@ResponseBody
	public Map<String, Object> updateSourceData(String cs_id, String sourceDataId, String soufieldDatas) {
		Map<String, Object> map = new HashMap<String, Object>();

		if (HBaseSourceDataDao.updateSourceData(cs_id, sourceDataId,
				new Gson().fromJson(soufieldDatas, new TypeToken<Map<String, String>>() {
				}.getType()))) {
			map.put("result", true);
			map.put("message", "更新成功");
		} else {
			map.put("result", false);
			map.put("message", "更新失败");
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
	public String getSourceDataById(HttpSession httpSession, String cs_id, String sourceDataId, String type) {

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
		httpSession.setAttribute("type123", type);
		if (type.equals("2")) {
			return "redirect:/jsp/formatdata/data_datain2.jsp";
		} else if (type.equals("4")) {
			return "redirect:/jsp/project/project_datain.jsp";
		} else {
			return "redirect:/jsp/formatdata/data_datain.jsp";
		}
	}

	/**
	 * 批量删除源数据
	 * 
	 * @param cs_id
	 * @param sourceDataIds
	 * @return
	 */
	@RequestMapping("/deleteSourceDatas")
	@ResponseBody
	public Map<String, Object> deleteSourceDatas(String cs_id, String sourceDataIds) {
		Map<String, Object> map = new HashMap<String, Object>();
		// List<String> sourceDataIdList = new ArrayList<>();
		for (String sourceDataId : sourceDataIds.split(",")) {
			// if (!sourceDataId.startsWith(uid+"_")) {
			try {
				userDataService.deleteid(sourceDataId, Integer.valueOf(cs_id));
			} catch (Exception e) {
				continue;
			}
			// sourceDataIdList.add(sourceDataId);
			// }
		}
		if (HBaseSourceDataDao.deleteSourceDatas(cs_id, sourceDataIds)) {
			map.put("result", true);
			map.put("message", "删除成功");
		} else {
			map.put("result", false);
			map.put("message", "删除失败");
		}
		return map;
	}

	/**
	 * 公开
	 * 
	 * @param cs_id
	 * @param sourceDataIds
	 * @return
	 */
	@RequestMapping("/open")
	@ResponseBody
	public Map<String, Object> open(String cs_id, String sourceDataIds) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (HBaseSourceDataDao.open(cs_id, sourceDataIds)) {
			map.put("result", true);
			map.put("message", "公开成功");
		} else {
			map.put("result", false);
			map.put("message", "公开失败");
		}
		return map;
	}

	/**
	 * 取消公开
	 * 
	 * @param cs_id
	 * @param sourceDataIds
	 * @return
	 */
	@RequestMapping("/notOpen")
	@ResponseBody
	public Map<String, Object> notOpen(String cs_id, String sourceDataIds) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (HBaseSourceDataDao.notOpen(cs_id, sourceDataIds)) {
			map.put("result", true);
			map.put("message", "取消公开成功");
		} else {
			map.put("result", false);
			map.put("message", "取消公开失败");
		}
		return map;
	}

	/**
	 * 添加到“我的”
	 * 
	 * @param request
	 * @param cs_id
	 * @param sourceDataIds
	 * @return
	 */
	@RequestMapping("/addMySource")
	@ResponseBody
	public Map<String, Object> addMySource(HttpServletRequest request, String cs_id, String sourceDataIds) {
		User user = (User) request.getAttribute("user");
		Integer uid = user.getId();

		List<String> old = userDataService.selects(uid, Integer.valueOf(cs_id));
		boolean b = true;
		// List<String> sourceDataIdList = new ArrayList<>();
		for (String sourceDataId : sourceDataIds.split(",")) {
			if ((!old.contains(sourceDataId)) && (!sourceDataId.startsWith(uid + "_" + cs_id + "_"))) {
				// sourceDataIdList.add(sourceDataId);
				if (userDataService.insert(uid, sourceDataId, Integer.valueOf(cs_id)) != 1) {
					b = false;
				}
			}
		}

		Map<String, Object> map = new HashMap<String, Object>();
		// if (HBaseSourceDataDao.addMySource(cs_id, String.valueOf(uid),
		// sourceDataIdList,
		// sourceFieldService.getSourceFields(Integer.valueOf(cs_id)))) {
		if (b) {
			map.put("result", true);
			map.put("message", "添加成功");
		} else {
			map.put("result", false);
			map.put("message", "添加失败");
		}
		return map;
	}

	/**
	 * 移出
	 * 
	 * @param request
	 * @param cs_id
	 * @param sourceDataIds
	 * @return
	 */
	@RequestMapping("/removeSourceDatas")
	@ResponseBody
	public Map<String, Object> removeSourceDatas(HttpServletRequest request, String cs_id, String sourceDataIds) {
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) request.getAttribute("user");
		Integer uid = user.getId();
		boolean b = true;
		List<String> old = userDataService.selects(uid, Integer.valueOf(cs_id));
		// List<String> sourceDataIdList = new ArrayList<>();
		for (String sourceDataId : sourceDataIds.split(",")) {
			// if (!sourceDataId.startsWith(uid+"_")) {
			try {
				if (old.contains(sourceDataId)) {
					if (userDataService.delete(uid, sourceDataId, Integer.valueOf(cs_id)) != 1) {
						b = false;
					}
				}
			} catch (Exception e) {
				continue;
			}
			// sourceDataIdList.add(sourceDataId);
			// }
		}

		// if (HBaseSourceDataDao.removeSourceDatas(cs_id, String.valueOf(uid),
		// sourceDataIds)) {
		if (b) {
			map.put("result", true);
			map.put("message", "移出成功");
		} else {
			map.put("result", false);
			map.put("message", "移出失败");
		}
		return map;
	}
}
