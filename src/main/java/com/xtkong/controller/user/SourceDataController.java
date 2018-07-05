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

		return getSourceDatas(request, httpSession, type, null, page, strip,null,null);
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
	public String getSourceDatas(HttpServletRequest request, HttpSession httpSession, String type, Integer cs_id,
			Integer page, Integer strip,Integer csf_id,String searchWord) {
		User user = (User) request.getAttribute("user");
		if (page == null) {
			page = 1;
		}
		if (strip == null) {
			strip = 12;
		}
		List<Project> projects;
		List<Source> sources = sourceService.getSourcesForUser();

		httpSession.setAttribute("sources", sources);// 采集源列表

		if (!sources.isEmpty()) {
			if (cs_id == null) {
				cs_id = sourceService.getSourcesForUserLimit(1).get(0).getCs_id();
			}
			Source source = sourceService.getSourceByCs_id(cs_id);
			source.setSourceFields(sourceFieldService.getSourceFields(cs_id));

			// httpSession.setAttribute("source", source);// 采集源字段列表
			// 源数据字段
			// List<List<String>> sourceDatas = new ArrayList<>();
			Map<String, Map<String, Object>> result = new HashMap<>();
			String tableName = ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id;
			String family = ConstantsHBase.FAMILY_INFO;
			List<String> qualifiers = new ArrayList<>();
			for (SourceField sourceField : source.getSourceFields()) {
				qualifiers.add(String.valueOf(sourceField.getCsf_id()));
			}
			Map<String, String> whereEqual = new HashMap<>();
			Map<String, String> whereLike = new HashMap<>();
			if (csf_id != null) {
				if (searchWord==null) {
					searchWord="";
				}
				whereLike.put(String.valueOf(csf_id), searchWord);
			}
			String condition = null;
			// 源数据字段数据，注：每个列表第一个值sourceDataId不显示
			switch (type) {
			case "1":
//				condition = PhoenixClient.getPheonixSQLQualifier(tableName, ConstantsHBase.QUALIFIER_USER) + "='"
//						+ String.valueOf(user.getId()) + "' OR "
//						+ PhoenixClient.getPheonixSQLQualifier(tableName, ConstantsHBase.QUALIFIER_CREATE) + "='"
//						+ String.valueOf(user.getId()) + "'";
				whereEqual.put(ConstantsHBase.QUALIFIER_USER, String.valueOf(user.getId()));
				break;
			case "2":
				SourceField publicStatus = new SourceField();
				publicStatus.setCs_id(cs_id);
				publicStatus.setCsf_name("公开状态");
				source.getSourceFields().add(publicStatus);
				qualifiers.add(ConstantsHBase.QUALIFIER_PUBLIC);
				whereEqual.put(ConstantsHBase.QUALIFIER_CREATE, String.valueOf(user.getId()));
				break;
			case "3":
				whereEqual.put(ConstantsHBase.QUALIFIER_PUBLIC, String.valueOf(ConstantsHBase.VALUE_PUBLIC_TRUE));
				break;
			}
			result = PhoenixClient.select(tableName, qualifiers, whereEqual, whereLike, condition, page, strip);
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
			httpSession.setAttribute("thiscs_id", cs_id);
			httpSession.setAttribute("source", source);// 采集源字段列表
			httpSession.setAttribute("sourceDatas", result.get("records").get("data"));// 源数据字段数据，注：每个列表第一个值sourceDataId不显示
			httpSession.setAttribute("total", result.get("page").get("totalCount"));
			httpSession.setAttribute("page", page);
			httpSession.setAttribute("rows", strip);
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
		default:
			return "redirect:/jsp/formatdata/data_public.jsp";
		}

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
		if (HBaseSourceDataDao.deleteSourceDatas(cs_id, sourceDataIds)) {
			map.put("result", true);
			map.put("message", "删除成功");
		} else {
			map.put("result", false);
			map.put("message", "删除失败");
		}
		return map;
	}
	@RequestMapping("/removeSourceDatas")
	@ResponseBody
	public Map<String, Object> removeSourceDatas(HttpServletRequest request,String cs_id, String sourceDataIds) {
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) request.getAttribute("user");
		Integer uid = user.getId();
		if (HBaseSourceDataDao.removeSourceDatas(cs_id,String.valueOf(uid), sourceDataIds)) {
			map.put("result", true);
			map.put("message", "删除成功");
		} else {
			map.put("result", false);
			map.put("message", "删除失败");
		}
		return map;
	}
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

	@RequestMapping("/addMySource")
	@ResponseBody
	public Map<String, Object> addMySource(HttpServletRequest request,String cs_id, String sourceDataIds) {
		User user = (User) request.getAttribute("user");
		Integer uid = user.getId();
		Map<String, Object> map = new HashMap<String, Object>();
		if (HBaseSourceDataDao.addMySource(cs_id, String.valueOf(uid), sourceDataIds,
				sourceFieldService.getSourceFields(Integer.valueOf(cs_id)))) {
			map.put("result", true);
			map.put("message", "添加成功");
		} else {
			map.put("result", false);
			map.put("message", "添加失败");
		}
		return map;
	}

}
