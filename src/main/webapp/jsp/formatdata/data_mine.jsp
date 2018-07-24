<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
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
<link rel="stylesheet" type="text/css"
	href="/wankangyuan/static/css/project1.css" />
<script type="text/javascript"
	src="/wankangyuan/jsp/formatdata/js/project1.js"></script>

<script type="text/javascript">
    window.onload=function(){
        project0();
        project1();
        pro_dataLB();
        pro_data();
        data_mine()
    }
</script>
<body>
	<div class="Box">
		<div class="box">
			<div class="top">
				<h1>
					<img src="/wankangyuan/static/img/newlogo2.png" height="70"
						width="218" alt="" class="logo" />
				</h1>
				<a href="/wankangyuan/project/selectMyProject">
					<div class="topT">项目</div>
				</a> <a href="/wankangyuan/sourceData/getSourceDatas?type=1">
					<div class="topT active">格式数据</div>
				</a> <a href="/wankangyuan/application/viewMine">
					<div class="topT ">应用</div>
				</a>
				<div class="touxiangK">
					<a href="/wankangyuan/userInfo"> <img src="${user.headimg }"
						onerror='this.src="/wankangyuan/static/img/head.jpg"'
						}"
						alt="" class="touxiang" />
					</a>
					<div class="userbutK">
						<a href="/wankangyuan/userInfo">
							<div class="userbut">用户信息</div>
						</a> <a href="/wankangyuan/message/viewMessage">
							<div class="userbut">
								系统消息
								<c:if test="${systemMSG }">
									<img
										src="<%=request.getContextPath()%>/static/img/redpoint.png"
										height="11" width="11" alt="" class="redpoint2" />
								</c:if>
							</div>
						</a>
						<div class="userbutline"></div>
						<a href="/wankangyuan/logout">
							<div class="userbut">退出登录</div>
						</a>
					</div>
				</div>
				<div class="nicheng">
					<shiro:principal />
				</div>
				<a href="/wankangyuan/friends/viewFriendsManage">
					<div class="yanjiuquan">
						<div class="yanjiuquanT">研究圈</div>
						<c:if test="${friendMSG}">
							<img src="<%=request.getContextPath()%>/static/img/redpoint.png"
								height="11" width="11" alt="" class="redpoint" />
						</c:if>
					</div>
				</a>
			</div>

			<div class="top2">
				<div class="top2C">
					<a href="/wankangyuan/sourceData/getSourceDatas?type=1">
						<div class="top2Cli top2CliYJ">我的</div>
					</a> <a href="/wankangyuan/sourceData/getSourceDatas?type=2">
						<div class="top2Cli">我创建的</div>
					</a> <a href="/wankangyuan/sourceData/getSourceDatas?type=3">
						<div class="top2Cli">公共</div>
					</a>
					<div class="search">
						<div class="searchC">
							<img src="/wankangyuan/static/img/search.png" alt=""
								class="searchCi"  onclick="searchFirst()"/> <input type="text" class="searchCt"
								placeholder="搜索数据" value="${searchFirstWord}" />
						</div>
					</div>
				</div>
			</div>
			<div class="shaixuan">
				<div class="shaixuanC">
					<div class="listZT">
						<a href="#">
							<div class="listZTli listZT1 active">
								<img src="/wankangyuan/static/img/listZT1.png" alt=""
									class="listZT1i" /> <img
									src="/wankangyuan/static/img/listZT1.png" alt=""
									class="listZT1i" />
							</div>
						</a> <a href="javascript:;">
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
							<img src="/wankangyuan/static/img/sanjiao_blue.png" alt=""
								class="shaixuanBTi" />
						</div>
					</div>
					<div class="pro_menu pro_addK">
						<div class="pro_addk">
							<div class="pro_addT">添加至项目</div>
							<div class="pro_addI"></div>
						</div>
					</div>
					<div class="pro_menu pro_rem" id="removeSourceDatas">移出</div>
					<div class="pro_menu pro_export" style="display: none;">导出</div>
					<!-- 展示数据源列表 ， 需要为select 的option 的onclick设置事件监听-->
					<select id="source_Select" class="pro_menusel">
						<c:forEach items="${sources}" var="sourcel">
							<c:if test="${sourcel.cs_id!=source.cs_id}">
								<option value="${sourcel.cs_id}">${sourcel.cs_name}</option>
							</c:if>
							<c:if test="${sourcel.cs_id==source.cs_id}">
								<option value="${sourcel.cs_id}" selected="selected">${sourcel.cs_name}</option>
							</c:if>
						</c:forEach>
					</select>

				</div>
				<div class="pro_addul">
					<c:forEach items="${projects}" var="projectTemp">
						<div class="pro_addli" id="${projectTemp.id }">${projectTemp.p_name}</div>
					</c:forEach>
				</div>
				<div class="shaixuanZK">
					<div class="shaixuanZKC">
						<c:forEach items="${source.sourceFields}" var="sourceFieldTemp">
							<div class="shaixuanZKli">
								<div class="shaixuanZKliI active"></div>
								<div class="shaixuanZKliT">${sourceFieldTemp.csf_name}</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="PJK">
				<div class="PJList">
					<div class="allK">
						<div class="quanxuanK">
							<input type="checkbox" class="input_check" name="0" id="check0">
							<label for="check0"></label>
						</div>
						<div class="allT">全选</div>
					</div>
					<c:forEach items="${source.sourceFields}" var="sourceFieldTemp">
						<div class="PJListli" id="${sourceFieldTemp.csf_id}">${sourceFieldTemp.csf_name}</div>
					</c:forEach>
				</div>
				<div class="PJListline"></div>
				<div class="PJul">
					<c:forEach items="${sourceDatas}" var="sourceData">
						<div class="PJli">
							<div class="PJliC">

								<c:forEach items="${sourceData}" var="sourceDataField"
									varStatus="status">

									<c:if test="${status.index==0}">
										<div class="fuxuanK2">
											<input type="checkbox" class="input_check"
												name="${sourceDataField}" id="check${sourceDataField}">
											<label for="check${sourceDataField}"></label>
										</div>
									</c:if>

									<c:if test="${status.index!=0}">
										<a href="#" onclick="datainHref('${sourceData[0]}')">
											<div class="PJliCli2">
												<span>${sourceDataField}</span>
											</div>
										</a>
									</c:if>

									<%-- <c:if test="${status.index!=0 && status.index!=1}">
										<div class="PJliCli2">${sourceDataField}</div>
									</c:if> --%>

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
							<img src="/wankangyuan/static/img/sort_up.png" alt=""
								class="BTSXcliI" /> <img
								src="/wankangyuan/static/img/sort_down.png" alt=""
								class="BTSXcliI" />
						</div>
						<div class="BTSXcli">
							<div class="BTSXcliT">过滤：</div>
							<input type="text" class="BTSXcliGLK" />
							<button id="guolv">过滤</button>
						</div>
						<div class="BTSXcli">
							<div class="BTSXcliT">值筛选：</div>
						</div>
						<div class="BTSXcli2">
							<div class="BTSXcli2li">
								<input type="checkbox" class="BTSXcli2liI" />
								<div class="BTSXcli2liT">空值</div>
							</div>
						</div>
						<div class="BTSXcli3">
							<div class="BTSXcli3BT BTSXcli3BTent" onclick="shaixuan(1)">筛选</div>
							<div class="BTSXcli3BT BTSXcli3BTres" onclick="chongzhi()">重置</div>
						</div>
					</div>
				</div>
			</div>

			<div class="pageK" id="box"></div>

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
			<div id="oldCondition" style="display: none;">${oldCondition}</div>
		</div>
	</div>

	<script type="text/javascript"
		src="/wankangyuan/static/js/jquery.min.js"></script>
	<script type="text/javascript" src="/wankangyuan/static/js/paging.js"></script>
	<script type="text/javascript">

	var cs_id=$('#source_Select').val();
	var searchId="${searchId}";
	var searchWord="";
	var desc_asc="${desc_asc}";
	var oldCondition=$("#oldCondition").html();
	var page="${page}";
	var searchFirstWord=$(".searchCt").val();
	$("#source_Select").change(function(){
		cs_id = $("#source_Select").val();
			window.location.href="/wankangyuan/sourceData/getSourceDatas?type=1&cs_id="+cs_id;
	
	});

	$('.PJListli').click(function(){
		searchId = $(this).attr('id');
	});
	//全搜索
	function searchFirst(){
		reset();
		searchFirstWord=$(".searchCt").val();
		window.location.href="/wankangyuan/sourceData/getSourceDatas?type=1&cs_id="
				+cs_id+"&searchFirstWord="+searchFirstWord;
	}
    $(".searchCt").bind("keypress" , function(event){
    	searchFirstWord=this.value;
		if(event.keyCode == 13){
			reset();
			window.location.href="/wankangyuan/sourceData/getSourceDatas?type=1&cs_id="
					+cs_id+"&searchFirstWord="+this.value;
			
		}
	});
  //点击过滤按钮
	$("#guolv").click(function (){
		//过滤
		filter();
	});

	$('.BTSXcliGLK').keypress(function(e){		
		if (e.keyCode == 13) {
			filter();
		}
	})
	function filter(){
		searchWord=$(".BTSXcliGLK").val();//过滤条件
		$.ajax({
			type:"post",
			url:"/wankangyuan/sourceData/getSourceFieldDatas",
			async:true,
			data:{
				type:1,
				cs_id:$('#source_Select').val(),
				searchId:searchId,
				searchWord:searchWord,
        		oldCondition:oldCondition
			},
			success:function(res){
				if (res.result) {
					var htmlStr =  '<div class="BTSXcli2li">'
									+'<input type="checkbox" class="BTSXcli2liI" />'
									+'<div class="BTSXcli2liT">空值</div>'
								+'</div>'
								+'<div class="BTSXcli2li">'
								+	'<input type="checkbox" class="BTSXcli2liI"  style="display: none;"/>'
								+'</div>';
					var data = res.csfDatas;
					for (var i in data) {
						htmlStr += '<div class="BTSXcli2li">'
								+		'<input type="checkbox" class="BTSXcli2liI" />'
								+		'<div class="BTSXcli2liT">' + data[i] + '</div>'
								+	'</div>';
					}
					$('.BTSXcli2').html(htmlStr);
				}
			}
		});
	};
	
	var oBTSXcliI1=document.querySelectorAll('.BTSXcliI')[0];
	var oBTSXcliI2=document.querySelectorAll('.BTSXcliI')[1];
	oBTSXcliI1.onclick=function(){
		desc_asc="ASC";
		window.location.href="/wankangyuan/sourceData/getSourceDatas?type=1&cs_id="+cs_id+"&searchId="+searchId+
		"&desc_asc="+desc_asc+"&searchWord="+searchWord+"&oldCondition="+oldCondition;
	}

	oBTSXcliI2.onclick=function(){
		desc_asc="DESC";
		window.location.href="/wankangyuan/sourceData/getSourceDatas?type=1&cs_id="+cs_id+"&searchId="+searchId+
		"&desc_asc="+desc_asc+"&searchWord="+searchWord+"&oldCondition="+oldCondition;
	}
	function updown(sc){
		desc_asc=sc;
	    window.location.href="/wankangyuan/sourceData/getSourceDatas?type=1&cs_id="+cs_id+"&searchId="+searchId+
	    		"&desc_asc="+desc_asc+"&searchWord="+searchWord+"&oldCondition="+oldCondition;
	}

	//重置，清空累加筛选条件
	function chongzhi(){
		reset();
		shaixuan(0);
	}		
	function reset(){
		$('#oldCondition').html('');
		oldCondition="";
		$.ajax({
			type:"post",
			url:"/wankangyuan/sourceData/reset",
			async:true,
			data:{					
			},
			success:function(data){
				/* if (data.result) {
					alert(data.message);
				} */
			}
		});
		
	}

	function shaixuan(likeSearch){
		var afuxuanK=document.querySelectorAll('.BTSXcli2li');
        var chooseDatasArr = [];
        for(var i=0;i<afuxuanK.length;i++){
        	if(afuxuanK[i].querySelectorAll('.BTSXcli2liI')[0].checked){
        		chooseDatasArr.push(afuxuanK[i].querySelectorAll('.BTSXcli2liT')[0].innerHTML);
        	}
        }
        var chooseDatas=chooseDatasArr.join(",");
    	window.location.href="/wankangyuan/sourceData/getSourceDatas?type=1&cs_id="+cs_id+"&searchId="+
		searchId+"&desc_asc="+desc_asc+"&likeSearch="+likeSearch
		+"&searchWord="+searchWord+"&chooseDatas="+chooseDatas+"&oldCondition="+oldCondition;
	}
	
	
	$("#removeSourceDatas").click(function (){
		
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
        	alert("请勾选待移出的选项！");
        	return;
        }
        var result = confirm("确认移出选中的数据源数据吗？");
		if(result == true){
			var cs_id = $("#source_Select").val();
            $.ajax({
            	url:"/wankangyuan/sourceData/removeSourceDatas",
            	type:"post",
            	data:{
            		sourceDataIds:ids.join(","),
            		cs_id:cs_id
            	},
            	dataType:"json",
            	success : function(data){
            		if(data.result == true){
            			alert(data.message);
            			  window.location.href="/wankangyuan/sourceData/getSourceDatas?type=1&cs_id="+cs_id+"&searchId="+searchId+
          	    		"&desc_asc="+desc_asc+"&searchWord="+searchWord+"&oldCondition="+oldCondition+"&page="+page+"&strip=${rows}";

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

	  	//将格式数据添加到项目
		$(".pro_addli").click(function (){
			
			var p_id = this.id;
			//var cs_id = $("#source_Select").val();
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
				async:true,
	        	data:{
	        		p_id:p_id,
	        		sourceDataIds:sourceDataIds.join(","),
            		cs_id:cs_id
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
	  	
	  /* 	//导出源数据
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
    	}); */
	  	
	  	
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
                	window.location.href="/wankangyuan/sourceData/getSourceDatas?type=1&cs_id="+cs_id+"&searchId="+searchId+
    	    		"&desc_asc="+desc_asc+"&searchWord="+searchWord+"&oldCondition="+oldCondition+"&page="+page+"&strip=${rows}";
                }
            }
        });  
    </script>

</body>
</html>