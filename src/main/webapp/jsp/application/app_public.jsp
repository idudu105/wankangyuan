<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
                <a href="/wankangyuan/admin/formatdata">
                    <div class="topT">格式数据</div>
                </a>
                <a href="/wankangyuan/application/viewMine">
                    <div class="topT active">应用</div>
                </a>
                <div class="touxiangK">
                    <a href=" ">
                        <img src="<%=request.getContextPath()%>/static/img/touxiang.png" alt="" class="touxiang" />
                    </a>
                    <div class="userbutK">
                        <a href="user_info.html">
                            <div class="userbut">用户信息</div>
                        </a>
                        <a href="javascript:;">
                            <div class="userbut">系统消息
                                <img src="<%=request.getContextPath()%>/static/img/redpoint.png" height="11" width="11" alt="" class="redpoint2" />
                            </div>
                        </a>
                        <div class="userbutline"></div>
                        <a href="/wankangyuan/logout">
                            <div class="userbut">退出登录</div>
                        </a>
                    </div>
                </div>
                <div class="nicheng"><shiro:principal/></div>
                <div class="yanjiuquan">
                    <div class="yanjiuquanT">研究圈</div>
                    <img src="<%=request.getContextPath()%>/static/img/redpoint.png" height="11" width="11" alt="" class="redpoint" />
                </div>
            </div>
            <div class="top2">
                <div class="top2C">
                    <a href="/wankangyuan/application/viewMine"><div class="top2Cli">我的</div></a>
                    <a href="/wankangyuan/application/viewCreate"><div class="top2Cli">我创建的</div></a>
                    <a href="/wankangyuan/application/viewPublic"><div class="top2Cli top2CliYJ">公共</div></a>
                    <div class="search">
                        <div class="searchC">
                            <img src="<%=request.getContextPath()%>/static/img/search.png" alt="" class="searchCi" />
                            <form method="get">
                                <input name="appName" type="text" class="searchCt" value="${appName }"  placeholder="搜索应用" />
                            </form>
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
                        <div class="shaixuanBTiK" style="margin-top: 7px">
                            <img src="<%=request.getContextPath()%>/static/img/sanjiao_blue.png" alt="" class="shaixuanBTi" />
                        </div>
                    </div>
                    <!-- <div class="jiangeline"></div>
                    <div class="allK">
                        <div class="quanxuanK">
                            <input type="checkbox" class="input_check" id="check0">
                            <label for="check0"></label>
                        </div>
                        <div class="allT">全选</div>
                    </div> -->
                    <!-- <div class="pro_menu pro_exit">退出</div> -->
                    <div class="pro_menu app_typeK">
                        <div class="app_typek">
                            <div class="app_typeT">应用类别</div>
                            <div class="app_typeI"></div>
                        </div>
                    </div>
                    <div class="pro_menu app_addtomine" onclick="addToMine()" >添加至我的</div>
                    <!-- <div class="pro_menu pro_addK">
                        <div class="pro_addk">
                            <div class="pro_addT">添加至项目</div>
                            <div class="pro_addI"></div>
                        </div>
                    </div> -->

                    <!-- <div class="pro_menu pro_del">删除</div> -->
                    <!-- <div class="pro_menu pro_open">公开</div> -->
                    <!-- <div class="pro_menu pro_disopen">取消公开</div> -->
                    <!-- <div class="pro_menu pro_createapp">+创建应用</div> -->
                    <!-- <div class="pro_menu pro_run">运行</div> -->
                    <!-- <div class="search2">
                        <div class="search2C">
                            <img src="<%=request.getContextPath()%>/static/img/search.png" alt="" class="search2Ci" />
                            <input type="text" class="search2Ct"  placeholder="搜索应用" />
                        </div>
                    </div> -->
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
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">是否公开</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
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
                <div class="app_typeul">
	                <c:forEach items="${typeSet }" var="appType" varStatus="appList">
		                <c:if test="${appType ne null }">
		                    <div class="app_typeli">${appType }</div>
		                </c:if>
	                </c:forEach>
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
                    <div class="PJListli appname">应用名称</div>
                    <div class="PJListli appcreater">创建人</div>
                    <div class="PJListli apptime">创建时间</div>
                    <div class="PJListli appopen">状态</div>
                    <div class="PJListli PJyibu">异步/同步</div>
                    <div class="PJListli PJkeyword">关键字</div>
                    <div class="PJListli appexplain">应用描述</div>
                </div>
                <div class="PJListline"></div>
                <div class="PJul">                 
                <form id="appList" method="post">
                <c:forEach items="${list }" var="app" varStatus="appList">
                    <div class="PJli">
                        <div class="PJliC">
                            <div class="fuxuanK2">
                                <input name="ids" type="checkbox" class="input_check" id="check${appList.count }" value="${app.id }">
                                <label for="check${appList.count }"></label>
                            </div>
                            <a href="/wankangyuan/application/explain?id=${app.id }">
                                <div class="PJliCli appname">${app.appName }</div>
                                <div class="PJliCli appcreater">${app.creator }</div>
                                <div class="PJliCli apptime">
                                    <fmt:formatDate type="date" value="${app.createTime }" />
                                </div>
                                
                                <div class="PJliCli appopen">
                                <c:if test="${app.creator eq user.username }">我创建的</c:if>
                                <c:if test="${app.creator ne user.username }">${app.status }</c:if>
                                </div>
                                
                                <div class="PJliCli PJyibu">
                                <c:if test="${app.isAsync eq 0}">同步</c:if>
                                <c:if test="${app.isAsync eq 1}">异步</c:if>
                                
                                </div>
                                <div class="PJliCli PJkeyword">${app.keywords }</div>
                                <div class="PJliCli appexplain">${app.appOverview }</div>
                            </a>
                        </div>
                        <div class="PJliline"></div>
                    </div>
                </c:forEach>
                </form>
                </div>

                <div class="BTSX">
                    <div class="BTSXc">
                        <div class="BTSXcli">
                            <div class="BTSXcliT">排序：</div>
                            <img src="<%=request.getContextPath()%>/static/img/sort_up.png" alt="" class="BTSXcliI" />
                            <img src="<%=request.getContextPath()%>/static/img/sort_down.png" alt="" class="BTSXcliI" />
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

<script type="text/javascript">
function addToMine(){
    $("#appList").attr('action',"/wankangyuan/userAppRelation/addToMine");
    $("#appList").submit();
}

    $('#box').paging({
        initPageNo: ${page}, // 初始页码
        totalPages: Math.ceil(${total}/${rows}), //总页数
        totalCount: '合计&nbsp;' + ${total} + '&nbsp;条数据', // 条目总数
        slideSpeed: 600, // 缓动速度。单位毫秒
        jump: true, //是否支持跳转
        callback: function(page) { // 回调函数
            console.log(page);
            if(page!=${page}){
                window.location.href="/wankangyuan/application/viewPublic?page="+page+"&rows=${rows}&appName=${appName}";
               
            }
        }
    });


</script>
</body>
</html>