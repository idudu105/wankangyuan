/**
 * HBase常量参数
 * */
package com.xtkong.util;

public class ConstantsHBase {
	
	public static final String HBASE_ZOOKEEPER_QUORUM="hpc03";
	public static final String HBASE_ZOOKEEPER_PROPERTY_CLIENTPORT="52181";
	public static final String HBASE_MASTER_INFO_PORT="56010";
	public static final String PhoenixDriver="org.apache.phoenix.jdbc.PhoenixDriver";
	
	
	/** 表名前缀 */
	public static final String TABLE_PREFIX_SOURCE_ = "source_";// 采集源
	public static final String TABLE_PREFIX_NODE_ = "node_";// 节点
	public static final String TABLE_PREFIX_FORMAT_ = "format_";// 格式类型
	/** 表名称 */
	public static final String TABLE_GID = "gid";// 计数
	/** 各表列簇名 FAMILY_表名_列簇名 */
	public static final String FAMILY_GID_GID = "gid";
	public static final String FAMILY_INFO = "info";
	/** 各表列名 */
	public static final String QUALIFIER_GID_GID_GID = "gid";
	public static final String QUALIFIER_NODE = "node";
	
	public static final String QUALIFIER_ADD = "add";//添加
	public static final String QUALIFIER_PUBLIC = "public";//公共，1公共，0不公开（默认）
	
	public static final String QUALIFIER_PROJECT = "porject";//项目
	/**值*/

	public static final String VALUE_ADD_TRUE = "1";//1添加数据
	public static final String VALUE_ADD_FALSE = "0";//0自建数据（默认）
	
	public static final String VALUE_PUBLIC_TRUE = "1";//1公共
	public static final String VALUE_PUBLIC_FALSE = "0";//0不公开（默认）
	/** 存储版本	 */
	public static final int VERSION_SOURCE=1;
	public static final int VERSION_NODE=1;
	public static final int VERSION_FORMAT=1;
	
	/***/
	public static final int IS_meta_true=1;//meta类型
	public static final int IS_meta_false=0;//data类型
	// 数据参数
	// 扫描器最大缓冲，一次扫描请求返回数据量
	public static final int SCAN_CACHING_MAX = 50;

}
