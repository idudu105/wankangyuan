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
<link rel="stylesheet" type="text/css" href="css/project1.css" />
<script type="text/javascript" src="js/project1.js"></script>
<script type="text/javascript">
    window.onload=function(){
        project0();
        project2();
        data_mine();
    }
</script>
<body>
    <div class="Box">
        <div class="box">
            <div class="top">
                <h1><img src="img/newlogo2.png" height="70" width="218" alt="" class="logo" /></h1>
                <a href="project_mine.html">
                    <div class="topT">项目</div>
                </a>
                <a href="/wankangyuan/sourceData/firstIn?type=1">
                    <div class="topT active">格式数据</div>
                </a>
                <a href="app_mine.html">
                    <div class="topT">应用</div>
                </a>
                <div class="touxiangK">
                    <a href="/wankangyuan/userInfo">
                        <img src="${user.headimg }" onerror='this.src="/wankangyuan/static/img/head.jpg"'  }" alt="" class="touxiang" />
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
                    <a href="/wankangyuan/sourceData/firstIn?type=1"><div class="top2Cli top2CliYJ">我的</div></a>
                    <a href="/wankangyuan/sourceData/firstIn?type=2"><div class="top2Cli">我创建的</div></a>
                    <a href="/wankangyuan/sourceData/firstIn?type=3"><div class="top2Cli">公共</div></a>
                    <div class="search">
                        <div class="searchC">
                            <img src="img/search.png" alt="" class="searchCi" />
                            <input type="text" class="searchCt"  placeholder="搜索项目" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="shaixuan">
                <div class="shaixuanC">
                    <div class="listZT">
                        <a href="javascript:;">
                            <div class="listZTli listZT1">
                                <img src="img/listZT1.png"alt="" class="listZT1i" />
                                <img src="img/listZT1.png" alt="" class="listZT1i" />
                            </div>
                        </a>
                        <a href="data_mine.html">
                            <div class="listZTli listZT2 active">
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
                            <img src="img/sanjiao_blue.png" alt="" class="shaixuanBTi" />
                        </div>
                    </div>
                    <div class="jiangeline"></div>
                    <div class="allK">
                        <div class="allX"></div>
                        <div class="allT">全选</div>
                    </div>
                    <!-- <div class="pro_menu pro_exit">退出</div> -->
                    <div class="pro_menu pro_addK">
                        <div class="pro_addk">
                            <div class="pro_addT">添加至项目</div>
                            <div class="pro_addI"></div>
                        </div>
                    </div>
                    <div class="pro_menu pro_rem">移除</div>
                    <div class="pro_menu pro_export">导出</div>
                    <select name="" id="" class="pro_menusel">
                        <option value="man">人</option>
                    </select>
                </div>
                <div class="pro_addul">
                    <div class="pro_addli">项目1</div>
                    <div class="pro_addli">项目2</div>
                    <div class="pro_addli">项目3</div>
                    <div class="pro_addli">项目4</div>
                    <div class="pro_addli">项目5</div>
                </div>
            </div>
            <div class="PJK2">
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <a href="project_detail.html">
                            <div class="PJK2litopT">数据名称</div>
                        </a>
                        <div class="PJK2litopI"></div>
                    </div>
                    <div class="PJK2licre">
                        <div class="PJK2licreT1">创建人：</div>
                        <div class="PJK2licreT2">Peter</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">2018-8-20</div>
                        <div class="PJK2litimeT2">12：00</div>
                    </div>
                    
                </div>
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <a href="project_detail.html">
                            <div class="PJK2litopT">数据名称</div>
                        </a>
                        <div class="PJK2litopI"></div>
                    </div>
                    <div class="PJK2licre">
                        <div class="PJK2licreT1">创建人：</div>
                        <div class="PJK2licreT2">Peter</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">2018-8-20</div>
                        <div class="PJK2litimeT2">12：00</div>
                    </div>
                    
                </div>
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <a href="project_detail.html">
                            <div class="PJK2litopT">数据名称</div>
                        </a>
                        <div class="PJK2litopI"></div>
                    </div>
                    <div class="PJK2licre">
                        <div class="PJK2licreT1">创建人：</div>
                        <div class="PJK2licreT2">Peter</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">2018-8-20</div>
                        <div class="PJK2litimeT2">12：00</div>
                    </div>
                    
                </div>
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <a href="project_detail.html">
                            <div class="PJK2litopT">数据名称</div>
                        </a>
                        <div class="PJK2litopI"></div>
                    </div>
                    <div class="PJK2licre">
                        <div class="PJK2licreT1">创建人：</div>
                        <div class="PJK2licreT2">Peter</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">2018-8-20</div>
                        <div class="PJK2litimeT2">12：00</div>
                    </div>
                    
                </div>
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <a href="project_detail.html">
                            <div class="PJK2litopT">数据名称</div>
                        </a>
                        <div class="PJK2litopI"></div>
                    </div>
                    <div class="PJK2licre">
                        <div class="PJK2licreT1">创建人：</div>
                        <div class="PJK2licreT2">Peter</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">2018-8-20</div>
                        <div class="PJK2litimeT2">12：00</div>
                    </div>
                    
                </div>
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <a href="project_detail.html">
                            <div class="PJK2litopT">数据名称</div>
                        </a>
                        <div class="PJK2litopI"></div>
                    </div>
                    <div class="PJK2licre">
                        <div class="PJK2licreT1">创建人：</div>
                        <div class="PJK2licreT2">Peter</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">2018-8-20</div>
                        <div class="PJK2litimeT2">12：00</div>
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
    
    
	<script type="text/javascript"
		src="/wankangyuan/static/js/jquery.min.js"></script>
	<script type="text/javascript" src="/wankangyuan/static/js/paging.js"></script>
	<script type="text/javascript">
    
	  	//将格式数据添加到项目
		$(".pro_addli").click(function (){
			
			var p_id = this.id;
			var cs_id = $("#source_Select").val();
			var afuxuanK=document.querySelectorAll('.fuxuanK2');
	        var afuxuan=[];
	        for(var i=0;i<afuxuanK.length;i++){
	            afuxuan.push(afuxuanK[i].querySelectorAll('.input_check')[0]);
	        }
	        var sourceDataIds = [];
	        for(var i=0;i<afuxuanK.length;i++){
	        	if(afuxuan[i].checked){
	        		sourceDataIds.push(afuxuan[i].name);
	        	}
	        }
	        if(sourceDataIds == ""){
	        	alert("请勾选源数据！");
	        	return;
	        }
	        $.ajax({
	        	url:"/wankangyuan/projectFormatData/insert",
	        	type:"post",
	        	data:{
	        		p_id:p_id,
	        		sourceDataIds:sourceDataIds.join(",")
	        	},
	        	dataType:"json",
	        	success : function(data){
	        		if(data.result == true){
	        			alert(data.message);
	        		}else{
	        			alert(data.message);
	        		}
	        	},
	        	error : function(){
	        		alert("联网失败");
	        	}
	        });
		});
	  	
	  	//导出源数据
		$(".pro_export").click(function (){
    		var cs_id = $("#source_Select").val();
    		var afuxuanK=document.querySelectorAll('.fuxuanK2');
            var afuxuan=[];
            for(var i=0;i<afuxuanK.length;i++){
                afuxuan.push(afuxuanK[i].querySelectorAll('.input_check')[0]);
            }
            var sourceDataIds = [];
            for(var i=0;i<afuxuanK.length;i++){
            	if(afuxuan[i].checked){
            		sourceDataIds.push(afuxuan[i].name);
            	}
            }
            if(sourceDataIds == ""){
            	alert("请勾选源数据！");
            	return;
            }
            window.location.href="/wankangyuan/export/sourceData?cs_id="+cs_id+"&sourceDataIds="+sourceDataIds;    
    	});
	  	
	  	//更换数据源时，更新列表
	  	$("#source_Select").change(function(){
    		cs_id = $("#source_Select").val();
   			window.location.href="/wankangyuan/sourceData/getSourceDatas?type=1&cs_id="+cs_id;
    	
    	});
	  	
    	//进入到详情页
    	function datainHref(sourceDataId){
    		var cs_id = $("#source_Select").val();
    		window.location.href="/wankangyuan/sourceData/getSourceDataById?cs_id="+cs_id+"&sourceDataId="+sourceDataId+"&type=1";
    	}
    	$('#box').paging({
            initPageNo: ${page}, // 初始页码
            totalPages: Math.ceil(${total}/${rows}), //总页数
            totalCount: '合计&nbsp;' + ${total} + '&nbsp;条数据', // 条目总数
            slideSpeed: 600, // 缓动速度。单位毫秒
            jump: true, //是否支持跳转
            callback: function(page) { // 回调函数
                console.log(page);
            	var user_id=${user.id};
        		var cs_id = $("#source_Select").val();
                if(page!=${page}){
                    window.location.href="/wankangyuan/sourceData/getSourceDatas?type=1&cs_id="+cs_id+"&user_id="+user_id+"&page="+page+"&strip=${rows}";
                }
            }
        });  
    </script>
</body>
</html>