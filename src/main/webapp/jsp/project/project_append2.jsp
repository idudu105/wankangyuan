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
<link rel="stylesheet" type="text/css" href="/wankangyuan/static/css/project1.css" />
<script type="text/javascript" src="/wankangyuan/static/js/project1.js"></script>
<script type="text/javascript">
    window.onload=function(){
        project0();
        project2();
        // pro_mine();
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
                    <div class="top2Ctl active">13例结直肠癌病人的基因表达</div>
                    <a href="/wankangyuan/projectTopic/selectProjectTopic"><div class="top2Ctr">讨论版</div></a>
                    <a href="/wankangyuan/projectMember/selectProjectMember"><div class="top2Ctr">成员</div></a>
                    <a href="/wankangyuan/projectAppEnd/selectProjectAppEnd"><div class="top2Ctr active">应用结果</div></a>
                    <a href="/wankangyuan/projectApp/selectProjectApp?p_id=${project.id}"><div class="top2Ctr">应用</div></a>
                    <a href="/wankangyuan/projectFormatData/getSourceDatas?p_id=${project.id}"><div class="top2Ctr">格式数据</div></a>
                    <a href="/wankangyuan/projectFloderFile/selectProjectFloderByProjectId"><div class="top2Ctr">文件</div></a>
                    <a href="/wankangyuan/project/getProjectDetail"><div class="top2Ctr">基本信息</div></a>
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
                        <a href="project_append.jsp">
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
                            <img src="/wankangyuan/static/img/sanjiao_blue.png" alt="" class="shaixuanBTi" />
                        </div>
                    </div>
                    <div class="jiangeline"></div>
                    <div class="allK">
                        <div class="allX"></div>
                        <div class="allT">全选</div>
                    </div>
                    <!-- <div class="pro_menu pro_exit">退出</div> -->
                    <div class="pro_menu pro_rem">移除</div>
                    <div class="pro_menu pro_canfabu">取消发布</div>
                    <div class="pro_menu pro_fabu">发布</div>
                    <a href="project_appendre.html">
                        <div class="pro_menu pro_rerun">重新运行</div>
                    </a>
                    <div class="search2">
                        <div class="search2C">
                            <img src="/wankangyuan/static/img/search.png" alt="" class="search2Ci" />
                            <input type="text" class="search2Ct"  placeholder="搜索应用" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="PJK2">
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <a href="project_appendxq.html">
                            <div class="PJK2litopT2">13例结直肠癌病人的基因表达模式研究</div>
                        </a>
                        
                        <div class="PJK2litopI"></div>
                    </div>
                    <div class="PJK2licre">
                        <div class="PJK2licreT1">创建人：</div>
                        <div class="PJK2licreT2">Peter</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">2018-8-20</div>
                        <div class="PJK2litimeT2">12：00</div>
                    </div>
                    <div class="PJK2lidetail">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet</div>
                    <div class="PJK2liex">应用结果描述</div>
                </div>
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <a href="project_appendxq.html">
                            <div class="PJK2litopT2">13例结直肠癌病人的基因表达模式研究</div>
                        </a>
                        <div class="PJK2litopI"></div>
                    </div>
                    <div class="PJK2licre">
                        <div class="PJK2licreT1">创建人：</div>
                        <div class="PJK2licreT2">Peter</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">2018-8-20</div>
                        <div class="PJK2litimeT2">12：00</div>
                    </div>
                    <div class="PJK2lidetail">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet</div>
                    <div class="PJK2liex">应用结果描述</div>
                </div>
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <a href="project_appendxq.html">
                            <div class="PJK2litopT2">13例结直肠癌病人的基因表达模式研究</div>
                        </a>
                        <div class="PJK2litopI"></div>
                    </div>
                    <div class="PJK2licre">
                        <div class="PJK2licreT1">创建人：</div>
                        <div class="PJK2licreT2">Peter</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">2018-8-20</div>
                        <div class="PJK2litimeT2">12：00</div>
                    </div>
                    <div class="PJK2lidetail">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet</div>
                    <div class="PJK2liex">应用结果描述</div>
                </div>
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <a href="project_appendxq.html">
                            <div class="PJK2litopT2">13例结直肠癌病人的基因表达模式研究</div>
                        </a>
                        <div class="PJK2litopI"></div>
                    </div>
                    <div class="PJK2licre">
                        <div class="PJK2licreT1">创建人：</div>
                        <div class="PJK2licreT2">Peter</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">2018-8-20</div>
                        <div class="PJK2litimeT2">12：00</div>
                    </div>
                    <div class="PJK2lidetail">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet</div>
                    <div class="PJK2liex">应用结果描述</div>
                </div>
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <a href="project_appendxq.html">
                            <div class="PJK2litopT2">13例结直肠癌病人的基因表达模式研究</div>
                        </a>
                        <div class="PJK2litopI"></div>
                    </div>
                    <div class="PJK2licre">
                        <div class="PJK2licreT1">创建人：</div>
                        <div class="PJK2licreT2">Peter</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">2018-8-20</div>
                        <div class="PJK2litimeT2">12：00</div>
                    </div>
                    <div class="PJK2lidetail">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet</div>
                    <div class="PJK2liex">应用结果描述</div>
                </div>
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <a href="project_appendxq.html">
                            <div class="PJK2litopT2">13例结直肠癌病人的基因表达模式研究</div>
                        </a>
                        <div class="PJK2litopI"></div>
                    </div>
                    <div class="PJK2licre">
                        <div class="PJK2licreT1">创建人：</div>
                        <div class="PJK2licreT2">Peter</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">2018-8-20</div>
                        <div class="PJK2litimeT2">12：00</div>
                    </div>
                    <div class="PJK2lidetail">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet</div>
                    <div class="PJK2liex">应用结果描述</div>
                </div>
            </div>

            <div class="pageK">
                <div class="pageLR">
                    <img src="/wankangyuan/static/img/pageL.png" class="pageLRi" alt="" />
                </div>
                <div class="pageNUM active">1</div>
                <div class="pageNUM ">2</div>
                <div class="pageNUM">3</div>
                <div class="pageLR">
                    <img src="/wankangyuan/static/img/pageR.png" class="pageLRi" alt="" />
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
</body>
</html>