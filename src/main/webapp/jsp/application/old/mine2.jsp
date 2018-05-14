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
                <a href="project_mine.html">
                    <div class="topT">项目</div>
                </a>
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
                    <a href="/wankangyuan/application/viewMine2"><div class="top2Cli top2CliYJ">我的</div></a>
                    <a href="/wankangyuan/application/viewCreate2"><div class="top2Cli">我创建的</div></a>
                    <a href="/wankangyuan/application/viewPublic2"><div class="top2Cli">公共</div></a>
                    <div class="search">
                        <div class="searchC">
                            <img src="<%=request.getContextPath()%>/static/img/search.png" alt="" class="searchCi" />
                            <form>
                                <input name="appName" type="text" class="searchCt" value="${appName }"  placeholder="搜索项目" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="shaixuan">
                <div class="shaixuanC">
                    <div class="listZT">
                        <a href="javascript:;">
                            <div class="listZTli listZT1">
                                <img src="<%=request.getContextPath()%>/static/img/listZT1.png" alt="" class="listZT1i" />
                                <img src="<%=request.getContextPath()%>/static/img/listZT1.png" alt="" class="listZT1i" />
                            </div>
                        </a>
                        <a href="project_app.html">
                            <div class="listZTli listZT2 active">
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
                    <div class="jiangeline"></div>
                    <div class="allK">
                        <div class="quanxuanK">
                            <input type="checkbox" class="input_check" id="check0">
                            <label for="check0"></label>
                        </div>
                        <div class="allT">全选</div>
                    </div>
                    <div class="pro_menu pro_exit">退出</div>
                </div>
            </div>
            <div class="PJK2">
            <c:forEach items="${list }" var="app" varStatus="appList">
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <div class="PJK2litopT2">${app.appName }</div>
                        <!-- <div class="PJK2litopI"></div> -->
                        <div class="fuxuanK3">
                            <input type="checkbox" class="input_check" id="check${appList.count }" value="${app.id }">
                            <label for="check${appList.count }"></label>
                        </div>
                    </div>
                    <div class="PJK2licre">
                        <div class="PJK2licreT1">创建人：</div>
                        <div class="PJK2licreT2">${app.creator }</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">${app.createTime }</div>
                        <div class="PJK2litimeT2"></div>
                    </div>
                    <div class="PJK2lidetail">${app.appOverview }</div>
                    <div class="PJK2liex">应用说明</div>
                </div>
            </c:forEach>
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
</body>
</html>