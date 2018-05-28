/**
 * 格式数据
 * 
 * 
 */
package com.xtkong.dao.hbase;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.PrefixFilter;
import org.apache.hadoop.hbase.util.Bytes;

import com.xtkong.model.FormatField;
import com.xtkong.util.ConstantsHBase;
import com.xtkong.util.HBaseDB;

public class HBaseFormatDataDao {

	/**
	 * 新增格式类型：创建格式数据表
	 * 
	 * @param cs_id
	 *            采集源
	 * @param ft_id
	 *            格式类型
	 */
	public static void createFormatDataTable(String cs_id, String ft_id) {
		createFormatDataTable(ConstantsHBase.TABLE_PREFIX_FORMAT_ + cs_id + "_" + ft_id,
				new String[] { ConstantsHBase.FAMILY_INFO }, ConstantsHBase.VERSION_FORMAT);
	}

	private static void createFormatDataTable(String tableName, String[] columnFamilies, int version) {
		HBaseDB db = HBaseDB.getInstance();
		db.createTable(tableName, columnFamilies, version);
	}

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
	public static boolean insertFormatData(String cs_id, String ft_id, String formatNodeId,
			Map<String, String> formatFieldDatas) {
		HBaseDB db = HBaseDB.getInstance();
		Long count = db.getNewId(ConstantsHBase.TABLE_GID, formatNodeId, ConstantsHBase.FAMILY_GID_GID,
				ConstantsHBase.QUALIFIER_GID_GID_GID);
		for (Entry<String, String> formatFieldData : formatFieldDatas.entrySet()) {
			if (!db.put(ConstantsHBase.TABLE_PREFIX_FORMAT_ + cs_id + "_" + ft_id, formatNodeId + "_" + count,
					ConstantsHBase.FAMILY_INFO, formatFieldData.getKey(), formatFieldData.getValue())) {
				return false;
			}
		}
		return true;
	}

	/**
	 * 格式数据明细共用部分
	 * 
	 * @param cs_id
	 * @param ft_id
	 * @param formatNodeId
	 * @param formatFields
	 * @return formatDatas[0]:formatDataId
	 * 
	 *         formatDatas[1]:id,名，值
	 */
	public static List<List<String>> getFormatDataMetas(String cs_id, String ft_id, String formatNodeId,
			List<FormatField> formatFields) {
		List<List<String>> formatDatas = new ArrayList<>();
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(ConstantsHBase.TABLE_PREFIX_FORMAT_ + cs_id + "_" + ft_id);
			Get get = new Get(Bytes.toBytes(formatNodeId));
			Result result = table.get(get);
			if (!result.isEmpty()) {
				List<String> rowkey = new ArrayList<>();
				rowkey.add(Bytes.toString(result.getRow()));// 获取行键formatDataId，不显示
				formatDatas.add(rowkey);
				for (FormatField formatField : formatFields) {
					List<String> formatData = new ArrayList<>();
					formatData.add(String.valueOf(formatField.getFf_id()));
					formatData.add(formatField.getFf_name());
					formatData.add(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
							Bytes.toBytes(String.valueOf(formatField.getFf_id())))));
					formatDatas.add(formatData);
				}
			}
			table.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return formatDatas;
	}

	/**
	 * 格式数据明细
	 * 
	 * @param cs_id
	 *            采集源id
	 * @param ft_id
	 *            格式类型id
	 * @param formatNodeId
	 *            节点id
	 * @param formatFields
	 *            格式字段
	 * @return 格式数据明细数据，注：每个列表第一个值formatDataId不显示
	 */
	public static List<List<String>> getFormatDatas(String cs_id, String ft_id, String formatNodeId,
			List<FormatField> formatFields) {
		List<List<String>> formatDatas = new ArrayList<>();
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(ConstantsHBase.TABLE_PREFIX_FORMAT_ + cs_id + "_" + ft_id);
			Scan scan = new Scan();
			// 列簇约束结果集
			scan.addFamily(Bytes.toBytes(ConstantsHBase.FAMILY_INFO));
			// 前缀formatNodeId+"_"过滤
			Filter filter = new PrefixFilter(Bytes.toBytes(formatNodeId + "_"));
			scan.setFilter(filter);
			ResultScanner resultScanner = table.getScanner(scan);
			Iterator<Result> iterator = resultScanner.iterator();
			while (iterator.hasNext()) {
				Result result = iterator.next();
				if (!result.isEmpty()) {
					List<String> formatData = new ArrayList<>();
					formatData.add(Bytes.toString(result.getRow()));// 获取行键formatDataId，不显示
					for (FormatField formatField : formatFields) {
						formatData.add(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
								Bytes.toBytes(String.valueOf(formatField.getFf_id())))));
					}
					formatDatas.add(formatData);
				}
			}
			resultScanner.close();
			table.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return formatDatas;
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
	public static boolean updateFormatData(String cs_id, String ft_id, String formatDataId,
			Map<String, String> formatFieldDatas) {
		HBaseDB db = HBaseDB.getInstance();
		for (Entry<String, String> formatFieldData : formatFieldDatas.entrySet()) {
			if (!db.put(ConstantsHBase.TABLE_PREFIX_FORMAT_ + cs_id + "_" + ft_id, formatDataId,
					ConstantsHBase.FAMILY_INFO, formatFieldData.getKey(), formatFieldData.getValue())) {
				return false;
			}
		}
		return true;
	}

	/**
	 * 批量删除格式数据
	 * 
	 * @param cs_id
	 * @param ft_id
	 * @param formatDataIds
	 * @return
	 */
	public static boolean deleteFormatDatas(String cs_id, String ft_id, String formatDataIds) {
		HBaseDB db = HBaseDB.getInstance();
		for (String formatDataId : formatDataIds.split(",")) {
			if (!db.delete(ConstantsHBase.TABLE_PREFIX_FORMAT_ + cs_id + "_" + ft_id, formatDataId)) {
				return false;
			}
		}
		return true;
	}
}
