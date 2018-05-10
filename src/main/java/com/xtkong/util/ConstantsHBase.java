/**
 * HBase常量参数
 * */
package com.xtkong.util;

public class ConstantsHBase {
	/** zookeeper的主机地址 */
	public static final String HBASE_ZOOKEEPER_QUORUM_NAME = "hbase.zookeeper.quorum";
	/** zookeeper的主机虚拟机主机名 */
	public static  String HBASE_ZOOKEEPER_QUORUM = "60.29.25.133";
	/** hbase存储数据的位置 */
	public static final String HBASE_ROOT_DIR_NAME = "hbase:rootdir";
	/** hbase-site.xml配置文件路径 */
	public static String HBASE_ROOT_DIR = "hdfs://MyhealthGene/hbase";
	/** 表名前缀*/
	public static final String TABLE_PREFIX_SOURCE = "collection_source";// 采集源
	public static final String TABLE_PREFIX_FORMAT = "format_type";// 格式类型
	/** 表名称 */
	public static final String TABLE_USER = "user";// 用户
	public static final String TABLE_GID = "gid";// 计数
	/** 各表列簇名 FAMILY_表名_列簇名 */
	public static final String FAMILY_USER_ID = "id";
	public static final String FAMILY_USER_INFO = "info";
	public static final String FAMILY_USER_GENRE = "genre";	
	
	public static final String FAMILY_GID_GID= "gid";
	public static final String FAMILY_SOURCE_FormatDataName= "name";//源数据格式数据命名;
	public static final String FAMILY_SOURCE_INFO = "info";//源数据基础信息
	/** 各表列名 */	
	public static final String QUALIFIER_GID_GID_GID = "gid";
	
	public static final String QUALIFIER_SOURCE_FormatDataName= "name";//源数据格式数据命名;
/*	// user表 QUALIFIER_表名_列簇_列名
	public static final String QUALIFIER_USER_ID_ID = "id";
	public static final String QUALIFIER_USER_INFO_NAME = "name";
	public static final String QUALIFIER_USER_INFO_EMAIL = "email";
	public static final String QUALIFIER_USER_INFO_USERNAME = "username";
	public static final String QUALIFIER_USER_INFO_PASSWORD = "password";
	public static final String QUALIFIER_USER_GENRE_GENRE_ID = "genre_id";
	public static final String QUALIFIER_USER_GENRE_GENRE_NAME = "genre_name";
	public static final String QUALIFIER_USER_GENRE_SCORE = "score";*/

	//数据参数
	//扫描器最大缓冲，一次扫描请求返回数据量
	public static final int SCAN_CACHING_MAX_MOVIE = 50;
	
}
