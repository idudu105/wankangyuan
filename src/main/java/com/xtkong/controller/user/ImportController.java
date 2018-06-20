package com.xtkong.controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

import com.xtkong.dao.hbase.HBaseFormatDataDao;
import com.xtkong.dao.hbase.HBaseSourceDataDao;
import com.xtkong.model.FormatField;
import com.xtkong.model.SourceField;
import com.xtkong.service.FormatFieldService;
import com.xtkong.service.FormatTypeService;
import com.xtkong.service.SourceFieldService;
import com.xtkong.service.SourceService;
import com.xtkong.util.ConstantsHBase;

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
			String cs_id) {

		String uid = "1";
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
			List<SourceField> sourceFields = sourceFieldService.getSourceFields(Integer.valueOf(cs_id));
			for (int i = sheetAt.getFirstRowNum() + 1; i < sheetAt.getPhysicalNumberOfRows(); i++) {
				row = sheetAt.getRow(i);
				if (row == null) {
					continue;
				}
				Map<String, String> sourceFieldDatas = new HashMap<>();
				for (int j = row.getFirstCellNum(); j < row.getLastCellNum(); j++) {
					cell = row.getCell(j);
					sourceFieldDatas.put(String.valueOf(sourceFields.get(j).getCsf_id()), cell.toString());
				}
				HBaseSourceDataDao.insertSourceData(cs_id, uid, sourceFieldDatas);
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
			String cs_id, String ft_id, String formatNodeId) {
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
			List<FormatField> data = formatFieldService.getFormatFieldsIs_meta(Integer.valueOf(ft_id),
					ConstantsHBase.IS_meta_false);
			for (int i = sheetAt.getFirstRowNum() + 1; i < sheetAt.getPhysicalNumberOfRows(); i++) {
				row = sheetAt.getRow(i);
				if (row == null) {
					continue;
				}
				Map<String, String> formatFieldDatas = new HashMap<>();
				for (int j = row.getFirstCellNum(); j < row.getLastCellNum(); j++) {
					cell = row.getCell(j);
					formatFieldDatas.put(String.valueOf(data.get(j).getFf_id()), cell.toString());
				}
				HBaseFormatDataDao.insertFormatData(cs_id, ft_id, formatNodeId, formatFieldDatas);
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
