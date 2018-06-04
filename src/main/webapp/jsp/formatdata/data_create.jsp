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
<script type="text/javascript" src="/wankangyuan/jsp/formatdata/js/project1.js"></script>

<script type="text/javascript">
    window.onload=function(){
        project0();
        project1();
        pro_dataLB();
        pro_data();
        data_mine();
        data_create();
    }
</script>
<body>
    <div class="Box">
        <div class="box">
            <div class="top">
                <h1><img src="/wankangyuan/static/img/newlogo2.png" height="70" width="218" alt="" class="logo" /></h1>
                <a href="/wankangyuan/project/selectMyProject">
                	<div class="topT">项目</div>
                </a>
                <a href="/wankangyuan/sourceData/firstIn?type=1">
                    <div class="topT active">格式数据</div>
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
                    <a href="/wankangyuan/sourceData/firstIn?type=1"><div class="top2Cli">我的</div></a>
                    <a href="/wankangyuan/sourceData/firstIn?type=2"><div class="top2Cli top2CliYJ">我创建的</div></a>
                    <a href="/wankangyuan/sourceData/firstIn?type=3"><div class="top2Cli">公共</div></a>
                    <!--
                    <div class="search">
                        <div class="searchC">
                            <img src="/wankangyuan/static/img/search.png" alt="" class="searchCi" />
                            <input type="text" class="searchCt"  placeholder="搜索项目" />
                        </div>
                    </div>
                    -->
                </div>
            </div>
            <div class="shaixuan">
                <div class="shaixuanC">
                    <div class="listZT">
                        <a href="#">
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
                    <div class="pro_menu pro_addK">
                        <div class="pro_addk">
                            <div class="pro_addT">添加至项目</div>
                            <div class="pro_addI"></div>
                        </div>
                    </div>
                    <div class="pro_menu pro_open">公开</div>
                    <div class="pro_menu pro_canopen">取消公开</div>
                    <div class="pro_menu pro_inport">导入</div>
                    <div class="pro_menu pro_export">导出</div>
                    <div class="pro_menu pro_rem" id="deleteSourceDatas">移除</div>
                    <div class="pro_menu pro_adddata">+添加源数据</div>
                   	<select name="" id="source_Select" class="pro_menusel" >
						<c:forEach items="${sources}" var="source">
							<option value="${source.cs_id }" >${source.cs_name}</option>
						</c:forEach>						
					</select>
                </div>
                <div class="pro_addul">
                	<c:forEach items="${projects}" var="projectTemp">
						<div class="pro_addli" id="${projectTemp.id }" >${projectTemp.p_name}</div>
					</c:forEach>
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
                <div class="inportK">
                    <div class="inportT">
                        <div class="inportTt">导入数据</div>
                        <div class="inportTx"></div>
                    </div>
                    <div class="inportM">
                        <div class="inportMt">请把相关数据按照分类准确输入到EXCEL表格模板中，上传数据后，表格会自动配置相关内容。</div>

                        <a href="#" class="inportMz inportMd" id="downloadExcelMode">下载EXCEL模板</a>
                        <div class="inportMz inportMu">上传数据</div>
                        <input type="file" class="inportMf" id="inportMf" onchange="upFile()"/>
                    </div>
                </div>
                
                
                <div class="adddataK">
                    <div class="adddataT">
                        <div class="adddataTt">添加源数据</div>
                        <div class="adddataTx"></div>
                    </div>
                    <div class="adddataM" id="adddataM">
                    </div>
                    <div class="adddataB">
                        <input type="button" class="adddataBb" value="提交" />
                    </div>
                </div>
                
                
                <div class="PJList">
                    <div class="allK">
                        <div class="quanxuanK">
                            <input type="checkbox" class="input_check" name="0" id="check0">
                            <label for="check0"></label>
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
    
    	$("#deleteSourceDatas").click(function (){
    			
    			var afuxuanK=document.querySelectorAll('.fuxuanK2');
                var afuxuan=[];
                for(var i=0;i<afuxuanK.length;i++){
                    afuxuan.push(afuxuanK[i].querySelectorAll('.input_check')[0]);
                }
                var ids = [];
                for(var i=0;i<afuxuanK.length;i++){
                	if(afuxuan[i].checked){
                		ids.push(afuxuan[i].name);
                	}
                }
                if(ids == ""){
                	alert("请勾选待删除的选项！");
                	return;
                }
                var result = confirm("确认删除选中的数据源数据吗？");
        		if(result == true){
        			var cs_id = $("#source_Select").val();
                    $.ajax({
                    	url:"/wankangyuan/sourceData/deleteSourceDatas",
                    	type:"post",
                    	data:{
                    		sourceDataIds:ids.join(","),
                    		cs_id:cs_id
                    	},
                    	dataType:"json",
                    	success : function(data){
                    		if(data.result == true){
                    			alert(data.message);
                    			window.location.href="/wankangyuan/sourceData/firstIn?type=2";
                    		}else{
                    			alert(data.message);
                    		}
                    	},
                    	error : function(){
                    		alert("联网失败");
                    	}
                    });
        		}else{
        			return;
        		}
    	});
    	
    	//进入到详情页
    	function datainHref(sourceDataId){
    		var cs_id = $("#source_Select").val();
    		window.location.href="/wankangyuan/sourceData/getSourceDataById?cs_id="+cs_id+"&sourceDataId="+sourceDataId+"&type=2";
    	}
    	
    	$("#source_Select").change(function(){
    		cs_id = $("#source_Select").val();
   			window.location.href="/wankangyuan/sourceData/getSourceDatas?type=2&cs_id="+cs_id;
    	
    	});
    	
    	$(".pro_open").click(function (){
    		
    		var afuxuanK=document.querySelectorAll('.fuxuanK2');
    		
            var afuxuan=[];
            for(var i=0;i<afuxuanK.length;i++){
                afuxuan.push(afuxuanK[i].querySelectorAll('.input_check')[0]);
            }
            
            var ids = [];
            for(var i=0;i<afuxuanK.length;i++){
            	if(afuxuan[i].checked){
            		ids.push(afuxuan[i].name);
            	}
            }
            
            if(ids == ""){
            	alert("请勾选待公开的选项！");
            	return;
            }
            var cs_id = $("#source_Select").val();
            
    		$.ajax({
    			url:"/wankangyuan/sourceData/open",
    			type:"post",
    			data:{
    				cs_id:cs_id,
    				sourceDataIds:ids.join(",")
    			},
    			success : function(data){
    				alert(data.message);
    			},
    			error : function(){
    				alert("联网失败");
    			}
    			
    		});
            
    	});
    	
    	
    	$(".pro_canopen").click(function (){
    		
    		var afuxuanK=document.querySelectorAll('.fuxuanK2');
    		
            var afuxuan=[];
            for(var i=0;i<afuxuanK.length;i++){
                afuxuan.push(afuxuanK[i].querySelectorAll('.input_check')[0]);
            }
            
            var ids = [];
            for(var i=0;i<afuxuanK.length;i++){
            	if(afuxuan[i].checked){
            		ids.push(afuxuan[i].name);
            	}
            }
            
            if(ids == ""){
            	alert("请勾选待公开的选项！");
            	return;
            }
            var cs_id = $("#source_Select").val();
            
    		$.ajax({
    			url:"/wankangyuan/sourceData/notOpen",
    			type:"post",
    			data:{
    				cs_id:cs_id,
    				sourceDataIds:ids.join(",")
    			},
    			success : function(data){
    				alert(data.message);
    			},
    			error : function(){
    				alert("联网失败");
    			}
    			
    		});
            
    	});
    	
    	$("#downloadExcelMode").click(function (){
    		var cs_id = $("#source_Select").val();
    		window.location.href="/wankangyuan/export/sourceDataModel?cs_id="+cs_id;
    	});
    	
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
    	
    	function upFile(){
    		var cs_id = $("#source_Select").val();
    		var file = document.getElementById("inportMf").files[0];
            var formdata = new FormData();
            formdata.append('file', file);
    		$.ajax({
	            url: '/wankangyuan/import/sourceData?cs_id='+cs_id,
	            type: 'POST',
	            data: formdata,
	            async: false,
	            cache: false,
	            contentType: false,
	            processData: false,
	            success: function (data) {
	            	if(data.result == false){
	            		alert(data.message)
	            	}else{
	            		window.location.href="/wankangyuan/sourceData/firstIn?type=2";
	            	}
	            },
	            error: function () {
	            	alert("联网失败");
	            }
	        });
    	}
    	
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
            	url:"/wankangyuan/projectData/insert",
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
    
    </script>

</body>
</html>