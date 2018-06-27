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
        project1();
        // pro_mine();
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
            <div class="top2">
                <div class="top2C">
                    <div class="top2Ctl active">${project.p_name }</div>
                    <c:if test="${authoritys['74'] == true }">
                    	  <a href="/wankangyuan/projectTopic/selectProjectTopic"><div class="top2Ctr">讨论版</div></a>
                    </c:if>
                   
                    <c:if test="${authoritys['63'] == true }">
                    	 <a href="/wankangyuan/projectMember/selectProjectMember"><div class="top2Ctr">成员</div></a>
                    </c:if>
                    
					<c:if test="${authoritys['57'] == true }">
                    	 <a href="/wankangyuan/projectAppEnd/selectProjectAppEnd"><div class="top2Ctr active">应用结果</div></a>
                    </c:if>
                   
                    <c:if test="${authoritys['42'] == true }">
                    	<a href="/wankangyuan/projectApp/selectProjectApp?p_id=${project.id}"><div class="top2Ctr">应用</div></a>
                    </c:if>
                    
                    <c:if test="${authoritys['31'] == true }">
                    	<a href="/wankangyuan/projectFormatData/getSourceDatas?p_id=${project.id}"><div class="top2Ctr">格式数据</div></a>
                    </c:if>
                    
                    <c:if test="${authoritys['27'] == true }">
                    	<a href="/wankangyuan/projectFloderFile/selectProjectFloderByProjectId"><div class="top2Ctr">文件</div></a>
                    </c:if>
                    
                    <c:if test="${authoritys['11'] == true }">
                    	<a href="/wankangyuan/project/getProjectDetail"><div class="top2Ctr ">基本信息</div></a>
                    </c:if>
                    
                    
                </div>
            </div>
            <div class="shaixuan">
                <div class="shaixuanC">
                    <div class="listZT">
                        <a href="/wankangyuan/jsp/project/project_append2.jsp">
                            <div class="listZTli listZT1 active">
                                <img src="/wankangyuan/static/img/listZT1.png"alt="" class="listZT1i" />
                                <img src="/wankangyuan/static/img/listZT1.png" alt="" class="listZT1i" />
                            </div>
                        </a>
                        <a href="javascript:;">
                            <div class="listZTli listZT2">
                                <div class="listZT2d"></div>
                                <div class="listZT2d"></div>
                                <div class="listZT2d"></div>
                            </div>
                        </a>
                    </div>
                    <div class="jiangeline"></div>
                    <div class="shaixuanBT">
                        <div class="shaixuanBTt">筛选</div>
                        <div class="shaixuanBTiK">
                            <img src="/wankangyuan/static/img/sanjiao_blue.png" alt="" class="shaixuanBTi" />
                        </div>
                    </div>
                    
                    <c:if test="${authoritys['53'] == true }">
                    	<div class="pro_menu pro_rem">移除</div>
                    </c:if>
                    <c:if test="${authoritys['52'] == true }">
                    	<div class="pro_menu pro_canfabu">取消发布</div>
                    </c:if>
                    <c:if test="${authoritys['51'] == true }">
                    	<div class="pro_menu pro_fabu">发布</div>
                    </c:if>
                    <c:if test="${authoritys['50'] == true }">
                    	<div class="pro_menu pro_rerun">重新运行</div>
                    </c:if>
                    
                    <div class="search2">
                        <div class="search2C">
                            <img src="/wankangyuan/static/img/search.png" alt="" class="search2Ci" />
                            <input type="text" class="search2Ct"  placeholder="搜索应用结果" value="${projectAppTaskSearchWord }"/>
                        </div>
                    </div>
                </div>
                <div class="shaixuanZK">
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">结果名称</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">应用名称</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">创建者</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">运行时间</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">运行使用参数</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">运行结果描述</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">进度</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">发布状态</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">异步/即时</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">结果文件</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                </div>
            </div>
            <div class="PJK">
                <div class="PJList">
                    <div class="allK">
                        <div class="quanxuanK">
                            <input type="checkbox" class="input_check" id="check0">
                            <label for="check0"></label>
                        </div>
                        <div class="allT">全选</div>
                    </div>
                    <div class="PJListli appendname">结果名称</div>
                    <div class="PJListli appname">应用名称</div>
                    <div class="PJListli appcreater">创建人</div>
                    <div class="PJListli apptime">创建时间</div>
                    <div class="PJListli apptime">运行使用参数</div>
                    <div class="PJListli apptime">运行结果描述</div>
                    <div class="PJListli appjindu">进度</div>
                    <div class="PJListli appfabuZT">发布状态</div>
                    <div class="PJListli appYBorJS">异步/即时</div>
                    <div class="PJListli ">结果文件</div>

                </div>
                <div class="PJListline"></div>
                <div class="PJul">
                	
                	<c:forEach items="${projectAppTasks }" var="projectAppTaskTemp">
                		<div class="PJli">
	                        <div class="PJliC">
	                            <div class="fuxuanK2">
	                                <input name="ids" type="checkbox" class="input_check" id="check${projectAppTaskTemp.id }" value="${projectAppTaskTemp.id }">
	                                <label for="check${projectAppTaskTemp.id }"></label>
	                            </div>
	                            <a href="#">
	                            	<c:if test="${authoritys['54'] == true }">
				                    	<div class="PJliCli appendname" onclick="taskEndLocation(${projectAppTaskTemp.id})">${projectAppTaskTemp.taskName }</div>
				                    </c:if>
				                    <c:if test="${authoritys['54'] != true }">
				                    	<div class="PJliCli appendname">${projectAppTaskTemp.taskName }（无打开权限）</div>
				                    </c:if> 
	                                <div class="PJliCli appname">${projectAppTaskTemp.app_name }</div>
	                                <div class="PJliCli appcreater">${projectAppTaskTemp.username }</div>
	                                <div class="PJliCli apptime">${projectAppTaskTemp.create_datetime }</div>
	                                <c:if test="${authoritys['55'] == true }">
				                    	<div class="PJliCli apptime param" onclick="showParam(${projectAppTaskTemp.id})">查看</div>
				                    </c:if>
				                    <c:if test="${authoritys['55'] != true }">
				                    	<div class="PJliCli apptime param">（无查看权限）</div>
				                    </c:if> 
	                                
	                                <div class="PJliCli apptime">${projectAppTaskTemp.taskDescription }</div>
	                                <div class="PJliCli appjindu">完成</div>
	                                <c:if test="${projectAppTaskTemp.isRelease == 0 }">
	                                	<div class="PJliCli appfabuZT">未发布</div>
	                                </c:if>
	                                <c:if test="${projectAppTaskTemp.isRelease == 1 }">
	                                	<div class="PJliCli appfabuZT">已发布</div>
	                                </c:if>
	                                <div class="PJliCli appYBorJS">即时</div>
	                                <c:if test="${authoritys['56'] == true }">
				                    	<div class="PJliCli " onclick="showResultFile(${projectAppTaskTemp.id})">查看</div>
				                    </c:if>
				                    <c:if test="${authoritys['56'] != true }">
				                    	<div class="PJliCli " >（无查看权限）</div>
				                    </c:if> 
	                                
	                            </a> 
	                        </div>
	                        <div class="PJliline"></div>
	                    </div>
                	</c:forEach>
                </div>

                <div class="BTSX">
                    <div class="BTSXc">
                        <div class="BTSXcli">
                            <div class="BTSXcliT">排序：</div>
                            <img src="/wankangyuan/static/img/sort_up.png" alt="" class="BTSXcliI" />
                            <img src="/wankangyuan/static/img/sort_down.png" alt="" class="BTSXcliI" />
                        </div>
                        <div class="BTSXcli">
                            <div class="BTSXcliT">过滤：</div>
                            <input type="text" class="BTSXcliGLK" />
                        </div>
                        <div class="BTSXcli">
                            <div class="BTSXcliT">值筛选：</div>
                        </div>
                        <div class="BTSXcli2">
                            <div class="BTSXcli2li">
                                <div class="BTSXcli2liI"></div>
                                <div class="BTSXcli2liT">项目编号1</div>
                            </div>
                            <div class="BTSXcli2li">
                                <div class="BTSXcli2liI"></div>
                                <div class="BTSXcli2liT">项目编号1</div>
                            </div>
                            <div class="BTSXcli2li">
                                <div class="BTSXcli2liI"></div>
                                <div class="BTSXcli2liT">项目编号1</div>
                            </div>
                            <div class="BTSXcli2li">
                                <div class="BTSXcli2liI"></div>
                                <div class="BTSXcli2liT">项目编号1</div>
                            </div>
                            <div class="BTSXcli2li">
                                <div class="BTSXcli2liI"></div>
                                <div class="BTSXcli2liT">项目编号1</div>
                            </div>
                        </div>
                        <div class="BTSXcli3">
                            <div class="BTSXcli3BT BTSXcli3BTent">筛选</div>
                            <div class="BTSXcli3BT BTSXcli3BTres">重置</div>
                        </div>
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
    
	    $('#box').paging({
	        initPageNo: ${page}, // 初始页码
	        totalPages: Math.ceil(${total}/${rows}), //总页数
	        totalCount: '合计&nbsp;' + ${total} + '&nbsp;条数据', // 条目总数
	        slideSpeed: 600, // 缓动速度。单位毫秒
	        jump: true, //是否支持跳转
	        callback: function(page) { // 回调函数
	            console.log(page);
	            if(page!=${page}){
	            	var searchWord = $(".search2Ct").val();
	                window.location.href="/wankangyuan/projectAppEnd/selectProjectAppEnd?type=1&page="+page+"&strip=12&searchWord="+searchWord;
	            }
	        }
	    });
	    
	    $(".search2Ct").bind("keypress" , function (event){
	    	if(event.keyCode == 13){
	    		var searchWord = this.value;
	    		window.location.href="/wankangyuan/projectAppEnd/selectProjectAppEnd?type=1&page=1&strip=12&searchWord="+searchWord;
	    	}
	    });
	    
	    $(".pro_rerun").click(function (){
	    	var afuxuanK=document.querySelectorAll('.fuxuanK2');
            var afuxuan=[];
            for(var i=0;i<afuxuanK.length;i++){
                afuxuan.push(afuxuanK[i].querySelectorAll('.input_check')[0]);
            }
            var ids = [];
            for(var i=0;i<afuxuanK.length;i++){
            	if(afuxuan[i].checked){
            		ids.push(afuxuan[i].value);
            	}
            }
            if(ids == ""){
            	alert("请勾选应用！");
            	return;
            }
            if(ids.length >1){
            	alert("一次最多运行一个应用！");
            	return;
            }
            var task_id = ids.join(",");
            var operType = 'update';
            
            $.ajax({
            	url:"/wankangyuan/projectAppEnd/projectAppReRun",
            	type:"post",
            	data:{
            		task_id:task_id,
            		operType:operType
            	},
            	dataType:"json",
            	success : function(data){
            		if(data.result == true){
            			window.open(data.message
                        		,'_blank'
                        		,'width=1200,height=600,menubar=no,toolbar=no,status=no,scrollbars=yes')
            		}else{
            			alert("应用运行地址解失败！");
            		}
            	},
            	error : function(){
            		alert("联网失败");
            	}
            });  
	    });
	    //查看运行参数
	    function showParam(task_id){
	    	var operType = 'query';
	    	$.ajax({
            	url:"/wankangyuan/projectAppEnd/projectAppReRun",
            	type:"post",
            	data:{
            		task_id:task_id,
            		operType:operType
            	},
            	dataType:"json",
            	success : function(data){
            		if(data.result == true){
            			window.open(data.message
                        		,'_blank'
                        		,'width=1200,height=600,menubar=no,toolbar=no,status=no,scrollbars=yes')
            		}else{
            			alert("应用运行地址解失败！");
            		}
            	},
            	error : function(){
            		alert("联网失败");
            	}
            });
	    }
	    //打开应用结果地址
	    function taskEndLocation(task_id){
	    	$.ajax({
            	url:"/wankangyuan/projectAppEnd/projectAppTaskResultEnd",
            	type:"post",
            	data:{
            		task_id:task_id,
            	},
            	dataType:"json",
            	success : function(data){
            		if(data.result == true){
            			window.open(data.message
                        		,'_blank'
                        		,'width=1200,height=600,menubar=no,toolbar=no,status=no,scrollbars=yes')
            		}else{
            			alert("应用运行地址解失败！");
            		}
            	},
            	error : function(){
            		alert("联网失败");
            	}
            });
	    }
	    //查看运行结果文件
	    function showResultFile(task_id){
	    	$.ajax({
            	url:"/wankangyuan/projectAppEnd/projectAppTaskResultFile",
            	type:"post",
            	data:{
            		task_id:task_id,
            	},
            	dataType:"json",
            	success : function(data){
            		if(data.result == true){
            			window.open(data.message
                        		,'_blank'
                        		,'width=1200,height=600,menubar=no,toolbar=no,status=no,scrollbars=yes')
            		}else{
            			alert("应用运行地址解失败！");
            		}
            	},
            	error : function(){
            		alert("联网失败");
            	}
            });
	    }
	    
	    $(".pro_fabu").click(function (){
	    	var afuxuanK=document.querySelectorAll('.fuxuanK2');
            var afuxuan=[];
            for(var i=0;i<afuxuanK.length;i++){
                afuxuan.push(afuxuanK[i].querySelectorAll('.input_check')[0]);
            }
            var ids = [];
            for(var i=0;i<afuxuanK.length;i++){
            	if(afuxuan[i].checked){
            		ids.push(afuxuan[i].value);
            	}
            }
            if(ids == ""){
            	alert("请勾选应用！");
            	return;
            }
            var taskIds = ids.join(",");
            $.ajax({
            	url:"/wankangyuan/projectAppEnd/projectAppTaskRelease",
            	type:"post",
            	data:{
            		taskIds:taskIds
            	},
            	dataType:"json",
            	success : function(data){
            		alert(data.message);
            		var searchWord = $(".search2Ct").val();
            		window.location.href="/wankangyuan/projectAppEnd/selectProjectAppEnd?type=1&page=1&strip=12&searchWord="+searchWord;
            	},
            	error : function(){
            		alert("联网失败");
            	}
            });
	    });
	    
	    $(".pro_canfabu").click(function (){
	    	var afuxuanK=document.querySelectorAll('.fuxuanK2');
            var afuxuan=[];
            for(var i=0;i<afuxuanK.length;i++){
                afuxuan.push(afuxuanK[i].querySelectorAll('.input_check')[0]);
            }
            var ids = [];
            for(var i=0;i<afuxuanK.length;i++){
            	if(afuxuan[i].checked){
            		ids.push(afuxuan[i].value);
            	}
            }
            if(ids == ""){
            	alert("请勾选应用！");
            	return;
            }
            var taskIds = ids.join(",");
            $.ajax({
            	url:"/wankangyuan/projectAppEnd/projectAppTaskUnRelease",
            	type:"post",
            	data:{
            		taskIds:taskIds
            	},
            	dataType:"json",
            	success : function(data){
            		alert(data.message);
            		var searchWord = $(".search2Ct").val();
            		window.location.href="/wankangyuan/projectAppEnd/selectProjectAppEnd?type=1&page=1&strip=12&searchWord="+searchWord;
            	},
            	error : function(){
            		alert("联网失败");
            	}
            });
	    });
	    
	    $(".pro_rem").click(function (){
	    	var afuxuanK=document.querySelectorAll('.fuxuanK2');
            var afuxuan=[];
            for(var i=0;i<afuxuanK.length;i++){
                afuxuan.push(afuxuanK[i].querySelectorAll('.input_check')[0]);
            }
            var ids = [];
            for(var i=0;i<afuxuanK.length;i++){
            	if(afuxuan[i].checked){
            		ids.push(afuxuan[i].value);
            	}
            }
            if(ids == ""){
            	alert("请勾选应用！");
            	return;
            }
            var taskIds = ids.join(",");
            $.ajax({
            	url:"/wankangyuan/projectAppEnd/projectAppTaskDelete",
            	type:"post",
            	data:{
            		taskIds:taskIds
            	},
            	dataType:"json",
            	success : function(data){
            		alert(data.message);
            		var searchWord = $(".search2Ct").val();
            		window.location.href="/wankangyuan/projectAppEnd/selectProjectAppEnd?type=1&page=1&strip=12&searchWord="+searchWord;
            	},
            	error : function(){
            		alert("联网失败");
            	}
            });
	    });
    
    </script>
</body>
</html>