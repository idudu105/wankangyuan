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
	    project1();
	    // pro_mine();
	    // app_mine();
	    app_public();
	    // app_create();
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
                        <img src="${user.headimg }"  onerror='this.src="/wankangyuan/static/img/head.jpg"'  class="touxiang" />
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
                    <a href="/wankangyuan/application/viewMine"><div class="top2Cli">我的</div></a>
                    <a href="/wankangyuan/application/viewCreate"><div class="top2Cli">我创建的</div></a>
                    <a href="/wankangyuan/application/viewPublic"><div class="top2Cli top2CliYJ">公共</div></a>
                    <div class="search">
                        <div class="searchC">
                            <img src="<%=request.getContextPath()%>/static/img/search.png" alt="" class="searchCi" data-bind="click:searchAppList" />
                            <input name="appName" type="text" class="searchCt" data-bind="event: { keyup: judgeSearchAppList}" placeholder="搜索应用" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="shaixuan">
                <div class="shaixuanC">
                    <div class="listZT">
                        <a href="/wankangyuan/application/viewPublic2">
                            <div class="listZTli listZT1 active">
                                <img src="<%=request.getContextPath()%>/static/img/listZT1.png" alt="" class="listZT1i" />
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
                        <div class="shaixuanBTiK">
                            <img src="<%=request.getContextPath()%>/static/img/sanjiao_blue.png" alt="" class="shaixuanBTi" />
                        </div>
                    </div>
                    <div class="pro_menu app_typeK">
                        <div class="app_typek">
                            <div class="app_typeT">应用类别</div>
                            <div class="app_typeI"></div>
                        </div>
                    </div>
                    <div class="pro_menu app_addtomine" onclick="addToMine()" >添加至我的</div>
                </div>
                <div class="shaixuanZK">
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">应用名称</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">创建人</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">创建时间</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <!-- <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">是否公开</div>
                        <div class="shaixuanZKliI active"></div>
                    </div> -->
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">异步/同步</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">关键字</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">应用描述</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
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
            <div class="PJK">
                <div class="createappK">
                    <div class="inportT">
                        <div class="inportTt">创建应用</div>
                        <div class="inportTx"></div>
                    </div>
                    <div class="adddataM">
                        <div class="adddataMli">
                            <div class="adddataMlit">应用名称：</div>
                            <input type="text" class="adddataMliTT adddataMliT" />
                        </div>
                        <div class="adddataMli">
                            <div class="adddataMlit">应用描述：</div>
                            <textarea name="" id=""  class="adddataMliTT adddataMliT3" ></textarea>
                        </div>
                    </div>
                    <input type="button" class="inportB" value="创建" />
                </div>
                <div class="PJList">
                    <div class="allK">
                        <div class="quanxuanK">
                            <input type="checkbox" class="input_check" id="check0">
                            <label for="check0"></label>
                        </div>
                        <div class="allT">全选</div>
                    </div>
                    <div class="PJListli appname" name="appName" order="app_name">应用名称</div>
                    <div class="PJListli appcreater" name="creator" order="creator">创建人</div>
                    <div class="PJListli apptime" name="createTime" order="create_time">创建时间</div>
                    <!-- <div class="PJListli appopen" name="isDisplay" order="is_display">是否公开</div> -->
                    <div class="PJListli PJyibu" name="isAsync" order="is_async">异步/同步</div>
                    <div class="PJListli PJkeyword" name="keywords" order="keywords">关键字</div>
                    <div class="PJListli appexplain" name="appIntro" order="app_intro">应用描述</div>
                </div>
                <div class="PJListline"></div>
                <div class="PJul">                 
                <form id="appList" method="post">
                <div data-bind="foreach:appList">
                    <div class="PJli">
                        <div class="PJliC">
                            <div class="fuxuanK2">
                                <input name="ids" type="checkbox" class="input_check" data-bind="value: id,attr:{id:'check'+($index()+1)}">
                                <label data-bind="attr:{for:'check'+($index()+1)}"></label>
                            </div>
                            <a data-bind="attr:{href:'/wankangyuan/application/explain?id='+id}">
                                <div class="PJliCli appname" data-bind="text:appName"></div>
                                <div class="PJliCli appcreater" data-bind="text:creator"></div>
                                <div class="PJliCli apptime" data-bind="text:createTime"></div>
                                
                                <!-- <div class="PJliCli appopen">
                                ko if: "${user.username}" == creator我创建的/ko
                            	ko if: "${user.username}" != creator
                                	ko if: 0 == isDisplay私有/ko
                            		ko if: 1 == isDisplay公开/ko
                            	/ko
                                </div> -->
                                
                                <div class="PJliCli PJyibu">
                                <!-- ko if: 0 == isAsync -->同步<!-- /ko -->
                            	<!-- ko if: 1 == isAsync -->异步<!-- /ko -->
                                </div>
                                <div class="PJliCli PJkeyword" data-bind="text:keywords"></div>
                                <div class="PJliCli appexplain" data-bind="text:appIntro"></div>
                            </a>
                        </div>
                        <div class="PJliline"></div>
                    </div>
                </div>
                </form>
                </div>

                <div class="BTSX">
                    <div class="BTSXc">
                    	<input type="hidden"  class="BTSXpd" />
                        <div class="BTSXcli">
                            <div class="BTSXcliT">排序：</div>
                            <div class="BTSXcliI" data-bind="click:function(){orderAppList(' ASC')}">↑</div>
                            <div class="BTSXcliI" data-bind="click:function(){orderAppList(' DESC')}">↓</div>
                        </div>
                        <div class="BTSXcli">
                            <div class="BTSXcliT">过滤：</div>
                            <input type="text" class="BTSXcliGLK" />
                            <button style="display: inline-block;" data-bind="click:searchField">过滤</button>
                        </div>
                        <div class="BTSXcli">
                            <div class="BTSXcliT">值筛选：</div>
                        </div>
                        <div class="BTSXcli2" data-bind="foreach:{data:fieldList,as:'field'}">
                            <div class="BTSXcli2li" data-bind="if:eval('field.'+$('.BTSXpd').val()) != '' " >
                                <input name="option" type="checkbox" class="BTSXcli2liC" data-bind="value:eval('field.'+$('.BTSXpd').val())" />
                                <div class="BTSXcli2liT" data-bind="text:eval('field.'+$('.BTSXpd').val())"></div>
                            </div>
                        </div>
                        <div class="BTSXcli3">
                            <div class="BTSXcli3BT BTSXcli3BTent" data-bind="click:filterSearchAppList">筛选</div>
                            <div class="BTSXcli3BT BTSXcli3BTres" data-bind="click:$root.fieldList.removeAll();">重置</div>
                        </div>
                    </div>
                </div>
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
/* function filtrateAppType(appType){
    $("input[name='appType']").val(appType);
    $("#filterFrom").submit();
} */

function addToMine(){
	var ids = $("input[name='ids']");
    var checkNum = 0;
    for (var i = 0; i < ids.length; i++) {
        if (ids[i].checked) {
            checkNum++;
        }
    }
    if (checkNum == 0) {
        return layer.msg("请至少选中一个",function(){}),!1;
    } else {
	    $("#appList").attr('action',"/wankangyuan/userAppRelation/addToMine");
	    $("#appList").submit();
    }
}

//定义ViewModel
function ViewModel() {
	var self = this;
	var page,rows,total,appName,appType,orderName,orderDir,field,option;
	self.appList = ko.observableArray();
	self.showAppList = function() {
        
		$.getJSON("/wankangyuan/application/getPublic",{
			page:page,
			appName:self.appName,
			appType:self.appType,
			orderName:self.orderName,
			orderDir:self.orderDir,
			field:$(".BTSXpd").val(),
			option:self.option
			},function(data){
			page = data.page;
			rows = data.rows;
			total = data.total;
			self.appList.removeAll();
			for (var i in data.list){
                self.appList.push(data.list[i]);
            }
			project0();
		    project1();
		    app_public();
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
			if($("#check0").attr('checked')){
                $(".input_check").attr("checked",true);
            }
		});
	}
	//初始化列表
	self.showAppList();
	
	//点击搜索
	self.searchAppList = function() {
		page = 1;
		self.appName = $("input[name='appName']").val();
		self.showAppList();
	}
	//回车搜索
	self.judgeSearchAppList = function(data, event) {
        if(event.keyCode == "13") {  
        	self.searchAppList();
        }  
    }
	//筛选搜索
	self.filterSearchAppList = function() {
		arr = [];
		$("input[name='option']:checked").each(function(i){  
			arr[i]=$(this).val(); 
		});  
        self.option = arr.join(",");
        self.appName = "";
        page = 1;
        self.showAppList();
	}
	//排序搜索
	self.orderAppList = function(order) {
		self.orderName = $(".BTSXpd").attr("order");
		self.orderDir = order;
		self.searchAppList();
	}
	//显示字段列表
	self.fieldList = ko.observableArray();
	self.searchField = function() {
		self.fieldList.removeAll();
		$.getJSON("/wankangyuan/application/getPublicAppFieldList",{field:$(".BTSXpd").attr("order"),content:$(".BTSXcliGLK").val()},function(data){
            for (var i=0;i<data.length;i++){
            	if($(".BTSXpd").attr("order") == "is_async"){
					if(data[i].isAsync == '0') {
						data[i].isAsync = "同步"
					}
					if(data[i].isAsync == '1') {
						data[i].isAsync = "异步"
					}
				}
            	if($(".BTSXpd").attr("order") == "is_display"){
					if(data[i].isDisplay == '0') {
						data[i].isDisplay = "私有"
					}
					if(data[i].isDisplay == '1') {
						data[i].isDisplay = "公开"
					}
				}
            	if($(".BTSXpd").attr("order") == "create_time"){
                    for(var j =parseInt(i)+1; j<data.length; j++){
                    if(data[i].createTime == data[j].createTime){
                        j = ++i;
                    }
                  }
                }
            	self.fieldList.push(data[i]);
            }
        });
	}
	$(".PJListli").click(function() {
		self.fieldList.removeAll();
	    $(".BTSXpd").val($(this).attr("name"));
	    $(".BTSXpd").attr("order",$(this).attr("order"));
	});
	
	/* -------------------------------------------- */
	//应用类型列表
	self.appTypeList = ko.observableArray();
	self.filtrateAppType = function(appType) {
        self.appType = appType;
        self.searchAppList();
    }
	self.getAppTypeList = function() {
		$.getJSON("/wankangyuan/application/getPublicAppTypeList",function(data){
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