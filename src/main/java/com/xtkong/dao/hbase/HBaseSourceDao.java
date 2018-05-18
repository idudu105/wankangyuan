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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.xtkong.model.FormatField;
import com.xtkong.model.FormatType;
import com.xtkong.model.SourceField;
import com.xtkong.service.FormatTypeService;
import com.xtkong.util.ConstantsHBase;
import com.xtkong.util.HBaseDB;

@Controller
public class HBaseSourceDao {
	@Autowired
	static FormatTypeService formatTypeService;

	/***
	 * 新增采集源
	 * 
	 * @param source
	 *            采集源
	 * @param version
	 *            存储版本数量
	 */
	public static void createSource(String source, int version) {
		createSource(ConstantsHBase.TABLE_PREFIX_SOURCE + "_" + source, new String[] { ConstantsHBase.FAMILY_INFO },
				version);
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
				ConstantsHBase.FAMILY_INFO, source_field, value);
	}

	/**
	 * 获取指定采集源、用户的源数据基础信息
	 * 
	 * @param cs_id
	 *            采集源 id
	 * @param uid
	 *            用户 id
	 * @param sourceFields
	 *           源数据字数据，注：每个列表第一个值sourceDataId不显示
	 * @return
	 */
	public static List<List<String>> getSourceDatasByUid(String cs_id, String uid, List<SourceField> sourceFields) {
		List<List<String>> sourceDatas = new ArrayList<List<String>>();
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(ConstantsHBase.TABLE_PREFIX_SOURCE + "_" + cs_id);
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sourceDatas;
	}

	/**
	 * 
	 * @param cs_id
	 * @param sourceDataId
	 * @param formatTypes
	 * @param formatTypes
	 * @return formatDataNodeId、ft_id、ft_name、节点名
	 */
	public static List<List<String>> getFormatTypeFloders(String cs_id, String sourceDataId,
			List<FormatType> formatTypes) {
		List<List<String>> formatTypeFloders = new ArrayList<List<String>>();
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(ConstantsHBase.TABLE_PREFIX_FORMAT + "_" + cs_id);
			Scan scan = new Scan();
			// 列簇约束结果集
			scan.addFamily(Bytes.toBytes(ConstantsHBase.FAMILY_INFO));
			// 前缀sourceDataId+"_"过滤
			Filter filter = new PrefixFilter(Bytes.toBytes(sourceDataId + "_"));
			scan.setFilter(filter);
			ResultScanner resultScanner = table.getScanner(scan);
			Iterator<Result> iterator = resultScanner.iterator();
			while (iterator.hasNext()) {
				Result result = iterator.next();
				if (!result.isEmpty()) {
					List<String> formatTypeFloder = new ArrayList<>();

					formatTypeFloder.add(Bytes.toString(result.getRow()));// 获取行键formatDataNodeId，不显示
					// 获取ft_id，不显示
					String ft_id = Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
							Bytes.toBytes(ConstantsHBase.QUALIFIER_ft_id)));
					formatTypeFloder.add(ft_id);//
					formatTypeFloder.add(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
							Bytes.toBytes(ConstantsHBase.QUALIFIER_ft_name))));// 获取ft_name，显示
					formatTypeFloder.add(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
							Bytes.toBytes(ConstantsHBase.QUALIFIER_node))));// 获取节点名，显示
					formatTypeFloders.add(formatTypeFloder);
					try {
						formatTypes.remove(formatTypeService.getFormatType(Integer.valueOf(ft_id)));
					} catch (NumberFormatException e) {
						continue;
					}
				}
			}
			resultScanner.close();
			table.close();
			for (FormatType formatType : formatTypes) {
				List<String> formatTypeFloder = new ArrayList<>();
				formatTypeFloder.add("");
				formatTypeFloder.add(String.valueOf(formatType.getFt_id()));
				formatTypeFloder.add(formatType.getFt_name());
				formatTypeFloder.add("");
				formatTypeFloders.add(formatTypeFloder);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return formatTypeFloders;
	}

	/**
	 * 格式数据明细
	 * 
	 * @param cs_id
	 *            采集源id
	 * @param ft_id
	 *            格式类型id
	 * @param formatDataNodeId
	 *            节点id
	 * @param formatFields
	 *            格式字段
	 * @return 格式数据明细数据，注：每个列表第一个值formatDataId不显示
	 */
	public static List<List<String>> getFormatFields(String cs_id, String ft_id, String formatDataNodeId,
			List<FormatField> formatFields) {
		List<List<String>> formatDatas = new ArrayList<>();
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(ConstantsHBase.TABLE_PREFIX_FORMAT + "_" + cs_id + "_" + ft_id);
			Scan scan = new Scan();
			// 列簇约束结果集
			scan.addFamily(Bytes.toBytes(ConstantsHBase.FAMILY_INFO));
			// 前缀formatDataNodeId+"_"过滤
			Filter filter = new PrefixFilter(Bytes.toBytes(formatDataNodeId + "_"));
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
								Bytes.toBytes(formatField.getFf_id()))));
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

}
