package com.xtkong.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.Map.Entry;

import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Row;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.filter.BinaryComparator;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.FilterList;
import org.apache.hadoop.hbase.filter.PageFilter;
import org.apache.hadoop.hbase.filter.PrefixFilter;
import org.apache.hadoop.hbase.filter.SingleColumnValueFilter;
import org.apache.hadoop.hbase.filter.CompareFilter.CompareOp;
import org.apache.hadoop.hbase.filter.FilterList.Operator;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.poi.hssf.record.cf.DataBarFormatting;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.xtkong.dao.hbase.HBaseFormatDataDao;
import com.xtkong.dao.hbase.HBaseFormatNodeDao;
import com.xtkong.dao.hbase.HBaseSourceDataDao;
import com.xtkong.model.FormatField;
import com.xtkong.model.Source;
import com.xtkong.model.SourceField;
import com.xtkong.service.FormatFieldService;
import com.xtkong.service.FormatTypeService;
import com.xtkong.service.PhoenixClient;
import com.xtkong.service.SourceFieldService;
import com.xtkong.service.SourceService;
import com.xtkong.util.ConstantsHBase;
import com.xtkong.util.HBaseDB;

@SuppressWarnings("unused")
@Controller
@RequestMapping(value = "/admin")
public class HbaseTest {
	// Connection connection = null;
	@Autowired
	SourceService sourceService;
	@Autowired
	SourceFieldService sourceFieldService;
	@Autowired
	FormatTypeService formatTypeService;
	@Autowired
	FormatFieldService formatFieldService;
	private static PrintWriter pWriter;
	
	
	static{
		try {
			pWriter = new PrintWriter("E:/Users/admin/Desktop/CC/新建文件夹/记录.txt");
			try {
				pWriter = new PrintWriter(ConstantsHBase.class.getClass()+"/记录1.txt");
			} catch (Exception e) {
				try {
					pWriter = new PrintWriter(ConstantsHBase.class.getClassLoader()+"/记录2.txt");
				} catch (Exception e1) {
					pWriter = new PrintWriter(ConstantsHBase.class+"/记录3.txt");
				}
			}
		} catch (FileNotFoundException e) {
			pWriter = new PrintWriter("C:/记录.txt");
		}
	}
	public static void toJson(Object object) {
		pWriter.println(object);
		pWriter.println(new Gson().toJson(object).toString());
		pWriter.println();
		pWriter.flush();
	}
	public static void println(Object object) {
		pWriter.println();
		pWriter.println(object);
		pWriter.flush();
	}
	
	@Before
	public void init() {
		System.out.println("start");
		/*
		 * Configuration configuration = HBaseConfiguration.create(); //
		 * zookeeper的主机地址，虚拟机主机名
		 * configuration.set(ConstantsHBase.HBASE_ZOOKEEPER,
		 * ConstantsHBase.HBASE_ZOOKEEPER_HOST); //
		 * hbase存储数据的位置，hbase-site.xml中配置
		 * configuration.set(ConstantsHBase.HBASE_DIR,
		 * ConstantsHBase.HBASE_ROOT_DIR); try { connection =
		 * ConnectionFactory.createConnection(configuration); } catch
		 * (IOException e) { e.printStackTrace(); }
		 */
	}

	@Test
	public void PhoenixClientcreateView() {

		int cs_id = 48;
		List<String> sourceQualifiers = new ArrayList<>();
		sourceQualifiers.add(ConstantsHBase.QUALIFIER_USER);
		sourceQualifiers.add(ConstantsHBase.QUALIFIER_PROJECT);
		sourceQualifiers.add(ConstantsHBase.QUALIFIER_CREATE);
		PhoenixClient.createView(ConstantsHBase.TABLE_PREFIX_SOURCE_ + cs_id,
				sourceQualifiers);

		List<String> nodeQualifiers = new ArrayList<>();
		nodeQualifiers.add(ConstantsHBase.QUALIFIER_FORMATTYPE);
		nodeQualifiers.add(ConstantsHBase.QUALIFIER_NODENAME);
		nodeQualifiers.add(ConstantsHBase.QUALIFIER_SOURCEDATAID);
		PhoenixClient.createView(ConstantsHBase.TABLE_PREFIX_NODE_ + cs_id, nodeQualifiers);

	}

	@Test

	public void PhoenixClientalterViewAdds() {

		int cs_id = 62;
		// List<String> sourceQualifiers = new ArrayList<>();
		// sourceQualifiers.add("67");
		// sourceQualifiers.add("68");
		// // sourceQualifiers.add("69");
		// // sourceQualifiers.add("70");
		// //
		// // for (SourceField sourceField :
		// // sourceFieldService.getSourceFields(cs_id)) {
		// // sourceQualifiers.add(String.valueOf(sourceField.getCsf_id()));
		// // System.out.println(String.valueOf(sourceField.getCsf_id()));
		// // }
		// sourceQualifiers.add(ConstantsHBase.QUALIFIER_PUBLIC);
		// PhoenixClient.alterViewAddColumns(ConstantsHBase.TABLE_PREFIX_SOURCE_
		// + cs_id, ConstantsHBase.FAMILY_INFO,
		// sourceQualifiers);
		Integer ft_id = 45;
		//
		List<String> formatFieldQualifiers = new ArrayList<>();
		// for (int i = 73; i < 78; i++) {
		// formatFieldQualifiers.add(""+i);
		// }
		for (FormatField formatField : formatFieldService.getFormatFieldsForAdmin(ft_id)) {
			formatFieldQualifiers.add(String.valueOf(formatField.getFf_id()));
			System.out.println(String.valueOf(formatField.getFf_id()));
		}
		PhoenixClient.alterViewAddColumns(ConstantsHBase.TABLE_PREFIX_FORMAT_ + cs_id + "_" + ft_id,
				 formatFieldQualifiers);
	}

	public static void main(String[] args) {
		new HbaseTest().PhoenixClientalterViewAdds();
	}

	@Test
	public void test() {
		String a=null;
		if (a == null) {
			a=" ";
		}
		System.out.println("a"+a.isEmpty());
		System.out.println("a"+a.trim().isEmpty());
		
		
		String b="dsadad";
		
		
//		
//		HBaseDB db=new HBaseDB();
//		String tableName =ConstantsHBase.TABLE_PREFIX_SOURCE_+ "71";
//		String family = ConstantsHBase.FAMILY_INFO;
//		List<String> qualifiers = new ArrayList<>();
//		// qualifiers.add(ConstantsHBase.QUALIFIER_PROJECT);
//		qualifiers.add("E");
//		qualifiers.add("D");
//		qualifiers.add("F");
////		db.deleteTable(tableName);
//		db.createTable(tableName, new String[]{family}, 1);
		
	/*	int i = 0;
		String s = "ERROR 1012 (42M03): Table undefined. tableName\u003dSOURCE_4845   AND   ";
		System.out.println(i++ + "" + (s.contentEquals("Table undefined")));//false
		System.out.println(i++ + "" + (s.contains("Table undefined")));//true
		System.out.println(i++ + "" + (s.startsWith("ERROR 1012 (42M03): Table undefined.")));//true
		System.out.println(i++ + "" + (s.trim())+"PP");
		System.out.println(i++ + "" + (s.trim().endsWith("AND")));
		// HBaseFormatDataDao.deleteFormatDataTable("1", "2");
		int cs_id = 48;
		String tableStr = "FORMAT_62_45";
		String rowkeyStr = "10437";
		String familyStr = ConstantsHBase.FAMILY_INFO;
		String columnStr1 = ConstantsHBase.QUALIFIER_USER;
		String columnStr2 = ConstantsHBase.QUALIFIER_PROJECT;
		String valueStr1 = "1";
		String valueStr2 = "77";
		List<Put> puts = new ArrayList<>();
		for (i = 73; i < 78; i++) {
			Put put3 = new Put(Bytes.toBytes(String.valueOf("30_48_" + i)));
			put3.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes(""+i), Bytes.toBytes(""));
			puts.add(put3);
		}*/
		//// for (int i = 1; i < 17; i++) {
		//// Put put3 = new Put(Bytes.toBytes(String.valueOf("30_48_"+i)));
		//// put3.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr1),
		// Bytes.toBytes(String.valueOf("1")));
		//// put3.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr2),
		// Bytes.toBytes(String.valueOf("90")));
		//// puts.add(put3);
		//// }
		// for (int i = 2; i < 3; i++) {
		// Put put3 = new Put(Bytes.toBytes(String.valueOf("35_48_"+i)));
		// put3.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr1),
		// Bytes.toBytes(String.valueOf("1")));
		// put3.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr2),
		// Bytes.toBytes(String.valueOf("92")));
		// puts.add(put3);
		// }
		// testPutList(puts,tableStr);
		//
		// String tableName = ConstantsHBase.TABLE_PREFIX_SOURCE_ + 1;
		//
		// Scan scan = new Scan();
		// // 列簇约束结果集
		// scan.addFamily(Bytes.toBytes(ConstantsHBase.FAMILY_INFO));
		// // 前缀uid+"_"+source+"_"过滤
		// Filter filter1 = new PrefixFilter(Bytes.toBytes("1_1_1"));
		// Filter filter2 = new PageFilter(10);
		// FilterList filterList = new FilterList(Operator.MUST_PASS_ALL,
		// filter1, filter2);
		// scan.setFilter(filterList);
		// JsonObject data = new JsonObject();
		// data.addProperty("tableName", tableName);
		// data.addProperty("scan",scan.toString());
		// List<String> quelifiers=new ArrayList<>();
		// quelifiers.add("sss");
		// quelifiers.add("333");
		// data.addProperty("quelifiers", quelifiers.toString());
		// System.out.println(data);
		// Gson gson=new Gson();
		// gson.totoJson(scan);
		// Integer cs_id=3;
		// HBaseSourceDataDao.createSourceDataTable(String.valueOf(cs_id));
		// HBaseFormatNodeDao.createFormatNodeTable(String.valueOf(cs_id));
		// HBaseFormatDataDao.createFormatDataTable(String.valueOf(cs_id),
		// String.valueOf(2));
		// HBaseFormatDataDao.createFormatDataTable(String.valueOf(cs_id),
		// String.valueOf(32));
	}

	// 添加/修改数据
	@Test
	public void testPut() {
		int cs_id = 48;
		String tableStr = "SOURCE_70";
		String rowkeyStr = "17";
		String familyStr = ConstantsHBase.FAMILY_INFO;
		String columnStr1 = "1";
		String columnStr2 = "1";
		String valueStr1 = "张2313三";
		String valueStr2 = "4131张SD";
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(tableStr);
			List<Put> puts=new ArrayList<>();
			for (int i = 1; i < 4; i++) {
				Put put = new Put(Bytes.toBytes("45_62_"+i));
				for (int j = 89; j < 92; j++) {
					put.addColumn(Bytes.toBytes(familyStr),Bytes.toBytes(""+j), Bytes.toBytes(i+"value"+j));
					
				}
//				put.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes("USER"),Bytes.toBytes("1_62_1"));
				put.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes("PROJECT"),Bytes.toBytes("94"));
				puts.add(put);
			}
			Put put = new Put(Bytes.toBytes(1_62_2));
			for (int j = 89; j < 95; j++) {
				put.addColumn(Bytes.toBytes(familyStr),Bytes.toBytes(""+j), Bytes.toBytes("value"+j));
				
			}
			put.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes("USER"),Bytes.toBytes("1"));
			put.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes("PROJECT"),Bytes.toBytes("114"));
			puts.add(put);
			table.put(puts);
			table.close();
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	// 扫描
	@SuppressWarnings("deprecation")
	@Test
	public void testScan() {
		String tableStr = "SOURCE_72";
		String rowkeyStr1 = "IRNA0003338";
		String rowkeyStr2 = "IRNA0003339";
		String familyStr = ConstantsHBase.FAMILY_INFO;
		String columnStr1 = "67";
		String columnStr2 = "68";
		List<String> qualifiers = new ArrayList<>();
		qualifiers.add("67");
		qualifiers.add("68");
		qualifiers.add("69");
		qualifiers.add("70");
		int cachingStr = 10;// 一次扫描请求返回数据量
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(tableStr);

			// 没有指定起始行，则从表的起始位置开始获取
			Scan scan = new Scan();
			// 设置扫描起始位置，包含
			// scan.setStartRow(Bytes.toBytes(rowkeyStr1));
			// 设置扫描终止位置，不包含
			// scan.setStopRow(Bytes.toBytes(rowkeyStr2));
			scan.setReversed(true);// 反转扫描顺序
			// scan.setMaxResultSize(1);
			// scan.setCaching(cachingStr);// 一次扫描请求返回数据量
			scan.addFamily(Bytes.toBytes(ConstantsHBase.FAMILY_INFO));
			Map<String, String> sourceFieldDatas = new HashMap<>();
			sourceFieldDatas.put(ConstantsHBase.QUALIFIER_SOURCEDATAID, "1_72_13");
			sourceFieldDatas.put(ConstantsHBase.QUALIFIER_PROJECT, "118");

//			FilterList filterList = new FilterList(Operator.MUST_PASS_ALL);
//			for (Entry<String, String> sourceFieldData : sourceFieldDatas.entrySet()) {
//				filterList.addFilter(new SingleColumnValueFilter(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
//						Bytes.toBytes(sourceFieldData.getKey()), CompareOp.EQUAL,
//						new BinaryComparator(Bytes.toBytes(sourceFieldData.getValue()))));
//			}
			Filter filter=new SingleColumnValueFilter(Bytes.toBytes(ConstantsHBase.FAMILY_INFO),
					Bytes.toBytes(ConstantsHBase.QUALIFIER_SOURCEDATAID), CompareOp.EQUAL,
					new BinaryComparator(Bytes.toBytes("1_72_13")));
			FilterList filterList = new FilterList(Operator.MUST_PASS_ALL,filter);
//			filterList.addFilter(filter);
			scan.setFilter(filterList);

			ResultScanner resultScanner = table.getScanner(scan);
			// Result[] results = resultScanner.next(10);// 返回10行数据
			Iterator<Result> iterator = resultScanner.iterator();
			int count = 1;
			// for (Result result : results) {
			while (iterator.hasNext()) {
				// 每次next都进行一次单独的RPC请求
				// System.out.println(iterator.next());
				Result result = iterator.next();
				String rowKey = Bytes.toString(result.getRow());
				List<Cell> cells = result.listCells();
				System.out.print(count++ + "  rowKey：" + rowKey);
				for (Cell cell : cells) {
					System.out
							.print("  ," + Bytes.toString(cell.getQualifier()) + ":" + Bytes.toString(cell.getValue()));
				}
				System.out.println();
				// for (Cell cell : cells) {
				// System.out.print(" ," +
				// Bytes.toStringBinary(cell.getQualifier()) + ":"
				// + Bytes.toStringBinary(cell.getValue()));
				// }
				// System.out.println();
				// for (Cell cell : cells) {
				// System.out.print(" ," + Bytes.toHex(cell.getQualifier()) +
				// ":" + Bytes.toHex(cell.getValue()));
				// }
				// System.out.println();
				// for (Cell cell : cells) {
				// System.out.print(" ," + cell.getQualifier() + ":"
				// + cell.getValue());
				// }
				// System.out.println();
				// byte[] name = result.getValue(Bytes.toBytes(familyStr),
				// Bytes.toBytes(columnStr1));
				// byte[] age = result.getValue(Bytes.toBytes(familyStr),
				// Bytes.toBytes(columnStr2));
				// System.out.println(
				// count++ + " rowKey：" + rowKey + ",name：" + ((name == null) ?
				// null : Bytes.toString(name))
				// + ",email：" + ((age == null) ? null : Bytes.toString(age)));
			}
			resultScanner.close();
			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
	}

	public void testInitTable() {

		Scanner scanner = null;
		try {
			scanner = new Scanner(new FileInputStream("E://Users//admin//Desktop//CC//万康源提供的示例数据//donor_example.txt"));
			String[] heads = null;
			String[] datas = null;
			HBaseDB db = HBaseDB.getInstance();
			int row = 1;
			List<Put> puts = new ArrayList<>();
			while (scanner.hasNextLine()) {
				if (heads == null) {
					heads = scanner.nextLine().split("\t");
					db.createTable("USER", new String[] { ConstantsHBase.FAMILY_INFO }, 1);
				} else {
					datas = scanner.nextLine().split("\t");
					for (int i = 0; i < heads.length; i++) {
						try {
							// System.out.println(json[i]+":"+dataStr[i]);
							// db.put("USER", values[0],
							// ConstantsHBase.FAMILY_USER_INFO, names[i],
							// values[i]);
							Put put = new Put(Bytes.toBytes(datas[0]));// "row-key-00001".getBytes()
							put.addColumn(Bytes.toBytes(ConstantsHBase.FAMILY_INFO), Bytes.toBytes(heads[i]),
									Bytes.toBytes(datas[i]));
							puts.add(put);
						} catch (Exception e) {
							continue;
						}
					}
				}
				System.out.println("===========" + row++);
			}
			testPutList(puts, "");
		} catch (FileNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally {
			scanner.close();
		}

	}

	// 混合批量操作

	public void testBatch() {
		String tableStr = "USER";
		String rowkeyStr1 = "IRNA0003338";
		String familyStr = ConstantsHBase.FAMILY_INFO;
		String columnStr1 = "DONOR_NAME";
		String valueStr1 = "张三";
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(tableStr);
			// Put，Get，Delete实现了Row接口
			List<Row> actions = new ArrayList<Row>();
			actions.add(new Put(Bytes.toBytes("row-key-0004")).addColumn(Bytes.toBytes("info"), Bytes.toBytes("age"),
					Bytes.toBytes(36)));
			actions.add(new Put(Bytes.toBytes("row-key-01")).addColumn(Bytes.toBytes("info"), Bytes.toBytes("name"),
					Bytes.toBytes("lisi")));
			actions.add(new Get(Bytes.toBytes("row-key-0003")));
			actions.add(
					new Delete(Bytes.toBytes("row-key-0003")).addColumn(Bytes.toBytes("info"), Bytes.toBytes("age")));
			actions.add(new Get(Bytes.toBytes("row-key-01")));
			// 存放批量操作的结果
			Object[] results = new Object[actions.size()];
			table.batch(actions, results);
			for (Object result : results) {
				System.out.println(result);
			}
			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 判断删除

	public void testCheckAndDelete() {
		String tableStr = "USER";
		String rowkeyStr1 = "IRNA0003338";
		String familyStr = ConstantsHBase.FAMILY_INFO;
		String columnStr1 = "DONOR_NAME";
		String valueStr1 = "张三";
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(tableStr);
			Delete delete = new Delete(Bytes.toBytes(rowkeyStr1));
			delete.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr1));

			table.checkAndDelete(Bytes.toBytes(rowkeyStr1), Bytes.toBytes(familyStr), Bytes.toBytes(columnStr1),
					Bytes.toBytes(valueStr1), delete);

			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 删除List

	public void testDeleteList() {
		String tableStr = "USER";
		String rowkeyStr1 = "IRNA0003338";
		String rowkeyStr2 = "IRNA0003339";
		String familyStr = ConstantsHBase.FAMILY_INFO;
		String columnStr1 = "DONOR_NAME";
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(tableStr);
			Delete delete = new Delete(Bytes.toBytes(rowkeyStr1));
			delete.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr1));
			Delete delete2 = new Delete(Bytes.toBytes(rowkeyStr2));
			delete2.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr1));

			List<Delete> deletes = new ArrayList<Delete>();
			deletes.add(delete);
			deletes.add(delete2);
			table.delete(deletes);

			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 删除单条

	public void testDelete() {

		String tableStr = "USER";
		String rowkeyStr = "IRNA0003338";
		String familyStr = ConstantsHBase.FAMILY_INFO;
		String columnStr1 = "DONOR_NAME";
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(tableStr);
			Delete delete = new Delete(Bytes.toBytes(rowkeyStr));
			delete.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr1));

			table.delete(delete);

			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 获取List

	public void testGetList() {
		String tableStr = "USER";
		String rowkeyStr1 = "IRNA0003338";
		String rowkeyStr2 = "IRNA0003339";
		String familyStr = ConstantsHBase.FAMILY_INFO;
		String columnStr1 = "DONOR_NAME";
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(tableStr);
			Get get1 = new Get(Bytes.toBytes(rowkeyStr1));
			Get get2 = new Get(Bytes.toBytes(rowkeyStr2));
			// get.addColumn(Bytes.toBytes(familyStr),
			// Bytes.toBytes(columnStr1));
			List<Get> gets = new ArrayList<Get>();
			gets.add(get1);
			gets.add(get2);
			Result[] results = table.get(gets);
			for (Result result : results) {
				byte[] bytes = result.getValue(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr1));
				System.out.println(new String(bytes));
			}

			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 获取单条记录

	public void testGet() {
		String tableStr = "USER";
		String rowkeyStr = "IRNA0003338";
		String familyStr = ConstantsHBase.FAMILY_INFO;
		String columnStr1 = "DONOR_NAME";
		String columnStr2 = "AGE";
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(tableStr);
			// 某行数据
			Get get = new Get(Bytes.toBytes(rowkeyStr));
			// //获取版本的数量
			// get.setMaxVersions(5);
			// 某列簇数据
			// get.addFamily(Bytes.toBytes(familyStr));
			// 某列数据
			get.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr1));
			get.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr2));
			Result result = table.get(get);
			if (!result.isEmpty()) {
				System.out.println(result);
				// 获取行键
				String rowKey = Bytes.toString(result.getRow());
				byte[] name = result.getValue(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr1));
				byte[] age = result.getValue(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr2));
				System.out.println("rowKey：" + rowKey + ",name：" + ((name == null) ? null : Bytes.toString(name))
						+ ",age：" + ((age == null) ? null : Bytes.toInt(age)));
			}

			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 修改数据

	public void testCheckAndPut() {
		String tableStr = "USER";
		String rowkeyStr = "IRNA0003338";
		String familyStr = ConstantsHBase.FAMILY_INFO;
		String columnStr1 = "DONOR_NAME";
		String columnStr2 = "AGE";
		String valueStr1 = "张三";
		String valueStr2 = "23";
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(tableStr);
			// 设置行键
			Put put = new Put(Bytes.toBytes(rowkeyStr));
			put.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr1), Bytes.toBytes(valueStr1));
			// 检测现有数据符合则put，即修改，保证原子性，既检查又写,false未更新true更新
			boolean result = table.checkAndPut(Bytes.toBytes(rowkeyStr), Bytes.toBytes(familyStr),
					Bytes.toBytes(columnStr2), Bytes.toBytes(valueStr2), put);
			System.out.println(result);
			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 批量添加/修改数据

	public void testPutList(List<Put> puts, String tableStr) {
		try {
			HBaseDB db = HBaseDB.getInstance();
			Table table = db.getTable(tableStr);
			table.put(puts);
			table.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@After
	public void end() {
		System.out.println("end");
	}

}
