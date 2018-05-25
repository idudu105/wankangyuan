package com.xtkong.dao.hbase;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;

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

public class HBaseSourceDataDao {

	/***
	 * 新增采集源：创建源数据基础信息表
	 * 
	 * @param cs_id
	 *            采集源id
	 */
	public static void createSourceDataTable(String cs_id) {
		// 源数据基础信息表
		createSourceDataTable(ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id, new String[] { ConstantsHBase.FAMILY_INFO },
				ConstantsHBase.VERSION_SOURCE);
	}

	private static void createSourceDataTable(String tableName, String[] columnFamilies, int version) {
		HBaseDB db = HBaseDB.getInstance();
		db.createTable(tableName, columnFamilies, version);
	}

	/**
	 * 添加一条源数据
	 * 
	 * @param cs_id
	 *            采集源
	 * @param uid
	 *            用户
	 * @param sourceFieldDatas
	 *            采集源字段、 数据值
	 */
	public static boolean insertSourceData(String cs_id, String uid, HashMap<String, String> sourceFieldDatas) {
		HBaseDB db = HBaseDB.getInstance();
		Long count = db.getNewId(ConstantsHBase.TABLE_GID, uid + "_" + cs_id, ConstantsHBase.FAMILY_GID_GID,
				ConstantsHBase.QUALIFIER_GID_GID_GID);
		for (Entry<String, String> sourceFieldData : sourceFieldDatas.entrySet()) {
			if (!db.put(ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id, uid + "_" + cs_id + "_" + count,
					ConstantsHBase.FAMILY_INFO, sourceFieldData.getKey(), sourceFieldData.getValue())) {
				return false;
			}
		}
		return true;
	}

	/**
	 * 获取指定采集源、用户的源数据基础信息
	 * 
	 * @param cs_id
	 *            采集源 id
	 * @param uid
	 *            用户 id
	 * @param sourceFields
	 *            源数据字数据，注：每个列表第一个值sourceDataId不显示
	 * @return
	 */
	public static List<List<String>> getSourceDatasByUid(String cs_id, String uid, List<SourceField> sourceFields) {
		List<List<String>> sourceDatas = new ArrayList<List<String>>();
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id);
			Scan scan = new Scan();
			// 列簇约束结果集
			scan.addFamily(Bytes.toBytes(ConstantsHBase.FAMILY_INFO));
			// 前缀uid+"_"+source+"_"过滤
			Filter filter = new PrefixFilter(Bytes.toBytes(uid + "_" + cs_id + "_"));
			scan.setFilter(filter);
			ResultScanner resultScanner = table.getScanner(scan);
			Iterator<Result> iterator = resultScanner.iterator();
			while (iterator.hasNext()) {
				Result result = iterator.next();
				if (!result.isEmpty()) {
					List<String> sourceData = new ArrayList<>();
					// for (Entry<String, String> source_field :
					// sourceFields.entrySet()) {
					// sourceData.put(source_field.getValue(),Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_SOURCE_INFO),
					// Bytes.toBytes(source_field.getKey()))));
					// }
					// 获取行键sourceDataId
					sourceData.add(Bytes.toString(result.getRow()));
					for (SourceField sourceField : sourceFields) {
						sourceData.add(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
								Bytes.toBytes(sourceField.getCsf_id()))));
					}
					sourceDatas.add(sourceData);
				}
			}
			resultScanner.close();
			table.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sourceDatas;
	}

	/**
	 * 更新一条源数据
	 * 
	 * @param cs_id
	 *            采集源
	 * @param sourceDataId
	 * @param sourceFieldDatas
	 *            采集源字段、 数据值
	 */
	public static boolean updateSourceData(String cs_id, String sourceDataId,
			HashMap<String, String> sourceFieldDatas) {
		HBaseDB db = HBaseDB.getInstance();
		for (Entry<String, String> sourceFieldData : sourceFieldDatas.entrySet()) {
			if (!db.put(ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id, sourceDataId, ConstantsHBase.FAMILY_INFO,
					sourceFieldData.getKey(), sourceFieldData.getValue())) {
				return false;
			}
		}
		return true;
	}

	/**
	 * 批量删除源数据
	 * 
	 * @param cs_id
	 * @param sourceDataIds
	 * @return
	 */
	public static boolean deleteSourceDatas(String cs_id, List<String> sourceDataIds) {
		HBaseDB db = HBaseDB.getInstance();
		for (String sourceDataId : sourceDataIds) {
			if (!db.delete(ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id, sourceDataId)) {
				return false;
			}
		}
		return true;
	}
}