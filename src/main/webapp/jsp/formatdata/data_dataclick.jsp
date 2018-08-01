

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
        // pro_mine();
        // pro_dataLB();
        pro_dataclick();
        //data_dataclick();
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
				</a> <a href="/wankangyuan/sourceData/firstIn?type=1">
					<div class="topT active">格式数据</div>
				</a> <a href="/wankangyuan/application/viewMine">
					<div class="topT">应用</div>
				</a>
				<div class="touxiangK">
					<a href="/wankangyuan/userInfo"> <img src="${user.headimg }"
						onerror='this.src="/wankangyuan/static/img/head.jpg"' }" alt=""
						class="touxiang" />
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
					<div class="top2Ctl active">
						<a
							href="/wankangyuan/sourceData/getSourceDataById?cs_id=${formatTypeFolders[0].cs_id}&sourceDataId=${sourceDataId}&type=${type123}">
							<img src="/wankangyuan/static/img/back.png" height="20"
							width="20" alt="" class="backI" />
						</a>${sourceData[1]} <input id="cs_id"
							value="${formatTypeFolders[0].cs_id }" style="display: none;" />
						<input id="ft_id" value="${data[0].ft_id }" style="display: none;" />
						<input id="formatNodeId" value="${formatNodeId}"
							style="display: none;" /> <input id="sourceDataId"
							value="${sourceDataId}" style="display: none;" />
					</div>

					<div class="data_to_proK" style="display: none;">
						<div class="pro_menu pro_addK">
							<div class="pro_addk">
								<div class="pro_addT">添加结点至项目</div>
							</div>
						</div>
					</div>


					<div class="app_expexport app_expexport_node"  style="display: none;">导出结点</div>
					<div class="app_expexport app_expexport_type"  style="display: none;">导出格式类型</div>
				</div>
			</div>
			<div class="pro_addul">
				<c:forEach items="${projects}" var="projectTemp">
					<div class="pro_addli" id="${projectTemp.id }">${projectTemp.p_name}</div>
				</c:forEach>
			</div>
			<div class="prodainm">
				<div class="prodainmL">
					<div class="PJliBK">
						<c:forEach items="${formatTypeFolders}" var="formatTypeTemp"
							varStatus="status">
							<div class="PJliB1">
								<div class="PJliB1L">
									<div class="fuxuanK4 fuxuanK41">
										<input type="checkbox" class="input_check"
											name="${formatTypeTemp.ft_id }"
											id="check1_${formatTypeTemp.ft_id }"> <label
											for="check1_${formatTypeTemp.ft_id }"></label>
									</div>
									<div class="PJliB1Lt">${formatTypeTemp.ft_name }</div>
									<div class="PJliBLi PJliBLi2"></div>
								</div>
								<div class="PJliBR">
									<c:forEach items="${formatTypeTemp.formatDataNodes}"
										var="formatDataNodeTemp" varStatus="status">
										<div class="PJliB2">
											<div class="PJliB2L">
												<div class="fuxuanK4 fuxuanK42">
													<input type="checkbox" class="input_check"
														value="${formatTypeTemp.ft_id }"
														name="${formatDataNodeTemp.key}"
														id="check1_${formatDataNodeTemp.key}"> <label
														for="check1_${formatDataNodeTemp.key}"></label>
												</div>
												<div class="PJliB2Lt" id="${formatDataNodeTemp.key}"
													onclick="dataNodeClick('${formatDataNodeTemp.key}','${formatTypeTemp.ft_id }')">${formatDataNodeTemp.value}
												</div>

											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>


				<div class="prodaclmR">
					<div class="prodaclmRz">
					    <table class="PJul" >
					    <tr class="PJList">

							<td><div class="prodaclmRzTt prodaclmRzTtmz">名称</div></td>
							<td><div class="prodaclmRzTt prodaclmRzTtmz">内容</div></td>
						</tr>
							<c:forEach items="${metaDatas}" var="metaDataListTemp">
						 <tr class="PJli">
									<td><div class="prodaclmRzBzt prodaclmRzTtmz">${metaDataListTemp[1] }</div></td>
									<td><div class="prodaclmRzBzt prodaclmRzTtmz">
										${metaDataListTemp[2] }</div></td>
						</tr>
							</c:forEach>
						</table>
					</div>
					<br>

					<div class="pro_addul">
						<c:forEach items="${projects}" var="projectTemp">
							<div class="pro_addli" id="${projectTemp.id }">${projectTemp.p_name}</div>
						</c:forEach>
					</div>
					<div class="prodaclmRz2">
						<div class="prodaclmRsxK">
							<div class="pro_menu pro_addK"  style="display: none;">
								<div class="pro_addk">
									<div class="pro_addT">添加至项目</div>
									<div class="pro_addI"></div>
								</div>
							</div>
							<div class="search">
								<div class="searchC">
									<img src="/wankangyuan/static/img/search.png" alt=""
										class="searchCi" /> <input type="text" class="searchCt"
										placeholder="搜索数据" value="${searchFirstWordNode}" />
								</div>
							</div>

							<div class="prodaclmRsx">
								<div class="prodaclmRsxT">筛选</div>
								<img src="/wankangyuan/static/img/sanjiao_blue.png" alt=""
									class="prodaclmRsxI" />
							</div>
						</div>
						<div class="shaixuanZK">
							<div class="shaixuanZKC">
								<c:forEach items="${data}" var="dataTemp">
									<div class="shaixuanZKli">
										<div class="shaixuanZKliI active"></div>
										<div class="shaixuanZKliT">${dataTemp.ff_name }</div>
									</div>
								</c:forEach>
							</div>
						</div>

						<div class="prodaclmRsjK">
						<table class="PJul" >
                        <tr class="PJList">
                            <td>
								<div class="quanxuanK fxK1">
									<input type="checkbox" class="input_check" id="check4_0">
									<label for="check4_0"></label>
								</div>
								</td>
								<c:forEach items="${data}" var="dataTemp">
									<td><div class="prodaclmRzTt2" id="${dataTemp.ff_id}">${dataTemp.ff_name }</div></td>
								</c:forEach>
							</tr>

								<c:forEach items="${dataDatas}" var="dataDataTemp">
									<tr class="PJli">
										<c:forEach items="${dataDataTemp}" var="dataDataTempTemp"
											varStatus="status">
											<c:if test="${status.index == 0 }">
											<td>
												<div class="fuxuanK5 fxK1 fx4">
													<input type="checkbox" class="input_check"
														name="${dataDataTempTemp}" id="check4_${dataDataTempTemp}">
													<label for="check4_${dataDataTempTemp}"></label>
												</div>
										      </td>
											</c:if>
											<c:if test="${status.index != 0 }">
												<%-- <div class="prodaclmRzTt3 prodaclmRzTtsj3">${dataDataTempTemp}</div>
											 --%>
												<td><div class="prodaclmRzTt3">
													<span>${dataDataTempTemp}</span>
												</div></td>
											</c:if>
										</c:forEach>
									</tr>
								</c:forEach>
							</table>
								<div class="pageK" id="box"></div>
						</div>

						<div class="BTSX2">
							<div class="BTSXc">
								<div class="BTSXcli">
									<div class="BTSXcliT">排序：</div>
									<img src="/wankangyuan/static/img/sort_up.png" alt=""
										class="BTSXcliI" /> <img
										src="/wankangyuan/static/img/sort_down.png" alt=""
										class="BTSXcliI" /> <input type="text" class="BTSXcliIpd"
										style="display: none;" />
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
									<div class="BTSXcli3BT BTSXcli3BTent" onclick="chongzhi()">重置</div>
								</div>
							</div>
						</div>
					</div>
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
			<div id="oldCondition" style="display: none;">${oldCondition}</div>
		</div>
	</div>

	<script type="text/javascript"
		src="/wankangyuan/static/js/jquery.min.js"></script>

	<script type="text/javascript" src="/wankangyuan/static/js/paging.js"></script>
	<script type="text/javascript">
    var cs_id="${cs_id}";//采集源id
	var searchId="${searchId}";//操作字段id
	var searchWord="";//搜索词
	var desc_asc="${desc_asc}";//排序
	var oldCondition=$("#oldCondition").html();//累加筛选条件
	var page="${page}";//页码
	var ft_id = $('#ft_id').val();//类型id
	var nodeName = $("#dataNodeTextArea").val();//结点名
	var sourceDataId = $("#sourceDataId").val();//源数据id
	var formatNodeId = $("#formatNodeId").val();//结点id
	
	var fanhui='check1_'+formatNodeId;
    var fanhuiID=document.getElementById(fanhui);
    var IDparent1=fanhuiID.parentNode;
    var IDparent2=IDparent1.parentNode;
    var owenben=IDparent2.querySelectorAll('.PJliB2Lt')[0];
    owenben.style.color="#16579b";
	//更换采集源，刷新页面
	//选择待操作字段
	$('.prodaclmRzTt2').click(function(){
		searchId = $(this).attr('id');
	});
	//全搜索
    $(".searchCt").bind("keypress" , function(event){
		if(event.keyCode == 13){
			reset();
			window.location.href="/wankangyuan/formatNode/getFormatNodeById?cs_id="+cs_id
					+"&sourceDataId="+sourceDataId+"&type=1&ft_id="+ft_id+"&formatNodeId="+formatNodeId
					+"&searchFirstWord="+this.value;
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
			url:"/wankangyuan/formatData/getFieldDatas",
			async:true,
			data:{
				type:1,
				cs_id:$("#cs_id").val(),
				ft_id:ft_id,
				formatNodeId:formatNodeId,
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
					var data = res.ffDatas;
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
	//排序
	var oBTSXcliI1=document.querySelectorAll('.BTSXcliI')[0];
	var oBTSXcliI2=document.querySelectorAll('.BTSXcliI')[1];
	oBTSXcliI1.onclick=function(){
		desc_asc="ASC";
	    window.location.href="/wankangyuan/formatNode/getFormatNodeById?cs_id="
			+cs_id+"&sourceDataId="+sourceDataId+"&type=1&ft_id="+ft_id+"&formatNodeId="+formatNodeId
			+"&searchId="+searchId+"&desc_asc="+desc_asc+"&searchWord="+searchWord+"&oldCondition="+oldCondition;
	}

	oBTSXcliI2.onclick=function(){
		desc_asc="DESC";
	    window.location.href="/wankangyuan/formatNode/getFormatNodeById?cs_id="
			+cs_id+"&sourceDataId="+sourceDataId+"&type=1&ft_id="+ft_id+"&formatNodeId="+formatNodeId
			+"&searchId="+searchId+"&desc_asc="+desc_asc+"&searchWord="+searchWord+"&oldCondition="+oldCondition;
	}
	function updown(sc){
		desc_asc=sc;
	    window.location.href="/wankangyuan/formatNode/getFormatNodeById?cs_id="
			+cs_id+"&sourceDataId="+sourceDataId+"&type=1&ft_id="+ft_id+"&formatNodeId="+formatNodeId
			+"&searchId="+searchId+"&desc_asc="+desc_asc+"&searchWord="+searchWord+"&oldCondition="+oldCondition;
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
	//数据筛选，支持模糊查询
	function shaixuan(likeSearch){
		var afuxuanK=document.querySelectorAll('.BTSXcli2li');
        var chooseDatasArr = [];
        for(var i=0;i<afuxuanK.length;i++){
        	if(afuxuanK[i].querySelectorAll('.BTSXcli2liI')[0].checked){
        		chooseDatasArr.push(afuxuanK[i].querySelectorAll('.BTSXcli2liT')[0].innerHTML);
        	}
        }
        var chooseDatas=chooseDatasArr.join(",");
    	window.location.href="/wankangyuan/formatNode/getFormatNodeById?cs_id="
			+cs_id+"&sourceDataId="+sourceDataId+"&type=1&ft_id="+ft_id+"&formatNodeId="+formatNodeId
			+"&searchId="+searchId+ "&desc_asc="+desc_asc+"&likeSearch="+likeSearch
			+"&searchWord="+searchWord+"&oldCondition="+oldCondition
    		+"&chooseDatas="+chooseDatas;
	}
	

	//分页
    $('#box').paging({
    	initPageNo: ${page}, // 初始页码
    	totalPages: Math.ceil(${total}/${rows}), //总页数
    	totalCount: '合计&nbsp;' + ${total} + '&nbsp;条数据', // 条目总数
    	slideSpeed: 600, // 缓动速度。单位毫秒
    	jump: true, //是否支持跳转
    	callback: function(page) { // 回调函数
    		//console.log(page);
    		var user_id=${user.id};
    		var cs_id = $("#cs_id").val();
    		var ft_id = $("#ft_id").val();
    		var formatNodeId = $("#formatNodeId").val();
    		var sourceDataId = $("#sourceDataId").val();
    		if(page!=${page}){
    			window.location.href="/wankangyuan/formatNode/getFormatNodeById?cs_id="
    				+cs_id+"&sourceDataId="+sourceDataId+"&type=1&ft_id="+ft_id+"&formatNodeId="+formatNodeId
    				+"&page="+page+"&strip=${rows}"
    				+"&searchId="+searchId+"&desc_asc="+desc_asc+"&searchWord="+searchWord+"&oldCondition="+oldCondition;
    			
    		}
    	}
    }); 
	    function dataNodeClick(formatNodeId , ft_id){
			var cs_id = $('#cs_id').val();
			var sourceDataId = $("#sourceDataId").val();
			var type=${type123};
			window.location.href="/wankangyuan/formatNode/getFormatNodeById?cs_id="
					+cs_id+"&sourceDataId="+sourceDataId+"&type="+type+"&ft_id="+ft_id+"&formatNodeId="+formatNodeId;
		}
	    
	   /*  $(".app_expexport_node").click(function (){
    		var afuxuanK=document.querySelectorAll('.fuxuanK42');
            var afuxuan=[];
            for(var i=0;i<afuxuanK.length;i++){
                afuxuan.push(afuxuanK[i].querySelectorAll('.input_check')[0]);
            }
            var ft_ids = [];
            var formatNodeIds = [];
            for(var i=0;i<afuxuanK.length;i++){
            	if(afuxuan[i].checked){
            		formatNodeIds.push(afuxuan[i].name);
            		ft_ids.push(afuxuan[i].value);
            	}
            }
            if(ft_ids.length > 1 || formatNodeIds.length > 1){
            	alert("最多选择一个结点！");
            	return;
            }
            if(ft_ids == "" || formatNodeIds == ""){
         	   alert("请选择待导出数据的结点！");
         	   return;
            }
            var cs_id = $('#cs_id').val();
    		var ft_id = ft_ids.join(",");
    		var formatNodeId = formatNodeIds.join(",");
           	window.location.href="/wankangyuan/export/formatNode?cs_id="+cs_id+"&ft_id="+ft_id+"&formatNodeId="+formatNodeId
			+"&page="+page+"&strip=${rows}"
           	+"&searchId="+searchId+"&desc_asc="+desc_asc+"&searchWord="+searchWord
			+"&oldCondition="+oldCondition;;
           	
    	}); */
    	
    	/* $(".app_expexport_type").click(function (){
    		
    		var afuxuanK=document.querySelectorAll('.fuxuanK41');
            var afuxuan=[];
            for(var i=0;i<afuxuanK.length;i++){
                afuxuan.push(afuxuanK[i].querySelectorAll('.input_check')[0]);
            }
            var ft_ids = [];
            for(var i=0;i<afuxuanK.length;i++){
            	if(afuxuan[i].checked){
            		ft_ids.push(afuxuan[i].name);
            	}
            }
            if(ft_ids.length > 1){
            	alert("最多选择一种格式数据类型！");
            	return;
            }
           	if(ft_ids == ""){
        	   alert("请选择待导出数据的格式类型！");
        	   return;
           	}
            var cs_id = $('#cs_id').val();
    		var sourceDataId = $("#sourceDataId").val();
    		var ft_id = ft_ids.join(",");
           	window.location.href="/wankangyuan/export/formatType?cs_id="+cs_id+"&sourceDataId="+sourceDataId+"&ft_id="+ft_id
			+"&page="+page+"&strip=${rows}"
           	+"&searchId="+searchId+"&desc_asc="+desc_asc+"&searchWord="+searchWord
			+"&oldCondition="+oldCondition;;
    	
    	}); */
    	var aprodaclmRzTt2=document.querySelectorAll('.prodaclmRzTt2');
        var oPJK=document.querySelectorAll('.PJK')[0];//项目框
        var oBTSX2=document.querySelectorAll('.BTSX2')[0];//项目表头筛选框

        //点击设置排序筛选框
        for(var i=0;i<aprodaclmRzTt2.length;i++){
            (function(j){
                aprodaclmRzTt2[j].onclick=function(){
                    // if(BTSXpd==j){
                    //     oBTSX2.style.display="none";
                    //     BTSXpd=-1;
                    // }else{
                        oBTSX2.style.display="block";
                        // BTSXpd=j;
                    // }
                    var BTSXleft=aprodaclmRzTt2[j].offsetLeft;
                    // oBTSX2.name=aprodaclmRzTt2[j].innerHTML;
                    if(document.querySelectorAll('.BTSXpd')[0]){
                        var oBTSXpd=document.querySelectorAll('.BTSXpd')[0];//项目表头筛选框判断
                        oBTSXpd.value=aprodaclmRzTt2[j].title;
                        //console.log(oBTSXpd.value);
                    }
                    
                    
                    //console.log(aprodaclmRzTt2[j].offsetLeft);
                    //console.log(BTSXleft);
                    if(BTSXleft>1118){
                        BTSXleft=1118;
                    }
                    oBTSX2.style.left=BTSXleft-100+'px'; 
                    event.stopPropagation();
                }
            })(i)
        }
        $(window).click(function(){
        	oBTSX2.style.display="none";
        })
        
        oBTSX2.onclick=function(){
            event.stopPropagation();
        }
     /*    var aBTSXcliI=oBTSX2.querySelectorAll('.BTSXcliI');//筛选框排序箭头
        var oBTSXcliIpd=document.querySelectorAll('.BTSXcliIpd')[0];//筛选框选择判断
        for(var i=0;i<aBTSXcliI.length;i++){
            (function(index){
                aBTSXcliI[index].onclick=function(){
                    for(var j=0;j<aBTSXcliI.length;j++){
                        aBTSXcliI[j].style.color="#666";
                    }
                    aBTSXcliI[index].style.color="#5ca0e5";
                    oBTSXcliIpd.value=index+1;
                    console.log(oBTSXcliIpd.value);
                }
            })(i)
        } */

        var oBTSXcli3BTres=document.querySelectorAll('.BTSXcli3BTres')[0];//重置按钮
        var aBTSXcli2liC=document.querySelectorAll('.BTSXcli2liC');//复选框
        var oBTSXcliGLK=document.querySelectorAll('.BTSXcliGLK')[0];//过滤框

      /*   oBTSXcli3BTres.onclick=function(){
            for(var j=0;j<aBTSXcliI.length;j++){
                aBTSXcliI[j].style.color="#666";
            }
            oBTSXcliGLK.value="";
            for(var i=0;i<aBTSXcli2liC.length;i++){
                aBTSXcli2liC[i].checked=false;
            }
        } */
    </script>
</body>
</html>