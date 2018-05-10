<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/project1.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/project1.js"></script>
<script type="text/javascript">
    window.onload=function(){
        project0();
        project2();
        pro_mine();
    }
</script>

<title>Insert title here</title>
</head>
<body>
    <div class="Box">
        <div class="box">
            <div class="top">
                <h1><img src="<%=request.getContextPath()%>/static/img/newlogo2.png" height="70" width="218" alt="" class="logo" /></h1>
                <div class="topT">项目</div>
                <div class="topT">格式数据</div>
                <div class="topT active">应用</div>
                <div class="touxiangK">
                    <img src="<%=request.getContextPath()%>/static/img/touxiang.png" alt="" class="touxiang" />
                </div>
                <div class="nicheng">Peter</div>
                <div class="yanjiuquan">
                    <div class="yanjiuquanT">研究圈</div>
                    <img src="<%=request.getContextPath()%>/static/img/redpoint.png" height="11" width="11" alt="" class="redpoint" />
                </div>
            </div>
            <div class="top2">
                <div class="top2C">
                    <a href="/wankangyuan/application/viewMine"><div class="top2Cli top2CliYJ">我的</div></a>
                    <a href="/wankangyuan/application/viewCreate"><div class="top2Cli">我创建的</div></a>
                    <a href="/wankangyuan/application/viewPublic"><div class="top2Cli">公共</div></a>
                    <div class="search">
                        <div class="searchC">
                            <img src="<%=request.getContextPath()%>/static/img/search.png" alt="" class="searchCi" />
                            <form method="get">
	                            <input name="appName" type="text" class="searchCt" value="${appName }"  placeholder="搜索项目" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="shaixuan">
                <div class="shaixuanC">
                    <div class="listZT">
                        <a href="project_mine2.html">
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
                        <div class="shaixuanBTiK">
                            <img src="<%=request.getContextPath()%>/static/img/sanjiao_blue.png" alt="" class="shaixuanBTi" />
                        </div>
                    </div>
                    <!-- <div class="jiangeline"></div> -->
                    <!-- <div class="allK">
                        <div class="allX">
                            <img src="<%=request.getContextPath()%>/static/img/greentrue.png" alt="" class="allI active" />
                        </div>
                        <div class="allT">全选</div>
                    </div> -->
                    <div class="pro_menu pro_exit">退出</div>
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
                        <div class="shaixuanZKliT">异步/同步</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">关键字</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                </div>
            </div>
            <div class="PJK">
                <div class="PJList">
                    <div class="allK">
                        <div class="quanxuanK">
                            <input type="checkbox" class="input_check" id="check0">
                            <label for="check0"></label>
                        </div>
                        <div class="allT">全选</div>
                        
                    </div>
                    <div class="PJListli PJname">应用名称</div>
                    <div class="PJListli PJcreater">创建人</div>
                    <div class="PJListli PJtime">创建时间</div>
                    <div class="PJListli PJother1">应用描述</div>
                    <!-- <div class="PJListli PJother1">其他1</div>
                    <div class="PJListli PJother2">其他2</div>
                    <div class="PJListli PJother3">其他3</div>
                    <div class="PJListli PJother4">其他4</div> -->
                    <!-- <div class="PJListli PJyibu">异步/同步</div> -->
                    <!-- <div class="PJListli PJkeyword">关键字</div> -->
                    <!-- <div class="PJListli PJcaozuo">操作</div> -->
                    <!-- <div class="PJListli PJother4">其他4</div> -->
                </div>
                <div class="PJListline"></div>
                <div class="PJul">
                <form id="appList" action="/wankangyuan/application/setStatus" method="post">
                <c:forEach items="${list }" var="app" varStatus="appList">
                    <div class="PJli">
                        <div class="PJliC">
                            <!-- <div class="PJXZ"></div> -->
                            <div class="fuxuanK2">
                                <input name="ids" type="checkbox" class="input_check" id="check${appList.count }" value="${app.id }">
                                <label for="check${appList.count }"></label>
                            </div>
                            <a href="project_detail.html">
                                <div class="PJliCli PJname">${app.appName }</div>
                                <div class="PJliCli PJcreater">${app.creator }</div>
                                <div class="PJliCli PJtime">${app.createTime }</div>
                                <div class="PJliCli PJother1">${app.appOverview }</div>
                            </a>
                            <!-- <div class="PJliCli PJedit">编辑</div> -->
                        </div>
                        <div class="PJliline"></div>
                    </div>
                </c:forEach>
                <input type="submit" name="cmd" value="公开" >
                <input type="submit" name="cmd" value="私有" >
                <input type="button" value="添加至我的" onclick="addToMine()">
                <input type="button" value="从我的中移除" onclick="removeFromMine()">
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

            <div class="pageK">
                <div class="pageLR">
                    <img src="<%=request.getContextPath()%>/static/img/pageL.png" class="pageLRi" alt="" />
                </div>
                <div class="pageNUM active">1</div>
                <div class="pageNUM ">2</div>
                <div class="pageNUM">3</div>
                <div class="pageLR">
                    <img src="<%=request.getContextPath()%>/static/img/pageR.png" class="pageLRi" alt="" />
                </div>
            </div>

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

<script type="text/javascript">
function addToMine(){
	$("#appList").attr('action',"/wankangyuan/userAppRelation/addToMine");
	$("#appList").submit();
}
function removeFromMine(){
	$("#appList").attr('action',"/wankangyuan/userAppRelation/removeFromMine");
    $("#appList").submit();
}
</script>
</body>
</html>