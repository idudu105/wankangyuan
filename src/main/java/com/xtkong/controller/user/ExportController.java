package com.xtkong.controller.user;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xtkong.dao.hbase.HBaseFormatDataDao;
import com.xtkong.dao.hbase.HBaseFormatNodeDao;
import com.xtkong.dao.hbase.HBaseSourceDataDao;
import com.xtkong.model.FormatField;
import com.xtkong.model.FormatType;
import com.xtkong.model.Source;
import com.xtkong.service.FormatFieldService;
import com.xtkong.service.FormatTypeService;
import com.xtkong.service.SourceFieldService;
import com.xtkong.service.SourceService;
import com.xtkong.util.ConstantsHBase;

@Controller
@RequestMapping("/export")
public class ExportController {
	@Autowired
	SourceService sourceService;
	@Autowired
	SourceFieldService sourceFieldService;
	@Autowired
	FormatTypeService formatTypeService;
	@Autowired
	FormatFieldService formatFieldService;

	/**
	 * 导出源数据上传格式
	 * 
	 * @param response
	 * @param cs_id
	 */
	@RequestMapping("/sourceDataModel")
	public void sourceDataModel(HttpServletResponse response, Integer cs_id) {
		response.setContentType("application/vnd.ms-excel");
		/**
		 * 以下为生成Excel操作
		 */
		// 1.创建一个workbook，对应一个Excel文件
		HSSFWorkbook workbook = new HSSFWorkbook();
		// 2.单元格居中
		HSSFCellStyle style = workbook.createCellStyle();
		// 居中格式
		style.setAlignment(HorizontalAlignment.CENTER);

		// 3.在workbook中添加一个sheet，对应Excel中的一个sheet

		HSSFSheet sheet = workbook.createSheet("源数据模版");
		sheet = sheetSourceDataForm(sheet, style, cs_id);

		try {
			OutputStream output = response.getOutputStream();
			workbook.write(output);
			output.flush();
			output.close();
			workbook.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 导出源数据
	 * 
	 * @param response
	 * @param cs_id
	 * @param sourceDataIds
	 */
	@RequestMapping("/sourceData")
	public void sourceData(HttpServletResponse response, String cs_id, String sourceDataIds) {
		response.setContentType("application/vnd.ms-excel");

		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFCellStyle style = workbook.createCellStyle();
		style.setAlignment(HorizontalAlignment.CENTER);

		HSSFSheet sheet = workbook.createSheet("源数据");
		sheet = sheetSourceDataByIds(sheet, style, cs_id, sourceDataIds);
		// 设置表头
		try {
			OutputStream output = response.getOutputStream();
			workbook.write(output);
			output.flush();
			output.close();
			workbook.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 导出某格式类型数据
	 * 
	 * @param response
	 * @param cs_id
	 * @param sourceDataId
	 * @param ft_id
	 */
	@RequestMapping("/formatType")
	public void formatType(HttpServletResponse response, String cs_id, String sourceDataId, String ft_id) {
		response.setContentType("application/vnd.ms-excel");
		/**
		 * 以下为生成Excel操作
		 */
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFCellStyle style = workbook.createCellStyle();
		style.setAlignment(HorizontalAlignment.CENTER);
		HSSFSheet sheet;
		FormatType formatType = HBaseFormatNodeDao.getFormatNodes(cs_id, sourceDataId, ft_id);
		String formatNodeId;
		String formatNodeName;
		for (Entry<String, String> formatNode : formatType.getFormatDataNodes().entrySet()) {
			formatNodeId = formatNode.getKey();
			formatNodeName = formatNode.getValue();
			// meta数据
			sheet = workbook.createSheet("公共数据-" + formatNodeName);
			sheet = sheetFormatDatas(sheet, style, cs_id, ft_id, formatNodeId, ConstantsHBase.IS_meta_true);

			// data数据
			sheet = workbook.createSheet("专属数据-" + formatNodeName);
			sheet = sheetFormatDatas(sheet, style, cs_id, ft_id, formatNodeId, ConstantsHBase.IS_meta_false);
		}

		try {
			OutputStream output = response.getOutputStream();
			workbook.write(output);
			output.flush();
			output.close();
			workbook.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * 导出结点数据
	 * 
	 * @param response
	 * @param cs_id
	 * @param ft_id
	 * @param formatNodeId
	 */
	@RequestMapping("/formatNode")
	public void formatNode(HttpServletResponse response, String cs_id, String ft_ids, String formatNodeIds) {
		response.setContentType("application/vnd.ms-excel");

		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFCellStyle style = workbook.createCellStyle();
		style.setAlignment(HorizontalAlignment.CENTER);
		HSSFSheet sheet;
		String[] formatNodeIdsStr=formatNodeIds.split(",");
		String[] ft_idsStr=ft_ids.split(",");
		
		for (int i = 0; i < ft_idsStr.length; i++) {
			// meta数据
			String ft_id=ft_idsStr[i];
			String formatNodeId= formatNodeIdsStr[i];
			FormatType formatType = formatTypeService.getFormatType(Integer.valueOf(ft_id));
			List<String> formatNode=HBaseFormatNodeDao.getFormatNodeById(cs_id, ft_id, formatNodeId);
			String nodeName="";
			try {
				nodeName=formatNode.get(2);
			} catch (Exception e) {			
				nodeName=""+i;
			}
			sheet = workbook.createSheet(formatType.getFt_name()+"_"+nodeName+"_"+"公共数据");
			sheet = sheetFormatDatas(sheet, style, cs_id, ft_id, formatNodeId, ConstantsHBase.IS_meta_true);

			// data数据
			sheet = workbook.createSheet(formatType.getFt_name()+"_"+nodeName+"_"+"专属数据");
			sheet = sheetFormatDatas(sheet, style, cs_id, ft_id, formatNodeId, ConstantsHBase.IS_meta_false);
		}
		try {
			OutputStream output = response.getOutputStream();
			workbook.write(output);
			output.flush();
			output.close();
			workbook.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * 导出格式数据上传格式
	 * 
	 * @param response
	 * @param cs_id
	 */
	@RequestMapping("/formatDataModel")
	public void formatDataModel(HttpServletResponse response, String ft_id) {
		response.setContentType("application/vnd.ms-excel");
		/**
		 * 以下为生成Excel操作
		 */
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFCellStyle style = workbook.createCellStyle();
		style.setAlignment(HorizontalAlignment.CENTER);
		HSSFSheet sheet = workbook.createSheet("格式数据");
		sheet = sheetFormatFieldForm(sheet, style, ft_id, ConstantsHBase.IS_meta_false);
		try {
			OutputStream output = response.getOutputStream();
			workbook.write(output);
			output.flush();
			output.close();
			workbook.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 导出某格式数据
	 * 
	 * @param response
	 * @param cs_id
	 * @param ft_id
	 * @param formatDataIds
	 * @param type
	 *            1公共，0非公共
	 */
	@RequestMapping("/formatData")
	public void formatData(HttpServletResponse response, String cs_id, String ft_id, String formatDataIds) {
		response.setContentType("application/vnd.ms-excel");

		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFCellStyle style = workbook.createCellStyle();
		style.setAlignment(HorizontalAlignment.CENTER);
		HSSFSheet sheet = workbook.createSheet("格式数据");
		sheet = sheetFormatDataByIds(sheet, style, cs_id, ft_id, formatDataIds);
		try {
			OutputStream output = response.getOutputStream();
			workbook.write(output);
			output.flush();
			output.close();
			workbook.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private HSSFSheet sheetSourceDataForm(HSSFSheet sheet, HSSFCellStyle style, Integer cs_id) {
		Source source = sourceService.getSourceByCs_id(cs_id);
		// 4.在sheet中添加表头第0行，老版本poi对excel行数列数有限制short
		HSSFRow row = sheet.createRow((short) 0);
		// 设置表头
		source.setSourceFields(sourceFieldService.getSourceFields(cs_id));
		HSSFCell cell = row.createCell(0);
		for (int i = 0; i < source.getSourceFields().size(); i++) {
			cell = row.createCell((i));
			cell.setCellValue(source.getSourceFields().get(i).getCsf_name());
		}
		return sheet;
	}

	private HSSFSheet sheetSourceDataByIds(HSSFSheet sheet, HSSFCellStyle style, String cs_id, String sourceDataIds) {
		// 在sheet中添加表头第0行，老版本poi对excel行数列数有限制short
		HSSFRow row = sheet.createRow((short) 0);
		Source source = sourceService.getSourceByCs_id(Integer.valueOf(cs_id));
		// 设置表头
		source.setSourceFields(sourceFieldService.getSourceFields(Integer.valueOf(cs_id)));
		HSSFCell cell = row.createCell(0);
		for (int i = 0; i < source.getSourceFields().size(); i++) {
			cell = row.createCell((i));
			cell.setCellValue(source.getSourceFields().get(i).getCsf_name());
			cell.setCellStyle(style);
		}
		if (sourceDataIds != null) {
			// 写入各条记录，每条记录对应Excel中的一行
			List<List<String>> sourceDatas = HBaseSourceDataDao.getSourceDatasByIds(cs_id, sourceDataIds,
					source.getSourceFields());
			for (int iRow = 0; iRow < sourceDatas.size(); iRow++) {
				row = sheet.createRow((short) iRow + 1);
				for (int j = 0; j < source.getSourceFields().size(); j++) {
					cell = row.createCell(j);
					cell.setCellValue(sourceDatas.get(iRow).get(j + 1));
					cell.setCellStyle(style);
				}
			}
		}
		return sheet;
	}

	private HSSFSheet sheetFormatFieldForm(HSSFSheet sheet, HSSFCellStyle style, String ft_id, Integer isMeta) {
		HSSFRow row = sheet.createRow((short) 0);
		// 设置表头
		List<FormatField> formatFields = formatFieldService.getFormatFieldsIs_meta(Integer.valueOf(ft_id), isMeta);
		HSSFCell cell = row.createCell(0);
		for (int i = 0; i < formatFields.size(); i++) {
			cell = row.createCell((i));
			cell.setCellValue(formatFields.get(i).getFf_name());
			cell.setCellStyle(style);
		}
		return sheet;
	}

	private HSSFSheet sheetFormatDataByIds(HSSFSheet sheet, HSSFCellStyle style, String cs_id, String ft_id,
			String formatDataIds) {
		HSSFRow row = sheet.createRow((short) 0);
		// 设置表头

		List<FormatField> formatFields = formatFieldService.getFormatFieldsForUser(Integer.valueOf(ft_id));
		if (formatFields.isEmpty()) {
			return sheet;
		}
		HSSFCell cell = row.createCell(0);
		for (int i = 0; i < formatFields.size(); i++) {
			cell = row.createCell((i));
			cell.setCellValue(formatFields.get(i).getFf_name());
			cell.setCellStyle(style);
		}

		List<List<String>> formatDatas = HBaseFormatDataDao.getFormatDataByIds(cs_id, ft_id, formatDataIds,
				formatFields);

		// 写入各条记录，每条记录对应Excel中的一行

		for (int iRow = 0; iRow < formatDatas.size(); iRow++) {
			row = sheet.createRow((short) iRow + 1);
			for (int j = 0; j < formatFields.size(); j++) {
				cell = row.createCell(j);
				cell.setCellValue(formatDatas.get(iRow).get(j));
				cell.setCellStyle(style);
			}
		}

		return sheet;
	}

	private HSSFSheet sheetFormatDatas(HSSFSheet sheet, HSSFCellStyle style, String cs_id, String ft_id,
			String formatNodeId, Integer isMeta) {
		HSSFRow row = sheet.createRow((short) 0);
		// 设置表头
		List<FormatField> formatFields = formatFieldService.getFormatFieldsIs_meta(Integer.valueOf(ft_id), isMeta);
		if (formatFields.isEmpty()) {
			return sheet;
		}

		HSSFCell cell = row.createCell(0);
		for (int i = 0; i < formatFields.size(); i++) {
			cell = row.createCell((i));
			cell.setCellValue(formatFields.get(i).getFf_name());
			cell.setCellStyle(style);
		}

		List<List<String>> formatDatas = HBaseFormatDataDao.getFormatDatas(cs_id, ft_id, formatNodeId, formatFields);

		// 写入各条记录，每条记录对应Excel中的一行
		if (isMeta.equals(ConstantsHBase.IS_meta_true)) {
			row = sheet.createRow((short) 1);
			for (int j = 0; j < formatFields.size(); j++) {
				cell = row.createCell(j);
				cell.setCellValue(formatDatas.get(0).get(j + 1));
				cell.setCellStyle(style);
			}
		} else {
			for (int iRow = 0; iRow < formatDatas.size(); iRow++) {
				row = sheet.createRow((short) iRow + 1);
				for (int j = 0; j < formatFields.size(); j++) {
					cell = row.createCell(j);
					cell.setCellValue(formatDatas.get(iRow).get(j + 1));
					cell.setCellStyle(style);
				}
			}
		}
		return sheet;
	}

}
