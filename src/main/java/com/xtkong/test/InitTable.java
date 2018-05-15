/**
 * HBaseeDB工具类测试
  */
package com.xtkong.test;

import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;

import com.xtkong.util.ConstantsHBase;
import com.xtkong.util.HBaseDB;

public class InitTable {
	public static void main(String[] args) {
		System.out.println("++11");
		HBaseDB db = HBaseDB.getInstance();
		System.out.println("++13");
		//db.createTable(ConstantsHBase.TABLE_GID, new String[] { ConstantsHBase.FAMILY_GID_GID }, 1);
		db.getNewId("t", "22", "f", "uid");
		System.out.println("++15");
		String tableStr="t";
		String rowkeyStr="222";
		String familyStr="f";
		String columnStr1="user";
		
		try {
		
			Table table = db.getTable(tableStr);
			// 某行数据
			Get get = new Get(Bytes.toBytes(rowkeyStr));
			// //获取版本的数量
			// get.setMaxVersions(5);
			// 某列簇数据
			// get.addFamily(Bytes.toBytes(familyStr));
			// 某列数据
			get.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr1));
			Result result = table.get(get);
			if (!result.isEmpty()) {
				System.out.println(result);
				// 获取行键
				String rowKey = Bytes.toString(result.getRow());
				byte[] name = result.getValue(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr1));
				System.out.println("rowKey：" + rowKey + ",name：" + ((name == null) ? null : Bytes.toString(name))
						);
			}

			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		db.put("t", "1", "f", "uid", "456");
		System.out.println("++17");
	}

}
