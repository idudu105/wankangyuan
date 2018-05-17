/**
 * @author 沫
 * */
package com.xtkong.test;

import java.io.IOException;
import java.net.URI;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class HDFSAPITest {
	FileSystem fileSystem = null;

	/**
	 * junit单元测试，junit.jar
	 * 
	 * 如果有个功能点需要运行测试，使用main方法。由于main方法在一个java文件中只能有一个，如果有多个功能点需要测试，可以：
	 * 1.创建多个java文件，使用每个文件中的main方法； 2.使用一个main方法，但是把不同的程序写在不同的方法中，依次在main方法中调用。
	 * 因上述两种方法都不方便，故使用junit库。 junit库：方法前加@Test注解，该方法执行Junit测试。
	 * 如果执行@Test方法需要一些初始化操作（如获取FileSystem对象），初始化操作写入@Before标注的方法，该方法在@Test方法执行之前执行；
	 * 如果执行@Test方法之后有关闭/释放资源等操作（如获取FileSystem.close()），初始化操作写入@After标注的方法，该方法在@Test方法执行之后执行；
	 *
	 */
	@Before
	public void init() {
		// System.setProperty("hadoop.home.dir",
		// "E:/Users/admin/Documents/O/hadoop-2.6.0");
		System.out.println("初始化操作，创建fileSystem");
		// hadoop有几个配置文件，如，core-site.xml，hdfs-site.xml等
		// 存储配置文件解析的结果
		Configuration configuration = new Configuration();
		try {
			/*
			 * 在创建uri时，要指定协议名称，因为FileSystem支持多种文件系统，通过协议名称来指定操作的文件系统类型 。
			 * 
			 * 可以操作，本地文件系统，hdfs、ftp等
			 */
			URI uri = new URI("hdfs://60.29.25.133:9000/");
			// 默认(URI为空)获取LocalFileSystem对象，该对象默认读取本地文件系统中的文件
			fileSystem = FileSystem.get(uri, configuration);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@After
	public void close() {
		System.out.println("释放资源操作，关闭fileSystem");
		if (fileSystem != null) {
			try {
				fileSystem.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	// 新建目录
	@Test
	public void testMkdirs() {
		System.out.println("mkdirs");
		try {
			/**
			 * HDFS API进行写操作时，获取当前操作系统登录的用户，以此用户向HDFS写数据；
			 * 但若HDFS有权限检查机制，并且当前操作系统登录的用户和hadoop所使用的用户不一致，会出现权限问题； 解决方法：
			 * 1.修改HDFS目录的权限； 2.关闭HDFS权限检测，hdfs-site.xml
			 * 3.指定api获取的用户，与hadoop用户一致，-DHADOOP_USER_NAME=mo
			 */
			fileSystem.mkdirs(new Path("/aa/bb/cc"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 删除目录
	@Test
	public void testDeldirs() {
		System.out.println("Deldirs");
		try {
			// true递归删除hdfs://single:9000/testwc/output/1
			fileSystem.delete(new Path("/testwc/output"), true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 文件传输
	@Test
	public void testPut() {
		System.out.println("put");
		try {
			fileSystem.copyFromLocalFile(new Path("E:/Users/admin/Desktop/暑期实训/7-3/项目流程介绍.txt"), new Path("/aa/bb"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 文件列表获取
	@Test
	public void testList() {
		System.out.println("List");
		try {
			FileStatus[] fileStatus = fileSystem.listStatus(new Path("/testwc"));
			for (FileStatus fileStatus2 : fileStatus) {
				System.out.println(fileStatus2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 读文件内容
	@Test
	public void testOpen() {
		System.out.println("Open");
		try {
			FSDataInputStream inputStream = fileSystem.open(new Path("/aa/bb/项目流程介绍.txt"));
			IOUtils.copyBytes(inputStream, System.out, 1000);
			// int c = 0;
			// while ((c = inputStream.read()) != -1) {
			// System.out.print((char)c);
			// }
			System.out.println();
			inputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@SuppressWarnings("deprecation")
	@Test
	public void testCount() {
		try {
			FSDataInputStream inputStream = fileSystem.open(new Path("/testwc/input/hadoop-mo-datanode-single.log"));
			HashMap<String, Integer> mapper = new HashMap<>();
			String string = null;
			while ((string = inputStream.readLine()) != null) {
				// System.out.println(string);
				for (String tmp : string.split("[^\\w]")) {//[^\w],[^a-zA-Z_0-9]
					if (mapper.containsKey(tmp)) {
						mapper.put(tmp, mapper.get(tmp)+1);
					} else {
						mapper.put(tmp, 1);
					}
				}
			}
			
			for (Iterator<Entry<String, Integer>> iterator = mapper.entrySet().iterator(); iterator.hasNext();) {
				System.out.println(iterator.next());;
				
			}
			System.out.println();
			inputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		// // hadoop有几个配置文件，如，core-site.xml，hdfs-site.xml等
		// // 存储配置文件解析的结果
		// Configuration configuration = new Configuration();
		// try {
		// /*
		// * 在创建uri时，要指定协议名称，因为FileSystem支持多种文件系统，通过协议名称来指定操作的文件系统类型 。
		// * 可以操作，本地文件系统，hdfs、ftp等
		// */
		// URI uri = new URI("hdfs://single:9000/");
		// // 默认(URI为空)获取LocalFileSystem对象，该对象默认读取本地文件系统中的文件
		// FileSystem fileSystem = FileSystem.get(uri, configuration);
		//
		// // 读文件，默认模式读取本地文件
		// FSDataInputStream inputStream = fileSystem.open(new Path(""));
		// /*
		// * int c = 0; while ((c = inputStream.read()) != -1) {
		// * System.out.print((char) c); }
		// */
		// IOUtils.copyBytes(inputStream, System.out, 1000);
		// inputStream.close();
		// fileSystem.close();
		// } catch (Exception e) {
		// e.printStackTrace();
		// }

	}
}
