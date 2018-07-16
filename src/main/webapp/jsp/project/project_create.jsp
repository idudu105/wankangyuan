<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>我创建的项目</title>
</head>
<link rel="stylesheet" type="text/css" href="/wankangyuan/static/css/project1.css" />
<script type="text/javascript" src="/wankangyuan/static/js/project1.js"></script>
<script type="text/javascript">
    window.onload=function(){
        project0();
        project1();
        pro_create();
        pro_create1();
        
        var columnName = document.querySelectorAll(".BTSX")[0].id;
        if(columnName!=null && columnName!=""){
        	//需要点击对应的头部
        	document.getElementById(columnName).click();
        }
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
                    <div class="topT ">应用</div>
                </a>
                <div class="touxiangK">
                    <a href="/wankangyuan/userInfo">
                        <img src="${user.headimg }" onerror='this.src="/wankangyuan/static/img/head.jpg"' class="touxiang" />
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
                    <a href="/wankangyuan/project/selectMyProject?user_id=1"><div class="top2Cli">我的</div></a>
                    <a href="/wankangyuan/project/selectCreatedProject?creator=1"><div class="top2Cli top2CliYJ">我创建的</div></a>
                    <a href="/wankangyuan/project/selectPublicProject"><div class="top2Cli">公共</div></a>
                    
                    <div class="search">
                        <div class="searchC">
                            <img src="/wankangyuan/static/img/search.png" alt="" class="searchCi" />
                            <input type="text" class="searchCt"  placeholder="搜索项目" value="${projectSearchWord}"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="shaixuan">
                <div class="shaixuanC">
                    <div class="listZT">
                        <a href="<%=request.getContextPath()%>/jsp/project/project_create2.jsp">
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
                    
                    <div class="pro_menu pro_delete" onclick="deleteProjects()">删除</div>
                    <div class="pro_menu pro_nonpublic" onclick="updateProjectOpenState(0)">取消公开</div>
                    <div class="pro_menu pro_public" onclick="updateProjectOpenState(1)">公开</div>
                    <div class="pro_menu pro_create">+创建项目</div>
                </div>
                <div class="shaixuanZK">
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">项目名称</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">项目编号</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">创建者</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">创建时间</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">关键字</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">公开状态</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                </div>
            </div>
            <div class="PJK">
                <div class="PJeditK">
                    <div class="PJeditX"></div>
                    <div class="PJeditli" style="display:none;">
                        <div class="PJeditliC">
                            <div class="PJeditlit">ID：</div>
                            <input type="text" class="PJeditlik" id="id_edit"/>
                        </div>
                    </div>
                    <div class="PJeditli">
                        <div class="PJeditliC">
                            <div class="PJeditlit">项目名称：</div>
                            <input type="text" class="PJeditlik" id="p_name_edit"/>
                        </div>
                    </div>
                    <div class="PJeditli">
                        <div class="PJeditliC">
                            <div class="PJeditlit">项目编号：</div>
                            <input type="text" class="PJeditlik" id="p_number_edit"/>
                        </div>
                    </div>
                    <div class="PJeditli">
                        <div class="PJeditliC">
                            <div class="PJeditlit">关键字：</div>
                            <input type="text" class="PJeditlik" id="key_words_edit"/>
                        </div>
                    </div>
                    <input type="button" class="PJeditB" value="完成" onclick="saveProject()"/>
                </div>
                <div class="PJList">
                
                    <div class="allK">
                        <div class="quanxuanK">
                            <input type="checkbox" class="input_check" id="check0">
                            <label for="check0"></label>
                        </div>
                        <div class="allT">全选</div>
                    </div>
                    
                    <div class="PJListli PJname" id="p_name">项目名称</div>
                    <div class="PJListli PJID" id="p_number">项目编号</div>
                    <div class="PJListli PJcreater" id="creator">创建者</div>
                    <div class="PJListli PJtime" id="create_datetime">创建时间</div>
                    <div class="PJListli PJkeyword" id="key_words">关键字</div>
                    <div class="PJListli PJopenor" id="is_open">公开状态</div>
                </div>
                <div class="PJListline"></div>
                <div class="PJul">
                
                	<c:forEach items="${projects}" var="project">
	                	<div class="PJli">
	                        <div class="PJliC">
			                    <div class="fuxuanK2">
	                                <input type="checkbox" class="input_check" id="check${project.id }" value="${project.id }">
	                                <label for="check${project.id }"></label>
	                            </div>
	                            <a href="/wankangyuan/project/getProjectDetail?id=${project.id}">
	                            
	                                <div class="PJliCli PJname">${project.p_name}</div>
	                                <div class="PJliCli PJID">${project.p_number }</div>
	                                <div class="PJliCli PJcreater">${project.creatorName }</div>
	                                <div class="PJliCli PJtime">${project.create_datetime }</div>
	                                <div class="PJliCli PJkeyword">${project.key_words }</div>
	                                <c:if test="${project.is_open == 0}">
	                                	<div class="PJliCli PJopenor">未公开</div>
	                                </c:if>
	                                <c:if test="${project.is_open == 1}">
	                                	<div class="PJliCli PJopenor">已公开</div>
	                                </c:if>

	                            </a>
	                            <div class="PJliCli PJedit"><a onclick="edit('${project.id}','${project.p_name}','${project.p_number}','${project.is_asy}','${project.key_words}')">编辑</a></div>
	                        </div>
	                        <div class="PJliline"></div>
	                    </div>
                	</c:forEach>
                </div>
				
				<!-- 筛选框 -->
                <div class="BTSX" id="${projectQueryCondition.columnName}">
                	<input id="isFilter" value="${projectQueryCondition.isFilter}" style="display:none;"/>
                    <div class="BTSXc">
                        <div class="BTSXcli">
                        	<input type="text" id="sort" style="display:none;" value="${projectQueryCondition.order}"/>
                            <div class="BTSXcliT">排序：</div>
                            <div class="BTSXcliI" id="sort_asc" <c:if test="${projectQueryCondition.order != null && projectQueryCondition.order == 'asc' }">style="color:#5ca0e5;"</c:if>>↑</div>
                            <div class="BTSXcliI" id="sort_desc" <c:if test="${projectQueryCondition.order != null && projectQueryCondition.order == 'desc' }">style="color:#5ca0e5;"</c:if>>↓</div>
                        </div>
                        <div class="BTSXcli">
                            <div class="BTSXcliT">过滤：</div>
                            <input type="text" class="BTSXcliGLK" value="${projectQueryCondition.filter}"/>
                            <button id="guolv">过滤</button>
                        </div>
                        <div class="BTSXcli">
                            <div class="BTSXcliT">值筛选：</div>
                            <input id="values" style="display:none;" value="${projectQueryCondition.values}"/>
                        </div>
                        <div class="BTSXcli2" id="BTSXcli2">
                        	<c:forEach items="${projectQueryCondition.strings}" var="projectQueryConditionTemp">
                        		<div class="BTSXcli2li">
	                                <input type="checkbox" class="BTSXcli2liC" name="${projectQueryConditionTemp}"/>
	                                <div class="BTSXcli2liT">${projectQueryConditionTemp}</div>
	                            </div>
                        	 </c:forEach>
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

            <div class="createPJK">
            	<!-- form表单提交数据 -->
            	<form action="/wankangyuan/project/insertProject">

	                <div class="cre_PJKtop">
	                    <div class="cre_PJKtopT">创建项目</div>
	                    <img src="/wankangyuan/static/img/close.png" alt="" class="cre_PJKtopI" />
	                </div>
	                <div class="cre_PJKline"></div>
	                <div class="cre_PJKmid">
	                    <div class="cre_PJKmidT">项目名称：</div>
	                    <input type="text" id="p_name" name="p_name" class="cre_PJKmidK" />
	                </div>
	                <div class="cre_PJKmid">
	                    <div class="cre_PJKmidT">项目编号：</div>
	                    <input type="text" id="p_number" name="p_number" class="cre_PJKmidK" />
	                </div>
	                <div class="cre_PJKmid">
	                    <div class="cre_PJKmidT">关键字：</div>
	                    <input type="text" id="key_words" name="key_words" class="cre_PJKmidK" />
	                </div>
	                <input type="submit" class="cre_PJKbt" value="创建" />

	           </form>
            </div>
        </div>
    </div>
    
    <script type="text/javascript" src="/wankangyuan/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="/wankangyuan/static/js/paging.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/layer/layer.js"></script>
    <script type="text/javascript">
    	
    	//编辑前准备
    	function edit(id , p_name , p_number , is_asy , key_words){
    		$("#id_edit").val(id);
    		$("#p_name_edit").val(p_name);
    		$("#p_number_edit").val(p_number);
    		$("#key_words_edit").val(key_words);
    	}
    	
    	//提交编辑后的结果
    	function saveProject(){
    		var id = $("#id_edit").val();
    		var p_name = $("#p_name_edit").val();
    		var p_number = $("#p_number_edit").val();
    		var key_words = $("#key_words_edit").val();
    		//进行ajax请求
    		$.ajax({
    			url:"/wankangyuan/project/editProject",
    			type:"post",
    			dataType:"json",
    			data:{
    				id:id,
    				p_name:p_name,
    				p_number:p_number,
    				key_words:key_words
    			},
    			success : function(data){
    				if(data.result == true){
    					window.location.href="/wankangyuan/project/selectCreatedProject?creator=1";
    				}else{
    					layer.msg(data.message);
    				}
    			},
    			error : function(){
    				layer.msg("联网失败");
    			}
    		});	
    	}
    	
    	//公开，取消公开项目项目
    	function updateProjectOpenState(is_open){
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
            	layer.msg("请勾选项目");
            	return;
            }
            if(is_open == 0){
            	layer.confirm('请确认取消公开项目？',{
                	btn:['确认','取消'],
                	icon:2
                },function(){
                	//公开项目
                    $.ajax({
                    	url:"/wankangyuan/project/updateProjectOpenState",
                    	type:"post",
                    	data:{
                    		ids:ids.join(","),
                    		is_open:is_open
                    	},
                    	dataType:"json",
                    	success : function(data){
                    		if(data.result == true){
                    			window.location.href="/wankangyuan/project/selectCreatedProject?creator=1";
                    		}else{
                    			layer.msg(data.message);
                    			window.location.href="/wankangyuan/project/selectCreatedProject?creator=1";
                    		}
                    	},
                    	error : function(){
                    		layer.msg("联网失败");
                    	}
                    	
                    });
                },function(){
                	return;
                });
            }
            if(is_open == 1){
            	layer.confirm('请确认公开项目？',{
                	btn:['确认','取消'],
                	icon:2
                },function(){
                	//公开项目
                    $.ajax({
                    	url:"/wankangyuan/project/updateProjectOpenState",
                    	type:"post",
                    	data:{
                    		ids:ids.join(","),
                    		is_open:is_open
                    	},
                    	dataType:"json",
                    	success : function(data){
                    		if(data.result == true){
                    			window.location.href="/wankangyuan/project/selectCreatedProject?creator=1";
                    		}else{
                    			layer.msg(data.message);
                    			window.location.href="/wankangyuan/project/selectCreatedProject?creator=1";
                    		}
                    	},
                    	error : function(){
                    		layer.msg("联网失败");
                    	}
                    });
                },function(){
                	return;
                });
            }
            
    	}
    	
    	//删除我创建的项目
    	function deleteProjects(){
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
            	layer.msg('请勾选项目');
            	return;
            }
            layer.confirm('请确认删除所选项目？',{
            	btn:['确认','取消'],
            	icon:2
            },function(){
            	//网络请求添加公共项目到我的项目中
                $.ajax({
                	url:"/wankangyuan/project/deleteProjects",
                	type:"post",
                	data:{
                		ids:ids.join(","),
                	},
                	dataType:"json",
                	success : function(data){
                		if(data.result == true){
                			layer.msg("项目已删除");
                		}else{
                			layer.msg(data.message);
                		}
                		window.location.href="/wankangyuan/project/selectCreatedProject?creator=1";
                	},
                	error : function(){
                		alert("联网失败");
                	}
                });
            },function(){
            	return;
            });
    		
    	}
    	
    	//翻页
    	$('#box').paging({
            initPageNo: ${page}, // 初始页码
            totalPages: Math.ceil(${total}/${rows}), //总页数
            totalCount: '合计&nbsp;' + ${total} + '&nbsp;条数据', // 条目总数
            slideSpeed: 600, // 缓动速度。单位毫秒
            jump: true, //是否支持跳转
            callback: function(page) { // 回调函数
                console.log(page);
                if(page!=${page}){
                	var searchWord = $(".searchCt").val();
                	
                	if($("#isFilter").val() == "true"){
                		shaixuan(page);
                	}else{
                		window.location.href="/wankangyuan/project/selectCreatedProject?page="+page+"&searchWord="+searchWord;
                	}  
                }
            }
        });
    	
    	//搜索我创建的项目
    	$(".searchCt").bind("keypress" , function(event){
    		if(event.keyCode == 13){
    			var user_id=${user.id};
    			window.location.href="/wankangyuan/project/selectCreatedProject?creator="
    					+user_id+"&searchWord="+this.value;
    		}
    	});
    	
    	//点击项目标题栏
    	$(".PJListli").click(function (){
    		document.querySelectorAll(".BTSX")[0].id=this.id;//更新筛选框的筛选字段为当前点击的字段名
   			filter();//然后自动执行过滤，筛选出十个数值
    	});

    	//过滤框绑定enter事件
    	$(".BTSXcliGLK").bind("keypress" , function(event){
    		if(event.keyCode == 13){
    			//过滤
    			filter();
    		}
    	});
    	//点击过滤按钮
    	$("#guolv").click(function (){
    		//过滤
    		filter();
    	});
    	//过滤指定的字段，根据过滤条件获取指定字段的前十个值
    	function filter(){
    		var filter = $(".BTSXcliGLK").val();//过滤条件
    		var values = $("#values").val();//上次筛选操作中选中的值
    		var vals = values.split(",");//数组形式
    		var columnName = document.querySelectorAll(".BTSX")[0].id;//筛选字段名
    		$.ajax({
    			url:"/wankangyuan/projectFilter/getDistinctColumnValueByColumnNameAndUidCreated",
    			type:"post",
    			data:{
    				columnName:columnName,
    				filter:filter
    			},
    			dataType:"json",
    			success : function(data){
    				if(data.result == true){
    					var BTSXcli2 = document.getElementById("BTSXcli2");//填充筛选值
    					var BTSXcli2_html = "";
    					for(var index in data.message){
    						//if(index < 10){
    							BTSXcli2_html+='<div class="BTSXcli2li">';
    							if(vals.indexOf(data.message[index]) != -1){//如果筛选值在之前的筛选中被勾选了，再次选中它
    								BTSXcli2_html+='<input type="checkbox" class="BTSXcli2liC" name="'+data.message[index]+'" checked/>';
    							}else{
    								BTSXcli2_html+='<input type="checkbox" class="BTSXcli2liC" name="'+data.message[index]+'"/>';
    							}
        						
        						BTSXcli2_html+='<div class="BTSXcli2liT">'+data.message[index]+'</div>';
        						BTSXcli2_html+='</div>';
    						//}
    					}
    					BTSXcli2.innerHTML=BTSXcli2_html;
    				}else{
    					layer.msg(data.message);
    				}
    			},
    			error : function(){
    				layer.msg("联网失败");
    			}
    		});
    	}
    	
    	//重置按钮
    	$(".BTSXcli3BTres").click(function(){
    		//重置排序栏
    		document.getElementById("sort").value="";
    		document.getElementById("sort_desc").style.color="#666";
    		document.getElementById("sort_asc").style.color="#666"
    		//重新过滤条件
    		$(".BTSXcliGLK").val("");
    		//重置值筛选
    		document.getElementById("BTSXcli2").innerHTML="";
    		//设置重置后退出筛选状态，执行一般的筛选操作
    		$("#isFilter").val("false");
    	});
    	
    	//点击筛选按钮
    	$(".BTSXcli3BTent").click(function(){
    		shaixuan(1);//1代表第一页
    	});
    	//降序排列
    	$("#sort_desc").click(function(){
    		document.getElementById("sort").value="desc";
    		shaixuan(1);//1代表第一页
    	});
    	//升序排列
    	$("#sort_asc").click(function(){
    		document.getElementById("sort").value="asc";
    		shaixuan(1);//1代表第一页
    	});
    	//点击筛选按钮，请求筛选接口
    	function shaixuan(page){
    		var filter = $(".BTSXcliGLK").val();//过滤条件
    		var searchWord = $(".searchCt").val();//搜索条件
    		var columnName = document.querySelectorAll(".BTSX")[0].id;//字段名
    		var order = document.getElementById("sort").value;//排序方式

    		var BTSXcli2liC=document.querySelectorAll('.BTSXcli2liC');
            var values = [];
            for(var i=0;i<BTSXcli2liC.length;i++){
            	if(BTSXcli2liC[i].checked){
            		values.push(BTSXcli2liC[i].name);
            	}
            }
            values = values.join(",");//勾选的值
            
            $("#isFilter").val("true");//设置当前为筛选状态
    		
    		window.location.href="/wankangyuan/projectFilter/selectCreatedProjectByFilterCondition?page="+page+"&searchWord="
				+searchWord+"&columnName="+columnName+"&order="+order+"&filter="+filter+"&values="+values+"&isFilter=true";
    	}
    
    </script>
    
</body>
</html>