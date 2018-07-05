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
			// conn = DriverManager.getConnection(url);
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
				// 如果在一定时间之内，还没得到 Connection 对象，则认为连接超时，不继续阻塞，防止服务夯死
				long timeout = 1000 * 60;
				conn = future.get(timeout, TimeUnit.MILLISECONDS);
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
	private static String executeUpdate(List<String> phoenixSQLs) {
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
	private static Map<String, Map<String, Object>> executeQuery(String phoenixSQL) {
		Map<String, Map<String, Object>> map = new HashMap<String, Map<String, Object>>();
		Map<String, Object> msg = new HashMap<String, Object>();
		Map<String, Object> records = new HashMap<String, Object>();
		List<String> head = new ArrayList<String>();
		List<List<String>> datas = new ArrayList<>();

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

			PreparedStatement stmt = conn.prepareStatement(phoenixSQL);
			ResultSet set = stmt.executeQuery(phoenixSQL);
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
		}
		return map;
	}

	/**
	 * HBase表 映射phoenix视图
	 * 
	 * @param tableName
	 *            HBase表
	 * @param family
	 *            列簇
	 * @param qualifiers
	 *            列
	 */
	public static void createView(String tableName, List<String> qualifiers) {
		List<String> phoenixSQLs = new ArrayList<>();
		String string = "create VIEW IF NOT EXISTS \"" + tableName + "\" (id varchar  primary key, ";
		if ((tableName != null) && (qualifiers != null) && (!qualifiers.isEmpty())) {
			for (String qualifier : qualifiers) {
				string += "\"" + qualifier + "\"" + "varchar, ";
			}
		}
		String phoenixSQL = string.substring(0, string.lastIndexOf(",")) + ")";
		phoenixSQLs.add(phoenixSQL);
		PhoenixClient.executeUpdate(phoenixSQLs);
	}

	public static void dropView(String tableName) {
		List<String> phoenixSQLs = new ArrayList<>();
		phoenixSQLs.add("DROP VIEW IF EXISTS \"" + tableName + "\"");
		PhoenixClient.executeUpdate(phoenixSQLs);
	}

	public static void alterViewAddColumns(String tableName, List<String> qualifiers) {
		List<String> phoenixSQLs = new ArrayList<>();
		if ((tableName != null) && (qualifiers != null) && (!qualifiers.isEmpty())) {
			for (String qualifier : qualifiers) {
				phoenixSQLs.add(
						"ALTER VIEW \"" + tableName + "\" ADD IF NOT EXISTS " + "\"" + qualifier + "\"" + " varchar");
			}
		}
		if (!phoenixSQLs.isEmpty()) {
			PhoenixClient.executeUpdate(phoenixSQLs);
		}
	}

	public static void alterViewAddColumn(String tableName, String qualifier) {
		List<String> phoenixSQLs = new ArrayList<>();
		if ((tableName != null) && (qualifier != null)) {
			phoenixSQLs
					.add("ALTER VIEW \"" + tableName + "\" ADD IF NOT EXISTS " + "\"" + qualifier + "\"" + " varchar");
		}
		if (!phoenixSQLs.isEmpty()) {
			PhoenixClient.executeUpdate(phoenixSQLs);
		}
	}

	public static void alterViewDropColumns(String tableName, List<String> qualifiers) {
		List<String> phoenixSQLs = new ArrayList<>();
		if ((tableName != null) && (qualifiers != null) && (!qualifiers.isEmpty())) {
			for (String qualifier : qualifiers) {
				phoenixSQLs.add("ALTER VIEW \"" + tableName + "\"  DROP COLUMN IF EXISTS " + "\"" + qualifier + "\""
						+ " varchar");
			}
		}
		if (!phoenixSQLs.isEmpty()) {
			PhoenixClient.executeUpdate(phoenixSQLs);
		}
	}

	public static void alterViewDropColumn(String tableName, String qualifier) {
		List<String> phoenixSQLs = new ArrayList<>();
		if ((tableName != null) && (qualifier != null)) {
			phoenixSQLs.add("ALTER VIEW \"" + tableName + "\" DROP COLUMN IF EXISTS " + "\"" + qualifier + "\"");
		}
		if (!phoenixSQLs.isEmpty()) {
			PhoenixClient.executeUpdate(phoenixSQLs);
		}
	}

	/**
	 * 构造等值条件，内部and关系
	 * 
	 * @param tableName
	 * @param conditionEqual
	 * @return
	 */
	public static String getPhoenixSQLConditionEqualsAND(String tableName, Map<String, String> conditionEqual) {
		String phoenixSQL = " ";
		if ((conditionEqual != null) && (!conditionEqual.isEmpty())) {
			for (Entry<String, String> eqlual : conditionEqual.entrySet()) {
				phoenixSQL += "\"" + tableName + "\".\"" + eqlual.getKey() + "\"='" + eqlual.getValue() + "' AND ";
			}
		}
		if (phoenixSQL.trim().endsWith("AND")) {
			phoenixSQL = phoenixSQL.substring(0, phoenixSQL.lastIndexOf("AND"));
		}
		return phoenixSQL;
	}

	/**
	 * 构造模糊条件，内部and关系
	 * 
	 * @param tableName
	 * @param conditionEqual
	 * @return
	 */
	public static String getPhoenixSQLConditionLikesAND(String tableName, Map<String, String> conditionLike) {
		String phoenixSQL = " ";
		if ((conditionLike != null) && (!conditionLike.isEmpty())) {
			for (Entry<String, String> like : conditionLike.entrySet()) {
				phoenixSQL += "\"" + tableName + "\".\"" + like.getKey() + "\" like '%" + like.getValue() + "%' AND ";
			}
		}
		if (phoenixSQL.trim().endsWith("AND")) {
			phoenixSQL = phoenixSQL.substring(0, phoenixSQL.lastIndexOf("AND"));
		}
		return phoenixSQL;
	}

	/**
	 * 构造phoenixSQL,conditionEqual+conditionLike+condition+page+strip
	 * 
	 * @param tableName
	 *            表/视图名
	 * @param qualifiers
	 *            列s
	 * @param conditionEqual
	 *            等值条件
	 * @param conditionLike
	 *            模糊条件
	 * @param condition
	 *            其他条件
	 * @param page
	 *            请求页码
	 * @param strip
	 *            页面大小
	 * @return
	 */
	public static String getPhoenixSQL(String tableName, List<String> qualifiers, Map<String, String> conditionEqual,
			Map<String, String> conditionLike, String condition, Integer page, Integer strip) {
		String phoenixSQL = " ";
		if ((tableName != null) && (qualifiers != null) && (!qualifiers.isEmpty())) {
			phoenixSQL += " SELECT ID ";
			for (String qualifier : qualifiers) {
				phoenixSQL += ",\"" + tableName + "\".\"" + qualifier + "\"";
			}
		}
		phoenixSQL += " FROM \"" + tableName + "\"  WHERE  ";
		String phoenixSQLConditionEqualsAND = getPhoenixSQLConditionEqualsAND(tableName, conditionEqual);
		if (!phoenixSQLConditionEqualsAND.equals(" ")) {
			phoenixSQL += phoenixSQLConditionEqualsAND + " AND ";
		}
		String phoenixSQLConditionLikesAND = getPhoenixSQLConditionLikesAND(tableName, conditionLike);
		if (!phoenixSQLConditionLikesAND.equals(" ")) {
			phoenixSQL += phoenixSQLConditionLikesAND + " AND ";
		}
		if (condition != null) {
			phoenixSQL += condition;
		}
		if (phoenixSQL.trim().endsWith("WHERE")) {
			phoenixSQL = phoenixSQL.substring(0, phoenixSQL.lastIndexOf("WHERE"));
		}
		if (phoenixSQL.trim().endsWith("AND")) {
			phoenixSQL = phoenixSQL.substring(0, phoenixSQL.lastIndexOf("AND"));
		}
		if ((page != null) && (strip != null) && (page > 0) && (strip > 0)) {
			phoenixSQL += " LIMIT " + strip + " OFFSET " + strip * (page - 1);
		}
		return phoenixSQL;
	}

	/**
	 * 构造phoenixSQL,phoenixSQL+condition+page+strip
	 * 
	 * @param phoenixSQL
	 * @param condition
	 *            与SQL的连接符+其他条件,order by等。
	 * @param page
	 *            请求页码
	 * @param strip
	 *            页面大小
	 * @return
	 */
	public static String getPhoenixSQL(String phoenixSQL, String condition, Integer page, Integer strip) {
		if (condition != null) {
			phoenixSQL += condition;
		}
		if ((page != null) && (strip != null) && (page > 0) && (strip > 0)) {
			phoenixSQL += " LIMIT " + strip + " OFFSET " + strip * (page - 1);
		}
		return phoenixSQL;
	}

	/**
	 * 根据Phoenix支持的SQL格式，查询Hbase的数据。
	 * 
	 * @param phoenixSQL
	 * @return 成功信息，数据，分页
	 */
	public static Map<String, Map<String, Object>> select(String phoenixSQL) {
		return executeQuery(phoenixSQL);
	}

	/**
	 * 统计
	 * 
	 * @param phoenixSQL
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Integer count(String phoenixSQL) {
		Integer count = 0;
		Integer index = -1;
		if ((index = phoenixSQL.indexOf("FROM")) == -1) {
			index = phoenixSQL.indexOf("from");
		}
		if (index != -1) {
			Map<String, Map<String, Object>> map = PhoenixClient
					.executeQuery("SELECT COUNT(*)" + phoenixSQL.substring(index));
			if ((map.get("msg")).get("msg").equals("success")) {
				count = Integer.valueOf(((List<List<String>>) map.get("records").get("data")).get(0).get(0));
			}
		}
		return count;
	}

	/**
	 * 表/视图结构异常处理
	 * 
	 * @param msg
	 *            异常信息
	 * @param tableName
	 *            表/视图名
	 * @param qualifiers
	 *            列s
	 * @param conditionEqual
	 *            等值条件
	 * @param conditionLike
	 *            模糊条件
	 * @return
	 */
	public static void undefined(String msg, String tableName, List<String> qualifiers,
			Map<String, String> conditionEqual, Map<String, String> conditionLike) {
		// Map<String, Map<String, Object>> map = new HashMap<>();
		// ERROR 504 (42703): Undefined column. columnName\u003dPROJECT"}
		// ERROR 1012 (42M03): Table undefined. tableName\u003dSOURCE_4845"}

		if (msg.contains("Table undefined")) {
			PhoenixClient.createView(tableName, qualifiers);
		}
		if (msg.contains("Undefined column")) {
			List<String> qualifiersAdd = qualifiers;
			if ((conditionEqual != null) && (!conditionEqual.isEmpty())) {
				for (String qualifier : conditionEqual.keySet()) {
					if (!qualifiersAdd.contains(qualifier)) {
						qualifiersAdd.add(qualifier);
					}
				}
			}
			if ((conditionLike != null) && (!conditionLike.isEmpty())) {
				for (String qualifier : conditionLike.keySet()) {
					if (!qualifiersAdd.contains(qualifier)) {
						qualifiersAdd.add(qualifier);
					}
				}
			}
			PhoenixClient.alterViewAddColumns(tableName, qualifiersAdd);
		}
		// map = PhoenixClient.select(tableName, family, qualifiers,
		// conditionEqual, whereLike, page, strip);
		// return map;

	}

	public static String getPhoenixSQLQualifier(String tableName, String qualifier) {
		return "\"" + tableName + "\".\"" + qualifier + "\"";
	}

	/**
	 * 
	 * @param tableName
	 *            表/视图名
	 * @param qualifiers
	 *            列s
	 * @param whereEqual
	 *            等值条件
	 * @param whereLike
	 *            模糊条件
	 * @param condition
	 *            其他条件
	 * @param page
	 *            页码
	 * @param strip
	 *            分页大小
	 * @return
	 */
	public static Map<String, Map<String, Object>> select(String tableName, List<String> qualifiers,
			Map<String, String> whereEqual, Map<String, String> whereLike, String condition, Integer page,
			Integer strip) {
		String phoenixSQL = " SELECT ID";
		if ((tableName != null) && (qualifiers != null) && (!qualifiers.isEmpty())) {
			for (String qualifier : qualifiers) {
				phoenixSQL += ",\"" + tableName + "\".\"" + qualifier + "\"";
			}
		}
		phoenixSQL += " FROM \"" + tableName + "\"  WHERE  ";

		if ((whereEqual != null) && (!whereEqual.isEmpty())) {
			for (Entry<String, String> eqlual : whereEqual.entrySet()) {
				phoenixSQL += "\"" + tableName + "\".\"" + eqlual.getKey() + "\"='" + eqlual.getValue() + "' AND ";
			}
		}
		if ((whereLike != null) && (!whereLike.isEmpty())) {
			for (Entry<String, String> like : whereLike.entrySet()) {
				phoenixSQL += "\"" + tableName + "\".\"" + like.getKey() + "\" like '%" + like.getValue() + "%' AND ";
			}
		}
		if (condition != null) {
			phoenixSQL += condition + " AND ";
		}
		if (phoenixSQL.trim().endsWith("WHERE")) {
			phoenixSQL = phoenixSQL.substring(0, phoenixSQL.lastIndexOf("WHERE"));
		}
		if (phoenixSQL.trim().endsWith("AND")) {
			phoenixSQL = phoenixSQL.substring(0, phoenixSQL.lastIndexOf("AND"));
		}
		return selectPage(phoenixSQL, page, strip);
	}

	/**
	 * 
	 * @param tableName
	 * @param family
	 * @param qualifiers
	 * @param whereEqual
	 * @param whereLike
	 * @param page
	 * @param strip
	 * @return
	 */
	public static Map<String, Map<String, Object>> select(String tableName, String family, List<String> qualifiers,
			Map<String, String> whereEqual, Map<String, String> whereLike, Integer page, Integer strip) {
		String phoenixSQL = " SELECT ID";
		if ((tableName != null) && (family != null) && (qualifiers != null) && (!qualifiers.isEmpty())) {
			for (String qualifier : qualifiers) {
				phoenixSQL += ",\"" + family + "\"." + "\"" + qualifier + "\"";
			}
		}
		phoenixSQL += " FROM \"" + tableName + "\" WHERE ";
		if ((whereEqual != null) && (!whereEqual.isEmpty())) {
			for (Entry<String, String> eqlual : whereEqual.entrySet()) {
				phoenixSQL += "\"" + family + "\"." + "\"" + eqlual.getKey() + "\"='" + eqlual.getValue() + "' AND ";
			}
		}
		if ((whereLike != null) && (!whereLike.isEmpty())) {
			for (Entry<String, String> like : whereLike.entrySet()) {
				phoenixSQL += "\"" + family + "\"." + "\"" + like.getKey() + "\" like '%" + like.getValue() + "%' AND ";
			}
		}
		if (phoenixSQL.trim().endsWith("WHERE")) {
			phoenixSQL = phoenixSQL.substring(0, phoenixSQL.lastIndexOf("WHERE"));
		}
		if (phoenixSQL.trim().endsWith("AND")) {
			phoenixSQL = phoenixSQL.substring(0, phoenixSQL.lastIndexOf("AND"));
		}
		System.out.println(phoenixSQL);
		return selectPage(phoenixSQL, page, strip);
	}

	/**
	 * 分页查询
	 * 
	 * @param phoenixSQL
	 * @param page
	 *            请求页码
	 * @param strip
	 *            页面大小
	 * @return
	 */
	public static Map<String, Map<String, Object>> selectPage(String phoenixSQL, Integer page, Integer strip) {
		Map<String, Map<String, Object>> map = new HashMap<>();
		Integer index = 0;
		if ((index = phoenixSQL.indexOf("FROM")) == -1) {
			index = phoenixSQL.indexOf("from");
		}
		if (index == -1) {
			Map<String, Object> msg = new HashMap<String, Object>();
			msg.put("msg", "phoenixSQL 语法错误！");
			map.put("msg", msg);
		} else {
			if ((page == null) || (strip == null)) {
				map = PhoenixClient.executeQuery(phoenixSQL);
			} else if ((page > 0) && (strip > 0)) {
				Integer count = count("SELECT COUNT(*)" + phoenixSQL.substring(index));
				map = PhoenixClient.executeQuery(phoenixSQL + " LIMIT " + strip + " OFFSET " + strip * (page - 1));
				// Integer count = (Integer) map.get("page").get("totalCount");
				Map<String, Object> pages = new HashMap<String, Object>();
				pages.put("totalCount", count);
				pages.put("pageSize", strip);
				Integer totalPage = count / strip;
				if ((count % strip != 0) || (totalPage == 0)) {
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
			PhoenixClient.createView(tableName, qualifiers);
		}
		if (msg.contains("Undefined column")) {
			List<String> qualifiersAdd = qualifiers;
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
			PhoenixClient.alterViewAddColumns(tableName, qualifiersAdd);
		}
		map = PhoenixClient.select(tableName, family, qualifiers, whereEqual, whereLike, page, strip);
		return map;

	}

	/**
	 * 通用查询
	 * 
	 * @param phoenixSQL
	 * @param page
	 * @param strip
	 * @return
	 */
	public static Map<String, Object> commonSelect(String phoenixSQL, Integer page, Integer strip) {
		Map<String, Object> map = new HashMap<>();
		try {
			Connection conn = PhoenixClient.getConnection();
			if (conn == null) {
				map.put("msg", "Phoenix DB连接超时！");
				return map;
			}
			Integer index = 0;
			if ((index = phoenixSQL.indexOf("FROM")) == -1) {
				index = phoenixSQL.indexOf("from");
			}
			if (index == -1) {
				Map<String, Object> msg = new HashMap<String, Object>();
				msg.put("msg", "phoenixSQL 语法错误！");
				map.put("msg", msg);
				return map;
			}
			if ((page != null) && (strip != null) && (page > 0) && (strip > 0)) {
				Map<String, Object> pages = new HashMap<String, Object>();
				Integer totalCount = count("SELECT COUNT(*)" + phoenixSQL.substring(index));
				pages.put("totalCount", totalCount);
				pages.put("pageSize", strip);
				Integer totalPage = totalCount / strip;
				if ((totalCount % strip != 0) || (totalPage == 0)) {
					totalPage++;
				}
				pages.put("totalPage", totalPage);
				pages.put("currPage", page);
				map.put("page", pages);

				phoenixSQL += " LIMIT " + strip + " OFFSET " + strip * (page - 1);
			}
			// 准备查询
			PreparedStatement stmt = conn.prepareStatement(phoenixSQL);
			ResultSet set = stmt.executeQuery(phoenixSQL);
			// 查询出来的列是不固定的，所以这里通过遍历的方式获取列名
			ResultSetMetaData meta = set.getMetaData();
			List<String> head = new ArrayList<String>();
			if (head.size() == 0) {
				for (int i = 1, count = meta.getColumnCount(); i <= count; i++) {
					String id = meta.getColumnName(i);
					head.add(id);
				}
			}
			List<Map<String, String>> datas = new ArrayList<>();
			while (set.next()) {
				Map<String, String> data = new HashMap<>();
				for (int i = 0, len = head.size(); i < len; i++) {
					String value = set.getString(head.get(i));
					if (value == null) {
						value = "";
					}
					data.put(head.get(i), value);
				}
				datas.add(data);
			}
			// 结果封装
			map.put("data", datas);
			map.put("msg", "success");
		} catch (SQLException e) {
			e.printStackTrace();
			map.put("msg", "SQL执行出错：\n SQL:  " + phoenixSQL + "\n异常信息:  " + e.getMessage());
			return map;
		}
		return map;
	}

	@SuppressWarnings("unused")
	public static void main(String[] args) {

		int cs_id = 49;
		String tableName = "XXQQ";
		String family = ConstantsHBase.FAMILY_INFO;
		List<String> qualifiers = new ArrayList<>();
		// qualifiers.add(ConstantsHBase.QUALIFIER_PROJECT);
		qualifiers.add("E");
		qualifiers.add("D");
		qualifiers.add("F");
		qualifiers.add("G");
		Integer page = 1;
		Integer strip = 22;
		Map<String, String> whereEqual = new HashMap<String, String>();
		// whereEqual.put(ConstantsHBase.QUALIFIER_PROJECT, "77");
		// whereEqual.put(ConstantsHBase.QUALIFIER_USER, "7");
		Map<String, String> whereLike = new HashMap<String, String>();
		// whereLike.put("70", "");

		Map<String, Map<String, Object>> result = null;
		// result =select(tableName, family, qualifiers, whereEqual, whereLike,
		// null, null);
		// dropView(tableName);
		List<String> phoenixSQLs = new ArrayList<>();
		// phoenixSQLs.add("DROP TABLE IF EXISTS \"" + tableName + "\"");
		String string = "create TABLE IF NOT EXISTS \"" + tableName + "\" (id varchar  primary key, ";
		if ((tableName != null) && (family != null) && (qualifiers != null) && (!qualifiers.isEmpty())) {
			for (String qualifier : qualifiers) {
				string += "\"" + family + "\"." + "\"HH" + qualifier + "\"" + "varchar, ";
			}
			for (String qualifier : qualifiers) {
				string += "\"" + "HHH" + "\"." + "\"" + qualifier + "\"" + "varchar, ";
			}
			string += "\"" + "HHH" + "\"." + "\"HHE\"" + "varchar, ";
			string += "\"rr\".\"rer\" varchar, ";
		}
		String phoenixSQL = string.substring(0, string.lastIndexOf(",")) + ")";

		phoenixSQLs.add(phoenixSQL);
		// phoenixSQLs.add("ALTER VIEW \"" + tableName + "\" ADD IF NOT EXISTS "
		// + "\"" + family + "\"." + "\"XE\"" + " varchar");
		PhoenixClient.executeUpdate(phoenixSQLs);
		// String phoenixSQL;
		// phoenixSQL="SELECT * FROM "+tableName+" where (id='1_62_1' or
		// id='1_62_2') and \"90\"='eqe'";
		phoenixSQL = "SELECT * FROM XXQQ X";
		// phoenixSQL="SELECT B.\"ID\",B.\"1\",A.\"ID\",A.\"1\" FROM B LEFT
		// OUTER JOIN A ON B.\"1\"=A.\"1\"";
		phoenixSQL = "SELECT ID,\"89\",\"90\",\"91\",\"92\",\"93\",\"94\" FROM		 \"SOURCE_62\""
				+ " WHERE \"SOURCE_62\".\"USER\"='45' OR		 \"SOURCE_62\".\"CREATE\"='45' ";
		phoenixSQL = "SELECT *"
				+ " FROM \"FORMAT_62_45\" WHERE SOURCEDATAID='1_62_1' AND		 \"FORMAT_62_45\".\"ID\"!='17' ";
		// phoenixSQL = " ";
		// phoenixSQL = "SELECT COUNT(*)FROM \"SOURCE_62\" WHERE
		// \"93\"='value93' ORDER BY ID DESC ";
		result = selectPage(phoenixSQL, null, null);
		// result = executeQuery("SELECT COUNT(1) FROM \"SOURCE_62\" ");
		// String resultMsg = String.valueOf((result.get("msg")).get("msg"));
		// for (int j = 0; j < 2; j++) {
		// resultMsg = String.valueOf((result.get("msg")).get("msg"));
		// if (resultMsg.equals("success")) {
		// break;
		// } else {
		// result = PhoenixClient.reSelect("Table undefined", tableName, family,
		// qualifiers, whereEqual,
		// whereLike, page, strip);
		// }
		// }
		System.out.println("\n" + new Gson().toJson(result).toString() + "\n");
		// System.out.println(new Gson().toJson(selectPage(" SELECT * FROM
		// source_60", currPage, pageSize)).toString());

		// System.out.println(new Gson().toJson(select(tableName, family,
		// qualifiers, 10, 2)).toString());
		//
		// dropView("FORMAT_1_2");
		// viewTEST();
		// System.out.println(new
		// Gson().toJson(PhoenixClient.executeQuery("SELECT * FROM FORMAT_1_2
		// ")).toString());

		// select("select * from SOURCE_1");
		// select("select idcardnum,sex,\"1\" from TEST.PERSON");
		// // while (true) {
		// String phoenixSQL1 = "CREATE VIEW \"" +
		// ConstantsHBase.TABLE_PREFIX_SOURCE_ + "1" + "\""
		// + " AS SELECT * FROM \"" + ConstantsHBase.TABLE_PREFIX_SOURCE_ + "1"
		// + "\"";
		// // phoenixSQL1 = "drop TABLE if exists \"" +
		// // ConstantsHBase.TABLE_PREFIX_SOURCE_ + 2 + "\"";

		// }
	}

}
