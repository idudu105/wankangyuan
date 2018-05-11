<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Document</title>
</head>
<link rel="stylesheet" type="text/css" href="/wankangyuan/static/css/project1.css" />
<script type="text/javascript" src="/wankangyuan/static/js/project1.js"></script>
<script type="text/javascript">
    window.onload=function(){
        project0();
        // project1();
        pro_detail();
    }
</script>
<body>
    <div class="Box">
        <div class="box">
            <div class="top">
                <h1><img src="/wankangyuan/static/img/newlogo2.png" height="70" width="218" alt="" class="logo" /></h1>
                <a href="/wankangyuan/project/selectMyProject?user_id=1">
                	<div class="topT active">项目</div>
                </a>
                <div class="topT">格式数据</div>
                <div class="topT">应用</div>
                <div class="touxiangK">
                    <img src="/wankangyuan/static/img/touxiang.png" alt="" class="touxiang" />
                </div>
                <div class="nicheng">Peter</div>
                <div class="yanjiuquan">
                    <div class="yanjiuquanT">研究圈</div>
                    <img src="/wankangyuan/static/img/redpoint.png" height="11" width="11" alt="" class="redpoint" />
                </div>
            </div>
            <div class="top2">
                <div class="top2C">
                    <div class="top2Ctl active">${project.p_name }</div>
                    <a href="project_discuss.html"><div class="top2Ctr">讨论版</div></a>
                    <a href="project_member.html"><div class="top2Ctr">成员</div></a>
                    <a href="project_append.html"><div class="top2Ctr">应用结果</div></a>
                    <a href="project_app.html"><div class="top2Ctr">应用</div></a>
                    <a href="project_data.html"><div class="top2Ctr">格式数据</div></a>
                    <a href="/wankangyuan/projectFloderFile/selectProjectFloderByProjectId"><div class="top2Ctr">文件</div></a>
                    <a href="javascript:;"><div class="top2Ctr active">基本信息</div></a>
                </div>
            </div>
            <div class="prodexq">
                <div class="prodexqL">
                    <div class="prodexqLt">项目说明</div>
                    <div class="prodexqLk">
                        <div class="prodexLbk">
                            <!-- <div class="prodexLb">保存</div> -->
                            <input type="button" class="prodexLb" value="保存" onclick="saveProjectIntroduction()"/>
                        </div>
                        <textarea name="" id="" class="prodexLt" >${project.introduction}</textarea>

                        <div class="prodexLtj">
                            <div class="prodexLtjt">
                                <div class="prodexLtjtL">项目统计信息</div>
                            </div>
                            <div class="prodexLtjt">
                                <div class="prodexLtjtL">文件：</div>
                                <div class="prodexLtjtR">${project.fileNum }</div>
                            </div>
                            <div class="prodexLtjt">
                                <div class="prodexLtjtL">应用：</div>
                                <div class="prodexLtjtR">${project.appNum }</div>
                            </div>
                            <div class="prodexLtjt">
                                <div class="prodexLtjtL">应用结果：</div>
                                <div class="prodexLtjtR">${project.appResultNum }</div>
                            </div>
                            <div class="prodexLtjt">
                                <div class="prodexLtjtL">成员：</div>
                                <div class="prodexLtjtR">${project.memberNum }</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="prodexqR">
                    <div class="prodexqRt">${project.p_name }</div>
                    <div class="prodexqRk">
                        <div class="prodexqRbK">
                            <div class="prodexqRb active">
                                <img src="/wankangyuan/static/img/prodetail1_1.png" alt="" class="prodexqRbI" />
                                <div class="prodexqRbT">25例糖尿病患者的基因表达模式研究1</div>
                            </div>
                            <div class="prodexqRb">
                                <img src="/wankangyuan/static/img/prodetail1_2.png" alt="" class="prodexqRbI" />
                                <div class="prodexqRbT">25例糖尿病患者的基因表达模式研究2</div>
                            </div>
                            <div class="prodexqRb">
                                <img src="/wankangyuan/static/img/prodetail1_3.png" alt="" class="prodexqRbI" />
                                <div class="prodexqRbT">25例糖尿病患者的基因表达模式研究3</div>
                            </div>
                        </div>
                        <div class="prodexqRaK">
                            <div class="prodexqRa active"></div>
                            <div class="prodexqRa"></div>
                            <div class="prodexqRa"></div>
                        </div>
                    </div>
                </div>
            </div>
            

            <div class="bottom">
                <a href="javascript:;">
                    <div class="bot_guanwang">公司官网</div>
                </a>
                <a href="javascript:;">
                    <div class="bot_guanyu">关于</div>
                </a>
                <a href="javascript:;">
                    <div class="bot_jianyi">反馈建议</div>
                </a>
                <div class="botT">Copyright @2018天津万康源科技有限公司</div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="/wankangyuan/static/js/jquery.min.js"></script>
    <script type="text/javascript">
    	
    	//提交编辑后的结果
    	function saveProjectIntroduction(){
    		
    		var introduction = $(".prodexLt").val();
    		//进行ajax请求
    		$.ajax({
    			url:"/wankangyuan/project/updatePorjectIntroduction",
    			type:"post",
    			dataType:"json",
    			data:{
    				introduction:introduction
    			},
    			success : function(data){
    				if(data.result == true){
    					window.location.href="/wankangyuan/project/getProjectDetail";
    				}else{
    					alert(data.message);
    				}
    			},
    			error : function(){
    				alert("联网失败");
    			}
    			
    		});
    		
    	}
    
    
    
    </script>
</body>
</html>