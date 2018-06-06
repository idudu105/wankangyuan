<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script type="text/javascript" src="/wankangyuan/jsp/project/js/project1.js"></script>
<script type="text/javascript">
    window.onload=function(){
        project0();
        project1();
        pro_mine();
    }
</script>
<body>
    <div class="Box">
        <div class="box">
            <div class="top">
                <h1><img src="/wankangyuan/static/img/newlogo2.png" height="70" width="218" alt="" class="logo" /></h1>
                <a href="/wankangyuan/project/selectMyProject">
                    <div class="topT active">项目</div>
                </a>
                <a href="/wankangyuan/sourceData/firstIn?type=1">
                    <div class="topT">格式数据</div>
                </a>
                <a href="/wankangyuan/application/viewMine">
                    <div class="topT">应用</div>
                </a>
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
                    <div class="top2Ctl active">13例结直肠癌病人的基因表达</div>
                    <a href="project_discuss.html"><div class="top2Ctr">讨论版</div></a>
                    <a href="project_member.html"><div class="top2Ctr">成员</div></a>
                    <a href="project_append.html"><div class="top2Ctr">应用结果</div></a>
                    <a href="/wankangyuan/projectApp/selectProjectApp?p_id=${project.id}"><div class="top2Ctr active">应用</div></a>
                    <a href="/wankangyuan/projectFormatData/getSourceDatas?p_id=${project.id}"><div class="top2Ctr">格式数据</div></a>
                    <a href="/wankangyuan/projectFloderFile/selectProjectFloderByProjectId"><div class="top2Ctr">文件</div></a>
                    <a href="/wankangyuan/project/getProjectDetail"><div class="top2Ctr">基本信息</div></a>
                    
                </div>
            </div>
            <div class="shaixuan">
                <div class="shaixuanC">
                    <div class="listZT">
                        <a href="project_app2.jsp">
                            <div class="listZTli listZT1 active">
                                <img src="/wankangyuan/static/img/listZT1.png"alt="" class="listZT1i" />
                                <img src="/wankangyuan/static/img/listZT1.png" alt="" class="listZT1i" />
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
                    
                    <div class="pro_menu pro_rem">移除</div>
                    <div class="pro_menu pro_run">运行</div>
                    <div class="search2">
                        <div class="search2C">
                            <img src="/wankangyuan/static/img/search.png" alt="" class="search2Ci" />
                            <input type="text" class="searchCt"  placeholder="搜索应用" value="${projectSearchWord }"/>
                        </div>
                    </div>
                </div>
                <div class="shaixuanZK">
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">应用名称</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">创建人</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">创建时间</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">是否公开</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">异步/同步</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">关键字</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">应用描述</div>
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
                    <div class="PJListli appname">应用名称</div>
                    <div class="PJListli appcreater">创建人</div>
                    <div class="PJListli apptime">创建时间</div>
                    <div class="PJListli appopen">是否公开</div>
                    <div class="PJListli PJyibu">异步/同步</div>
                    <div class="PJListli PJkeyword">关键字</div>
                    <div class="PJListli appexplain">应用描述</div>
                </div>
                <div class="PJListline"></div>
                
                <div class="PJul">
                <c:forEach items="${projectApplications}" var="app" varStatus="appList">
                    <div class="PJli">
                        <div class="PJliC">
                            <div class="fuxuanK2">
                                <input name="ids" type="checkbox" class="input_check" id="check${appList.count }" value="${app.id }">
                                <label for="check${appList.count }"></label>
                            </div>
                            
                            <div class="PJliCli appname">${app.appName }</div>
                            <div class="PJliCli appcreater">${app.creator }</div>
                            <div class="PJliCli apptime">
                                <fmt:formatDate type="date" value="${app.createTime }" />
                            </div>
                            <div class="PJliCli appopen">${app.status }</div>
                            <div class="PJliCli PJyibu">${app.isAsync}
	                            <c:if test="${app.isAsync eq 0}">同步</c:if>
	                            <c:if test="${app.isAsync eq 1}">异步</c:if>
                            </div>
                            <div class="PJliCli PJkeyword">${app.keywords }</div>
                            <div class="PJliCli appexplain">${app.appOverview }</div>
                            
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
	        	var user_id=${user.id};
	            if(page!=${page}){
	            	var searchWord = $(".searchCt").val();
	            	var p_id = ${project.id};
	                window.location.href="/wankangyuan/projectApp/selectProjectApp?type=1&p_id="+p_id+"&page="+page+"&strip=${rows}&searchWord="+searchWord;
	            }
	        }
	    });
		
		$(".searchCt").bind("keypress" , function(event){
			if(event.keyCode == 13){
				var p_id = ${project.id};
				window.location.href="/wankangyuan/projectApp/selectProjectApp?type=1&p_id="
						+p_id+"&searchWord="+this.value;
				
			}
		});
		
		//移除项目绑定关系
		$(".pro_rem").click(function (){
			var p_id = ${project.id};
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
            $.ajax({
            	url:"/wankangyuan/projectApp/deleteProjectAppRelation",
            	type:"post",
            	data:{
            		p_id:p_id,
            		ids:ids.join(",")
            	},
            	dataType:"json",
            	success : function(data){
            		alert(data.message);
    				window.location.href="/wankangyuan/projectApp/selectProjectApp?type=1&p_id="+p_id;
            	},
            	error : function(){
            		alert("联网失败");
            	}
            });
		});
    </script>
</body>
</html>