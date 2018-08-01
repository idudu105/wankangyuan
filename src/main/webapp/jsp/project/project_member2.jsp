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
    
  //好友管理页面
    function friend_manage(){
        var ofriendMMlTT=document.querySelectorAll('.friendMMlTT')[0];//除我的好友外
        var afriendMMlTTz=ofriendMMlTT.querySelectorAll('.friendMMlTTz');//每个组织结构
        var afriendMMlTTzBz=document.querySelectorAll('.friendMMlTTzBz');//每个组织结构内的组

        var ofriendMMlTBa=document.querySelectorAll('.friendMMlTBa')[0];//我的好友按钮

        var ozzsyKpd=document.querySelectorAll('.zzsyKpd')[0];//添加组框内置预存框
        var ozzsy_editKpd=document.querySelectorAll('.zzsy_editKpd')[0];//修改组框内置预存框
        var ozzsy_delKpd=document.querySelectorAll('.zzsy_delKpd')[0];//删除组框内置预存框
        

        var afriendMMrz=document.querySelectorAll('.friendMMrz');//右侧成员框和好友框

        var ofriend_qunfa=document.querySelectorAll('.friend_qunfa')[0];//群发消息按钮
        var ofriend_yichuzu=document.querySelectorAll('.friend_yichuzu')[0];//从组中移除按钮
        var ofriend_yichuhy=document.querySelectorAll('.friend_yichuhy')[0];//移除好友按钮
        var ofriendMTrs=document.querySelectorAll('.friendMTrs')[0];//组织机构筛选
        var ofriendMTrss=document.querySelectorAll('.friendMTrss')[0];//好友角色筛选

        var osearch_2=document.querySelectorAll('.search_2')[0];//上方按钮栏搜索栏
        var osearch_3=document.querySelectorAll('.search_3')[0];//上方按钮栏搜索栏


        var ozhizhen=document.createElement('img');//指针图片
        ozhizhen.className="zhizhen";
        ozhizhen.src="../static/img/zhizhen2.png";

        var panduanjicunqi=0;
        
        var afriendMMlTTzBz2=document.querySelectorAll('.friendMMlTTzBz2');
        var afriendMMlTTzBz2Tk=document.querySelectorAll('.friendMMlTTzBz2Tk');
        var afriendMMlTTzBz2Mk=document.querySelectorAll('.friendMMlTTzBz2Mk');

        var zuzhi_PD=[];
        for(var i=0;i<afriendMMlTTz.length;i++){
            zuzhi_PD.push(0);
        }

    //console.log(afriendMMlTTz.length);
    //组织结构点击效果
        for(var i=0;i<afriendMMlTTz.length;i++){
            (function(index){
                var ofriendMMlTTzT=afriendMMlTTz[index].querySelectorAll('.friendMMlTTzT')[0];
                ofriendMMlTTzT.onclick=function(){
                    if(ozzsyKpd){
                        ozzsyKpd.value=ofriendMMlTTzT.parentNode.getAttribute("name");
                    }
                    
                    //console.log("添加组预存框"+ozzsyKpd.value);

                    // console.log(zuzhi_PD[index]);
                    if(zuzhi_PD[index]==0){
                        panduanjicunqi=0;
                    }else if(zuzhi_PD[index]==1){
                        panduanjicunqi=1;
                    }
                    // console.log(panduanjicunqi);

                    for(var j=0;j<afriendMMlTTz.length;j++){
                        afriendMMlTTz[j].className="friendMMlTTz";
                        zuzhi_PD[j]=0;
                    }

                    if(panduanjicunqi==0){
                        afriendMMlTTz[index].className="friendMMlTTz active";
                        zuzhi_PD[index]=1;
                    }else if(panduanjicunqi==1){
                        afriendMMlTTz[index].className="friendMMlTTz active2";
                        zuzhi_PD[index]=0;
                    }
                    var oko_orgers=document.getElementById('ko_orgers');
                    var oko_friends=document.getElementById('ko_friends');
                    
                    
                    //afriendMMrz[0].className="friendMMrz active";
                    //afriendMMrz[1].className="friendMMrz";
                    
                    oko_orgers.style.display="block";
                    oko_friends.style.display="none";
                    //console.log(1);
                    


                }
            })(i)
        }

    //组点击效果
        for(var i=0;i<afriendMMlTTzBz.length;i++){
            (function(index){
                afriendMMlTTzBz[index].onclick=function(){
                    if(ozzsyKpd){
                        ozzsyKpd.value=afriendMMlTTzBz[index].getAttribute("name");
                    }
                    
                    //console.log("添加组预存框"+ozzsyKpd.value);


                    for(var j=0;j<afriendMMlTTzBz.length;j++){
                        afriendMMlTTzBz[j].style.color="#666";
                    }
                    ofriendMMlTBa.className="friendMMlTBa";
                    afriendMMlTTzBz[index].style.color="#5ca0e5";

                    //组修改框内置预存框的写入
                    if(ozzsy_editKpd){
                        ozzsy_editKpd.value=afriendMMlTTzBz[index].getAttribute("name");
                    }
                    
                    // console.log("修改组预存框"+ozzsy_editKpd.value);

                    //组删除框内置预存框的写入
                    //if(ozzsy_delKpd){
                    //    ozzsy_delKpd.value=afriendMMlTTzBz[index].getAttribute("name");
                    //}
                    
                    // console.log("删除组预存框"+ozzsy_delKpd.value);
                    
                    
                  //搜索栏的显示
                    osearch_2.className="search_2 ";
                    osearch_3.className="search_3 active";
                    ofriendMTrs.style.display="inline-block";
                    ofriendMTrss.style.display="none";
                }
            })(i)
        }

    //特殊组的点击效果（该组内有包含组的时候）
        var teshuzuPD=[];
        for(var i=0;i<afriendMMlTTzBz2.length;i++){
            teshuzuPD.push(0);
        }
        // console.log(teshuzuPD);
        
        for(var i=0;i<afriendMMlTTzBz2.length;i++){
            (function(index){
                afriendMMlTTzBz2Tk[index].onclick=function(){
                    if(ozzsyKpd){
                        ozzsyKpd.value=afriendMMlTTzBz2Tk[index].parentNode.getAttribute("name");
                    }
                    
                    //console.log("添加组预存框"+ozzsyKpd.value);

                    //组修改框内置预存框的写入
                    if(ozzsy_editKpd){
                        ozzsy_editKpd.value=afriendMMlTTzBz2Tk[index].parentNode.getAttribute("name");
                    }
                    
                    // console.log("修改组预存框"+ozzsy_editKpd.value);

                    //组删除框内置预存框的写入
                    if(ozzsy_delKpd){
                        ozzsy_delKpd.value=afriendMMlTTzBz2Tk[index].parentNode.getAttribute("name");
                    }
                    
                    // console.log("删除组预存框"+ozzsy_delKpd.value);

                    if(teshuzuPD[index]==0){
                        afriendMMlTTzBz2[index].className="friendMMlTTzBz2 active";
                        afriendMMlTTzBz2Mk[index].style.display="block";
                        teshuzuPD[index]=1;

                    }else if(teshuzuPD[index]==1){
                        afriendMMlTTzBz2[index].className="friendMMlTTzBz2";
                        afriendMMlTTzBz2Mk[index].style.display="none";
                        teshuzuPD[index]=0;
                    }
                    
                    var oko_orgers=document.getElementById('ko_orgers');
                    var oko_friends=document.getElementById('ko_friends');
                    
                    
                    //afriendMMrz[0].className="friendMMrz active";
                    //afriendMMrz[1].className="friendMMrz";
                    
                    oko_orgers.style.display="block";
                    oko_friends.style.display="none";
                    
                }
            })(i)
        }
        
        
    // 我的好友点击效果
        ofriendMMlTBa.onclick=function(){
            for(var j=0;j<afriendMMlTTzBz.length;j++){
                afriendMMlTTzBz[j].style.color="#666";
            }
            ofriendMMlTBa.className="friendMMlTBa active";

            //搜索栏的显示
            osearch_2.className="search_2 active";
            osearch_3.className="search_3";
            ofriendMTrs.style.display="none";
            ofriendMTrss.style.display="inline-block";
        }

      //右侧多选
        //console.log(afriendMMrz.length);
          for(var i=0;i<afriendMMrz.length;i++){
              (function(index){
                  $(afriendMMrz[index]).css('display','block');
                  var oquanxuanK=afriendMMrz[index].querySelectorAll('.quanxuanK')[0];
                  var oquanxuan=oquanxuanK.querySelectorAll('.input_check')[0];

                  var afuxuan=[];
                  var afuxuanK=[];

                  if(afriendMMrz[index].querySelectorAll('.fuxuanK2')[0]){
                      afuxuanK=afriendMMrz[index].querySelectorAll('.fuxuanK2');
                      //console.log("k2");
                  }else if(afriendMMrz[index].querySelectorAll('.fuxuanK3')[0]){
                      afuxuanK=afriendMMrz[index].querySelectorAll('.fuxuanK3');
                      //console.log("k3");
                  }

                  if(afuxuanK[0]){
                      for(var i=0;i<afuxuanK.length;i++){
                          afuxuan.push(afuxuanK[i].querySelectorAll('.input_check')[0]);
                      }
                  }
                  

                  oquanxuanK.onchange=function(){
                      if(oquanxuan.checked){
                          for(var i=0;i<afuxuanK.length;i++){
                              afuxuan[i].checked=1;
                          }
                      }else{
                          console.log(2);
                          for(var i=0;i<afuxuanK.length;i++){
                              afuxuan[i].checked=0;
                          }
                      }
                  }


                  if(afuxuanK[0]){
                      for(var i=0;i<afuxuanK.length;i++){
                          (function(index){
                              afuxuanK[i].onchange=function(){
                                  var fuxuanPD=0;
                                  for(var j=0;j<afuxuanK.length;j++){
                                      if(afuxuan[j].checked){
                                          fuxuanPD++;
                                      }
                                      console.log(afuxuan[j].checked);
                                  }
                                  console.log(fuxuanPD);
                                  if(fuxuanPD==afuxuanK.length){
                                      oquanxuan.checked=1;
                                  }else if(fuxuanPD!=afuxuanK.length){
                                      oquanxuan.checked=0;
                                  }
                              }
                          })(i)
                      }
                  }
              })(i)
          }

        
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
                    	<a href="/wankangyuan/sourceData/getSourceDatas?type=4&p_id=${project.id}"><div class="top2Ctr">格式数据</div></a>
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
                    <c:if test="${authoritys['62'] != true }">
                    	<div class="pro_menu pro_mandel" style="display:none;">删除成员</div>
                    </c:if>
                    
                    <c:if test="${authoritys['61'] == true }">
                    	<div class="pro_menu pro_manGL">权限管理</div>
                    	<div class="pro_menu role_change">更改角色</div>
                    </c:if>
                    <c:if test="${authoritys['61'] != true }">
                    	<div class="pro_menu pro_manGL" style="display:none;">权限管理</div>
                    	<div class="pro_menu role_change" style="display:none;">更改角色</div>
                    </c:if>
                    
                    <c:if test="${authoritys['60'] == true }">
                    	<div class="pro_menu pro_manadd">添加成员</div>
                    </c:if>
                    <c:if test="${authoritys['60'] != true }">
                    	<div class="pro_menu pro_manadd" style="display:none;">添加成员</div>
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
                              <div data-bind="foreach: orgList">
                                <div class="friendMMlTTz" data-bind="attr:{name: id}" ><!-- 每个组织结构 -->
                                    <div class="friendMMlTTzT">
                                        <span class="fri_name" data-bind="text: organizationName,click:$root.removeAllOrgers"></span>
                                        <div class="friendMMlTTzTi"></div>
                                    </div>
                                    <div class="friendMMlTTzB">
                                        <div data-bind="template: { name: 'orgTmpl', foreach: groupList }"></div>
                                    </div>
                                </div>
                              </div>
                            </div>
                            <div class="friendMMlTB">
                                <a href="javascript:;" class="friendMMlTBa">
                                    <span data-bind="click:getMyFriends">我的好友（</span><span data-bind="text:friends().length"></span><span>）</span>
                                </a>
                            </div>
                            
                        </div>
                    </div>
                    
                    <div class="mimaddMr">
                    <input id="groupId" type="hidden" name="groupId">
                        <div class="search_2 active">
                            <div class="searchC">
                                <img src="<%=request.getContextPath()%>/static/img/search.png" alt="" class="searchCi" data-bind="click:getMyFriends" />
                                <input id="myFriendSearch" name="friendName" type="text" class="searchCt"  placeholder="搜索" data-bind="event: { keyup: searchMyFriends}" />
                            </div>
                        </div>
                        <div class="search_3">
                            <div class="searchC">
                                <img src="<%=request.getContextPath()%>/static/img/search.png" alt="" class="searchCi" data-bind="click:getOrgers" />
                                <input id="orgMemberSearch" type="text" class="searchCt"  placeholder="组内成员" data-bind="event: { keyup: searchOrgers}" />
                            </div>
                        </div>
                        <!-- <div class="friendMTrs" style="display:none;">
                            <select id="orgRole" name="orgRole" data-bind="event: { change:getOrgers }">
                                <option value="">无</option>
                                <option value="管理员">管理员</option>
                                <option value="成员">成员</option>
                            </select>
                        </div> -->
                        <!-- <div class="friendMTrss" style="display:none;">
                            <select id="sysRoles" name="sysRoles" data-bind="foreach:sysRoles,event: { change:getMyFriends }">
                                <option data-bind="text:description,value:description"></option>
                            </select>
                        </div> -->
                        <div class="friendMMrz">
                    	<table class="friMMrtab">
	                    	<tr class="biaotou">
                                <th class="xuanze">
                                    <div class="quanxuanK">
                                       <input type="checkbox" class="input_check" id="check1_0">
                                       <label for="check1_0"></label>
                                   </div>全选
                                </th>
                                <th class="touxiangk">头像</th>
                                <th class="yonghuming">用户名</th>
                                <th class="youxiang">邮箱</th>
                                <th class="juese">
                                <div class="friendMTrs" style="display:none;">
		                            <select id="orgRole" name="orgRole" data-bind="event: { change:getOrgers }">
		                                <option value="">所有角色</option>
		                                <option value="管理员">管理员</option>
		                                <option value="成员">成员</option>
		                            </select>
		                        </div>
		                        <div class="friendMTrss">
		                            <select id="sysRoles" name="sysRoles" data-bind="foreach:sysRoles,event: { change:getMyFriends }">
		                                <option data-bind="text:description,value:description"></option>
		                            </select>
		                        </div>
		                        
                                </th>
                            </tr>
	                        <tbody id="ko_orgers" data-bind="foreach:orgers">
		                        <tr class="">
		                            <td class="xuanze">
		                                <div class="fuxuanK2 fuxuanK40">
		                                    <input name="orgerIds" type="checkbox" class="input_check" data-bind="value: userId,attr:{id:'check1_'+($index()+1)}">
		                                    <label data-bind="attr:{for:'check1_'+($index()+1)}"></label>
		                                </div>
		                            </td>
		                            <td class="touxiangk">
		                                <img data-bind="attr:{src:headimg}" alt="" class="touxiangi" />
		                            </td>
		                            <td class="yonghuming"><span data-bind="text: username"></span></td>
		                            <td class="youxiang"><span data-bind="text: email"></span></td>
		                            <td class="juese"><span data-bind="text: orgRole"></span></td>
		                        </tr>
	                    	</tbody>
	                    	<tbody id="ko_friends" data-bind="foreach:friends" style="display:none;">
	                            <tr class="" >
	                                <td class="xuanze">
	                                    <div class="fuxuanK2 fuxuanK40">
	                                        <input name="ids" type="checkbox" class="input_check" data-bind="value: friendId,attr:{id:'check2_'+($index()+1)}">
	                                        <label data-bind="attr:{for:'check2_'+($index()+1)}"></label>
	                                    </div>
	                                </td>
	                                <td class="touxiangk">
	                                	<img data-bind="attr:{src:friendHeadimg}" onerror='this.src="/wankangyuan/static/img/head.jpg"' alt="" class="touxiangi" />
	                                </td>
	                                <td class="yonghuming"><span data-bind="text: friendName"></span></td>
	                                <td class="youxiang"><span data-bind="text: friendEmail"></span></td>
	                                <td class="juese"><span data-bind="text: friendRolename"></span></td>
	                            </tr>
                        	</tbody>
                    	</table>
                    	</div>
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
                        <div class="QXGLkMl">
                            <div class="QXGLkMlt">创建角色</div>
                            <div class="QXGLkMlm">
                            	<c:forEach items="${projectCustomRoles }" var="projectCustomRoleTemp">
                            		<div class="QXGLkMlz">
                            			<input id="${projectCustomRoleTemp.id}" class="QXGLkMlzt1" style="display:none;" value="${projectCustomRoleTemp.rolename}"/>
	                                    <div class="QXGLkMlzt" onclick="clickCustomRole(${projectCustomRoleTemp.id},'${projectCustomRoleTemp.rolename}')">
	                                    	${projectCustomRoleTemp.rolename }
	                                    </div>
	                                    <div class="QXGLkMlzi" onclick="deleteCustomRole(${projectCustomRoleTemp.id},'${projectCustomRoleTemp.rolename}')"></div>
	                                </div>
                            	</c:forEach>
                            </div>
                        </div>
                        <div class="QXGLkMr">
                            <div class="QXGLkMrz">
                                <div class="QXGLkMrzT">详情</div>
                                <div class="QXGLkMrzM">
                                	<input name="11" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>浏览详情</label>&nbsp;&nbsp;
                                	<input name="10" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>保存简介</label>&nbsp;&nbsp;
                                </div>
                            </div>
                            <div class="QXGLkMrz">
                                <div class="QXGLkMrzT">文件</div>
                                <div class="QXGLkMrzM">
                                	<input name="27" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>浏览文件</label>&nbsp;&nbsp;
                                	<input name="20" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>添加根</label>&nbsp;&nbsp;
                                	<input name="21" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>添加页</label>&nbsp;&nbsp;
                                	<input name="22" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>上传文件</label>&nbsp;&nbsp;<br>
                                	<input name="23" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>修改名称</label>&nbsp;&nbsp;
                                	<input name="24" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>删除文件夹</label>&nbsp;&nbsp;
                                	<input name="25" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>删除文件</label>&nbsp;&nbsp;
                                	<input name="26" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>下载文件</label>&nbsp;&nbsp;
                                </div>
                            </div>
                            <div class="QXGLkMrz">
                                <div class="QXGLkMrzT">格式数据</div>
                                <div class="QXGLkMrzM">
                                	<input name="31" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>浏览格式数据</label>&nbsp;&nbsp;
                                	<input name="30" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>移除格式数据</label>&nbsp;&nbsp;
                                </div>
                            </div>
                            <div class="QXGLkMrz">
                                <div class="QXGLkMrzT">应用</div>
                                <div class="QXGLkMrzM">
                                	<input name="42" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>浏览应用</label>&nbsp;&nbsp;
                                	<input name="40" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>运行应用</label>&nbsp;&nbsp;
                                	<input name="41" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>移除应用</label>&nbsp;&nbsp;
                                </div>
                            </div>
                            <div class="QXGLkMrz">
                                <div class="QXGLkMrzT">应用结果</div>
                                <div class="QXGLkMrzM">
                                	<input name="57" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>浏览结果</label>&nbsp;&nbsp;
                                	<input name="50" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>重新运行</label>&nbsp;&nbsp;
                                	<input name="51" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>发布结果</label>&nbsp;&nbsp;
                                	<input name="52" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>取消发布</label>&nbsp;&nbsp;<br>
                                	<input name="53" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>移除结果</label>&nbsp;&nbsp;
                                	<input name="54" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>查看结果</label>&nbsp;&nbsp;
                                	<input name="55" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>查看参数</label>&nbsp;&nbsp;
                                	<input name="56" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>查看结果文件</label>&nbsp;&nbsp;   
                                </div>
                            </div>
                            <div class="QXGLkMrz">
                                <div class="QXGLkMrzT">文件</div>
                                <div class="QXGLkMrzM">
	                                <input name="63" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>浏览成员</label>&nbsp;&nbsp;
	                                <input name="60" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>添加成员</label>&nbsp;&nbsp;
	                                <input name="61" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>权限管理</label>&nbsp;&nbsp;
	                                <input name="62" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>移除成员</label>&nbsp;&nbsp;
                                </div>
                            </div>
                            <div class="QXGLkMrz">
                                <div class="QXGLkMrzT">主题</div>
                                <div class="QXGLkMrzM">
                                    <input name="74" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>浏览主题</label>&nbsp;&nbsp;
                                    <input name="70" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>创建主题</label>&nbsp;&nbsp;
                                    <input name="72" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>回复主题</label>&nbsp;&nbsp;
                                    <br>
                                    <input name="71" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>删除主题</label>&nbsp;&nbsp;
                                    <input name="73" type="checkbox" class="authority" style="zoom:150%"/>&nbsp;<label>删除主题回复</label>&nbsp;&nbsp;
                                </div>
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
							<c:if test="${projectMemberTemp.role_name != '创建者'}">
								<input name="${projectMemberTemp.role_id }" type="checkbox" class="input_check" id="check${projectMemberTemp.id }" value="${projectMemberTemp.id }">
                          		<label for="check${projectMemberTemp.id }"></label>
							</c:if>
							<c:if test="${projectMemberTemp.role_name == '创建者'}">
								<input class="input_check" value="00">
							   	<label for="check00"></label>
							</c:if>
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
            	layer.msg("请勾选用户");
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
            			layer.msg(data.message);
            			var searchWord = $(".search2Ct").val();
            			window.location.href="/wankangyuan/projectMember/selectProjectMember?type=2&searchWord="+searchWord;
            		}
            	},
            	error : function(){
            		layer.msg("联网失败");
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
            	layer.msg("请勾选项目成员");
            	return;
            }
            
            layer.confirm('请确认是否删除?',{
                btn: ['确认','取消'], //按钮
                icon: 2
              }, function(){
                  $.ajax({
                      url:"/wankangyuan/projectMember/deleteProjectMembers",
                      type:"post",
                      data:{
                          ids:ids.join(",")
                      },
                      dataType:"json",
                      success : function(data){
                          if(data.result == true){
                              layer.msg(data.message, {
                                  anim: 0,
                                  end: function (index) {
                                      var searchWord = $(".search2Ct").val();
                                      window.location.href="/wankangyuan/projectMember/selectProjectMember?type=2&searchWord="+searchWord;
                                  }
                              });
                          }
                      },
                      error:function(result){
                          layer.msg("联网失败");
                      }
                  });
                  
              }, function(){
                  return;
              });
        });
        
        var role_id = 0;
        var role_name = 'rolename';
        
        //权限赋予提交按钮
        $(".QXGLkB_quanxian").click(function (){
        	if(role_id == 0){
        		layer.msg("请选择角色");
        		return;
        	}
        	if(role_name == '创建者'){
        		layer.msg("创建者为系统默认角色，不能修改权限列表");
        		return;
        	}
        	//获取准备赋予权限的项目成员
        	var authoritys=document.querySelectorAll('.authority');
        	var ids=[];
            for(var i=0;i<authoritys.length;i++){
            	if(authoritys[i].checked){
            		ids.push(authoritys[i].name);
            	}
            }
        	$.ajax({
        		url:"/wankangyuan/projectMember/updateProjectCustomRole",
        		type:"post",
        		data:{
        			authorities:ids.join(","),
        			id:role_id
        		},
        		dataType:"json",
        		success : function(data){
        			if(data.result == true){
        				layer.msg(data.message);
        				var searchWord = $(".search2Ct").val();
            			window.location.href="/wankangyuan/projectMember/selectProjectMember?type=2&searchWord="+searchWord;
        			}else{
        				layer.msg(data.message);
        			}
        		},
        		error : function(){
        			layer.msg("联网失败");
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
        
      	//请求自定义角色的权限列表
        function clickCustomRole(id , rolename){
        	$.ajax({
        		url:"/wankangyuan/projectMember/getProjectCustomRoleAuthorities",
        		type:"post",
        		data:{
        			id:id
        		},
        		dataType:"json",
        		success : function(data){
        			$('.QXGLkMrz').find('input[class=authority]').attr("checked", false);  
        			for(var i in data){
        				$('.QXGLkMrz').find('input[name='+data[i]+']').attr("checked", true);  
        			}
        			role_id = id;
        			role_name = rolename;
        		},
        		error : function(){
        			layer.msg("联网失败");
        		}
        	});
        }
        
        //移除项目自定义角色
        function deleteCustomRole(id , rolename){
        	if(rolename == "创建者" || rolename == "项目成员" || rolename == "访问者"){
        		layer.msg("项目默认角色不能移除");
        		return;
        	}
        	layer.confirm('请确认移除角色？',{
        		btn:['确认','取消'],
        		icon:2
        	},function(){
        		$.ajax({
        			url:"/wankangyuan/projectMember/deleteProjectCustomRole",
        			type:"post",
        			data:{
        				id:id
        			},
        			dataType:"json",
        			success : function(data){
        				if(data.result == true){
        					layer.msg(data.message);
        					var searchWord = $(".search2Ct").val();
                			window.location.href="/wankangyuan/projectMember/selectProjectMember?type=2&searchWord="+searchWord;
        				}else{
        					layer.msg(data.message);
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
        
        //点击创建角色按钮，弹出创建角色对话框
        $(".QXGLkMlt").click(function(){
        	layer.open({
        		id:1,
        		type: 1,
        		title:'创建角色',
        		skin:'layui-layer-rim',
        		area:['450px', 'auto'],
        		content: ' <div class="row" style="width: 420px;  margin-left:7px; margin-top:10px;">'
        			+'<div class="col-sm-12">'
        			+'<div class="input-group">'
        			+'<span class="input-group-addon">&nbsp;&nbsp;&nbsp;名称:&nbsp;&nbsp;&nbsp;</span>'
        			+'<input id="newRolename" type="text" class="" placeholder="请输入角色名称">'
        			+'</div>'
        			+'</div>'
	       			+'</div>',
        		btn:['提交','取消'],
        		btn1: function (index,layero) {
        			var rolename = $("#newRolename").val();
        			if(rolename == "创建者"  || rolename == "项目成员" || rolename == "访问者"){
        				layer.msg("该角色为系统配置角色，不能新建");
        				return;
        			}
        			$.ajax({
        				url:"/wankangyuan/projectMember/insertProjectCustomRole",
        				type:"post",
        				data:{
        					rolename:rolename
        				},
        				dataType:"json",
        				success : function(data){
        					layer.msg(data.message);
        					var searchWord = $(".search2Ct").val();
                			window.location.href="/wankangyuan/projectMember/selectProjectMember?type=2&searchWord="+searchWord;
        				},
        				error : function(){
        					layer.msg("联网失败");
        				}
        			});
        		},
        		btn2:function (index,layero) {
        			 layer.close(index);
        		}
        	});
        });
        
        //更新成员权限
        $(".role_change").click(function (){
        	//选择项目成员
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
            	layer.msg("请勾选成员");
            	return;
            }
            if(ids.length > 1){
            	layer.msg("一次只能修改一位成员的角色");
            	return;
            }
            if(ids == 0){
            	layer.msg("请勾选成员");
            	return;
            }
            //初始化项目内角色列表
            var roles = document.querySelectorAll('.QXGLkMlzt1');
            var content ='';
            content += ' <div class="row" style="width:420px ; margin-left:7px; margin-top:10px;">'
            	+'<div class="col-sm-12">'
            	+'<div class="input-group">';
            for(var i=0 ; i<roles.length ; i++){
            	if(roles[i].value != "创建者"){
            		content += '&nbsp;&nbsp;&nbsp;&nbsp;<input name="roleRadio" class="roleRadio" type="radio" style="zoom:150%" value='
                		+roles[i].id+'>&nbsp;&nbsp;<label>'+roles[i].value+'</label><br>' 
            	}	
            }
            content += '</div></div></div>';                 
            
            //打开更新权限弹出框
            layer.open({
        		id:1,
        		type: 1,
        		title:'更改角色',
        		skin:'layui-layer-rim',
        		area:['450px', 'auto'],
        		content: content,
        		btn:['提交','取消'],
        		btn1: function (index,layero) {
        			var customRoleId = 0;
        			var roles=document.querySelectorAll('.roleRadio');
                    for(var i=0;i<roles.length;i++){
                    	if(roles[i].checked){
                    		customRoleId = roles[i].value;
                    	}
                    }
                    if(customRoleId == 0){
                    	layer.msg("请选择项目成员角色");
                    	return;
                    }
                    //网络请求更换成员角色
                    $.ajax({
						url:"/wankangyuan/projectMember/updateProjectUserRole",
						type:"post",
						data:{
							id:ids.join(","),
							role_id:customRoleId
						},
						dataType:"json",
						success : function(data){
							if(data.result == true){
								layer.msg(data.message);
								var searchWord = $(".search2Ct").val();
	                			window.location.href="/wankangyuan/projectMember/selectProjectMember?type=2&searchWord="+searchWord;
							}else{
								layer.msg(data.message);
							}
						},
						error : function(){
							layer.msg("联网失败");
						}
					});
        		},
        		btn2:function (index,layero) {
        			 layer.close(index);
        		}
        	});
        });
        

	</script>
	

<!--菜单项模板-->
<script id="orgTmpl" type="text/html">
<!-- ko if:groupList.length -->
<div class="friendMMlTTzBz2" data-bind="attr:{name: id}" data-bind="text: organizationName">
    <div class="friendMMlTTzBz2Tk" data-bind="click:$root.removeAllOrgers">
        <img src="<%=request.getContextPath()%>/static/img/folder.png" alt="" class="friendMMlTTzBzi" />
        <div class="friendMMlTTzBzt" data-bind="text: organizationName"></div>
        <div class="friendMMlTTzTi"></div>
    </div>
    <div class="friendMMlTTzBz2Mk" data-bind="template: { name: 'orgTmpl', foreach: groupList }">
        <div class="friendMMlTTzBz" data-bind="attr:{name: id}">
            <img src="<%=request.getContextPath()%>/static/img/folder.png" alt="" class="friendMMlTTzBzi" />
            <div class="friendMMlTTzBzt" data-bind="text: organizationName"></div>
        </div>
    </div>
</div>
<!-- /ko -->

<!-- ko ifnot:groupList.length -->
    <div class="friendMMlTTzBz" data-bind="attr:{name: id},click:function(data, event){$root.showOrgers(id) }">
        <img src="<%=request.getContextPath()%>/static/img/folder.png" alt="" class="friendMMlTTzBzi" />
        <div class="friendMMlTTzBzt" data-bind="text: organizationName"></div>
    </div>
<!-- /ko -->
                                        
</script>

<script type="text/javascript">
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
        $("#groupId").val(id);
        centOrgId=id;
        self.orgers.removeAll();
        $.get("/wankangyuan/orgMember/findOrgMembers",{groupId:id},function(data){
            //alert(data);
            var list = JSON.parse(data);
            for (var i in list){
                //根据好友列表判断状态
                list[i].password = null;
                for(var k in myfriends) {
                    if(list[i].userId == myfriends[k].friendId){
                        list[i].password = "已添加";
                    }
                    
                }
                if(list[i].username == centUser) {
                    list[i].password = "当前用户";
                }
                
                self.orgers.push(list[i]);
                
            }
            document.getElementById("ko_orgers").style.display="";
            document.getElementById("ko_friends").style.display="none";
            friendmanage_quanxuan();
        });
    }
    
    self.getOrgers = function() {
    	if(null == $('#groupId').val() || '' == $('#groupId').val()) {
            return layer.msg("请选择组!",function(){}),!1;
        }
        self.orgers.removeAll();
        $.get("/wankangyuan/orgMember/findGroupMembersByname",{
        	username:$("#orgMemberSearch").val(),
        	groupId:$('#groupId').val(),
        	orgRole:$('#orgRole').val()
        	},function(data){
            var list = JSON.parse(data);
            for (var i in list){
                //根据好友列表判断状态
                list[i].password = null;
                for(var k in myfriends) {
                    if(list[i].userId == myfriends[k].friendId){
                        list[i].password = "已添加";
                    }
                }
                if(list[i].username == centUser) {
                    list[i].password = "当前用户";
                }
                self.orgers.push(list[i]);
            }
            document.getElementById("ko_orgers").style.display="";
            document.getElementById("ko_friends").style.display="none";
            friendmanage_quanxuan();
        });
    }
    self.removeAllOrgers = function(){
        $('#groupId').val("");
        self.orgers.removeAll();
    }
    
    self.searchOrgers = function(data, event) {
        if(event.keyCode == "13") {  
            self.getOrgers();
        }  
    }
    
    //移除组内成员
    self.removeOrgers = function() {
        var load = layer.load();
        $.post("/wankangyuan/orgMember/removeOrgMembers",$('#orgersForm').serialize() ,function(result){
            layer.close(load);
            if(result && result.status!= 200){
                return layer.msg(result.message,function(){}),!1;
            }else{
                layer.msg(result.message, {
                    anim: 0,
                    end: function (index) {
                        self.showOrgers(centOrgId);
                    }
                });
                
            }
            $('.zuyichuK').hide();
        },"json");
    }
    //成员列表
    /* self.members = ko.observableArray(); 
    self.showMembers = function() {
        self.members.removeAll();
        $.get("/wankangyuan/user/getOrgUserByName",$('#getUserByNameForm').serialize(),function(data){
            var list = JSON.parse(data);
            for (var i in list){
                self.members.push(list[i]);
                
            }
        });
    } */
    //所有陌生人
    self.strangerList = ko.observableArray(); 
    self.findStrangerList = function() {
        self.strangerList.removeAll();
        $.get("/wankangyuan/user/findStrangerList",$('#findStrangerListForm').serialize(),function(data){
            var list = JSON.parse(data);
            for (var i in list){
                self.strangerList.push(list[i]);
            }
            
        });
    }
    
    //初始化组能成员
    //self.showOrgMember();
    
    //发送好友申请
    self.sendFriendRequest = function(user) {
        var load = layer.load();
        $.post("/wankangyuan/message/sendFriendRequest",{userId:user.id} ,function(result){
            layer.close(load);
            if(result && result.status!= 200){
                return layer.msg(result.message,function(){}),!1;
            }else{
                layer.msg(result.message, {
                    anim: 0,
                    end: function (index) {
                        self.showOrgers(centOrgId);
                    }
                });
            }
        },"json");
    }
    
    //批量发送好友申请
    self.sendAllFriendRequest = function(user) {
        var load = layer.load();
        $.post("/wankangyuan/message/sendAllFriendRequest",$('#addFriendsForm').serialize() ,function(result){
            layer.close(load);
            if(result && result.status!= 200){
                return layer.msg(result.message,function(){}),!1;
            }else{
                layer.msg(result.message, {
                    anim: 0,
                });
            }
        },"json");
    }
    
    //-----------------------------------------------------
    
    //角色列表
    var roles;
    self.sysRoles = ko.observableArray();
    self.getRoles = function() {
        self.sysRoles.removeAll();
        $.get("/wankangyuan/role/getRoleList",{},function(data){
            roles = JSON.parse(data);
            roles[0].description = "所有角色";
            self.sysRoles.push(roles[0]);
            roles = JSON.parse(data);
            for (var i in roles){
                self.sysRoles.push(roles[i]);
                
            }
            //friendmanage_quanxuan();
        });
    }
    //初始化角色信息
    self.getRoles();
    
    //-----------------------------------------------------
    
    //我的好友列表
    self.friends = ko.observableArray();
    var myfriends;
    self.getMyFriends = function() {
        self.friends.removeAll();
        $.get("/wankangyuan/friends/getMyFriends",{
        	friendName:$("#myFriendSearch").val(),
        	sysRoles:$('#sysRoles').val()
        	},function(data){
            myfriends = JSON.parse(data);
            for (var i in myfriends){
                self.friends.push(myfriends[i]);
            }
            document.getElementById("ko_orgers").style.display="none";
            document.getElementById("ko_friends").style.display="";
            friendmanage_quanxuan();
        });
    }
    self.getMyFriends();
    
    //移除好友
    self.removeMyFriends = function() {
        var load = layer.load();
        $.post("/wankangyuan/friends/removeFriends",$('#myFriendsForm').serialize() ,function(result){
            layer.close(load);
            if(result && result.status!= 200){
                return layer.msg(result.message,function(){}),!1;
            }else{
                layer.msg(result.message, {
                    anim: 0,
                    end:function() {
                        $(".yichuhyK").hide();
                        self.getMyFriends();    
                    }
                });
            }
        },"json");
    }
    
    self.searchMyFriends = function(data, event) {
        if(event.keyCode == "13") {  
            self.getMyFriends();
        }  
    }
    
    self.sendMessage = function(friend) {
        window.location.href="/wankangyuan/friendMessage/viewSendMessage?objId="+ friend.friendId;
    }
    
    //-----------------------------------------------------
    
    var organization = function(id,organizationName, groupList) {
    this.id = ko.observable(id);
    this.organizationName = ko.observable(organizationName);
    this.groupList = ko.observableArray(groupList || []); //下级子菜单
};
    
    //组织结构
    self.orgList = ko.observableArray();
    self.getOrgList = function() {
        self.orgList.removeAll();
        $.get("/wankangyuan/organization/findOrgList",{},function(data){
            var orgListJson = JSON.parse(data);
            for (var i in orgListJson){
                self.orgList.push(new organization(orgListJson[i].id,orgListJson[i].organizationName,orgListJson[i].groupList));
                
            }
            friend_manage();
        });
    }
    
    self.getOrgList();
}
var vm = new ViewModel();
ko.applyBindings(vm);
</script>

    
</body>
</html>