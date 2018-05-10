/**
 * HBaseDB工具类
 * */
package com.xtkong.util;

import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;

public class HBaseDB {
	// 避免多线程导致生成多个实例
	private static final HBaseDB hBaseDBTool = new HBaseDB();
	private static Connection connection = null;
	static {
		Configuration configuration = HBaseConfiguration.create();
	//	configuration.set("hbase.master", "60.29.25.133");  
		// zookeeper的主机地址，虚拟机主机名
		configuration.set(ConstantsHBase.HBASE_ZOOKEEPER_QUORUM_NAME, ConstantsHBase.HBASE_ZOOKEEPER_QUORUM);
		configuration.set("hbase.zookeeper.property.clientPort", "2181");
		// hbase存储数据的位置，hbase-site.xml中配置
		configuration.set(ConstantsHBase.HBASE_ROOT_DIR_NAME, ConstantsHBase.HBASE_ROOT_DIR);
	//	configuration.set("hbase.master.port", "60000");
		try {
			connection = ConnectionFactory.createConnection(configuration);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private HBaseDB() {
	}

	public static HBaseDB getInstance() {
		return hBaseDBTool;
	}
	

	/**
	 * 创建HBase表
	 * 
	 * @param tableName
	 *            表名称
	 * @param columnFamilies
	 *            列簇，可能有多个
	 * @param version
	 *            列表存储的版本数量
	 */
	public void createTable(String tableName, String[] columnFamilies, int version) {
		try {
			Admin admin = connection.getAdmin();
			TableName tableNameObject = TableName.valueOf(tableName);
			if (admin.tableExists(tableNameObject)) {
				System.out.println("表：" + tableName + "已存在");
			} else {
				HTableDescriptor tableDescriptor = new HTableDescriptor(tableNameObject);
				for (String columnFamily : columnFamilies) {
					// 添加列簇
					tableDescriptor.addFamily(new HColumnDescriptor(columnFamily).setMaxVersions(version));
				}
				admin.createTable(tableDescriptor);
				System.out.println("创建表：" + tableName);
			}
			admin.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 删除HBase表
	 * 
	 * @param tableName
	 *            表名称
	 */
	public void deleteTable(String tableName) {
		try {
			Admin admin = connection.getAdmin();
			TableName tableNameObject = TableName.valueOf(tableName);
			if (admin.tableExists(tableNameObject)) {
				admin.disableTable(tableNameObject);
				admin.deleteTable(tableNameObject);
				System.out.println("删除表：" + tableName);
			} else {
				System.out.println("表：" + tableName + "不存在");
			}
			admin.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**新增列簇
	 * @param tableName  表名称
	 * @param columnFamilies 列簇，可能有多个
	 * @param version  列表存储的版本数量
	 */
	public void addColumnFamilys(String tableName, String[] columnFamilies, int version) {
		try {
			Admin admin = connection.getAdmin();
			TableName tableNameObject = TableName.valueOf(tableName);
			if (admin.tableExists(tableNameObject)) {
				System.out.println("表：" + tableName + "已存在");
				admin.disableTable(tableNameObject);
				//admin.getAlterStatus(tableNameObject);
				//HTableDescriptor tableDescriptor =admin.getTableDescriptor(tableNameObject);
				for (String columnFamily : columnFamilies) {
					// 添加列簇
					admin.addColumn(tableNameObject, new HColumnDescriptor(columnFamily).setMaxVersions(version));
					//tableDescriptor.addFamily(new HColumnDescriptor(columnFamily).setMaxVersions(version));
				}
				//admin.modifyTable(tableNameObject, tableDescriptor);
				admin.enableTableAsync(tableNameObject);
				System.out.println("表：" + tableName + "添加列簇");
				/*
				 * admin.disableTable(tableNameObject);
				 * admin.deleteTable(tableNameObject); System.out.println("删除表："
				 * + tableName);
				 */
				admin.close();
			} else {
				createTable( tableName,  columnFamilies, version) ;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 根据表名获取Table对象
	 * 
	 * @param tableName
	 *            表名称
	 */
	public Table getTable(String tableName) {
		Table table = null;
		try {
			Admin admin = connection.getAdmin();
			TableName tableNameObject = TableName.valueOf(tableName);
			if (admin.tableExists(tableNameObject)) {
				table = connection.getTable(tableNameObject);
			}
			admin.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return table;
	}

	/**
	 * 获取一个计数器的值，作为表的行键 计数器表已创建，列簇、列已知
	 * 
	 * @param tableName
	 *            表名称
	 * @param rowKey
	 *            行键
	 * @param family
	 *            列簇
	 * @param qualifier
	 *            列
	 */
	public Long getNewId(String tableName, String rowKey, String family, String qualifier) {
		long id = 0;
		try {
			Table table = getTable(tableName);
			id = table.incrementColumnValue(Bytes.toBytes(rowKey), Bytes.toBytes(family), Bytes.toBytes(qualifier), 1);
			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(id);
		return id;
	}

	/**
	 * 向表中添加一条数据 Object.toString()
	 * 
	 * @param tableName
	 *            表名称
	 * @param rowKey
	 *            行键
	 * @param family
	 *            列簇
	 * @param quelifier
	 *            列
	 * @param value
	 *            列值
	 */
	public void put(Object tableName, Object rowKey, Object family, Object quelifier, Object value) {
		try {
			Table table = getTable(tableName.toString());
			// 设置行键
			Put put = new Put(Bytes.toBytes(rowKey.toString()));
			put.addColumn(Bytes.toBytes(family.toString()), Bytes.toBytes(quelifier.toString()),
					Bytes.toBytes(value.toString()));
			table.put(put);
			System.out.println("tableName:" + tableName + ",rowKey:" + rowKey + ",family:" + family + ",quelifier:"
					+ quelifier + ",value:" + value);
			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}