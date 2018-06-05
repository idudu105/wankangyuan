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
	window.onload = function() {
		project0();
		project1();
		// pro_mine();
		pro_dataLB();
	}
</script>
<body>
	<div class="Box">
		<div class="box">
			<div class="top">
				<h1>
					<img src="/wankangyuan/static/img/newlogo2.png" height="70" width="218" alt=""
						class="logo" />
				</h1>
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
					<img src="/wankangyuan/static/img/touxiang.png" alt="" class="touxiang" />
				</div>
				<div class="nicheng">Peter</div>
				<div class="yanjiuquan">
					<div class="yanjiuquanT">研究圈</div>
					<img src="/wankangyuan/static/img/redpoint.png" height="11" width="11" alt=""
						class="redpoint" />
				</div>
			</div>
			<div class="top2">
				<div class="top2C">
					<div class="top2Ctl active">${project.p_name}</div>
					<a href="project_discuss.html"><div class="top2Ctr">讨论版</div></a> 
					<a href="project_member.html"><div class="top2Ctr">成员</div></a> 
					<a href="project_append.html"><div class="top2Ctr">应用结果</div></a> 
					<a href="/wankangyuan/projectApp/selectProjectApp?p_id=${project.id}"><div class="top2Ctr">应用</div></a> 
					<a href="/wankangyuan/projectFormatData/getSourceDatas?p_id=${project.id}"><div class="top2Ctr active">格式数据</div></a>
                    <a href="/wankangyuan/projectFloderFile/selectProjectFloderByProjectId"><div class="top2Ctr">文件</div></a>
                    <a href="/wankangyuan/project/getProjectDetail"><div class="top2Ctr">基本信息</div></a>
				</div>
			</div>
			<div class="shaixuan">
				<div class="shaixuanC">
					
					<div class="listZT">
						<div class="listZTli listZT1 active">
							<img src="/wankangyuan/static/img/listZT1.png" alt="" class="listZT1i" />
							<img src="/wankangyuan/static/img/listZT1.png" alt="" class="listZT1i" />
						</div>
						<div class="listZTli listZT2">
							<div class="listZT2d"></div>
							<div class="listZT2d"></div>
							<div class="listZT2d"></div>
						</div>
					</div>
					<div class="jiangeline"></div>
					
					<div class="shaixuanBT">
						<div class="shaixuanBTt">筛选</div>
						<div class="shaixuanBTiK">
							<img src="/wankangyuan/static/img/sanjiao_blue.png" alt="" class="shaixuanBTi" />
						</div>
					</div>

					<div class="pro_menu pro_rem">移除</div>
					
					<select id="source_Select" class="pro_menusel">
						<c:forEach items="${sources}" var="source">
							<option value="${source.cs_id }" >${source.cs_name}</option>
						</c:forEach>						
					</select>
					
					<div class="search2">
						<div class="search2C">
							<img src="/wankangyuan/static/img/search.png" alt="" class="search2Ci" /> <input
								type="text" class="search2Ct" placeholder="搜索数据" />
						</div>
					</div>
				</div>
				<div class="shaixuanZK">
					<c:forEach items="${source.sourceFields}" var="sourceFieldTemp">
						<div class="shaixuanZKli">
							<div class="shaixuanZKliT">${sourceFieldTemp.csf_name}</div>
							<div class="shaixuanZKliI active"></div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="PJK">
				<div class="PJList">
					<div class="allK">
						<div class="allX">
							<!-- <img src="img/greentrue.png" alt="" class="allI" /> -->
						</div>
						<div class="allT">全选</div>
					</div>
					<c:forEach items="${source.sourceFields}" var="sourceFieldTemp">
						<div class="PJListli">${sourceFieldTemp.csf_name}</div>
					</c:forEach>					
				</div>
				<div class="PJListline"></div>
				<div class="PJul">
					<c:forEach items="${sourceDatas}" var="sourceData">
						<div class="PJli">
							<div class="PJliC">
								
								<c:forEach items="${sourceData}" var="sourceDataField" varStatus="status">
								
									<c:if test="${status.index==0}">										
			                            <div class="fuxuanK2">
			                                <input type="checkbox" class="input_check" name="${sourceDataField}" id="check${sourceDataField}">
			                                <label for="check${sourceDataField}"></label>
			                            </div>
									</c:if>
								
									<c:if test="${status.index==1}">										
										<div class="PJliCli2 dataname">
			                                <a href="#" onclick="datainHref('${sourceData[0]}')">
			                                    <span>${sourceDataField}</span>
			                                </a>
			                            </div>
									</c:if>
									
									<c:if test="${status.index!=0 && status.index!=1}">
										<div class="PJliCli2">${sourceDataField}</div>
									</c:if>
									
								</c:forEach>		
							</div>
							<div class="PJliline"></div>

						</div>
					</c:forEach>	 
				</div>

				<div class="BTSX">
					<div class="BTSXc">
						<div class="BTSXcli">
							<div class="BTSXcliT">排序：</div>
							<img src="/wankangyuan/static/img/sort_up.png" alt="" class="BTSXcliI" /> <img
								src="/wankangyuan/static/img/sort_down.png" alt="" class="BTSXcliI" />
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

			<div class="pageK">
				<div class="pageLR">
					<img src="/wankangyuan/static/img/pageL.png" class="pageLRi" alt="" />
				</div>
				<div class="pageNUM active">1</div>
				<div class="pageNUM ">2</div>
				<div class="pageNUM">3</div>
				<div class="pageLR">
					<img src="/wankangyuan/static/img/pageR.png" class="pageLRi" alt="" />
				</div>
			</div>

			<div class="bottom">
				<a href="javascript:;">
					<div class="bot_guanwang">公司官网</div>
				</a> <a href="javascript:;">
					<div class="bot_guanyu">关于</div>
				</a> <a href="javascript:;">
					<div class="bot_jianyi">反馈建议</div>
				</a>
				<div class="botT">Copyright @2018天津万康源科技有限公司</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="/wankangyuan/static/js/jquery.min.js"></script>
	<script type="text/javascript">
		
    	//进入到详情页
    	function datainHref(sourceDataId){
    		var cs_id = $("#source_Select").val();
    		window.location.href="/wankangyuan/projectFormatData/getSourceDataById?cs_id="+cs_id+"&sourceDataId="+sourceDataId;
    	}
    	
    	
    	$("#source_Select").change(function(){
    		cs_id = $("#source_Select").val();
    		var p_id = ${project.id};
   			window.location.href="/wankangyuan/projectFormatData/getSourceDatas?p_id="+p_id+"&cs_id="+cs_id;
    	
    	});
    	
    	$(".pro_rem").click(function (){
    		
			var p_id = ${project.id};
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
            	url:"/wankangyuan/projectFormatData/remove",
            	type:"post",
            	data:{
            		p_id:p_id,
            		sourceDataIds:sourceDataIds.join(",")
            	},
            	dataType:"json",
            	success : function(data){
            		if(data.result == true){
            			alert(data.message);
                		var p_id = ${project.id};
               			window.location.href="/wankangyuan/projectFormatData/getSourceDatas?p_id="+p_id+"&cs_id="+cs_id;
            		}else{
            			alert(data.message);
            		}
            	},
            	error : function(){
            		alert("联网失败");
            	}
            });
    	});
		
	</script>


</body>
</html>