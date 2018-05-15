<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        project2();
        // pro_mine();
        app_mine();
        app_create();
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
                <a href="data_mine.html">
                    <div class="topT">格式数据</div>
                </a>
                <a href="/wankangyuan/application/viewMine">
                    <div class="topT active">应用</div>
                </a>
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
                    <a href="/wankangyuan/application/viewMine2"><div class="top2Cli">我的</div></a>
                    <a href="/wankangyuan/application/viewCreate2"><div class="top2Cli top2CliYJ">我创建的</div></a>
                    <a href="/wankangyuan/application/viewPublic2"><div class="top2Cli">公共</div></a>
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
                        <a href="/wankangyuan/application/viewCreate">
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
                        <div class="shaixuanBTiK" style="margin-top: 7px">
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
                    <!-- <div class="pro_menu pro_exit">退出</div> -->
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

                    <div class="pro_menu pro_del" onclick="to_delete()">删除</div>
                    <div class="pro_menu pro_open" onclick="to_public()">公开</div>
                    <div class="pro_menu pro_disopen" onclick="to_private()">取消公开</div>
                    <div class="pro_menu pro_createapp">+创建应用</div>
                    <!-- <div class="pro_menu pro_run">运行</div> -->
                    <!-- <div class="search2">
                        <div class="search2C">
                            <img src="<%=request.getContextPath()%>/static/img/search.png" alt="" class="search2Ci" />
                            <input type="text" class="search2Ct"  placeholder="搜索应用" />
                        </div>
                    </div> -->
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
            <div class="PJK2">  
                <div class="createappK">
                    <div class="inportT">
                        <div class="inportTt">创建应用</div>
                        <div class="inportTx"></div>
                    </div>
                    <form action="/wankangyuan/application/create2" method="post">
                        <div class="adddataM">
                            <div class="adddataMli">
                                <div class="adddataMlit">应用名称：</div>
                                <input name="appName" type="text" class="adddataMliTT adddataMliT" />
                            </div>
                            <div class="adddataMli">
                                <div class="adddataMlit">应用描述：</div>
                                <textarea name="appOverview" class="adddataMliTT adddataMliT3" ></textarea>
                            </div>
                        </div>
                        <input type="submit" class="inportB" value="创建" />
                    </form>
                </div>               
                <form id="appList" action="/wankangyuan/application/setStatus2" method="post">
                <c:forEach items="${list }" var="app" varStatus="appList">
                    <div class="PJK2li">
                        <div class="PJK2litop">
                            <div class="PJK2litopT2">${app.appName }</div>
                            <!-- <div class="PJK2litopI"></div> -->
                            <div class="fuxuanK3">
                                <input name="ids" type="checkbox" class="input_check" id="check${appList.count }" value="${app.id }">
                                <label for="check${appList.count }"></label>
                            </div>
                        </div>
                        <div class="PJK2licre">
                            <div class="PJK2licreT1">创建人：</div>
                            <div class="PJK2licreT2">${app.creator }</div>
                        </div>
                        <div class="PJK2litime">
                            <div class="PJK2licreT1">状态：</div>
                            <div class="PJK2licreT2">${app.status }</div>
                        </div>
                        <div class="PJK2litime">
                            <div class="PJK2litimeT1">
                               <fmt:formatDate type="date" value="${app.createTime }" />
                            </div>
                            <div class="PJK2litimeT2">
                               <fmt:formatDate type="time" value="${app.createTime }" />
                            </div>
                        </div>
                        <div class="PJK2lidetail">${app.appOverview }</div>
                        <div onclick="location='/wankangyuan/application/updateForm2?id=${app.id }'" class="PJK2liex">应用说明</div>
                    </div>
                </c:forEach>
                <input id="pub_but" type="submit" name="cmd" value="公开" style="display:none">
                <input id="pri_but" type="submit" name="cmd" value="私有" style="display:none">
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
<c:if test="${not empty msg}">
    <script type="text/javascript">
    layer.msg("${msg}");
    </script>
</c:if>

<script type="text/javascript">

function to_public(){
    
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
        $("#pub_but").click();
    }
}

function to_private(){
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
        $("#pri_but").click();
    }
}

function to_delete(){
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
        layer.confirm('删除不能撤销，请确认是否删除?',{
          btn: ['确认','取消'], //按钮
          icon: 2
        }, function(){
            $("#appList").attr('action',"/wankangyuan/application/delete2");
            $("#appList").submit();
          
        }, function(){
            return;
        });
    }
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
                window.location.href="/wankangyuan/application/viewCreate2?page="+page+"&rows=${rows}&appName=${appName}";
               
            }
        }
    });


</script>
    
</body>
</html>