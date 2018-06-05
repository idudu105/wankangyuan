package com.xtkong.dao.hbase;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.hadoop.hbase.CompareOperator;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.filter.BinaryComparator;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.FilterList;
import org.apache.hadoop.hbase.filter.FilterList.Operator;
import org.apache.hadoop.hbase.filter.PrefixFilter;
import org.apache.hadoop.hbase.filter.SingleColumnValueFilter;
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
	public static boolean insertSourceData(String cs_id, String uid, Map<String, String> sourceFieldDatas) {
		HBaseDB db = HBaseDB.getInstance();
		Long count = db.getNewId(ConstantsHBase.TABLE_GID, uid + "_" + cs_id, ConstantsHBase.FAMILY_GID_GID,
				ConstantsHBase.QUALIFIER_GID_GID_GID);
		db.put(ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id, uid + "_" + cs_id + "_" + count, ConstantsHBase.FAMILY_INFO,
				ConstantsHBase.QUALIFIER_ADD, ConstantsHBase.VALUE_ADD_FALSE);
		db.put(ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id, uid + "_" + cs_id + "_" + count, ConstantsHBase.FAMILY_INFO,
				ConstantsHBase.QUALIFIER_PUBLIC, ConstantsHBase.VALUE_PUBLIC_FALSE);
		for (Entry<String, String> sourceFieldData : sourceFieldDatas.entrySet()) {
			if (!db.put(ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id, uid + "_" + cs_id + "_" + count,
					ConstantsHBase.FAMILY_INFO, sourceFieldData.getKey(), sourceFieldData.getValue())) {
				return false;
			}
		}
		return true;
	}

	/**
	 * 通过sourceDataId获取一条源数据
	 * 
	 * @param cs_id
	 * @param sourceDataId
	 * @param sourceFields
	 * @return
	 */
	public static List<String> getSourceDataById(String cs_id, String sourceDataId, List<SourceField> sourceFields) {
		List<String> sourceData = new ArrayList<>();
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id);
			Get get = new Get(Bytes.toBytes(sourceDataId));
			Result result = table.get(get);
			if (!result.isEmpty()) {
				// 获取行键sourceDataId
				sourceData.add(Bytes.toString(result.getRow()));
				for (SourceField sourceField : sourceFields) {
					sourceData.add(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
							Bytes.toBytes(String.valueOf(sourceField.getCsf_id())))));
				}
			}
			table.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sourceData;
	}
	public static List<List<String>> getSourceDataByIds(String cs_id, List<String> sourceDataIds, List<SourceField> sourceFields) {
		List<List<String>> sourceDatas = new ArrayList<>();
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id);
			List<Get> gets = new ArrayList<Get>();
			for (String sourceDataId :sourceDataIds) {
				if(sourceDataId!=null)
					gets.add(new Get(Bytes.toBytes(sourceDataId)));
			}
			Result[] results = table.get(gets);
			for (Result result : results) {
				List<String> sourceData= new ArrayList<>();
				// 获取行键sourceDataId
				sourceData.add(Bytes.toString(result.getRow()));
				for (SourceField sourceField : sourceFields) {
					sourceData.add(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
							Bytes.toBytes(String.valueOf(sourceField.getCsf_id())))));
				}
				sourceDatas.add(sourceData);
			}
			table.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sourceDatas;
	}
	public static List<List<String>> getSourceDataByIds(String cs_id, String sourceDataIds, List<SourceField> sourceFields) {
		List<List<String>> sourceDatas = new ArrayList<>();
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id);
			List<Get> gets = new ArrayList<Get>();
			for (String sourceDataId : sourceDataIds.split(",")) {
				if(sourceDataId!=null)
					gets.add(new Get(Bytes.toBytes(sourceDataId)));
			}
			Result[] results = table.get(gets);
			for (Result result : results) {
				List<String> sourceData= new ArrayList<>();
				// 获取行键sourceDataId
				sourceData.add(Bytes.toString(result.getRow()));
				for (SourceField sourceField : sourceFields) {
					sourceData.add(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
							Bytes.toBytes(String.valueOf(sourceField.getCsf_id())))));
				}
				sourceDatas.add(sourceData);
			}
			table.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sourceDatas;
	}
	/**
	 * 获取用户创建源数据基础信息
	 * 
	 * @param cs_id
	 *            采集源 id
	 * @param uid
	 *            用户 id
	 * @param sourceFields
	 *            源数据字数据，注：每个列表第一个值sourceDataId不显示
	 * @return
	 */
	public static List<List<String>> getSourceDatasCreated(String cs_id, String uid, List<SourceField> sourceFields) {
		List<List<String>> sourceDatas = new ArrayList<List<String>>();
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id);
			Scan scan = new Scan();
			// 列簇约束结果集
			scan.addFamily(Bytes.toBytes(ConstantsHBase.FAMILY_INFO));
			// 前缀uid+"_"+source+"_"过滤
			Filter filter1 = new PrefixFilter(Bytes.toBytes(uid + "_" + cs_id + "_"));
			// 单值过滤,获取行数据
			Filter filter2 = new SingleColumnValueFilter(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
					Bytes.toBytes(ConstantsHBase.QUALIFIER_ADD), CompareOperator.EQUAL,
					new BinaryComparator(Bytes.toBytes(ConstantsHBase.VALUE_ADD_FALSE)));
			// 与
			FilterList filterList = new FilterList(Operator.MUST_PASS_ALL, filter1, filter2);
			scan.setFilter(filterList);

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
								Bytes.toBytes(String.valueOf(sourceField.getCsf_id())))));
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
	 * 获取用户的添加源数据基础信息
	 * 
	 * @param cs_id
	 * @param uid
	 * @param sourceFields
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
					// 获取行键sourceDataId
					sourceData.add(Bytes.toString(result.getRow()));
					for (SourceField sourceField : sourceFields) {
						sourceData.add(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
								Bytes.toBytes(String.valueOf(sourceField.getCsf_id())))));
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
	 * 获取公开源数据基础信息
	 * 
	 * @param cs_id
	 * @param sourceFields
	 * @return
	 */
	public static List<List<String>> getSourceDatasPublic(String cs_id, List<SourceField> sourceFields) {
		List<List<String>> sourceDatas = new ArrayList<List<String>>();
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id);
			Scan scan = new Scan();
			// 列簇约束结果集
			scan.addFamily(Bytes.toBytes(ConstantsHBase.FAMILY_INFO));
			// 单值过滤,获取行数据
			Filter filter = new SingleColumnValueFilter(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
					Bytes.toBytes(ConstantsHBase.QUALIFIER_PUBLIC), CompareOperator.EQUAL,
					new BinaryComparator(Bytes.toBytes(ConstantsHBase.VALUE_PUBLIC_TRUE)));
			scan.setFilter(filter);
			ResultScanner resultScanner = table.getScanner(scan);
			Iterator<Result> iterator = resultScanner.iterator();
			while (iterator.hasNext()) {
				Result result = iterator.next();
				if (!result.isEmpty()) {
					List<String> sourceData = new ArrayList<>();
					// 获取行键sourceDataId
					sourceData.add(Bytes.toString(result.getRow()));
					for (SourceField sourceField : sourceFields) {
						sourceData.add(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
								Bytes.toBytes(String.valueOf(sourceField.getCsf_id())))));
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
	public static boolean updateSourceData(String cs_id, String sourceDataId, Map<String, String> sourceFieldDatas) {
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
	public static boolean deleteSourceDatas(String cs_id, String sourceDataIds) {
		HBaseDB db = HBaseDB.getInstance();
		for (String sourceDataId : sourceDataIds.split(",")) {
			if (!db.delete(ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id, sourceDataId)) {
				return false;
			}
		}
		return true;
	}

	public static boolean open(String cs_id, String sourceDataIds) {
		HBaseDB db = HBaseDB.getInstance();
		for (String sourceDataId : sourceDataIds.split(",")) {
			if (!db.put(ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id, sourceDataId, ConstantsHBase.FAMILY_INFO,
					ConstantsHBase.QUALIFIER_PUBLIC, ConstantsHBase.VALUE_PUBLIC_TRUE)) {
				return false;
			}
		}
		return true;
	}

	public static boolean notOpen(String cs_id, String sourceDataIds) {
		HBaseDB db = HBaseDB.getInstance();
		for (String sourceDataId : sourceDataIds.split(",")) {
			if (!db.put(ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id, sourceDataId, ConstantsHBase.FAMILY_INFO,
					ConstantsHBase.QUALIFIER_PUBLIC, ConstantsHBase.VALUE_PUBLIC_FALSE)) {
				return false;
			}
		}
		return true;
	}

	public static boolean addMySource(String cs_id, String uid, String sourceDataIds, List<SourceField> sourceFields) {
		try {

			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id);
			List<Get> gets = new ArrayList<Get>();
			for (String sourceDataId : sourceDataIds.split(",")) {
				if (!sourceDataId.startsWith(uid + "_" + cs_id + "_"))
					gets.add(new Get(Bytes.toBytes(sourceDataId)));
			}
			// 存放批量操作的结果
			Result[] results = table.get(gets);

			for (Result result : results) {
				Long count = db.getNewId(ConstantsHBase.TABLE_GID, uid + "_" + cs_id, ConstantsHBase.FAMILY_GID_GID,
						ConstantsHBase.QUALIFIER_GID_GID_GID);
				for (SourceField sourceField : sourceFields) {
					if (!db.put(ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id, uid + "_" + cs_id + "_" + count,
							ConstantsHBase.FAMILY_INFO, sourceField.getCsf_id(),
							Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
									Bytes.toBytes(String.valueOf(sourceField.getCsf_id())))))) {
						return false;
					}
				}
			}
			table.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
