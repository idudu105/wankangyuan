package com.liutianjun.utils;

import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;


public class SendViaAspx {

	private static HttpClient httpclient;
	
	public static int sendPhoneCode(String phone,String phoneCode) throws Exception {
		httpclient = new SSLClient();
		String url = "https://sh2.ipyy.com/sms.aspx";
		String accountName="zww63";							//改为实际账号名
		String password="qa12345";								//改为实际发送密码
		String text = "【万康源】您好，您的手机验证码是："+phoneCode+"，若非本人操作，请忽略！";
		
		HttpPost post = new HttpPost(url);
		post.setHeader("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		nvps.add(new BasicNameValuePair("action","send"));
		nvps.add(new BasicNameValuePair("userid", ""));
		nvps.add(new BasicNameValuePair("account", accountName)); 	
		nvps.add(new BasicNameValuePair("password", password));		
		nvps.add(new BasicNameValuePair("mobile", phone));		//多个手机号用逗号分隔
		nvps.add(new BasicNameValuePair("content", text));
		nvps.add(new BasicNameValuePair("sendTime", ""));
		nvps.add(new BasicNameValuePair("extno", ""));

		post.setEntity(new UrlEncodedFormEntity(nvps,"UTF-8"));

		HttpResponse response = httpclient.execute(post);

		try {
			System.out.println(response.getStatusLine());
			HttpEntity entity = response.getEntity();
			// 将字符转化为XML
			String returnString=EntityUtils.toString(entity, "UTF-8");
			Document doc = DocumentHelper.parseText(returnString);
			// 获取根节点
			Element rootElt = doc.getRootElement();
			// 获取根节点下的子节点的值
			String returnstatus = rootElt.elementText("returnstatus").trim();
			String message = rootElt.elementText("message").trim();
			String remainpoint = rootElt.elementText("remainpoint").trim();
			String taskID = rootElt.elementText("taskID").trim();
			String successCounts = rootElt.elementText("successCounts").trim();

			System.out.println(returnString);
			System.out.println("返回状态为：" + returnstatus);
			System.out.println("返回信息提示：" + message);
			System.out.println("返回余额：" + remainpoint);
			System.out.println("返回任务批次：" + taskID);
			System.out.println("返回成功条数：" + successCounts);
			EntityUtils.consume(entity);
			return Integer.parseInt(successCounts);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		
		return 0;
		
	}
}
