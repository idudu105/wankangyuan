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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/project1.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jsp/project/js/project1.js"></script>
<script type="text/javascript">
    window.onload=function(){
    	project0();
        pro_member();
        friend_manage();
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
                    <div class="top2Ctl active">${project.p_name }</div>
                    <c:if test="${authoritys['74'] == true }">
                    	  <a href="/wankangyuan/projectTopic/selectProjectTopic"><div class="top2Ctr">讨论版</div></a>
                    </c:if>
                   
                    <c:if test="${authoritys['63'] == true }">
                    	 <a href="/wankangyuan/projectMember/selectProjectMember"><div class="top2Ctr active">成员</div></a>
                    </c:if>
                    
					<c:if test="${authoritys['57'] == true }">
                    	 <a href="/wankangyuan/projectAppEnd/selectProjectAppEnd"><div class="top2Ctr">应用结果</div></a>
                    </c:if>
                   
                    <c:if test="${authoritys['42'] == true }">
                    	<a href="/wankangyuan/projectApp/selectProjectApp?p_id=${project.id}"><div class="top2Ctr">应用</div></a>
                    </c:if>
                    
                    <c:if test="${authoritys['31'] == true }">
                    	<a href="/wankangyuan/projectFormatData/getSourceDatas?p_id=${project.id}"><div class="top2Ctr">格式数据</div></a>
                    </c:if>
                    
                    <c:if test="${authoritys['27'] == true }">
                    	<a href="/wankangyuan/projectFloderFile/selectProjectFloderByProjectId"><div class="top2Ctr">文件</div></a>
                    </c:if>
                    
                    <c:if test="${authoritys['11'] == true }">
                    	<a href="/wankangyuan/project/getProjectDetail"><div class="top2Ctr ">基本信息</div></a>
                    </c:if>
                    
                    
                </div>
            </div>
            <div class="shaixuan">
                <div class="shaixuanC">
                    <div class="listZT">
                        <a href="javascript:;">
                            <div class="listZTli listZT1">
                                <img src="/wankangyuan/static/img/listZT1.png"alt="" class="listZT1i" />
                                <img src="/wankangyuan/static/img/listZT1.png" alt="" class="listZT1i" />
                            </div>
                        </a>
                        <a href="/wankangyuan/jsp/project/project_member.jsp">
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
                    </div>
                    <c:if test="${authoritys['62'] == true }">
                    	<div class="pro_menu pro_mandel">删除成员</div>
                    </c:if>
                    <c:if test="${authoritys['61'] == true }">
                    	<div class="pro_menu pro_manGL">权限管理</div>
                    </c:if>
                    <c:if test="${authoritys['60'] == true }">
                    	<div class="pro_menu pro_manadd">添加成员</div>
                    </c:if>
                    <div class="search2">
                        <div class="search2C">
                            <img src="/wankangyuan/static/img/search.png" alt="" class="search2Ci" />
                            <input type="text" class="search2Ct"  placeholder="搜索成员" value="${searchWord}"/>
                        </div>
                    </div>
                </div>
                <div class="shaixuanZK">
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">名称</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">角色</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">联系人</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">进组时间</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">上传文件</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">发表/回复话题</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                </div>
            </div>
                
            <div class="memaddK">
            <div class="memaddKx"></div>
            <div class="memaddM">
                <div class="friendMMl">
                    <div class="friendMMlT">
                        <div class="friendMMlTT">
                            <c:forEach items="${orgList }" var="org" varStatus="status">
                            <c:if test="${org.parentId eq 0 }">
                            <div class="friendMMlTTz <c:if test='${status.count eq 1}'>active</c:if>" name="${org.id }"><!-- 每个组织结构 -->
                                <div class="friendMMlTTzT">
                                    <span class="fri_name">${org.organizationName }</span>
                                    <div class="friendMMlTTzTi"></div>
                                    <img src="<%=request.getContextPath()%>/static/img/shenhe1.png" alt="" class="friendMMlTTzTi2" />
                                </div>
                                <div class="friendMMlTTzB">
                                <c:forEach items="${orgList }" var="group">
                                <c:if test="${org.id eq group.parentId }">
                                    <div class="friendMMlTTzBz" name="${group.id }">
                                        <img src="<%=request.getContextPath()%>/static/img/folder.png" alt="" class="friendMMlTTzBzi" />
                                        <div class="friendMMlTTzBzt" data-bind="click:function(data, event){showOrgers(${group.id}) }">${group.organizationName }</div>
                                    </div>
                                </c:if>    
                                </c:forEach>
                                </div>
                            </div>
                            </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                
                <div class="mimaddMr">
                	<table class="friMMrtab">
                 	<tr class="biaotou">
                            <th class="xuanze">
                                选择
                            </th>
                            <th class="touxiangk">头像</th>
                            <th class="yonghuming">用户名</th>
                            <th class="youxiang">邮箱</th>
                        </tr>
                     <tbody id="ko_friend" data-bind="foreach: orgers">
                      <tr class="">
                          <td class="xuanze">
                              <div class="fuxuanK2 fuxuanK40">
                                  <input name="orgerIds" type="checkbox" class="input_check" data-bind="value: id,attr:{id:'check1_'+($index()+1)}">
                                  <label data-bind="attr:{for:'check1_'+($index()+1)}"></label>
                              </div>
                          </td>
                          <td class="touxiangk">
                              <img data-bind="attr:{src:headimg}" alt="" class="touxiangi" />
                          </td>
                          <td class="yonghuming"><span data-bind="text: username"></span></td>
                          <td class="youxiang"><span data-bind="text: email"></span></td>
                      </tr>
                 	</tbody>
                	</table>
                	<input type="button" class="QXGLkB QXGLkB_chengyuan" value="添加" />
                    
                </div>
            </div>
        </div>
            
        <div class="PJK2">
            <div class="QXGLk">
                <div class="QXGLkT">
                    <div class="QXGLkTl">权限管理</div>
                    <div class="QXGLkTr"></div>
                </div>
                <div class="QXGLkM">
                    
                    <div class="QXGLkMr">
                        
                        <div class="QXGLkMrz">
                        	<c:forEach items="${projectRoles}" var="projectRole" varStatus="status">
                        		<div class="QXGLkMrzM">
                                 <div class="QXGLkMrzMz">
                                     <div class="fuxuanK2 fuxuanK30">
                                     	<c:if test="${status.index == 0 }">
                                     		<input name="idssss" type="checkbox" checked class="input_check" id="check${projectRole.id }" value="${projectRole.id }">
                                     	</c:if>
                                     	<c:if test="${status.index != 0 }">
                                     		<input name="idssss" type="checkbox" class="input_check" id="check${projectRole.id }" value="${projectRole.id }">
                                     	</c:if>
                                <label for="check${projectRole.id }"></label>
                            </div>
                                     <div class="QXGLkMrzMzt">${projectRole.role_name }</div>
                                 </div>
                             </div>
                        	</c:forEach>
                        </div>
                       
                    </div>
                </div>
                <input type="button" class="QXGLkB QXGLkB_quanxian" value="提交" />
            </div>
            
            <c:forEach items="${projectMembers}" var="projectMemberTemp">
                 
                 <div class="PJK2li">
                 
                  <div class="PJK2litop">
                      <div class="PJK2litopT">${projectMemberTemp.username}</div>
                      <div class="fuxuanK2 fuxuanK20">
                          <input name="${projectMemberTemp.role_id }" type="checkbox" class="input_check" id="check${projectMemberTemp.id }" value="${projectMemberTemp.id }">
                          <label for="check${projectMemberTemp.id }"></label>
                      </div>
                  </div>
                  
                  <div class="PJK2licre">
                      <div class="PJK2licreT1">角色：</div>
                      <div class="PJK2licreT2">${projectMemberTemp.role_name}</div>
                  </div>
                  <div class="PJK2litime">
                      <div class="PJK2litimeT1">${projectMemberTemp.bind_date_time}</div>
                  </div>
                  <div class="PJK2litime">
                      <div class="PJK2litimeT1">联系人：</div>
                      <div class="PJK2litimeT2">${projectMemberTemp.linkman_username}</div>
                  </div>
                  <div class="PJK2litime">
                      <div class="PJK2litimeT1">上传文件：</div>
                      <div class="PJK2litimeT2">${projectMemberTemp.file_num }</div>
                  </div>
                  <div class="PJK2litime">
                      <div class="PJK2litimeT1">发表/回复话题：</div>
                      <div class="PJK2litimeT2">${projectMemberTemp.topic_num }/${projectMemberTemp.topic_follow_num }</div>
                  </div>
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
    </div>
    </div>
    
    <script type="text/javascript" src="/wankangyuan/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="/wankangyuan/static/js/paging.js"></script>
    <script type="text/javascript" src="/wankangyuan/static/js/layer/layer.js"></script>
	<script type="text/javascript" src="/wankangyuan/static/js/knockout-3.4.2.js"></script>
	
    <script type="text/javascript">
    
	    $('.QXGLkMrz').find('input[name=idssss]').bind('click', function(){  
	        $('.QXGLkMrz').find('input[name=idssss]').not(this).attr("checked", false);  
	    }); 
	    
	    $('#box').paging({
	        initPageNo: ${page}, // 初始页码 
	        totalPages: Math.ceil(${total}/${rows}), //总页数
	        totalCount: '合计&nbsp;' + ${total} + '&nbsp;条数据', // 条目总数
	        slideSpeed: 600, // 缓动速度。单位毫秒
	        jump: true, //是否支持跳转
	        callback: function(page) { // 回调函数
	            console.log(page);
	            if(page!=${page}){
	            	var searchWord = $(".search2Ct").val();
	                window.location.href="/wankangyuan/projectMember/selectProjectMember?type=2&page="+page+"&strip=${rows}";
	            }
	        }
	    });
		
      	//定义ViewModel
        function ViewModel() {
      		
            var self = this;
            //当前组织ID
            var centOrgId;
            var centUser = '${user.username}';
            //组内成员
            self.orgers = ko.observableArray(); //添加动态监视数组对象
            //显示组内成员
            self.showOrgers = function(id){
            	centOrgId=id;
            	self.orgers.removeAll();
            	$.get("/wankangyuan/projectMember/getUserByOrg",{organizationId:id},function(data){
                    var list = JSON.parse(data);
                    for (var i in list){
                    	self.orgers.push(list[i]);
                    }
                });
            }
        }
        var vm = new ViewModel();
        ko.applyBindings(vm);
        
        
        //添加人员到项目中
        $(".QXGLkB_chengyuan").click(function (){
        	var afuxuanK=document.querySelectorAll('.fuxuanK40');
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
            	alert("请勾选用户！");
            	return;
            }

            $.ajax({
            	url:"/wankangyuan/projectMember/insertProjectMembers",
            	type:"post",
            	data:{
            		ids:ids.join(",")
            	},
            	dataType:"json",
            	success : function(data){
            		if(data.result == true){
            			alert(data.message);
            			var searchWord = $(".search2Ct").val();
            			window.location.href="/wankangyuan/projectMember/selectProjectMember?type=2&searchWord="+searchWord;
            		}
            	},
            	error : function(){
            		alert("联网失败");
            	}
            });

        });
        
        //批量删除成员
        $(".pro_mandel").click(function (){
        	var afuxuanK=document.querySelectorAll('.fuxuanK20');
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
            	alert("请勾选项目成员！");
            	return;
            }
            
            $.ajax({
            	url:"/wankangyuan/projectMember/deleteProjectMembers",
            	type:"post",
            	data:{
            		ids:ids.join(",")
            	},
            	dataType:"json",
            	success : function(data){
            		if(data.result == true){
            			alert(data.message);
            			var searchWord = $(".search2Ct").val();
            			window.location.href="/wankangyuan/projectMember/selectProjectMember?type=2&searchWord="+searchWord;
            		}
            	},
            	error : function(){
            		alert("联网失败");
            	}
            });
        });
        
        //权限赋予提交按钮
        $(".QXGLkB_quanxian").click(function (){
        	//获取准备赋予权限的项目成员
        	var afuxuanK=document.querySelectorAll('.fuxuanK20');
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
            	alert("请勾选用户！");
            	return;
            }
            if(ids.length > 1){
            	alert("一次最多只能修改一位用户的权限！");
            	return;
            }
            var project_user_id = ids.join(",");
            
        	//获取准备赋予的权限ID
            var afuxuanK=document.querySelectorAll('.fuxuanK30');
        	var afuxuan=[];
            for(var i=0;i<afuxuanK.length;i++){
                afuxuan.push(afuxuanK[i].querySelectorAll('.input_check')[0]);
            }
            var role_ids = [];
            for(var i=0;i<afuxuanK.length;i++){
            	if(afuxuan[i].checked){
            		role_ids.push(afuxuan[i].value);
            	}
            }
            var role_id = role_ids.join(",");
        	
        	$.ajax({
        		url:"/wankangyuan/projectMember/updateProjectUserRole",
        		type:"post",
        		data:{
        			id:project_user_id,
        			role_id:role_id
        		},
        		dataType:"json",
        		success : function(data){
        			if(data.result == true){
        				alert(data.message);
        				var searchWord = $(".search2Ct").val();
            			window.location.href="/wankangyuan/projectMember/selectProjectMember?type=2&searchWord="+searchWord;
        			}else{
        				alert(data.message);
        			}
        		},
        		error : function(){
        			alert("联网失败");
        		}
        	});        	
        });
        
        //搜索项目
        $(".search2Ct").bind("keypress" , function(event){
        	if(event.keyCode == 13){
        		var searchWord = this.value;
            	window.location.href="/wankangyuan/projectMember/selectProjectMember?type=2&searchWord="+searchWord;
        	}
        });

	</script>
    
    
</body>
</html>