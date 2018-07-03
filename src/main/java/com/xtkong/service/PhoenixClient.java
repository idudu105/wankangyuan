package com.xtkong.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import org.junit.Test;

import com.google.gson.Gson;
import com.xtkong.util.ConstantsHBase;

/**
 * 利用Phoenix访问Hbase
 *
 */
public class PhoenixClient {

	/**
	 * 利用静态块的方式初始化Driver，防止Tomcat加载不到（有时候比较诡异）
	 */
	static {
		try {
			Class.forName(ConstantsHBase.PhoenixDriver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取一个Hbase-Phoenix的连接
	 * 
	 * @return
	 */
	private static Connection getConnection() {
		Connection conn = null;
		final String url = ConstantsHBase.PhoenixJDBC;// zookeeper的master-host，zookeeper的master-port
		if (conn == null) {
			// try {
			// cc = DriverManager.getConnection(url);
			// } catch (SQLException e) {
			// // TODO Auto-generated catch block
			// e.printStackTrace();
			// }
			try {
				// Phoenix DB不支持直接设置连接超时
				// 所以这里使用线程池的方式来控制数据库连接超时
				final ExecutorService exec = Executors.newFixedThreadPool(1);
				Callable<Connection> call = new Callable<Connection>() {
					public Connection call() throws Exception {
						return DriverManager.getConnection(url);
					}
				};
				Future<Connection> future = exec.submit(call);
				// 如果在5s钟之内，还没得到 Connection 对象，则认为连接超时，不继续阻塞，防止服务夯死
				conn = future.get(1000 * 10 * 5, TimeUnit.MILLISECONDS);
				exec.shutdownNow();
			} catch (InterruptedException e) {
				e.printStackTrace();
			} catch (ExecutionException e) {
				e.printStackTrace();
			} catch (TimeoutException e) {
				e.printStackTrace();
			}
		}
		return conn;
	}

	/**
	 * 根据phoenix支持的SQL格式，执行HBase表映射到phoenix视图相关操作
	 * 
	 * @param phoenixSQLs
	 *            批量sql语句
	 * @return
	 */
	public static String executeUpdate(List<String> phoenixSQLs) {
		Connection conn = null;
		try {
			conn = PhoenixClient.getConnection();
			if (conn == null) {
				return "Phoenix DB连接超时！";
			}
			Statement stmt = conn.createStatement();
			for (String phoenixSQL : phoenixSQLs) {
				System.out.println("SQL：  " + phoenixSQL);
				stmt.executeUpdate(phoenixSQL);
			}
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			return "SQL执行出错：" + e.getMessage();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "success！";
	}

	/**
	 * 根据phoenix支持的SQL格式，查询Hbase的数据
	 *
	 * @param phoenixSQL
	 *            sql语句
	 * @return json-string
	 */
	public static Map<String, Map<String, Object>> executeQuery(String phoenixSQL) {
		Map<String, Map<String, Object>> map = new HashMap<String, Map<String, Object>>();
		Map<String, Object> msg = new HashMap<String, Object>();
		Map<String, Object> records = new HashMap<String, Object>();
		List<String> head = new ArrayList<String>();
		List<List<String>> datas = new ArrayList<>();
		// String result = "";
		Map<String, Object> page = new HashMap<>();
		page.put("totalCount", 0);
		page.put("pageSize", 1);
		page.put("totalPage", 1);
		page.put("currPage", 1);
		map.put("page", page);
		records.put("head", head);
		records.put("data", datas);
		map.put("records", records);
		try {
			Connection conn = PhoenixClient.getConnection();
			if (conn == null) {
				msg.put("msg", "Phoenix DB连接超时！");
				map.put("msg", msg);
				return map;
			}

			PreparedStatement stmt  =conn.prepareStatement(phoenixSQL);
			ResultSet set = stmt.executeQuery(phoenixSQL);
			// 准备查询
//			Statement stmt = conn.createStatement();
//			PhoenixResultSet set = (PhoenixResultSet) stmt.executeQuery(phoenixSQL);
			// 查询出来的列是不固定的，所以这里通过遍历的方式获取列名
			ResultSetMetaData meta = set.getMetaData();
			if (head.size() == 0) {
				for (int i = 1, count = meta.getColumnCount(); i <= count; i++) {
					head.add(meta.getColumnName(i));
				}
			}
			while (set.next()) {
				List<String> data = new ArrayList<>();
				for (int i = 0, len = head.size(); i < len; i++) {
					data.add(set.getString(head.get(i)));
				}
				datas.add(data);
			}
			// 结果封装
			page.put("totalCount", datas.size());
			map.put("page", page);
			records.put("head", head);
			records.put("data", datas);
			map.put("records", records);
			msg.put("msg", "success");
			map.put("msg", msg);
		} catch (SQLException e) {
			e.printStackTrace();
			msg.put("msg", "SQL执行出错：" + e.getMessage());
			map.put("msg", msg);
			return map;
			// } catch (JsonIOException e) {
			// e.printStackTrace();
			// msg.put("msg", "JSON转换出错：" + e.getMessage());
			// map.put("msg", msg);
			// return map;
		}
		return map;
	}

	/**
	 * HBase表 映射Pheonix视图
	 * 
	 * @param tableName
	 *            HBase表
	 * @param family
	 *            列簇
	 * @param qualifiers
	 *            列
	 */
	public static void createView(String tableName, String family, List<String> qualifiers) {
		List<String> pheonixSQLs = new ArrayList<>();
		String string = "create VIEW IF NOT EXISTS \"" + tableName + "\" (id varchar  primary key, ";
		if ((tableName != null) && (family != null) && (qualifiers != null) && (!qualifiers.isEmpty())) {
			for (String qualifier : qualifiers) {
				string += "\"" + family + "\"." + "\"" + qualifier + "\"" + "varchar, ";
			}
		}
		String pheonixSQL = string.substring(0, string.lastIndexOf(",")) + ")";
		// System.out.println(pheonixSQL);
		pheonixSQLs.add(pheonixSQL);
		PhoenixClient.executeUpdate(pheonixSQLs);
	}

	public static void dropView(String tableName) {
		List<String> pheonixSQLs = new ArrayList<>();
		pheonixSQLs.add("DROP VIEW IF EXISTS \"" + tableName + "\"");
		PhoenixClient.executeUpdate(pheonixSQLs);
	}

	public static void alterViewAddColumns(String tableName, String family, List<String> qualifiers) {
		List<String> pheonixSQLs = new ArrayList<>();
		if ((tableName != null) && (family != null) && (qualifiers != null) && (!qualifiers.isEmpty())) {
			for (String qualifier : qualifiers) {
				pheonixSQLs.add("ALTER VIEW \"" + tableName + "\" ADD IF NOT EXISTS " + "\"" + family + "\"." + "\""
						+ qualifier + "\"" + " varchar");
			}
		}
		if (!pheonixSQLs.isEmpty()) {
			PhoenixClient.executeUpdate(pheonixSQLs);
		}
	}

	public static void alterViewAddColumn(String tableName, String family, String qualifier) {
		List<String> pheonixSQLs = new ArrayList<>();
		if ((tableName != null) && (family != null) && (qualifier != null)) {
			pheonixSQLs.add("ALTER VIEW \"" + tableName + "\" ADD IF NOT EXISTS " + "\"" + family + "\"." + "\""
					+ qualifier + "\"" + " varchar");
		}
		if (!pheonixSQLs.isEmpty()) {
			PhoenixClient.executeUpdate(pheonixSQLs);
		}
	}

	public static void alterViewDropColumns(String tableName, String family, List<String> qualifiers) {
		List<String> pheonixSQLs = new ArrayList<>();
		if ((tableName != null) && (family != null) && (qualifiers != null) && (!qualifiers.isEmpty())) {
			for (String qualifier : qualifiers) {
				pheonixSQLs.add("ALTER VIEW \"" + tableName + "\"  DROP COLUMN IF EXISTS " + "\"" + family + "\"."
						+ "\"" + qualifier + "\"" + " varchar");
			}
		}
		if (!pheonixSQLs.isEmpty()) {
			PhoenixClient.executeUpdate(pheonixSQLs);
		}
	}

	public static void alterViewDropColumn(String tableName, String family, String qualifier) {
		List<String> pheonixSQLs = new ArrayList<>();
		if ((tableName != null) && (family != null) && (qualifier != null)) {
			pheonixSQLs.add("ALTER VIEW \"" + tableName + "\" DROP COLUMN IF EXISTS " + "\"" + family + "\"." + "\""
					+ qualifier + "\"");
		}
		if (!pheonixSQLs.isEmpty()) {
			PhoenixClient.executeUpdate(pheonixSQLs);
		}
	}

	@SuppressWarnings("unchecked")
	public static Integer count(String pheonixSQL) {
		Map<String, Map<String, Object>> map = PhoenixClient.executeQuery(pheonixSQL);
		Integer count = 0;
		if ((map.get("msg")).get("msg").equals("success")) {
			count = Integer.valueOf(((List<List<String>>) map.get("records").get("data")).get(0).get(0));
		}
		// System.out.println(pheonixSQL);
		// System.out.println("count:" + count);
		// System.out.println();
		return count;
	}
	public static String getPheonixSQLQualifier(String tableName, String qualifier) {
		return "\"" + tableName + "\".\"" + qualifier + "\"";
	}
	public static Map<String, Map<String, Object>> select(String tableName, List<String> qualifiers,
			Map<String, String> whereEqual, Map<String, String> whereLike,String condition, Integer page, Integer strip) {
		String pheonixSQL = " SELECT ID";
		if ((tableName != null)  && (qualifiers != null) && (!qualifiers.isEmpty())) {
			for (String qualifier : qualifiers) {
				pheonixSQL += ",\"" + tableName + "\".\"" +qualifier + "\"";
			}
		}
		pheonixSQL += " FROM \"" + tableName + "\"";
		boolean isAddWhere = true;
		
		if ((whereEqual != null) && (!whereEqual.isEmpty())) {
			if (isAddWhere) {
				pheonixSQL += " WHERE ";
				isAddWhere = false;
			}
			for (Entry<String, String> eqlual : whereEqual.entrySet()) {
				pheonixSQL += "\""  + tableName + "\".\"" + eqlual.getKey() + "\"='" + eqlual.getValue() + "' AND ";
			}
		}
		if ( (whereLike != null) && (!whereLike.isEmpty())) {
			if (isAddWhere) {
				pheonixSQL += " WHERE ";
				isAddWhere = false;
			}
			for (Entry<String, String> like : whereLike.entrySet()) {
				pheonixSQL += "\"" + tableName + "\".\"" +  like.getKey() + "\" like '%" + like.getValue() + "%' AND ";
			}
		}
		if (condition != null) {
			if (isAddWhere) {
				pheonixSQL += " WHERE ";
				isAddWhere = false;
			}
			pheonixSQL +=condition+ " AND ";
		}
		if (!isAddWhere) {
			pheonixSQL = pheonixSQL.substring(0, pheonixSQL.lastIndexOf("AND"));
		}
		System.out.println(pheonixSQL);
		return selectPage(pheonixSQL, page, strip);
	}

	/**
	 * @param tableName
	 *            表/视图名
	 * @param family
	 *            列簇
	 * @param qualifiers
	 *            列s
	 * @param whereEqual
	 *            等值条件
	 * @param whereLike
	 *            模糊条件
	 * @param page
	 *            页码
	 * @param strip
	 *            分页大小
	 * @return
	 */
	public static Map<String, Map<String, Object>> select(String tableName, String family, List<String> qualifiers,
			Map<String, String> whereEqual, Map<String, String> whereLike, Integer page, Integer strip) {
		String pheonixSQL = " SELECT ID";
		if ((tableName != null) && (family != null) && (qualifiers != null) && (!qualifiers.isEmpty())) {
			for (String qualifier : qualifiers) {
				pheonixSQL += ",\"" + family + "\"." + "\"" + qualifier + "\"";
			}
		}
		pheonixSQL += " FROM \"" + tableName + "\"";
		boolean isAddWhere = true;
		if ((whereEqual != null) && (!whereEqual.isEmpty())) {
			if (isAddWhere) {
				pheonixSQL += " WHERE ";
				isAddWhere = false;
			}
			for (Entry<String, String> eqlual : whereEqual.entrySet()) {
				pheonixSQL += "\"" + family + "\"." + "\"" + eqlual.getKey() + "\"='" + eqlual.getValue() + "' AND ";
			}
		}
		if ( (whereLike != null) && (!whereLike.isEmpty())) {
			if (isAddWhere) {
				pheonixSQL += " WHERE ";
				isAddWhere = false;
			}
			for (Entry<String, String> like : whereLike.entrySet()) {
				pheonixSQL += "\"" + family + "\"." + "\"" + like.getKey() + "\" like '%" + like.getValue() + "%' AND ";
			}
		}
		if (!isAddWhere) {
			pheonixSQL = pheonixSQL.substring(0, pheonixSQL.lastIndexOf("AND"));
		}
		System.out.println(pheonixSQL);
		return selectPage(pheonixSQL, page, strip);
	}

	/**
	 * 
	 * @param pheonixSQL
	 * @param page
	 *            请求页码
	 * @param strip
	 *            页面大小
	 * @return
	 */
	public static Map<String, Map<String, Object>> selectPage(String pheonixSQL, Integer page, Integer strip) {
		Map<String, Map<String, Object>> map = new HashMap<>();
		Integer index = 0;
		if ((index = pheonixSQL.indexOf("from")) == -1) {
			index = pheonixSQL.indexOf("FROM");
		}
		if (index == -1) {
			Map<String, Object> msg = new HashMap<String, Object>();
			msg.put("msg", "pheonixSQL 语法错误！");
			map.put("msg", msg);
		} else {
			if ((page == null) || (strip == null)) {
				map = PhoenixClient.executeQuery(pheonixSQL);
			} else if ((page > 0) && (strip > 0)) {
				map = PhoenixClient
						.executeQuery(pheonixSQL + " LIMIT " + strip + " OFFSET " + strip * (page - 1));
//				Integer count = count("SELECT COUNT(*)" + pheonixSQL.substring(index));
				Integer count =(Integer) map.get("page").get("totalCount");
				Map<String, Object> pages = new HashMap<String, Object>();
				pages.put("totalCount", count);
				pages.put("pageSize", strip);
				Integer totalPage = count / strip;
				if ((count % strip != 0)||(totalPage==0)) {
					totalPage++;
				}
				pages.put("totalPage", totalPage);
				pages.put("currPage", page);
				map.put("page", pages);
			} else {
				Map<String, Object> msg = new HashMap<String, Object>();
				msg.put("msg", "分页参数错误！");
				map.put("msg", msg);
			}
		}
		return map;
	}

	/**
	 * 表/视图结构异常处理
	 * 
	 * @param msg
	 *            异常信息
	 * @param tableName
	 *            表/视图名
	 * @param family
	 *            列簇
	 * @param qualifiers
	 *            列s
	 * @param whereEqual
	 *            等值条件
	 * @param whereLike
	 *            模糊条件
	 * @param page
	 *            页码
	 * @param strip
	 *            分页大小
	 * @return
	 */
	public static Map<String, Map<String, Object>> reSelectWhere(String msg, String tableName, String family,
			List<String> qualifiers, Map<String, String> whereEqual, Map<String, String> whereLike, Integer page,
			Integer strip) {
		Map<String, Map<String, Object>> map = new HashMap<>();
		// ERROR 504 (42703): Undefined column. columnName\u003dPROJECT"}
		// ERROR 1012 (42M03): Table undefined. tableName\u003dSOURCE_4845"}
	
		if (msg.contains("Table undefined")) {
			PhoenixClient.createView(tableName, family, qualifiers);
		}
		if (msg.contains("Undefined column")) {
			List<String> qualifiersAdd=qualifiers;
			if ((whereEqual != null) && (!whereEqual.isEmpty())) {
				for (String qualifier : whereEqual.keySet()) {
					if (!qualifiersAdd.contains(qualifier)) {
						qualifiersAdd.add(qualifier);
					}
				}
			}
			if ((whereLike != null) && (!whereLike.isEmpty())) {
				for (String qualifier : whereLike.keySet()) {
					if (!qualifiersAdd.contains(qualifier)) {
						qualifiersAdd.add(qualifier);
					}
				}
			}
			PhoenixClient.alterViewAddColumns(tableName, family, qualifiersAdd);
		}
		map = PhoenixClient.select(tableName, family, qualifiers, whereEqual, whereLike, page, strip);
		return map;

	}

	public static void main(String[] args) {
//		 viewTEST();
		
		int cs_id = 62;
		String tableName = ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id;
		String family = ConstantsHBase.FAMILY_INFO;
		List<String> qualifiers = new ArrayList<>();
//		qualifiers.add(ConstantsHBase.QUALIFIER_PROJECT);
//		qualifiers.add("67");
//		qualifiers.add("68");
//		qualifiers.add("69");
//		qualifiers.add("70");
		Integer page = 1;
		Integer strip = 200;
		Map<String, String> whereEqual = new HashMap<String, String>();
//		 whereEqual.put(ConstantsHBase.QUALIFIER_PROJECT, "77");
//		 whereEqual.put(ConstantsHBase.QUALIFIER_USER, "7");
		Map<String, String> whereLike = new HashMap<String, String>();
//		whereLike.put("70", "");
		
		Map<String, Map<String, Object>> result =null;
//		result =select(tableName, family, qualifiers, whereEqual, whereLike, null, null);

		String pheonixSQL;
//		pheonixSQL="SELECT * FROM "+tableName+" where (id='1_62_1' or id='1_62_2') and \"90\"='eqe'";
//		pheonixSQL="SELECT B.\"ID\" as aid,\"INFO\".\"1\" as a1,B.\"2\" as a2,BB.\"INFO\".\"B\" FROM  B BB ";
//		pheonixSQL="SELECT B.\"ID\",B.\"1\",A.\"ID\",A.\"1\" FROM B  LEFT OUTER JOIN  A  ON B.\"1\"=A.\"1\"";
//		pheonixSQL="SELECT ID,\"89\",\"90\",\"91\",\"92\",\"93\",\"94\" FROM \"SOURCE_62\""
//				+ " WHERE \"SOURCE_62\".\"USER\"='45' OR \"SOURCE_62\".\"CREATE\"='45' ";
//		pheonixSQL="SELECT *"
//				+ " FROM \"FORMAT_62_45\" WHERE  SOURCEDATAID='1_62_1' AND  \"FORMAT_62_45\".\"ID\"!='17' ";
		pheonixSQL=" SELECT ID,\"INFO\".\"89\",\"INFO\".\"90\",\"INFO\".\"91\",\"INFO\".\"92\",\"INFO\".\"93\","
		 		+ "\"INFO\".\"94\",\"INFO\".\"95\" FROM \"SOURCE_62\" WHERE \"INFO\".\"PROJECT\"='114' "
		 		+ "AND \"INFO\".\"89\" like '%%' ";
		result =selectPage(pheonixSQL, page, strip);
//		String resultMsg = String.valueOf((result.get("msg")).get("msg"));
//		for (int j = 0; j < 2; j++) {
//			resultMsg = String.valueOf((result.get("msg")).get("msg"));
//			if (resultMsg.equals("success")) {
//				break;
//			} else {
//				result = PhoenixClient.reSelectWhere(resultMsg, tableName, family, qualifiers, whereEqual,
//						whereLike, page, strip);
//			}
//		}
		System.out.println("\n"+new Gson().toJson(result).toString()+"\n");
		//		 System.out.println(new Gson().toJson(selectPage(" SELECT * FROM source_60", currPage, pageSize)).toString());

		// System.out.println(new Gson().toJson(select(tableName, family,
		// qualifiers, 10, 2)).toString());
		//
		// dropView("FORMAT_1_2");
//		 viewTEST();
		// System.out.println(new
		// Gson().toJson(PhoenixClient.executeQuery("SELECT * FROM FORMAT_1_2
		// ")).toString());

		// select("select * from SOURCE_1");
		// select("select idcardnum,sex,\"1\" from TEST.PERSON");
		// // while (true) {
		// String pheonixSQL1 = "CREATE VIEW \"" +
		// ConstantsHBase.TABLE_PREFIX_SOURCE_ + "1" + "\""
		// + " AS SELECT * FROM \"" + ConstantsHBase.TABLE_PREFIX_SOURCE_ + "1"
		// + "\"";
		// // pheonixSQL1 = "drop TABLE if exists \"" +
		// // ConstantsHBase.TABLE_PREFIX_SOURCE_ + 2 + "\"";

		// }
	}

	@Test
	public static void viewTEST() {

		List<String> pheonixSQLs = new ArrayList<>();

//		 pheonixSQLs.add(" DROP table IF  EXISTS \"B\"   ");
		
//		 pheonixSQLs.add(" create table IF NOT EXISTS \"B\" (id varchar primary key, \"INFO\".\"B\" varchar,\"INFO\".\"1\" varchar)DATA_BLOCK_ENCODING='NONE'");
//		pheonixSQLs.add("ALTER table  \"B\" ADD  IF NOT EXISTS \"" + "INFO" + "\"." + "\"2\"" + " varchar");
//		pheonixSQLs.add("ALTER table  \"B\" ADD  IF NOT EXISTS " + "INFO" + "." + "BB" + " varchar");
//		
//		pheonixSQLs.add("UPSERT INTO B SELECT * FROM a");
		
//		pheonixSQLs.add("ALTER table  \"b\" DROP COLUMN  IF  EXISTS \"" + "INFO" + "\"." + "\"244\"");
		// pheonixSQLs.add("ALTER VIEW \"FORMAT_1_2\" ADD INFO.D varchar");

		// pheonixSQLpublic static void viewTESTs.add(" create TABLE IF NOT
		// EXISTS \"A\" (id varchar not null primary key, \"1\" varchar,\"2\"
		// varchar)default_column_family='INFO'");
		 pheonixSQLs.add("upsert into B (ID,\"1\",\"2\") values		 ('1002','b小明','b12')");
		 pheonixSQLs.add("upsert into B (id,\"1\",\"2\") values		 ('1012','b红','b22')");
		 pheonixSQLs.add("upsert into B (id,\"1\",\"2\") values		 ('1032','b红2','b21')");

		// pheonixSQLs.add("ALTER TABLE A ADD sex varchar");
		// pheonixSQLs.add(" upsert into A (ID,sex) values ('100','男')");
		// pheonixSQLs.add(" upsert into test.person (idcardnum,sex) values
		// ('101','女')");
		// pheonixSQLs.add(" upsert into test.person (idcardnum,sex) values
		// ('103','男')");

		PhoenixClient.executeUpdate(pheonixSQLs);
	}

}
