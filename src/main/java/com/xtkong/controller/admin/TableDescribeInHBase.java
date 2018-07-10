package com.xtkong.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dzjin.service.ProjectService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.liutianjun.pojo.User;
import com.liutianjun.service.UserService;
import com.xtkong.model.TableDescribe;
import com.xtkong.model.TypeDescribe;
import com.xtkong.service.FormatFieldService;
import com.xtkong.service.FormatTypeService;
import com.xtkong.service.SourceFieldService;
import com.xtkong.service.SourceService;
import com.xtkong.util.ConstantsHBase;

@Controller
@RequestMapping("/admin")
public class TableDescribeInHBase {
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
	private UserService userService;

	/**
	 * 获取项目id
	 * 
	 * @param projectName
	 *            项目名
	 * @return
	 */
	@RequestMapping("/getProjectId")
	@ResponseBody
	public Map<String, Object> getProjectId(String projectName) {
		Map<String, Object> map = new HashMap<String, Object>();
		Integer projectId = projectService.getProjectId(projectName);
		map.put("projectId", projectId);
		return map;
	}

	/**
	 * 获取用户id
	 * 
	 * @param userName
	 *            用户名
	 * @return
	 */
	@RequestMapping("/getUserId")
	@ResponseBody
	public Map<String, Object> getUserId(String userName) {
		Map<String, Object> map = new HashMap<String, Object>();
		User user = userService.selectByUsername(userName);
		Integer userId = user.getId();
		map.put("userId", userId);
		return map;
	}

	/**
	 * 获取表信息
	 * 
	 * @param jsonStr
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getTableDescribeInHBase")
	@ResponseBody
	public Map<String, Object> test(String jsonStr) {
		Map<String, Object> map = new HashMap<String, Object>();

		Map<String, Object> gsonMap = new Gson().fromJson(jsonStr, new TypeToken<Map<String, Object>>() {
		}.getType());
		List<TableDescribe> tableDescribes = new ArrayList<>();

		try {
			List<Map<String, Object>> sourceDescribes = (List<Map<String, Object>>) gsonMap.get("tables");
			for (Map<String, Object> sourceDescribe : sourceDescribes) {
				tableDescribes.add(new TableDescribe(sourceDescribe));
			}
			// tableDescribes = (List<TableDescribe>) gsonMap.get("tables");
		} catch (Exception e) {
			map.put("result", "格式错误！");
			return map;
		}
		if (tableDescribes != null && !tableDescribes.isEmpty()) {
			List<Map<String, Object>> tables = new ArrayList<>();
			for (TableDescribe tableDescribe : tableDescribes) {
				Map<String, Object> table = new HashMap<String, Object>();
				if ((tableDescribe.getSourceName() != null && !tableDescribe.getSourceName().isEmpty())) {
					table = getSourceDescribe(tableDescribe.getSourceName(), tableDescribe.getColumns());
					if (tableDescribe.getAnalysis() != null && !tableDescribe.getAnalysis().isEmpty()) {
						List<Map<String, Object>> analysis = new ArrayList<>();
						for (TypeDescribe typeDescribe : tableDescribe.getAnalysis()) {
							analysis.add(getTypeDescribe(tableDescribe.getSourceName(), typeDescribe.getTypeName(),
									typeDescribe.getColumns()));
						}
						table.put("analysis", analysis);
					}
				}
				tables.add(table);
			}
			map.put("tables", tables);
			if (map.size() == 0) {
				map.put("result", "格式错误！");
			}
			return map;
		}
		map.put("result", "格式错误！");
		return map;
	}

	/**
	 * 获取采集源
	 * 
	 * @param cs_name
	 * @param columns
	 * @return
	 */
	private Map<String, Object> getSourceDescribe(String cs_name, List<String> columns) {
		Map<String, Object> map = new HashMap<String, Object>();
		Integer cs_id = sourceService.getSourceId(cs_name);
		if (cs_id != null) {
			Map<String, String> cs = new HashMap<>();
			cs.put(cs_name, ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id);
			map.put("source", cs);
			if (columns != null && !columns.isEmpty()) {
				// List<Integer> csf_ids = new ArrayList<>();
				Map<String, String> csf_ids = new HashMap<>();
				for (String csf_name : columns) {
					Integer csf_id = sourceFieldService.getSourceFieldId(cs_id, csf_name);
					// csf_ids.add(csf_id);
					csf_ids.put(csf_name, String.valueOf(csf_id));
				}
				map.put("columns", csf_ids);
			}
		}
		return map;

	}

	/**
	 * 获取类型
	 * 
	 * @param cs_name
	 * @param ft_name
	 * @param columns
	 * @return
	 */
	private Map<String, Object> getTypeDescribe(String cs_name, String ft_name, List<String> columns) {
		Map<String, Object> map = new HashMap<String, Object>();
		Integer cs_id = sourceService.getSourceId(cs_name);
		if (cs_id != null) {
			Integer ft_id = formatTypeService.getFormatTypeId(cs_id, ft_name);
			if (ft_id != null) {
				Map<String, String> ft = new HashMap<>();
				ft.put(ft_name, ConstantsHBase.TABLE_PREFIX_FORMAT_ + ft_id);
				map.put("type", ft);
				if (columns != null && !columns.isEmpty()) {
					// List<Integer> ff_ids = new ArrayList<>();
					Map<String, String> ff_ids = new HashMap<>();
					for (String ff_name : columns) {
						Integer ff_id = formatFieldService.getFormatField_ff_id(ft_id, ff_name);
						// ff_ids.add(ff_id);
						ff_ids.put(ff_name, String.valueOf(ff_id));
					}
					map.put("columns", ff_ids);
				}
			}
		}
		return map;
	}

}
