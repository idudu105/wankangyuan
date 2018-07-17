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
        // pro_mine();
        pro_dataLB();
        pro_data();
        // data_mine();
        // data_create();
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
				</a> <a href="/wankangyuan/sourceData/firstIn?type=3">
					<div class="topT active">格式数据</div>
				</a> <a href="/wankangyuan/application/viewMine">
					<div class="topT ">应用</div>
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
					<a href="/wankangyuan/sourceData/firstIn?type=1">
						<div class="top2Cli">我的</div>
					</a> <a href="/wankangyuan/sourceData/firstIn?type=2">
						<div class="top2Cli">我创建的</div>
					</a> <a href="/wankangyuan/sourceData/firstIn?type=3">
						<div class="top2Cli top2CliYJ">公共</div>
					</a>
					<div class="search">
						<div class="searchC">
							<img src="/wankangyuan/static/img/search.png" alt=""
								class="searchCi" /> <input type="text" class="searchCt"
								placeholder="搜索数据" value="${searchFirstWord}" />
						</div>
					</div>
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

					<div class="pro_menu">添加至我的</div>
					<select id="source_Select" class="pro_menusel">
						<c:forEach items="${sources}" var="source">
							<c:if test="${source.cs_id!=thiscs_id}">
								<option value="${source.cs_id}">${source.cs_name}</option>
							</c:if>
							<c:if test="${source.cs_id==thiscs_id}">
								<option value="${source.cs_id}" selected="selected">${source.cs_name}</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
				<div class="pro_addul">
					<div class="pro_addli">项目1</div>
					<div class="pro_addli">项目2</div>
					<div class="pro_addli">项目3</div>
					<div class="pro_addli">项目4</div>
					<div class="pro_addli">项目5</div>
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
				<div class="inportK">
					<div class="inportT">
						<div class="inportTt">导入数据</div>
						<div class="inportTx"></div>
					</div>
					<div class="inportM">
						<div class="inportMt">请把相关数据按照分类准确输入到EXCEL表格模板中，上传数据后，表格会自动配置相关内容。</div>

						<a href="javascript:;" class="inportMz inportMd">下载EXCEL模板</a>
						<div class="inportMz inportMu">上传数据</div>
						<input type="file" class="inportMf" />
					</div>
					<input type="button" class="inportB" value="提交" />
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
									<%-- 
									<c:if test="${status.index!=0 && status.index!=1}">
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
							<div class="BTSXcli3BT BTSXcli3BTent" onclick="shaixuan()">筛选</div>
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

	$("#source_Select").change(function(){
		cs_id = $("#source_Select").val();
			window.location.href="/wankangyuan/sourceData/getSourceDatas?type=3&cs_id="+cs_id;
	
	});	

	$('.PJListli').click(function(){
		searchId = $(this).attr('id');
	})	;
	//全搜索
    $(".searchCt").bind("keypress" , function(event){
		if(event.keyCode == 13){
			reset();
			window.location.href="/wankangyuan/sourceData/getSourceDatas?type=3&cs_id="
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
  				type:3,
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
		window.location.href="/wankangyuan/sourceData/getSourceDatas?type=3&cs_id="+cs_id+"&searchId="+searchId+
		"&desc_asc="+desc_asc+"&searchWord="+searchWord+"&oldCondition="+oldCondition;
	}

	oBTSXcliI2.onclick=function(){
		desc_asc="DESC";
		window.location.href="/wankangyuan/sourceData/getSourceDatas?type=3&cs_id="+cs_id+"&searchId="+searchId+
		"&desc_asc="+desc_asc+"&searchWord="+searchWord+"&oldCondition="+oldCondition;
	}
	function updown(sc){
		desc_asc=sc;
	    window.location.href="/wankangyuan/sourceData/getSourceDatas?type=3&cs_id="+cs_id+"&searchId="+searchId+
	    		"&desc_asc="+desc_asc+"&searchWord="+searchWord+"&oldCondition="+oldCondition;
	}
	
	//重置，清空累加筛选条件
	function chongzhi(){
		reset();
		shaixuan();
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

	function shaixuan(){
		var afuxuanK=document.querySelectorAll('.BTSXcli2li');
        var chooseDatasArr = [];
        for(var i=0;i<afuxuanK.length;i++){
        	if(afuxuanK[i].querySelectorAll('.BTSXcli2liI')[0].checked){
        		chooseDatasArr.push(afuxuanK[i].querySelectorAll('.BTSXcli2liT')[0].innerHTML);
        	}
        }
        var chooseDatas=chooseDatasArr.join(",");
    	window.location.href="/wankangyuan/sourceData/getSourceDatas?type=3&cs_id="+cs_id+"&searchId="+
		searchId+"&desc_asc="+desc_asc+"&likeSearch="+1
		+"&searchWord="+searchWord+"&chooseDatas="+chooseDatas+"&oldCondition="+oldCondition;
	}
	
	
	
	

    	$(".pro_menu").click(function (){
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
            	alert("请勾选源数据！");
            	return;
            }else{
            	var cs_id = $("#source_Select").val();
            	$.ajax({
        			url:"/wankangyuan/sourceData/addMySource",
        			type:"post",
        			data:{
        				cs_id:cs_id,
        				sourceDataIds:ids.join(",")
        			},
        			success : function(data){
        				alert(data.message);
        				cs_id = $("#source_Select").val();
        		    	window.location.href="/wankangyuan/sourceData/getSourceDatas?type=3&cs_id="+cs_id+"&searchId="+
        				searchId+"&desc_asc="+desc_asc+"&searchWord="+searchWord+"&chooseDatas="+chooseDatas+"&oldCondition="+oldCondition+"&page="+page+"&strip=${rows}";
        			},
        			error : function(){
        				alert("联网失败");
        			}
        			
        		});
            }
    	});
    	
    	//进入到详情页
    	function datainHref(sourceDataId){
    		var cs_id = $("#source_Select").val();
    		window.location.href="/wankangyuan/sourceData/getSourceDataById?cs_id="+cs_id+"&sourceDataId="+sourceDataId+"&type=3";
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
    		    	window.location.href="/wankangyuan/sourceData/getSourceDatas?type=3&cs_id="+cs_id+"&searchId="+
    				searchId+"&desc_asc="+desc_asc+"&searchWord="+searchWord+"&oldCondition="+oldCondition
    				+"&page="+page+"&strip=${rows}";
    			}
    		}
    	}); 
    </script>
</body>
</html>