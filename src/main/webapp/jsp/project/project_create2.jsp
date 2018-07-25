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
    <title>Document</title>
</head>
<link rel="stylesheet" type="text/css" href="/wankangyuan/static/css/project1.css" />
<script type="text/javascript" src="/wankangyuan/static/js/project1.js"></script>
<script type="text/javascript">
    window.onload=function(){
        project0();
        project2();
        pro_create();
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
                        	<img src="${user.headimg }" onerror='this.src="/wankangyuan/static/img/head.jpg"' class="touxiang" />
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
                    <a href="/wankangyuan/project/selectMyProject?user_id=1" onclick="remove()"><div class="top2Cli">我的</div></a>
                    <a href="javascript:;" onclick="remove()"><div class="top2Cli top2CliYJ">我创建的</div></a>
                    <a href="/wankangyuan/project/selectPublicProject" onclick="remove()"><div class="top2Cli">公共</div></a>
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
                        
                        <a href="<%=request.getContextPath()%>/jsp/project/project_create.jsp">
                            <div class="listZTli listZT2 active">
                                <div class="listZT2d"></div>
                                <div class="listZT2d"></div>
                                <div class="listZT2d"></div>
                            </div>
                        </a>
                    </div>
                    <div class="jiangeline"></div>
                   
                    <div class="allK">
                         <div class="quanxuanK">
                            <input type="checkbox" class="input_check" id="check0">
                            <label for="check0"></label>
                        </div>
                        <div class="allT">全选</div>
                         <input type="hidden" id="all_value" value=${allValue}>
                    </div>
                    <div class="pro_menu pro_delete" onclick="deleteProjects()">删除</div>
                    <div class="pro_menu pro_nonpublic" onclick="updateProjectOpenState(0)">取消公开</div>
                    <div class="pro_menu pro_public" onclick="updateProjectOpenState(1)">公开</div>
                    <div class="pro_menu pro_create">+创建项目</div>
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
	                                <input type="checkbox" class="input_check input_checks" name="projectCheck" id="check${project.id}" value="${project.id}">
	                                <label for="check${project.id}"></label>
	                        </div>
	                    </div>
	                    <div class="PJK2licre">
	                        <div class="PJK2licreT1">创建人：</div>
	                        <div class="PJK2licreT2">${project.creatorName }</div>
	                    </div>
	                    <div class="PJK2litime">
	                        <div class="PJK2litimeT1">${project.create_datetime }</div>
	                    </div>
	                    <div class="PJK2lidetail">${project.introduction }</div>
	                </div>    
	                	
                </c:forEach>
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
    	
    	
    	//改变项目公开状态
    	function updateProjectOpenState(is_open){
    		var searchWord = $(".searchCt").val();//搜索条件
    		var allChang = "";
    		if (sessionStorage.allChang){
    			allChang = sessionStorage.allChang;
			 }
    		var noChangId = "";
    		if (sessionStorage.noChangId){
    			noChangId = sessionStorage.noChangId;
			 }
    		
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
            	layer.msg('请勾选项目');
            	return;
            }
            if(is_open == 0){
            	layer.confirm('请确认取消公开项目？',{
                	btn:['确认','取消'],
                	icon:2
                },function(){
                	//公开项目
                    $.ajax({
                    	url:"/wankangyuan/project/updateProjectOpenState1",
                    	type:"post",
                    	data:{
                    		ids:ids.join(","),
                    		is_open:is_open,
                    		searchWord : searchWord,
                    		allValue : allChang,
                    		noChangId : noChangId
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
                    	url:"/wankangyuan/project/updateProjectOpenState1",
                    	type:"post",
                    	data:{
                    		ids:ids.join(","),
                    		is_open:is_open,
                    		searchWord : searchWord,
                    		allValue : allChang,
                    		noChangId : noChangId
                    	},
                    	dataType:"json",
                    	success : function(data){
                    		if(data.result == true){
                    			window.location.href="/wankangyuan/project/selectCreatedProject?creator=1&type=2";
                    		}else{
                    			layer.msg(data.message);
                    			window.location.href="/wankangyuan/project/selectCreatedProject?creator=1&type=2";
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
    	
    	//删除项目
    	function deleteProjects(){
    		var searchWord = $(".searchCt").val();//搜索条件
    		var allChang = "";
    		if (sessionStorage.allChang){
    			allChang = sessionStorage.allChang;
			 }
    		var noChangId = "";
    		if (sessionStorage.noChangId){
    			noChangId = sessionStorage.noChangId;
			 }
    		
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
            	layer.msg('请勾选项目');
            	return;
            }
            layer.confirm('请确认删除所选项目？',{
            	btn:['确认','取消'],
            	icon:2
            },function(){
            	//网络请求添加公共项目到我的项目中
                $.ajax({
                	url:"/wankangyuan/project/deleteProjects1",
                	type:"post",
                	data:{
                		ids:ids.join(","),
                		searchWord : searchWord,
                		allValue : allChang,
                		noChangId : noChangId
                	},
                	dataType:"json",
                	success : function(data){
                		if(data.result == true){
                			layer.msg("项目已删除");
                		}else{
                			layer.msg(data.message);
                		}
                		window.location.href="/wankangyuan/project/selectCreatedProject?creator=1&type=2";
                	},
                	error : function(){
                		alert("联网失败");
                	}
                });
            },function(){
            	return;
            });
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
                if(page!=${page}){
                	var searchWord = $(".searchCt").val();
                    window.location.href="/wankangyuan/project/selectCreatedProject?creator="+user_id+"&page="+page+"&strip=${rows}&type=2&searchWord="+searchWord+"&allValue="+$("#all_value").val();
                }
            }
        });
    	
    	$(".searchCt").bind("keypress" , function(event){
    		if(event.keyCode == 13){
    			var user_id=${user.id};
    			window.location.href="/wankangyuan/project/selectCreatedProject?creator="
    					+user_id+"&type=2&searchWord="+this.value;
    			
    		}
    	});
    
    	
    	$("#check0").click(function(){
    		if($("#check0").is(":checked")){
    			$("#all_value").val("all");
    			sessionStorage.setItem("noChangId",'');
    			sessionStorage.setItem("allChang",'true');
    		}else{
    			$("#all_value").val("");
    			sessionStorage.setItem("changId",'');
    			sessionStorage.setItem("allChang",'false');
    		}
    	});
    	
    	 $(function() {
    		 var arrs = []
    		 var narrs = []
    		var allValue = $("#all_value").val();
    		 if(sessionStorage.allChang == 'true'){
    			 $("#check0").attr("checked",true);
    			 $(".input_checks").each(function () {
    				 $(this).attr('checked',true)    			 
	    			 if (sessionStorage.noChangId){
						 if (sessionStorage.noChangId.indexOf(',') != -1) {
							 narrs = sessionStorage.noChangId.split(',')
							 var _this = $(this)
	    	    			 $.each(narrs,function (i) {
	    	    				 if(_this.val() == narrs[i]) {
	    	    					  _this.attr('checked',false)
	    	    				 }
	    	    			 })
						 } else {
							 if($(this).val() == sessionStorage.noChangId) {
								 $(this).attr('checked',false)
							}
						 }
						 
		    			 
					 }
    			 
    		 })
    		 }
    		 
    		 
    	})
    	// 筛选是否选中
    	$(".input_checks").each(function () {
    		 $(this).click(function () {
    			 var id = $(this).val()
        		 var bol = false
        		 // 当前元素id
        		 var snarr = [] // session 中未选
     			 var narr = [] // 未选中
    			 // 更改选中状态
        			$(".input_checks").each(function () {
        				 if (sessionStorage.noChangId){
        					 snarr = sessionStorage.noChangId.split(',')
        				 }
        				 if (sessionStorage.changId){
                			 sarr = sessionStorage.changId.split(',')
        				 }
        			 if($(this).attr('checked') == 'checked') {
        				// 选中时从未选中列表删除此元素
            			 if (snarr.indexOf(id) != -1) {
            				 snarr.splice(snarr.indexOf(id),1)
            			 }
        			 } else{
        				 narr.push($(this).val())
        			 }
        			})
	       			 //设置未选中
	       			 var snarrs = Array.from(new Set(snarr.concat(narr)))
	       			 sessionStorage.setItem("noChangId",snarrs.toString());
    		 })
    	 })
    	 
    	  function remove(){
    		 sessionStorage.setItem("noChangId",'');
    		 sessionStorage.setItem("allChang",'false');
    	 }
    
    </script>
</body>
</html>