/**
 * HBaseeDB工具类测试
  */
package com.xtkong.test;

import com.xtkong.util.ConstantsHBase;
import com.xtkong.util.HBaseDB;

public class InitTable {
	public static void main(String[] args) {
		HBaseDB db = HBaseDB.getInstance();

		db.createTable(ConstantsHBase.TABLE_GID, new String[] { ConstantsHBase.FAMILY_GID_GID }, 1);

		db.put(ConstantsHBase.TABLE_GID, "1", ConstantsHBase.FAMILY_GID_GID, "uid", "456");
		System.out.println("++++++++++");
	}

}
