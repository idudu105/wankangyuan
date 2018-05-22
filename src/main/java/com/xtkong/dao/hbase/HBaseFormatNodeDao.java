package com.xtkong.dao.hbase;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.PrefixFilter;
import org.apache.hadoop.hbase.util.Bytes;
import com.xtkong.model.FormatType;
import com.xtkong.util.ConstantsHBase;
import com.xtkong.util.HBaseDB;

public class HBaseFormatNodeDao {

	/***
	 * 新增采集源：创建格式类型节点表
	 * 
	 * @param cs_id
	 *            采集源id
	 */
	public static void createFormatNodeTable(String cs_id) {
		// 格式类型节点表
		createFormatNodeTable(ConstantsHBase.TABLE_PREFIX_NODE_ + cs_id, new String[] { ConstantsHBase.FAMILY_INFO },
				ConstantsHBase.VERSION_NODE);
	}

	private static void createFormatNodeTable(String tableName, String[] columnFamilies, int version) {
		HBaseDB db = HBaseDB.getInstance();
		db.createTable(tableName, columnFamilies, version);
	}

	/**
	 * 新增数据节点
	 * 
	 * @param cs_id
	 * @param sourceDataId
	 * @param ft_id
	 * @param nodeName
	 * @return
	 */
	public static boolean insertFormatNode(String cs_id, String sourceDataId,String ft_id, String nodeName) {
		HBaseDB db = HBaseDB.getInstance();
		Long count = db.getNewId(ConstantsHBase.TABLE_GID, sourceDataId + "_" + ft_id,
				ConstantsHBase.FAMILY_GID_GID, ConstantsHBase.QUALIFIER_GID_GID_GID);
		return db.put(ConstantsHBase.TABLE_PREFIX_NODE_ + cs_id,
				sourceDataId + "_" + ft_id + "_" + count, ConstantsHBase.FAMILY_INFO,
				ConstantsHBase.QUALIFIER_NODE, ft_id + "," + nodeName);
	}

	/**
	 * 节点树 List<FormatType>
	 * 
	 * formatType.ft_id： 不显示
	 * 
	 * formatType.ft_name：显示
	 * 
	 * formatType.List<FormatDataNode>:formatNodeId（节点id）： 不显示,节点名： 显示
	 * 
	 * @param cs_id
	 * @param sourceDataId
	 * @param formatTypeMap
	 * @return formatNodeId、ft_id、节点名
	 */
	public static List<FormatType> getFormatTypeFolders(String cs_id, String sourceDataId,
			HashMap<String, FormatType> formatTypeMap) {
		List<FormatType> formatTypeFolders = new ArrayList<FormatType>();
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(ConstantsHBase.TABLE_PREFIX_NODE_ + cs_id);
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
					// 获取ft_id，节点名
					String[] node = Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
							Bytes.toBytes(ConstantsHBase.QUALIFIER_NODE))).split(",");
					try {
						// 添加行键formatNodeId、不显示，节点名、显示
						formatTypeMap.get(node[0]).getFormatDataNodes().put(Bytes.toString(result.getRow()), node[1]);
					} catch (NumberFormatException e) {
						continue;
					}
				}
			}
			resultScanner.close();
			table.close();
			for (FormatType formatType : formatTypeMap.values()) {
				formatTypeFolders.add(formatType);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return formatTypeFolders;
	}


	/**
	 * 编辑数据节点
	 * 
	 * @param cs_id
	 * @param formatNodeId
	 * @param ft_id
	 * @param nodeName
	 * @return
	 */
	public static boolean updateFormatNode(String cs_id, String formatNodeId,String ft_id, String nodeName) {
		HBaseDB db = HBaseDB.getInstance();
		return db.put(ConstantsHBase.TABLE_PREFIX_NODE_ + cs_id,
				formatNodeId, ConstantsHBase.FAMILY_INFO,
				ConstantsHBase.QUALIFIER_NODE, ft_id + "," + nodeName);
	}
	/**
	 * 删除数据节点
	 * @param cs_id
	 * @param formatNodeId
	 * @return
	 */
	public static boolean deleteFormatNode(String cs_id, String formatNodeId) {
		HBaseDB db = HBaseDB.getInstance();
		return db.delete(ConstantsHBase.TABLE_PREFIX_NODE_ + cs_id, formatNodeId) ;
	}
}
