package com.xtkong.test;

import java.io.IOException;
import java.util.Iterator;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.filter.BinaryComparator;
import org.apache.hadoop.hbase.filter.CompareFilter.CompareOp;
import org.apache.hadoop.hbase.filter.FilterList.Operator;
import org.apache.hadoop.hbase.filter.FamilyFilter;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.FilterList;
import org.apache.hadoop.hbase.filter.PageFilter;
import org.apache.hadoop.hbase.filter.PrefixFilter;
import org.apache.hadoop.hbase.filter.QualifierFilter;
import org.apache.hadoop.hbase.filter.RegexStringComparator;
import org.apache.hadoop.hbase.filter.RowFilter;
import org.apache.hadoop.hbase.filter.SingleColumnValueFilter;
import org.apache.hadoop.hbase.filter.ValueFilter;
import org.apache.hadoop.hbase.util.Bytes;

import com.xtkong.util.ConstantsHBase;
import com.xtkong.util.HBaseDB;

public class HbaseTestFilter {
	Connection connection = null;

	
	public void init() {
		System.out.println("start");
		
	}

	/**
	 * 指定过滤器的与/或关系，默认与关系 MUST_PASS_ALL：当所有过滤器都允许包含这个值时，这个值才会被包含在结果中，默认值
	 * MUST_PASS_ONE：只要有一个过滤器允许包括这个值时，那这个值就会包含在结果中
	 */
	
	public void testFilterList() {
		try {
			Table table = connection.getTable(TableName.valueOf("users"));
			// 没有指定起始行，则从表的起始位置开始获取
			Scan scan = new Scan();
//			Filter filter1 = new FamilyFilter(CompareOp.EQUAL, new BinaryComparator(Bytes.toBytes("info")));
//			Filter filter2 = new ValueFilter(CompareOp.EQUAL, new BinaryComparator(Bytes.toBytes("name1")));
//			// 行键正则表达式，EQUAL，NOT_EQUAL，[0-5]{4}前四位由[0-5]中的数字组成,[0-5]{4}$四位由[0-5]中的数字组成
			Filter filter1 = new RowFilter(CompareOp.EQUAL, new RegexStringComparator("row-key-[0-5]{4}$"));
//			// 单值过滤,获取行数据rowKey：row-key-0001,name：name1,age：21
			Filter filter2 = new SingleColumnValueFilter(Bytes.toBytes("info"), Bytes.toBytes("name"),
					CompareOp.EQUAL, new RegexStringComparator("name"));
			Filter filter3 = new SingleColumnValueFilter(Bytes.toBytes("info"), Bytes.toBytes("name"),
					CompareOp.EQUAL, new RegexStringComparator("n"));
			//先或
			FilterList filterList = new FilterList(Operator.MUST_PASS_ONE,filter2, filter3);
			//后与
			FilterList filterList1 = new FilterList(Operator.MUST_PASS_ALL,filter1, filterList);
			scan.setFilter(filterList1);
			byte[] startRow = null;
			byte[] POSTFIX = new byte[] { 0x00 };

			while (true) {
				if (startRow != null) {
					// 非第一页
					startRow = Bytes.add(startRow, POSTFIX);
					scan.setStartRow(startRow);
				}

				ResultScanner resultScanner = table.getScanner(scan);
				Iterator<Result> iterator = resultScanner.iterator();
				if (!iterator.hasNext()) {
					break;
				}
				while (iterator.hasNext()) {
					// 每次next都进行一次单独的RPC请求
					// System.out.println(iterator.next());
					Result result = iterator.next();
					String rowKey = Bytes.toString(result.getRow());
					byte[] name = result.getValue(Bytes.toBytes("info"), Bytes.toBytes("name"));
					byte[] age = result.getValue(Bytes.toBytes("info"), Bytes.toBytes("age"));
					System.out.println("rowKey：" + rowKey + ",name：" + ((name == null) ? null : Bytes.toString(name))
							+ ",age：" + ((age == null) ? null : Bytes.toInt(age)));
					// 记录上一页的最后一条数据的行键值
					startRow = result.getRow();
				}
				resultScanner.close();
			}
			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**分页过滤 ：对结果按行分页，创建该过滤器时需要指定pageSize参数，客户端会记录本次扫描的最后一行，并在下次获取数据时把上次扫描的最后一行做为此次的起始行，同时保留相同的过滤属性，然后依次进行迭代*/
	
	public void testPageFilter() {
		try {
			Table table = connection.getTable(TableName.valueOf("users"));
			// 没有指定起始行，则从表的起始位置开始获取
			Scan scan = new Scan();
			// 4行一页
			Filter filter = new PageFilter(4);
			scan.setFilter(filter);
			byte[] startRow = null;
			byte[] POSTFIX = new byte[] { 0x00 };
			while (true) {
				if (startRow != null) {// 非第一页
					startRow = Bytes.add(startRow, POSTFIX);
					scan.setStartRow(startRow);
				}
				ResultScanner resultScanner = table.getScanner(scan);
				Iterator<Result> iterator = resultScanner.iterator();
				if (!iterator.hasNext()) {
					break;
				}
				while (iterator.hasNext()) {
					// 每次next都进行一次单独的RPC请求
					// System.out.println(iterator.next());
					Result result = iterator.next();
					String rowKey = Bytes.toString(result.getRow());
					byte[] name = result.getValue(Bytes.toBytes("info"), Bytes.toBytes("name"));
					byte[] age = result.getValue(Bytes.toBytes("info"), Bytes.toBytes("age"));
					System.out.println("rowKey：" + rowKey + ",name：" + ((name == null) ? null : Bytes.toString(name))
							+ ",age：" + ((age == null) ? null : Bytes.toInt(age)));
					// 记录上一页的最后一条数据的行键值
					startRow = result.getRow();
				}
				resultScanner.close();
				System.out.println("------------------------------------");
			}
			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/** 前缀过滤：所有行键值与前缀匹配的行都会被返回到客户端 */
	
	public void testPrefixFilter() {
		try {
			Table table = connection.getTable(TableName.valueOf("users"));
			// 没有指定起始行，则从表的起始位置开始获取
			Scan scan = new Scan();
			Filter filter = new PrefixFilter(Bytes.toBytes("row-key-00"));
			scan.setFilter(filter);
			ResultScanner resultScanner = table.getScanner(scan);
			Iterator<Result> iterator = resultScanner.iterator();
			while (iterator.hasNext()) {
				// 每次next都进行一次单独的RPC请求
				// System.out.println(iterator.next());
				Result result = iterator.next();
				String rowKey = Bytes.toString(result.getRow());
				byte[] name = result.getValue(Bytes.toBytes("info"), Bytes.toBytes("name"));
				byte[] age = result.getValue(Bytes.toBytes("info"), Bytes.toBytes("age"));
				System.out.println("rowKey：" + rowKey + ",name：" + ((name == null) ? null : Bytes.toString(name))
						+ ",age：" + ((age == null) ? null : Bytes.toInt(age)));
			}
			resultScanner.close();
			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/** 单值过滤:用一列的值决定一行数据是否被过滤 */
	
	public void testSingleColumnValueFilter() {
		try {
			Table table = connection.getTable(TableName.valueOf("users"));
			// 没有指定起始行，则从表的起始位置开始获取
			Scan scan = new Scan();
			// 单值过滤,获取行数据rowKey：row-key-0001,name：name1,age：21
			Filter filter = new SingleColumnValueFilter(Bytes.toBytes("info"), Bytes.toBytes("name"), CompareOp.EQUAL,
					new BinaryComparator(Bytes.toBytes("name1")));
			// Filter filter=new
			// SingleColumnValueFilter(Bytes.toBytes("info"),Bytes.toBytes("name"),CompareOp.EQUAL
			// ,new RegexStringComparator("name[0-5]"));
			scan.setFilter(filter);
			ResultScanner resultScanner = table.getScanner(scan);
			Iterator<Result> iterator = resultScanner.iterator();
			while (iterator.hasNext()) {
				// 每次next都进行一次单独的RPC请求
				// System.out.println(iterator.next());
				Result result = iterator.next();
				String rowKey = Bytes.toString(result.getRow());
				byte[] name = result.getValue(Bytes.toBytes("info"), Bytes.toBytes("name"));
				byte[] age = result.getValue(Bytes.toBytes("info"), Bytes.toBytes("age"));
				System.out.println("rowKey：" + rowKey + ",name：" + ((name == null) ? null : Bytes.toString(name))
						+ ",age：" + ((age == null) ? null : Bytes.toInt(age)));
			}
			resultScanner.close();
			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/** 值过滤:基于某个特定值筛选单元格 */
	
	public void testValueFilter() {
		try {
			Table table = connection.getTable(TableName.valueOf("users"));
			// 没有指定起始行，则从表的起始位置开始获取
			Scan scan = new Scan();
			// 值过滤，获取单元格数据rowKey：row-key-00002,name：name1,age：null
//			Filter filter = new ValueFilter(CompareOp.EQUAL, new BinaryComparator(Bytes.toBytes("name1")));
			Filter filter = new ValueFilter(CompareOp.EQUAL, new RegexStringComparator("name[0-5]"));
			scan.setFilter(filter);
			ResultScanner resultScanner = table.getScanner(scan);
			Iterator<Result> iterator = resultScanner.iterator();
			while (iterator.hasNext()) {
				// 每次next都进行一次单独的RPC请求
				// System.out.println(iterator.next());
				Result result = iterator.next();
				String rowKey = Bytes.toString(result.getRow());
				byte[] name = result.getValue(Bytes.toBytes("info"), Bytes.toBytes("name"));
				byte[] age = result.getValue(Bytes.toBytes("info"), Bytes.toBytes("age"));
				System.out.println("rowKey：" + rowKey + ",name：" + ((name == null) ? null : Bytes.toString(name))
						+ ",age：" + ((age == null) ? null : Bytes.toInt(age)));
			}
			resultScanner.close();
			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/** 列过滤:基于特定的列名过滤数据 */
	
	public void testQualifierFilter() {
		try {
			Table table = connection.getTable(TableName.valueOf("users"));
			// 没有指定起始行，则从表的起始位置开始获取
			Scan scan = new Scan();
			Filter filter = new QualifierFilter(CompareOp.EQUAL, new BinaryComparator(Bytes.toBytes("name")));
			scan.setFilter(filter);
			ResultScanner resultScanner = table.getScanner(scan);
			Iterator<Result> iterator = resultScanner.iterator();
			while (iterator.hasNext()) {
				// 每次next都进行一次单独的RPC请求
				// System.out.println(iterator.next());
				Result result = iterator.next();
				String rowKey = Bytes.toString(result.getRow());
				byte[] name = result.getValue(Bytes.toBytes("info"), Bytes.toBytes("name"));
				byte[] age = result.getValue(Bytes.toBytes("info"), Bytes.toBytes("age"));
				System.out.println("rowKey：" + rowKey + ",name：" + ((name == null) ? null : Bytes.toString(name))
						+ ",age：" + ((age == null) ? null : Bytes.toInt(age)));
			}
			resultScanner.close();
			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/** 列簇过滤 :基于特定的列簇名过滤数据*/
	
	public void testFamilyFilter() {
		try {
			Table table = connection.getTable(TableName.valueOf("users"));
			// 没有指定起始行，则从表的起始位置开始获取
			Scan scan = new Scan();
			Filter filter = new FamilyFilter(CompareOp.EQUAL, new BinaryComparator(Bytes.toBytes("info")));
			scan.setFilter(filter);
			ResultScanner resultScanner = table.getScanner(scan);
			Iterator<Result> iterator = resultScanner.iterator();
			while (iterator.hasNext()) {
				// 每次next都进行一次单独的RPC请求
				// System.out.println(iterator.next());
				Result result = iterator.next();
				String rowKey = Bytes.toString(result.getRow());
				byte[] name = result.getValue(Bytes.toBytes("info"), Bytes.toBytes("name"));
				byte[] age = result.getValue(Bytes.toBytes("info"), Bytes.toBytes("age"));
				System.out.println("rowKey：" + rowKey + ",name：" + ((name == null) ? null : Bytes.toString(name))
						+ ",age：" + ((age == null) ? null : Bytes.toInt(age)));
			}
			resultScanner.close();
			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/** 行键值过滤 :基于行键来过滤数据*/
	
	public void testRowFilter() {
		String tableStr="USER";
		String rowkeyStr1="IRNA0003338";
		String rowkeyStr2="IRNA0003339";
		String familyStr=ConstantsHBase.FAMILY_INFO;
		String columnStr1="DONOR_NAME";
		String columnStr2="AGE";
		try {
			HBaseDB db=HBaseDB.getInstance();
			Table table = db.getTable(tableStr);
			// 没有指定起始行，则从表的起始位置开始获取
			Scan scan = new Scan();
			Filter filter = new RowFilter(CompareOp.LESS_OR_EQUAL, new BinaryComparator(Bytes.toBytes(rowkeyStr1)));
			// 行键正则表达式，EQUAL，NOT_EQUAL，[0-5]{4}前四位由[0-5]中的数字组成,[0-5]{4}$四位由[0-5]中的数字组成
			// Filter filter = new RowFilter(CompareOp.EQUAL, new
			// RegexStringComparator("row-key-[0-5]{4}$"));
			scan.setFilter(filter);
			ResultScanner resultScanner = table.getScanner(scan);
			Iterator<Result> iterator = resultScanner.iterator();
			while (iterator.hasNext()) {
				// 每次next都进行一次单独的RPC请求
				// System.out.println(iterator.next());
				Result result = iterator.next();
				String rowKey = Bytes.toString(result.getRow());
				byte[] name = result.getValue(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr1));
				byte[] age = result.getValue(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr2));
				System.out.println("rowKey：" + rowKey + ",name：" + ((name == null) ? null : Bytes.toString(name))
						+ ",age：" + ((age == null) ? null : Bytes.toInt(age)));
			}
			resultScanner.close();
			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public void end() {
			System.out.println("end");
	}

}
