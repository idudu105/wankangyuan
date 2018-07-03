package com.xtkong.controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.liutianjun.pojo.User;
import com.xtkong.dao.hbase.HBaseFormatDataDao;
import com.xtkong.dao.hbase.HBaseSourceDataDao;
import com.xtkong.service.FormatFieldService;
import com.xtkong.service.FormatTypeService;
import com.xtkong.service.SourceFieldService;
import com.xtkong.service.SourceService;

@Controller
@RequestMapping("/import")
public class ImportController {
	@Autowired
	SourceService sourceService;
	@Autowired
	SourceFieldService sourceFieldService;
	@Autowired
	FormatTypeService formatTypeService;
	@Autowired
	FormatFieldService formatFieldService;

	@RequestMapping(value = "/sourceData")
	@ResponseBody

	public Map<String, Object> sourceData(@RequestParam(value = "file", required = false) MultipartFile file,
			String cs_id, HttpServletRequest request) {

		User user = (User) request.getAttribute("user");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (file == null || file.getInputStream() == null) {
				map.put("result", false);
				map.put("message", "文件上传失败");
				return map;
			}
			if (file.getSize() > 1024 * 1024) {
				map.put("result", false);
				map.put("message", "文件不能超过10M");
				return map;
			}

			HSSFWorkbook hssfWorkbook = new HSSFWorkbook(file.getInputStream());
			HSSFSheet sheetAt = hssfWorkbook.getSheetAt(0);
			HSSFCell cell = null;
			HSSFRow row = null;
			// List<SourceField> sourceFields =
			// sourceFieldService.getSourceFields(Integer.valueOf(cs_id));
			// 待导入文件中要导入的列的索引,对应的配置表中的字段id
			HashMap<Integer, String> index_csfIdMap = new HashMap<>();
			row = sheetAt.getRow(sheetAt.getFirstRowNum());
			for (int j = row.getFirstCellNum(); j < row.getLastCellNum(); j++) {
				cell = row.getCell(j);
				String csf_Id = String
						.valueOf(sourceFieldService.getSourceFieldId(Integer.valueOf(cs_id), cell.toString()));
				if (!csf_Id.equals("null")) {
					index_csfIdMap.put(j, csf_Id);
				}
			}

			for (int i = sheetAt.getFirstRowNum() + 1; i < sheetAt.getPhysicalNumberOfRows(); i++) {
				row = sheetAt.getRow(i);
				if (row == null) {
					continue;
				}
				Map<String, String> sourceFieldDatas = new HashMap<>();
				for (Entry<Integer, String> index_csfId : index_csfIdMap.entrySet()) {
					cell = row.getCell(index_csfId.getKey());
					sourceFieldDatas.put(index_csfId.getValue(), cell.toString());
				}
				// for (int j = row.getFirstCellNum(); j < row.getLastCellNum();
				// j++) {
				// cell = row.getCell(j);
				// sourceFieldDatas.put(String.valueOf(sourceFields.get(j).getCsf_id()),
				// cell.toString());
				// }
				HBaseSourceDataDao.insertSourceData(cs_id, String.valueOf(user.getId()), sourceFieldDatas);
			}
			hssfWorkbook.close();
		} catch (IOException e1) {
			map.put("result", false);
			map.put("message", "文件上传失败");
			return map;
		}

		return map;
	}

	@RequestMapping(value = "/formatData")
	@ResponseBody
	public Map<String, Object> formatData(@RequestParam(value = "file", required = false) MultipartFile file,
			String cs_id, String ft_id, String sourceDataId, String formatNodeId) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (file == null || file.getInputStream() == null) {
				map.put("result", false);
				map.put("message", "文件上传失败");
				return map;
			}
			if (file.getSize() > 1024 * 1024) {
				map.put("result", false);
				map.put("message", "文件不能超过10M");
				return map;
			}

			HSSFWorkbook hssfWorkbook = new HSSFWorkbook(file.getInputStream());
			HSSFSheet sheetAt = hssfWorkbook.getSheetAt(0);
			HSSFCell cell = null;
			HSSFRow row = null;
//			List<FormatField> data = formatFieldService.getFormatFieldsIs_meta(Integer.valueOf(ft_id),
//					ConstantsHBase.IS_meta_false);
			// 待导入文件中要导入的列的索引,对应的配置表中的字段id
			HashMap<Integer, String> index_ffIdMap = new HashMap<>();
			row = sheetAt.getRow(sheetAt.getFirstRowNum());
			for (int j = row.getFirstCellNum(); j < row.getLastCellNum(); j++) {
				cell = row.getCell(j);
				
				String ff_Id = String
						.valueOf(formatFieldService.getFormatField_ff_id(Integer.valueOf(ft_id), String.valueOf("'"+cell.toString()+"'")));
				if (!ff_Id.equals("null")) {
					index_ffIdMap.put(j, ff_Id);
				}
			}
			for (int i = sheetAt.getFirstRowNum() + 1; i < sheetAt.getPhysicalNumberOfRows(); i++) {
				row = sheetAt.getRow(i);
				if (row == null) {
					continue;
				}				
				Map<String, String> formatFieldDatas = new HashMap<>();
				for (Entry<Integer, String> index_csfId : index_ffIdMap.entrySet()) {
					cell = row.getCell(index_csfId.getKey());
					formatFieldDatas.put(index_csfId.getValue(), cell.toString());
				}
//				for (int j = row.getFirstCellNum(); j < row.getLastCellNum(); j++) {
//					cell = row.getCell(j);
//					formatFieldDatas.put(String.valueOf(data.get(j).getFf_id()), cell.toString());
//				}
				HBaseFormatDataDao.insertFormatData(cs_id, ft_id, sourceDataId, formatNodeId, formatFieldDatas);
			}
			hssfWorkbook.close();
		} catch (IOException e1) {
			map.put("result", false);
			map.put("message", "文件上传失败");
			return map;
		}

		return map;
	}
}
