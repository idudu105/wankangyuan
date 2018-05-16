package com.xtkong.dao.hbase;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.PrefixFilter;
import org.apache.hadoop.hbase.util.Bytes;

import com.xtkong.model.SourceField;
import com.xtkong.util.ConstantsHBase;
import com.xtkong.util.HBaseDB;

public class HBaseSourceDao {
	/***
	 * 新增采集源
	 * 
	 * @param source
	 *            采集源
	 * @param version
	 *            存储版本数量
	 */
	public static void createSource(String source, int version) {
		createSource(ConstantsHBase.TABLE_PREFIX_SOURCE + "_" + source,
				new String[] { ConstantsHBase.FAMILY_SOURCE_INFO }, version);
	}

	public static void createSource(String tableName, String[] columnFamilies, int version) {
		HBaseDB db = HBaseDB.getInstance();
		db.createTable(tableName, columnFamilies, version);
	}

	/**
	 * 添加一条源数据
	 * 
	 * @param source
	 *            采集源
	 * @param uid
	 *            用户
	 * @param source_field
	 *            采集源字段
	 * @param rowkey
	 *            数据归属最小单元 /用户-采集源-计数
	 * @param value
	 *            数据值
	 */
	public static void insertSource(String source, String uid, String source_field, String value) {
		HBaseDB db = HBaseDB.getInstance();
		Long count = db.getNewId(ConstantsHBase.TABLE_GID, uid + "_" + source, ConstantsHBase.FAMILY_GID_GID,
				ConstantsHBase.QUALIFIER_GID_GID_GID);
		db.put(ConstantsHBase.TABLE_PREFIX_SOURCE + "_" + source, uid + "_" + source + "_" + count,
				ConstantsHBase.FAMILY_SOURCE_INFO, source_field, value);
	}

	/**
	 * 获取指定采集源、用户的源数据基础信息
	 * 
	 * @param source
	 *            采集源 id
	 * @param uid
	 *            用户 id
	 * @param sourceFields
	 *            采集源字段 ids、names
	 * @return
	 */
	public List<List<String>> getSourceDatasByUid(String source, String uid, List<SourceField> sourceFields) {
		List<List<String>> list = new ArrayList<List<String>>();
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(ConstantsHBase.TABLE_PREFIX_SOURCE + "_" + source);
			Scan scan = new Scan();
			// 列簇约束结果集
			scan.addFamily(Bytes.toBytes(ConstantsHBase.FAMILY_SOURCE_INFO));
			// 前缀uid+"_"+source+"_"过滤
			Filter filter = new PrefixFilter(Bytes.toBytes(uid + "_" + source + "_"));
			scan.setFilter(filter);
			ResultScanner resultScanner = table.getScanner(scan);
			Iterator<Result> iterator = resultScanner.iterator();
			while (iterator.hasNext()) {
				Result result = iterator.next();
				if (!result.isEmpty()) {
					List<String> sourceData=new ArrayList<>();
//					for (Entry<String, String> source_field : sourceFields.entrySet()) {
//						sourceData.put(source_field.getValue(),Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_SOURCE_INFO),
//								Bytes.toBytes(source_field.getKey()))));
//					}
					for (SourceField sourceField : sourceFields) {
						sourceData.add(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_SOURCE_INFO),
								Bytes.toBytes(sourceField.getCsf_id()))));
					}
					list.add(sourceData);
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
