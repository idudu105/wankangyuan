/**
 * HBase常量参数
 * */
package com.xtkong.util;

public class ConstantsHBase {
	/** zookeeper的主机地址 */
	public static  String HBASE_ZOOKEEPER_QUORUM = "60.29.25.133";
	/**  hbase存储数据的位置..hbase-site.xml配置文件路径 */
	public static String HBASE_ROOT_DIR = "hdfs://60.29.25.133:9000/hbase";
	/** 表名前缀*/
	public static final String TABLE_PREFIX_SOURCE = "collection_source";// 采集源
	public static final String TABLE_PREFIX_FORMAT = "format_type";// 格式类型
	/** 表名称 */
	public static final String TABLE_USER = "user";// 用户
	public static final String TABLE_GID = "gid";// 计数
	/** 各表列簇名 FAMILY_表名_列簇名 */
	public static final String FAMILY_INFO = "info";
	
	public static final String FAMILY_GID_GID= "gid";
	/** 各表列名 */	
	public static final String QUALIFIER_GID_GID_GID = "gid";
	
//	public static final String QUALIFIER_SOURCE_FormatDataName= "name";//源数据格式数据命名;
	
	public static final String QUALIFIER_ft_id="ft_id";
	public static final String QUALIFIER_ft_name="ft_name";
	public static final String QUALIFIER_node="node";

	//数据参数
	//扫描器最大缓冲，一次扫描请求返回数据量
	public static final int SCAN_CACHING_MAX_MOVIE = 50;
	
}
