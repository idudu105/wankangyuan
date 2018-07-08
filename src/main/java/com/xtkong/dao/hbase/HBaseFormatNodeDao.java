package com.xtkong.dao.hbase;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.filter.BinaryComparator;
import org.apache.hadoop.hbase.filter.CompareFilter.CompareOp;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.FilterList;
import org.apache.hadoop.hbase.filter.PrefixFilter;
import org.apache.hadoop.hbase.filter.SingleColumnValueFilter;
import org.apache.hadoop.hbase.filter.FilterList.Operator;
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
		String tableName = ConstantsHBase.TABLE_PREFIX_NODE_ + cs_id;
		createFormatNodeTable(tableName, new String[] { ConstantsHBase.FAMILY_INFO }, ConstantsHBase.VERSION_NODE);
		// PhoenixClient.createView(tableName, ConstantsHBase.FAMILY_INFO,
		// null);
	}

	private static void createFormatNodeTable(String tableName, String[] columnFamilies, int version) {
		HBaseDB db = HBaseDB.getInstance();
		db.createTable(tableName, columnFamilies, version);
	}

	/**
	 * 新增数据节点，创建共用数据
	 * 
	 * @param cs_id
	 * @param sourceDataId
	 * @param ft_id
	 * @param nodeName
	 * @return
	 */
	public static String insertFormatNode(String cs_id, String sourceDataId, String ft_id, String nodeName,
			Map<String, String> mateFieldDatas) {
		HBaseDB db = HBaseDB.getInstance();
		Long count = db.getNewId(ConstantsHBase.TABLE_GID, sourceDataId + "_" + ft_id, ConstantsHBase.FAMILY_GID_GID,
				ConstantsHBase.QUALIFIER_GID_GID_GID);
		String formatNodeId = sourceDataId + "_" + ft_id + "_" + count;

		String tableName = ConstantsHBase.TABLE_PREFIX_NODE_ + cs_id;
		Put put = new Put(Bytes.toBytes(formatNodeId));
		put.addColumn(Bytes.toBytes(ConstantsHBase.FAMILY_INFO), Bytes.toBytes(ConstantsHBase.QUALIFIER_FORMATTYPE),
				Bytes.toBytes(String.valueOf(ft_id)));
		put.addColumn(Bytes.toBytes(ConstantsHBase.FAMILY_INFO), Bytes.toBytes(ConstantsHBase.QUALIFIER_NODENAME),
				Bytes.toBytes(String.valueOf(nodeName)));
		put.addColumn(Bytes.toBytes(ConstantsHBase.FAMILY_INFO), Bytes.toBytes(ConstantsHBase.QUALIFIER_SOURCEDATAID),
				Bytes.toBytes(String.valueOf(sourceDataId)));
		boolean b = db.putRow(tableName, put);
		// boolean b = db.putCell(ConstantsHBase.TABLE_PREFIX_NODE_ + cs_id,
		// formatNodeId, ConstantsHBase.FAMILY_INFO,
		// ConstantsHBase.QUALIFIER_NODE, ft_id + "," + nodeName);
		// HBaseFormatDataDao.updateFormatData(cs_id, ft_id,
		// sourceDataId,formatNodeId, formatNodeId,mateFieldDatas);
		if (mateFieldDatas != null && !mateFieldDatas.isEmpty()) {
			HBaseFormatDataDao.insertFormatDataMeta(cs_id, ft_id, sourceDataId, formatNodeId, mateFieldDatas);
		}
		if (b) {
			return formatNodeId;
		} else {
			return null;
		}
	}

	public static String getFormatNodeId(String cs_id, String sourceDataId, String ft_id, String nodeName) {
		String formatNodeId = null;
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(ConstantsHBase.TABLE_PREFIX_NODE_ + cs_id);
			Scan scan = new Scan();
			scan.addFamily(Bytes.toBytes(ConstantsHBase.FAMILY_INFO));
			// 与
			FilterList filterList = new FilterList(Operator.MUST_PASS_ALL);
			filterList.addFilter(new PrefixFilter(Bytes.toBytes(sourceDataId + "_" + ft_id + "_")));
			filterList.addFilter(new SingleColumnValueFilter(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
					Bytes.toBytes(ConstantsHBase.QUALIFIER_FORMATTYPE), CompareOp.EQUAL,
					new BinaryComparator(Bytes.toBytes(ft_id))));
			filterList.addFilter(new SingleColumnValueFilter(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
					Bytes.toBytes(ConstantsHBase.QUALIFIER_NODENAME), CompareOp.EQUAL,
					new BinaryComparator(Bytes.toBytes(nodeName))));
			scan.setFilter(filterList);
			ResultScanner resultScanner = table.getScanner(scan);
			Iterator<Result> iterator = resultScanner.iterator();
			if (iterator.hasNext()) {
				Result result = iterator.next();
				if (!result.isEmpty()) {
					formatNodeId = Bytes.toString(result.getRow());
				}
			}
			resultScanner.close();
			table.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return formatNodeId;
	}

	public static FormatType getFormatNodes(String cs_id, String sourceDataId, String ft_id) {
		FormatType formatType = new FormatType();
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(ConstantsHBase.TABLE_PREFIX_NODE_ + cs_id);
			Scan scan = new Scan();
			scan.addFamily(Bytes.toBytes(ConstantsHBase.FAMILY_INFO));
			FilterList filterList = new FilterList(Operator.MUST_PASS_ALL);
			filterList.addFilter(new PrefixFilter(Bytes.toBytes(sourceDataId + "_" + ft_id + "_")));
			filterList.addFilter(new SingleColumnValueFilter(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
					Bytes.toBytes(ConstantsHBase.QUALIFIER_FORMATTYPE), CompareOp.EQUAL,
					new BinaryComparator(Bytes.toBytes(ft_id))));
			scan.setFilter(filterList);
			ResultScanner resultScanner = table.getScanner(scan);
			Iterator<Result> iterator = resultScanner.iterator();
			while (iterator.hasNext()) {
				Result result = iterator.next();
				if (!result.isEmpty()) {
					String nodeName = Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
							Bytes.toBytes(ConstantsHBase.QUALIFIER_NODENAME)));
					try {
						// 添加行键formatNodeId、不显示，节点名、显示
						formatType.getFormatDataNodes().put(Bytes.toString(result.getRow()), nodeName);
					} catch (NumberFormatException e) {
						continue;
					}
				}
			}
			resultScanner.close();
			table.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return formatType;
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
			Map<String, FormatType> formatTypeMap) {
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
					String ft_id = Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
							Bytes.toBytes(ConstantsHBase.QUALIFIER_FORMATTYPE)));
					String nodeName = Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
							Bytes.toBytes(ConstantsHBase.QUALIFIER_NODENAME)));
					// String[] node =
					// Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
					// Bytes.toBytes(ConstantsHBase.QUALIFIER_NODE))).split(",");
					try {
						// 添加行键formatNodeId、不显示，节点名、显示
						formatTypeMap.get(ft_id).getFormatDataNodes().put(Bytes.toString(result.getRow()), nodeName);
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
	 * 
	 * @param cs_id
	 * @param sourceDataId
	 * @return formatNodeId,ft_id,nodeName
	 */
	public static List<List<String>> getFormatNodes(String cs_id, String sourceDataId) {
		List<List<String>> formatNodes = new ArrayList<>();
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
					List<String> formatNode = new ArrayList<>();
					// 获取formatNodeId,ft_id,节点名
					String rowkey = Bytes.toString(result.getRow());
					String ft_id = Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
							Bytes.toBytes(ConstantsHBase.QUALIFIER_FORMATTYPE)));
					String nodeName = Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
							Bytes.toBytes(ConstantsHBase.QUALIFIER_NODENAME)));
					formatNode.add(rowkey);
					formatNode.add(ft_id);
					formatNode.add(nodeName);
					formatNodes.add(formatNode);
				}
			}
			resultScanner.close();
			table.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return formatNodes;
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
	public static boolean updateFormatNode(String cs_id, String formatNodeId, String ft_id, String nodeName) {
		HBaseDB db = HBaseDB.getInstance();
		Put put = new Put(Bytes.toBytes(formatNodeId));
		put.addColumn(Bytes.toBytes(ConstantsHBase.FAMILY_INFO), Bytes.toBytes(ConstantsHBase.QUALIFIER_FORMATTYPE),
				Bytes.toBytes(String.valueOf(ft_id)));
		put.addColumn(Bytes.toBytes(ConstantsHBase.FAMILY_INFO), Bytes.toBytes(ConstantsHBase.QUALIFIER_NODENAME),
				Bytes.toBytes(String.valueOf(nodeName)));
		String tableName = ConstantsHBase.TABLE_PREFIX_NODE_ + cs_id;
		return db.putRow(tableName, put);
		// db.putCell(ConstantsHBase.TABLE_PREFIX_NODE_ + cs_id, formatNodeId,
		// ConstantsHBase.FAMILY_INFO,
		// ConstantsHBase.QUALIFIER_NODE, ft_id + "," + nodeName);
	}

	/**
	 * 删除数据节点
	 * 
	 * @param cs_id
	 * @param formatNodeId
	 * @return
	 */
	public static boolean deleteFormatNode(String cs_id, String formatNodeId) {
		HBaseDB db = HBaseDB.getInstance();
		return db.delete(ConstantsHBase.TABLE_PREFIX_NODE_ + cs_id, formatNodeId);
	}

	public static void deleteFormatNodeTable(String cs_id) {
		HBaseDB.getInstance().deleteTable(ConstantsHBase.TABLE_PREFIX_NODE_ + cs_id);
	}
}
