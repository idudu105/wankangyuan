package com.xtkong.util;



import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Row;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.xtkong.dao.hbase.HBaseFormatDataDao;
import com.xtkong.dao.hbase.HBaseFormatNodeDao;
import com.xtkong.dao.hbase.HBaseSourceDataDao;
import com.xtkong.util.ConstantsHBase;
import com.xtkong.util.HBaseDB;

public class HbaseTest {
//	Connection connection = null;
	@Before
	public void init() {
		System.out.println("start");
		/*Configuration configuration = HBaseConfiguration.create();
		// zookeeper的主机地址，虚拟机主机名
		configuration.set(ConstantsHBase.HBASE_ZOOKEEPER, ConstantsHBase.HBASE_ZOOKEEPER_HOST);
		// hbase存储数据的位置，hbase-site.xml中配置
		configuration.set(ConstantsHBase.HBASE_DIR, ConstantsHBase.HBASE_ROOT_DIR);
		try {
			connection = ConnectionFactory.createConnection(configuration);
		} catch (IOException e) {
			e.printStackTrace();
		}*/
	}
	
	public void testInitTable() {
		
			Scanner scanner = null;
			try {
				scanner = new Scanner(new FileInputStream("E://Users//admin//Desktop//CC//万康源提供的示例数据//donor_example.txt"));
				String[] heads=null; 
				String[] datas = null;
				HBaseDB db=HBaseDB.getInstance();
				int row=1;
				List<Put> puts = new ArrayList<>();
				while(scanner.hasNextLine()) {
					if (heads==null) {
						heads=scanner.nextLine().split("\t");
						db.createTable("USER",new String[] { ConstantsHBase.FAMILY_INFO }, 1);
					}
					else{
						datas=scanner.nextLine().split("\t");
						for (int i=0;i<heads.length;i++) {
							try {
								//System.out.println(json[i]+":"+dataStr[i]);
							//	db.put("USER", values[0], ConstantsHBase.FAMILY_USER_INFO, names[i], values[i]);
								Put put = new Put(Bytes.toBytes(datas[0]));// "row-key-00001".getBytes()
								put.addColumn(Bytes.toBytes(ConstantsHBase.FAMILY_INFO), Bytes.toBytes(heads[i]), Bytes.toBytes(datas[i]));
								puts.add(put);
							} catch (Exception e) {
								continue;
							}
						}
					}
					System.out.println("==========="+row++);
				}
				testPutList(puts);
			} catch (FileNotFoundException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}finally {
				scanner.close();
			}	
		
	}
	//扫描
	
	@SuppressWarnings("unused")
	public void testScan() {
		String tableStr="USER";
		String rowkeyStr1="IRNA0003338";
		String rowkeyStr2="IRNA0003339";
		String familyStr=ConstantsHBase.FAMILY_INFO;
		String columnStr1="DONOR_NAME";
		String columnStr2="AGE";
		int  cachingStr=10;// 一次扫描请求返回数据量
		try {
			HBaseDB db=HBaseDB.getInstance();
			Table table = db.getTable(tableStr);
			
			// 没有指定起始行，则从表的起始位置开始获取
			Scan scan = new Scan();
			// 设置扫描起始位置，包含
			// scan.setStartRow(Bytes.toBytes(rowkeyStr1));
			// 设置扫描终止位置，不包含
			// scan.setStopRow(Bytes.toBytes(rowkeyStr2));
			scan.setReversed(true);//反转扫描顺序
			scan.setMaxResultSize(1);
			scan.setCaching(cachingStr);// 一次扫描请求返回数据量
			ResultScanner resultScanner = table.getScanner(scan);
//			Result[] results = resultScanner.next(10);// 返回10行数据
			 Iterator<Result> iterator = resultScanner.iterator();
			int count = 1;
//			for (Result result : results) {
				 while (iterator.hasNext()) {
				// 每次next都进行一次单独的RPC请求
				// System.out.println(iterator.next());
				 Result result = iterator.next();
				String rowKey = Bytes.toString(result.getRow());
				byte[] name = result.getValue(Bytes.toBytes(familyStr),
						Bytes.toBytes(columnStr1));
				byte[] age = result.getValue(Bytes.toBytes(familyStr),
						Bytes.toBytes(columnStr2));
				System.out.println(count++ + "   rowKey：" + rowKey +  ",name：" + ((name == null) ? null : Bytes.toString(name)) + ",email："
						+ ((age == null) ? null : Bytes.toString(age)) );
			}
			resultScanner.close();
			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
	}	
	
	
	// 混合批量操作
		
		@SuppressWarnings("unused")
		public void testBatch() {
			String tableStr="USER";
			String rowkeyStr1="IRNA0003338";
			String familyStr=ConstantsHBase.FAMILY_INFO;
			String columnStr1="DONOR_NAME";
			String valueStr1="张三";
			try {
				HBaseDB db=HBaseDB.getInstance();
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
	//判断删除
	
	public void testCheckAndDelete() {
		String tableStr="USER";
		String rowkeyStr1="IRNA0003338";
		String familyStr=ConstantsHBase.FAMILY_INFO;
		String columnStr1="DONOR_NAME";
		String valueStr1="张三";
		try {
			HBaseDB db=HBaseDB.getInstance();
			Table table = db.getTable(tableStr);
			Delete delete = new Delete(Bytes.toBytes(rowkeyStr1));
			delete.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr1));
			
			table.checkAndDelete(Bytes.toBytes(rowkeyStr1), Bytes.toBytes(familyStr), Bytes.toBytes(columnStr1), Bytes.toBytes(valueStr1), delete);
			
			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//删除List
	
	public void testDeleteList() {
		String tableStr="USER";
		String rowkeyStr1="IRNA0003338";
		String rowkeyStr2="IRNA0003339";
		String familyStr=ConstantsHBase.FAMILY_INFO;
		String columnStr1="DONOR_NAME";
		try {
			HBaseDB db=HBaseDB.getInstance();
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

	//删除单条
	
	public void testDelete() {

		String tableStr="USER";
		String rowkeyStr="IRNA0003338";
		String familyStr=ConstantsHBase.FAMILY_INFO;
		String columnStr1="DONOR_NAME";
		try {
			HBaseDB db=HBaseDB.getInstance();
			Table table = db.getTable(tableStr);
			Delete delete = new Delete(Bytes.toBytes(rowkeyStr));
			delete.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr1));

			table.delete(delete);

			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//获取List
	
	public void testGetList() {
		String tableStr="USER";
		String rowkeyStr1="IRNA0003338";
		String rowkeyStr2="IRNA0003339";
		String familyStr=ConstantsHBase.FAMILY_INFO;
		String columnStr1="DONOR_NAME";
		try {
			HBaseDB db=HBaseDB.getInstance();
			Table table = db.getTable(tableStr);
			Get get1 = new Get(Bytes.toBytes(rowkeyStr1));
			Get get2 = new Get(Bytes.toBytes(rowkeyStr2));
			//get.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr1));
			List<Get> gets = new ArrayList<Get>();
			gets.add(get1);
			gets.add(get2);
			Result[] results = table.get(gets);
			for (Result result : results) {
				byte[] bytes =  result.getValue(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr1));
				System.out.println(new String(bytes));
			}
			
			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//获取单条记录
	
	public void testGet() {
		String tableStr="USER";
		String rowkeyStr="IRNA0003338";
		String familyStr=ConstantsHBase.FAMILY_INFO;
		String columnStr1="DONOR_NAME";
		String columnStr2="AGE";
		try {
			HBaseDB db=HBaseDB.getInstance();
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
	//修改数据
	
	public void testCheckAndPut() {
		String tableStr="USER";
		String rowkeyStr="IRNA0003338";
		String familyStr=ConstantsHBase.FAMILY_INFO;
		String columnStr1="DONOR_NAME";
		String columnStr2="AGE";
		String valueStr1="张三";
		String valueStr2="23";
		try {
			HBaseDB db=HBaseDB.getInstance();
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
	
	public void testPutList(List<Put> puts) {

		String tableStr="USER";
		try {
			HBaseDB db=HBaseDB.getInstance();
			Table table = db.getTable(tableStr);
			table.put(puts);
			table.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@Test
	public void test() {
		Integer cs_id=38;
	HBaseSourceDataDao.createSourceDataTable(String.valueOf(cs_id));
	HBaseFormatNodeDao.createFormatNodeTable(String.valueOf(cs_id));
//	HBaseFormatDataDao.createFormatDataTable(String.valueOf(cs_id), String.valueOf(2));
//	HBaseFormatDataDao.createFormatDataTable(String.valueOf(cs_id), String.valueOf(32));
	}
	// 添加/修改数据
	@Test
	public void testPut() {
		String tableStr="USER";
		String rowkeyStr="IRNA0003338";
		String familyStr=ConstantsHBase.FAMILY_INFO;
		String columnStr1="DONOR_NAME";
		String valueStr1="张三";
		String valueStr2="张";
		try {
			HBaseDB db=HBaseDB.getInstance();
			Table table = db.getTable(tableStr);
			//设置行键
			Put put = new Put(Bytes.toBytes(rowkeyStr));
			put.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes(columnStr1), Bytes.toBytes(valueStr1));
			put.addColumn(Bytes.toBytes(familyStr), Bytes.toBytes("age"), Bytes.toBytes(valueStr2));
			table.put(put);
			table.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
@After
	public void end() {
			System.out.println("end");
	}

}
