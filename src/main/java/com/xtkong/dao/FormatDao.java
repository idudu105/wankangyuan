/**
 * 格式数据
 * 
 * 
 */
package com.xtkong.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.filter.BinaryComparator;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.PrefixFilter;
import org.apache.hadoop.hbase.filter.RowFilter;
import org.apache.hadoop.hbase.filter.CompareFilter.CompareOp;
import org.apache.hadoop.hbase.util.Bytes;

import com.xtkong.util.ConstantsHBase;
import com.xtkong.util.HBaseDB;

/**
 * @author 沫
 *
 */
public class FormatDao {

	/**
	 * 新增格式数据类型
	 * 
	 * @param source
	 *            采集源
	 * @param uid
	 *            用户
	 * @param format
	 *            格式数据类型名(从根到叶但不包含叶)
	 * @param version
	 *            存储版本数量
	 */
	public static void createFormat(String source, String uid, String format_type, int version) {
		createFormat(ConstantsHBase.TABLE_PREFIX_FORMAT + "_" + source + "_" + format_type,
				new String[] { ConstantsHBase.FAMILY_SOURCE_FormatDataName, format_type }, version);
	}

	public static void createFormat(String tableName, String[] columnFamilies, int version) {
		HBaseDB db = HBaseDB.getInstance();
		db.createTable(tableName, columnFamilies, version);
	}

	/**
	 * 添加一格格式数据
	 * 
	 * @param source
	 *            采集源
	 * @param uid
	 *            用户
	 * @param format_type
	 *            格式数据类型名(从根到叶但不包含叶)
	 * @param format_field
	 *            格式数据字段名(叶)
	 * @param formatDataId
	 *            数据归属最小单元 /用户-采集源-计数-计数
	 * @param value
	 *            数据值
	 */
	public static void insertFormatData(String source, String uid, String format_type, String format_field,
			String formatDataId, String value) {
		HBaseDB db = HBaseDB.getInstance();
		db.put(ConstantsHBase.TABLE_PREFIX_FORMAT + "_" + source + "_" + format_type, formatDataId, format_type,
				format_field, value);
	}

	/**
	 * 格式数据命名
	 * 
	 * @param source
	 *            采集源
	 * @param format_type
	 *            格式数据类型名(从根到叶但不包含叶)
	 * @param sourceDataId
	 *            用户-采集源-计数
	 * @param value
	 *            格式数据命名
	 */
	public static void insertFormatDataName(String source, String format_type, String sourceDataId, String value) {
		HBaseDB db = HBaseDB.getInstance();
		Long count = db.getNewId(ConstantsHBase.TABLE_GID, sourceDataId, ConstantsHBase.FAMILY_GID_GID,
				ConstantsHBase.QUALIFIER_GID_GID_GID);
		db.put(ConstantsHBase.TABLE_PREFIX_FORMAT + "_" + source + "_" + format_type, sourceDataId + "_" + count,
				ConstantsHBase.FAMILY_SOURCE_FormatDataName, ConstantsHBase.QUALIFIER_SOURCE_FormatDataName, value);
	}

	/**
	 * 获取指定源数据（采集源、用户已知）的所有格式数据
	 * 
	 * @param source
	 *            采集源
	 * @param format_type
	 *            格式数据类型名(从根到叶但不包含叶)
	 * @param format_field
	 *            格式数据字段名(叶)
	 * @param sourceDataId
	 *            用户-采集源-计数
	 * @return
	 */
	public static List<String> getFormatDatasById(String source, String format_type, String format_field,
			String sourceDataId) {
		List<String> list = new ArrayList<String>();
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(ConstantsHBase.TABLE_PREFIX_SOURCE + "_" + source);
			Scan scan = new Scan();
			// 列簇约束结果集
			scan.addFamily(Bytes.toBytes(ConstantsHBase.FAMILY_SOURCE_INFO));
			// 前缀sourceDataId+"_"过滤
			Filter filter = new PrefixFilter(Bytes.toBytes(sourceDataId + "_"));
			scan.setFilter(filter);
			ResultScanner resultScanner = table.getScanner(scan);
			Iterator<Result> iterator = resultScanner.iterator();
			while (iterator.hasNext()) {
				Result result = iterator.next();
				if (!result.isEmpty()) {
					list.add(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_SOURCE_INFO),
							Bytes.toBytes(format_field))));
				}
			}
			resultScanner.close();
			table.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 获取指定源数据（采集源、用户已知）的某一条格式数据
	 * 
	 * @param source
	 *            采集源
	 * @param format_type
	 *            格式数据类型名(从根到叶但不包含叶)
	 * @param format_field
	 *            格式数据字段名(叶)
	 * @param formatDataId
	 *            数据归属最小单元 /用户-采集源-计数-计数
	 * @return
	 */
	public static List<String> getFormatDataById(String source, String format_type, String format_field,
			String formatDataId) {
		List<String> list = new ArrayList<String>();
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(ConstantsHBase.TABLE_PREFIX_SOURCE + "_" + source);
			Scan scan = new Scan();
			// 列簇约束结果集
			scan.addFamily(Bytes.toBytes(ConstantsHBase.FAMILY_SOURCE_INFO));
			// 行键formatDataId过滤
			Filter filter = new RowFilter(CompareOp.EQUAL, new BinaryComparator(Bytes.toBytes(formatDataId)));
			scan.setFilter(filter);
			ResultScanner resultScanner = table.getScanner(scan);
			Iterator<Result> iterator = resultScanner.iterator();
			while (iterator.hasNext()) {
				Result result = iterator.next();
				if (!result.isEmpty()) {
					list.add(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_SOURCE_INFO),
							Bytes.toBytes(format_field))));
				}
			}
			resultScanner.close();
			table.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 获取指定源数据（采集源、用户已知）的格式数据名列表
	 * 
	 * @param source
	 *            采集源
	 * @param format_type
	 *            格式数据类型名(从根到叶但不包含叶)
	 * @param sourceDataId
	 *            用户-采集源-计数
	 * @return
	 */
	public static List<String> getFormatNamesById(String source, String format_type, String sourceDataId) {
		List<String> list = new ArrayList<String>();
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(ConstantsHBase.TABLE_PREFIX_FORMAT + "_" + source + "_" + format_type);
			Scan scan = new Scan();
			// 列簇约束结果集
			scan.addFamily(Bytes.toBytes(ConstantsHBase.FAMILY_SOURCE_INFO));
			// 前缀sourceDataId+"_"过滤
			Filter filter = new PrefixFilter(Bytes.toBytes(sourceDataId + "_"));
			scan.setFilter(filter);
			ResultScanner resultScanner = table.getScanner(scan);
			Iterator<Result> iterator = resultScanner.iterator();
			while (iterator.hasNext()) {
				Result result = iterator.next();
				if (!result.isEmpty()) {
					list.add(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_SOURCE_FormatDataName),
							Bytes.toBytes(ConstantsHBase.QUALIFIER_SOURCE_FormatDataName))));
				}
			}
			resultScanner.close();
			table.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
