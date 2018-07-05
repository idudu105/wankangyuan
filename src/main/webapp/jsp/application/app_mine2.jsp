<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Document</title>
</head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/project1.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/project1.js"></script>
<script type="text/javascript">
	window.onload=function(){
	    project0();
	    project2();
	    // pro_mine();
	    app_mine();
	}
</script>
<body>
    <div class="Box">
        <div class="box">
            <div class="top">
                <h1><img src="<%=request.getContextPath()%>/static/img/newlogo2.png" height="70" width="218" alt="" class="logo" /></h1>
                <a href="/wankangyuan/project/selectMyProject">
                    <div class="topT">项目</div>
                </a>
                <a href="/wankangyuan/sourceData/firstIn?type=1">
                    <div class="topT">格式数据</div>
                </a>
                <a href="/wankangyuan/application/viewMine">
                    <div class="topT active">应用</div>
                </a>
                <div class="touxiangK">
                    <a href=" ">
                        <img src="${user.headimg }" onerror='this.src="/wankangyuan/static/img/head.jpg"'  class="touxiang" />
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
                    <a href="/wankangyuan/application/viewMine2"><div class="top2Cli top2CliYJ">我的</div></a>
                    <a href="/wankangyuan/application/viewCreate2"><div class="top2Cli">我创建的</div></a>
                    <a href="/wankangyuan/application/viewPublic2"><div class="top2Cli">公共</div></a>
                    <div class="search">
                        <div class="searchC">
                            <img src="<%=request.getContextPath()%>/static/img/search.png" alt="" class="searchCi" data-bind="click:searchAppList" />
                            <input name="appName" type="text" class="searchCt" data-bind="event: { keyup: judgeSearchAppList}"  placeholder="搜索应用" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="shaixuan">
                <div class="shaixuanC">
                    <div class="listZT">
                        <a href="/wankangyuan/application/viewMine">
                            <div class="listZTli listZT1 active">
                                <img src="<%=request.getContextPath()%>/static/img/listZT1.png"alt="" class="listZT1i" />
                                <img src="<%=request.getContextPath()%>/static/img/listZT1.png" alt="" class="listZT1i" />
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
                        <div class="shaixuanBTiK" >
                            <img src="<%=request.getContextPath()%>/static/img/sanjiao_blue.png" alt="" class="shaixuanBTi" />
                        </div>
                    </div>
                    <div class="jiangeline"></div>
                    <div class="allK">
                        <div class="quanxuanK">
                            <input type="checkbox" class="input_check" id="check0">
                            <label for="check0"></label>
                        </div>
                        <div class="allT">全选</div>
                    </div>
                    <div class="pro_menu app_typeK">
                        <div class="app_typek">
                            <div class="app_typeT">应用类别</div>
                            <div class="app_typeI"></div>
                        </div>
                    </div>
                    <div class="pro_menu pro_addK">
                        <div class="pro_addk">
                            <div class="pro_addT">添加至项目</div>
                            <div class="pro_addI"></div>
                        </div>
                    </div>

                    <div class="pro_menu pro_rem" onclick="removeFromMine()">移除</div>
                </div>
                <div class="app_typeul" data-bind="foreach:{data:appTypeList, as:'appType'}">
                	<div class="app_typeli" data-bind="text:appType,click:$root.filtrateAppType"></div>
                </div>
                <div class="pro_addul">
                    <div class="pro_addli">项目1</div>
                    <div class="pro_addli">项目2</div>
                    <div class="pro_addli">项目3</div>
                    <div class="pro_addli">项目4</div>
                    <div class="pro_addli">项目5</div>
                </div>
            </div>
            <div class="PJK2">                 
                <form id="appList" method="post">
                <div data-bind="foreach:appList">
                    <div class="PJK2li">
                        <div class="PJK2litop">
                            <div class="PJK2litopT2" data-bind="text:appName" ></div>
                            <div class="fuxuanK3">
                                <input name="ids" type="checkbox" class="input_check" data-bind="value: appId,attr:{id:'check'+($index()+1)}">
                            	<label data-bind="attr:{for:'check'+($index()+1)}"></label>
                            </div>
                        </div>
                        <div class="PJK2licre">
                            <div class="PJK2licreT1">创建人：</div>
                            <div class="PJK2licreT2" data-bind="text:creator" ></div>
                        </div>
                        <div class="PJK2litime">
                            <div class="PJK2litimeT1" data-bind="text:createTime" ></div>
                        </div>
                        <div class="PJK2lidetail" data-bind="text:appOverview"></div>
                        <a data-bind="attr:{href:'/wankangyuan/application/explain?id='+appId}" class="PJK2liex">应用说明</a>
                    </div>
                </div>
                <input id="projectId" name="projectId" type="hidden" disabled="disabled">
                </form>
            </div>

            <div class="pageK" id="box" ></div>

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
    
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/paging.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/layer/layer.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/knockout-3.4.2.js"></script>
<c:if test="${not empty msg}">
    <script type="text/javascript">
    layer.msg("${msg}");
    </script>
</c:if>

<script type="text/javascript">

function addToProjrct(projectId){
    var ids = $("input[name='ids']");
    var checkNum = 0;
    for (var i = 0; i < ids.length; i++) {
        if (ids[i].checked) {
            checkNum++;
        }
    }
    if (checkNum == 0) {
        layer.msg("请至少选中一个");
    } else {
        layer.confirm('请确认是否添加?',{
          btn: ['确认','取消'], //按钮
          icon: 2
        }, function(){
            $("#appList").attr('action',"/wankangyuan/ProjectAppRelation/addToProject");
            $("#projectId").removeAttr("disabled");
            $("#projectId").val(projectId);
            $("#appList").submit();
          
        }, function(){
            return;
        });
    }
}

function removeFromMine(){
    var ids = $("input[name='ids']");
    var checkNum = 0;
    for (var i = 0; i < ids.length; i++) {
        if (ids[i].checked) {
            checkNum++;
        }
    }
    if (checkNum == 0) {
        layer.msg("请至少选中一个");
    } else {
        layer.confirm('请确认是否移除?',{
          btn: ['确认','取消'], //按钮
          icon: 2
        }, function(){
            $("#appList").attr('action',"/wankangyuan/userAppRelation/removeFromMine2");
            $("#appList").submit();
          
        }, function(){
            return;
        });
    }
}

function ViewModel() {
	var self = this;
	var page,rows,total,appName,appType;
	self.appList = ko.observableArray();
	self.showAppList = function() {
        
		$.getJSON("/wankangyuan/userAppRelation/getMine",{
			page:page,
			appName:self.appName,
			appType:self.appType
			},function(data){
			page = data.page;
			rows = data.rows;
			total = data.total;
			self.appList.removeAll();
			for (var i in data.list){
                self.appList.push(data.list[i]);
            }
			project0();
		    project2();
		    app_mine();
			$('#box').paging({
			    initPageNo: page, // 初始页码
			    totalPages: Math.ceil(total/rows), //总页数
			    totalCount: '合计&nbsp;' + self.total + '&nbsp;条数据', // 条目总数
			    slideSpeed: 600, // 缓动速度。单位毫秒
			    jump: true, //是否支持跳转
			    callback: function(page_) { // 回调函数
			        console.log(page_);
			        if(page_!=page){
			           page = page_;
			           self.showAppList();
			        }
			    }
			});
		});
	}
	//初始化列表
	self.showAppList();
	//点击搜索
	self.searchAppList = function() {
		page = 1;
		self.option = "";
		self.appName = $("input[name='appName']").val();
		self.showAppList();
	}
	//回车搜索
	self.judgeSearchAppList = function(data, event) {
        if(event.keyCode == "13") {  
        	self.searchAppList();
        }  
    }
	//应用类型列表
	self.appTypeList = ko.observableArray();
	self.filtrateAppType = function(appType) {
        self.appType = appType;
        self.searchAppList();
    }
	self.getAppTypeList = function() {
		$.getJSON("/wankangyuan/userAppRelation/getMyAppTypeList",function(data){
            self.appTypeList.removeAll();
            for (var i in data){
                self.appTypeList.push(data[i]);
            }
		});
	}
	self.getAppTypeList();
	
}
var vm = new ViewModel();
ko.applyBindings(vm);

</script>
</body>
</html>