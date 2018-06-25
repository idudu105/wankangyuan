<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
        // pro_mine();
        // pro_discuss();
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
                <a href="/wankangyuan/sourceData/firstIn?type=1">
                    <div class="topT">格式数据</div>
                </a>
                <a href="/wankangyuan/application/viewMine">
                    <div class="topT ">应用</div>
                </a>
                <div class="touxiangK">
                    <a href="/wankangyuan/userInfo">
                        <img src="${user.headimg }" alt="" class="touxiang" />
                    </a>
                    <div class="userbutK">
                        <a href="/wankangyuan/userInfo">
                            <div class="userbut">用户信息</div>
                        </a>
                        <a href="/wankangyuan/message/viewMessage">
                            <div class="userbut">系统消息
                            <c:if test="${systemMSG }">
                                <img src="<%=request.getContextPath()%>/static/img/redpoint.png" height="11" width="11" alt="" class="redpoint2" />
                            </c:if>
                            </div>
                        </a>
                        <div class="userbutline"></div>
                        <a href="/wankangyuan/logout">
                            <div class="userbut">退出登录</div>
                        </a>
                    </div>
                </div>
                <div class="nicheng"><shiro:principal/></div>
                <a href="/wankangyuan/friends/viewFriendsManage">
                <div class="yanjiuquan">
                    <div class="yanjiuquanT">研究圈</div>
                    <c:if test="${friendMSG}">
                        <img src="<%=request.getContextPath()%>/static/img/redpoint.png" height="11" width="11" alt="" class="redpoint" />
                    </c:if>
                </div>
                </a>
            </div>
            
            <div class="middle">
                <div class="disdetailL">
                    <div class="disdetailLT">
                        <div class="eisdeLTl">
                            <img src="${projectTopic.headimg}" alt="" class="eisdeLTli" />
                            <div class="eisdeLTln">${projectTopic.username }</div>
                            <div class="eisdeLTlt">楼主</div>
                        </div>
                        <div class="eisdeLTr">
                            <div class="eisdeLTrT">${projectTopic.content }</div>
                            <div class="eisdeLTrB">
                                <div class="eisdeLTrBl">${projectTopic.create_datetime }</div>
                                <div class="eisdeLTrBde">删除</div>
                                <div class="eisdeLTrBre">
                                    <div class="eisdeLTrBreb">回复</div>
                                    <div class="eisdeLTrBret">
                                        (<span>${projectTopic.follow_up_num}</span>)
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="disdetailLB">
                     	<c:forEach items="${projectTopicFollows}" var="projectTopicFollowTemp">
                     		<div class="disdeLBz">
	                            <div class="disdeLBzl"><span>3</span>楼</div>
	                            <div class="disdeLBzc">
	                                <img src="${projectTopicFollowTemp.headimg}"alt="" class="disdeLBzci" />
	                                <div class="disdeLBzcn">${projectTopicFollowTemp.username}</div>
	                            </div>
	                            <div class="disdeLBzr">
	                                <div class="disdeLBzrt">${projectTopicFollowTemp.content}</div>
	                                <div class="disdeLBzrb">
	                                    <div class="disdeLBzrbti">${projectTopicFollowTemp.create_datetime}</div>
	                                    <div class="disdeLBzrbde" onclick="deleteProjectTopicFllow(${projectTopicFollowTemp.id})">删除</div>
	                                </div>
	                            </div>
	                        </div>
                     	</c:forEach>
                    </div>
                    
                    <!-- 回复主题悬浮窗 -->
                    <div class="themeadd" id="themeadd">
	                    <div class="themeaddX"></div>
	                    <div class="themeaddT">回复主题</div>
	                    <div class="themeaddM">
	                        <div class="themeaddMt">内容：</div>
	                        <textarea name="content" id="content" class="themeaddMk" maxlength="600"></textarea>
	                        <div class="themeaddMt2">600字以内</div>
	                    </div>
	                    <div class="themeaddB">
	                        <div class="themeaddBc">取消</div>
	                        <input type="button" class="themeaddBs" value="发送" />
	                    </div>
	                </div>
	                
                    <!--翻页组件 -->
                    <div class="pageK" id="box"></div>
                    
                </div>
                
                
                <div class="disdetailR">
                    <div class="disdeRT">其他话题</div>
                    <div class="disdeRM">
                    	
                    	<c:forEach items="${topProjectTopics}" var="topProjectTopicTemp">
                    		<div class="disdeRMz">
	                            <a href="/wankangyuan/projectTopic/selectProjectTopicFollow?project_topic_id=${topProjectTopicTemp.id}">
	                                <div class="disdeRMzT">${topProjectTopicTemp.content}</div>
	                            </a>
	                            <div class="disdeRMzB">
	                                <div class="disdeRMzBl">${topProjectTopicTemp.create_datetime}</div>
	                                <div class="disdeRMzBr">发布者：${topProjectTopicTemp.username}</div>
	                            </div>
	                        </div>
                    	</c:forEach>

                    </div>
                </div>
            </div>
            
			<div class="pageK" id="box"></div>

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
    <script type="text/javascript" src="/wankangyuan/static/js/paging.js"></script>
    <script type="text/javascript">
    
	  	//创建框的位置以及显示隐藏效果
	    var eisdeLTrBreb=document.querySelectorAll('.eisdeLTrBreb')[0];//回复主题按钮
	    var othemeadd=document.querySelectorAll('.themeadd')[0];//回复消息创建框
	    var othemeaddX=document.querySelectorAll('.themeaddX')[0];//回复消息关闭按钮
	    var othemeaddMk=document.querySelectorAll('.themeaddMk')[0];//回复消息框内容
	    var othemeaddBc=document.querySelectorAll('.themeaddBc')[0];//回复消息框取消按钮
	
	    var themeaddPD=0;
		
	    eisdeLTrBreb.onclick=function(){
	        if(themeaddPD==0){
	            othemeadd.style.display="block";
	            themeaddPD=1;
	        }else{
	            othemeadd.style.display="none";
	            themeaddPD=0;
	            othemeaddMk.value="";
	        }
	    }
	    othemeaddX.onclick=function(){
	        othemeadd.style.display="none";
	        themeaddPD=0;
	        othemeaddMk.value="";
	    }
	
	    othemeaddBc.onclick=function(){
	        othemeadd.style.display="none";
	        themeaddPD=0;
	        othemeaddMk.value="";
	    }
	    
	    //提交回复主题消息
	    $(".themeaddBs").click(function (){
	    	var content = $("#content").val();
	    	var project_topic_id = ${projectTopic.id};
	    	
	    	$.ajax({
	    		url:"/wankangyuan/projectTopic/insertProjectTopicFollow",
	    		type:"post",
	    		data:{
	    			content:content,
	    			project_topic_id:project_topic_id
	    		},
	    		dataType:"json",
	    		success : function(data){
	    			if(data.result == true){
	    				alert("回复成功！");
	    				window.location.href="/wankangyuan/projectTopic/selectProjectTopicFollow?project_topic_id="+project_topic_id;
	    			}else{
	    				alert(data.message);
	    			}
	    		},
	    		error : function(){
	    			alert("联网失败");
	    		}
	    	});
	    });
	    
	    //删除回复消息
	    function deleteProjectTopicFllow(id){
	    	alert(id);
	    	$.ajax({
	    		url:"/wankangyuan/projectTopic/deleteProjectTopicFollow",
	    		type:"post",
	    		data:{
	    			id:id
	    		},
	    		dataType:"json",
	    		success : function(data){
	    			if(data.result == true){
	    				alert("删除成功！");
	    				var project_topic_id = ${projectTopic.id};
	    				window.location.href="/wankangyuan/projectTopic/selectProjectTopicFollow?project_topic_id="+project_topic_id;
	    			}else{
	    				alert(data.message);
	    			}
	    		},
	    		error : function(){
	    			alert("联网失败");
	    		}
	    	});
	    }
	    
	    //删除主题
	    $(".eisdeLTrBde").click(function(){
			var project_topic_id = ${projectTopic.id};
	    	//进行ajax请求
	    	$.ajax({
	    		url:"/wankangyuan/projectTopic/deleteProjectTopic",
	    		type:"post",
	    		data:{
	    			project_topic_id:project_topic_id
	    		},
	    		dataType:"json",
	    		success : function(data){
	    			if(data.result == true){
	    				alert("主题删除成功！");
	    				window.location.href="/wankangyuan/projectTopic/selectProjectTopic";
	    			}else{
	    				alert(data.message);
	    			}
	    		},
	    		error : function(){
	    			alert("联网失败");
	    		}
	    	});
	    });

    
	    $('#box').paging({
	        initPageNo: ${page}, // 初始页码
	        totalPages: Math.ceil(${total}/${rows}), //总页数
	        totalCount: '合计&nbsp;' + ${total} + '&nbsp;条数据', // 条目总数
	        slideSpeed: 600, // 缓动速度。单位毫秒
	        jump: true, //是否支持跳转
	        callback: function(page) { // 回调函数
	            if(page!=${page}){
	                window.location.href="/wankangyuan/projectTopic/selectProjectTopicFollow?page="
	                		+page+"&strip=${rows}&project_topic_id="+${projectTopic.id};
	            }
	        }
	    });
	    
    	
    </script>
    
</body>
</html>