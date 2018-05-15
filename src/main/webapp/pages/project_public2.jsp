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
        project2();
        pro_mine();
    }
</script>
<body>
    <div class="Box">
        <div class="box">
            <div class="top">
                <h1><img src="/wankangyuan/static/newlogo2.png" height="70" width="218" alt="" class="logo" /></h1>
                <a href="/wankangyuan/project/selectMyProject?user_id=1">
                	<div class="topT active">项目</div>
                </a>
                <div class="topT">格式数据</div>
                <a href="/wankangyuan/application/viewMine">
                    <div class="topT ">应用</div>
                </a>
                <div class="touxiangK">
                    <img src="/wankangyuan/static/touxiang.png" alt="" class="touxiang" />
                </div>
                <div class="nicheng">Peter</div>
                <div class="yanjiuquan">
                    <div class="yanjiuquanT">研究圈</div>
                    <img src="/wankangyuan/static/redpoint.png" height="11" width="11" alt="" class="redpoint" />
                </div>
            </div>
            <div class="top2">
                <div class="top2C">
                    <a href="/wankangyuan/project/selectMyProject?user_id=1"><div class="top2Cli">我的</div></a>
                    <a href="/wankangyuan/project/selectCreatedProject?creator=1"><div class="top2Cli">我创建的</div></a>
                    <a href="javascript:;"><div class="top2Cli top2CliYJ">公共</div></a>
                    <div class="search">
                        <div class="searchC">
                            <img src="/wankangyuan/static/search.png" alt="" class="searchCi" />
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
                                <img src="/wankangyuan/static/listZT1.png"alt="" class="listZT1i" />
                                <img src="/wankangyuan/static/listZT1.png" alt="" class="listZT1i" />
                            </div>
                        </a>
                        <a href="project_public.jsp">
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
                            <img src="/wankangyuan/static/sanjiao_blue.png" alt="" class="shaixuanBTi" />
                        </div>
                    </div>
                    <div class="jiangeline"></div>
                    <div class="allK">
                         <div class="quanxuanK">
                            <input type="checkbox" class="input_check" id="check0">
                            <label for="check0"></label>
                        </div>
                        <div class="allT">全选</div>
                    </div>
                    <div class="pro_menu pro_addtomy" onclick="addToMine()">添加至我的</div>
                </div>
            </div>
            <div class="PJK2">
            	<c:forEach items="${projects}" var="project">
            	
		            <div class="PJK2li">
	                    <div class="PJK2litop">
	                        <a href="/wankangyuan/project/getProjectDetail?id=${project.id}">
	                            <div class="PJK2litopT">${project.p_name}</div>
	                        </a>
	                        <div class="fuxuanK3">
	                                <input type="checkbox" class="input_check" id="check${project.id}" value="${project.id}">
	                                <label for="check${project.id}"></label>
	                        </div>
	                    </div>
	                    <div class="PJK2licre">
	                        <div class="PJK2licreT1">创建人：</div>
	                        <div class="PJK2licreT2">${project.creator }</div>
	                    </div>
	                    <div class="PJK2litime">
	                        <div class="PJK2litimeT1">${project.create_datetime }</div>
	                    </div>
	                    <div class="PJK2lidetail">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet</div>
	                </div>    
	                	
                </c:forEach>
            </div>

            <div class="pageK">
                <div class="pageLR">
                    <img src="/wankangyuan/static/img/pageL.png" class="pageLRi" alt="" />
                </div>
                <div class="pageNUM active">1</div>
                <div class="pageLR">
                    <img src="/wankangyuan/static/img/pageR.png" class="pageLRi" alt="" />
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
    	//点击添加到我的项目之中
    	function addToMine(){
    		var afuxuanK=document.querySelectorAll('.fuxuanK3');
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
            	alert("请勾选项目！");
            	return;
            }
            
            //网络请求添加公共项目到我的项目中
            $.ajax({
            	url:"/wankangyuan/project/addPublicProjectToMine",
            	type:"post",
            	data:{
            		ids:ids.join(",")
            	},
            	dataType:"json",
            	success : function(data){
            		if(data.result == true){
            			window.location.href="/wankangyuan/project/selectMyProject?user_id=1";
            		}else{
            			alert(data.message);
            			window.location.href="/wankangyuan/project/selectMyProject?user_id=1";
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