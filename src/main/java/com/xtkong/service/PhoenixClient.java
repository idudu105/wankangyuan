package com.xtkong.service;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import org.apache.phoenix.jdbc.PhoenixResultSet;

import com.google.gson.JsonArray;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
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
	 * @return
	 */
	private static Connection getConnection() {
		Connection cc = null;
		final String url = ConstantsHBase.PhoenixJDBC;//zookeeper的master-host，zookeeper的master-port
		if (cc == null) {
//			try {
//				cc = DriverManager.getConnection(url);
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
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
				cc = future.get(1000 * 5, TimeUnit.MILLISECONDS);
				exec.shutdownNow();
			} catch (InterruptedException e) {
				e.printStackTrace();
			} catch (ExecutionException e) {
				e.printStackTrace();
			} catch (TimeoutException e) {
				e.printStackTrace();
			}
		}
		return cc;
	}

	/**
	 * 根据phoenix支持的SQL格式，查询Hbase的数据，并返回json格式的数据
	 *
	 * @param phoenixSQL
	 *            sql语句
	 * @return json-string
	 * @return
	 */
	public static String execSql(String phoenixSQL) {
		
		String result = "";
		try {
			// 耗时监控：记录一个开始时间
			long startTime = System.currentTimeMillis();

			// 获取一个Phoenix DB连接
			Connection conn = PhoenixClient.getConnection();
			if (conn == null) {
				return "Phoenix DB连接超时！";
			}

			// 准备查询
			Statement stmt = conn.createStatement();
			PhoenixResultSet set = (PhoenixResultSet) stmt.executeQuery(phoenixSQL);

			// 查询出来的列是不固定的，所以这里通过遍历的方式获取列名
			ResultSetMetaData meta = set.getMetaData();
			ArrayList<String> cols = new ArrayList<String>();

			// 把最终数据都转成JSON返回
			JsonArray jsonArr = new JsonArray();
			while (set.next()) {
				if (cols.size() == 0) {
					for (int i = 1, count = meta.getColumnCount(); i <= count; i++) {
						cols.add(meta.getColumnName(i));
					}
				}

				JsonObject json = new JsonObject();
				for (int i = 0, len = cols.size(); i < len; i++) {
					json.addProperty(cols.get(i), set.getString(cols.get(i)));
				}
				jsonArr.add(json);
			}
			// 耗时监控：记录一个结束时间
			long endTime = System.currentTimeMillis();

			// 结果封装
			JsonObject data = new JsonObject();
			data.add("data", jsonArr);
			data.addProperty("cost", (endTime - startTime) + " ms");
			result = data.toString();
		} catch (SQLException e) {
			e.printStackTrace();
			return "SQL执行出错：" + e.getMessage();
		} catch (JsonIOException e) {
			e.printStackTrace();
			return "JSON转换出错：" + e.getMessage();
		}
		return result;
	}

	
	public static void main(String[] args) {
		while (true) {
			String pheonixSQL = "select *  from gid";
			String result = PhoenixClient.execSql( pheonixSQL);
			System.out.println(result);
		}
	}
}
