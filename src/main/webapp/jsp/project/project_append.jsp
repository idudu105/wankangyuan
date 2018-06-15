<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
        project1();
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
                    <img src="/wankangyuan/static/img/touxiang.png" alt="" class="touxiang" />
                </div>
                <div class="nicheng">Peter</div>
                <div class="yanjiuquan">
                    <div class="yanjiuquanT">研究圈</div>
                    <img src="/wankangyuan/static/img/redpoint.png" height="11" width="11" alt="" class="redpoint" />
                </div>
            </div>
            <div class="top2">
                <div class="top2C">
                    <div class="top2Ctl active">13例结直肠癌病人的基因表达</div>
                    <a href="project_discuss.html"><div class="top2Ctr">讨论版</div></a>
                    <a href="project_member.html"><div class="top2Ctr">成员</div></a>
                    <a href="javascript:;"><div class="top2Ctr active">应用结果</div></a>
                    <a href="/wankangyuan/projectApp/selectProjectApp?p_id=${project.id}"><div class="top2Ctr">应用</div></a>
                    <a href="/wankangyuan/projectFormatData/selectProjectFormatDataList"><div class="top2Ctr">格式数据</div></a>
                    <a href="/wankangyuan/projectFloderFile/selectProjectFloderByProjectId"><div class="top2Ctr">文件</div></a>
                    <a href="/wankangyuan/project/getProjectDetail"><div class="top2Ctr">基本信息</div></a>
                </div>
            </div>
            <div class="shaixuan">
                <div class="shaixuanC">
                    <div class="listZT">
                        <a href="project_append2.html">
                            <div class="listZTli listZT1 active">
                                <img src="/wankangyuan/static/img/listZT1.png"alt="" class="listZT1i" />
                                <img src="/wankangyuan/static/img/listZT1.png" alt="" class="listZT1i" />
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
                            <img src="/wankangyuan/static/img/sanjiao_blue.png" alt="" class="shaixuanBTi" />
                        </div>
                    </div>
                    <!-- <div class="jiangeline"></div> -->
                    <!-- <div class="allK">
                        <div class="allX">
                            <img src="/wankangyuan/static/img/greentrue.png" alt="" class="allI active" />
                        </div>
                        <div class="allT">全选</div>
                    </div> -->
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
                            <input type="text" class="search2Ct"  placeholder="搜索应用结果" />
                        </div>
                    </div>
                </div>
                <div class="shaixuanZK">
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">应用结果名称</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">应用名称</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">应用结果描述</div>
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
                        <div class="shaixuanZKliT">进度</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">发布状态</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">异步/即时</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                </div>
            </div>
            <div class="PJK">
                <div class="PJList">
                    <div class="allK">
                        <div class="allX">
                            <!-- <img src="/wankangyuan/static/img/greentrue.png" alt="" class="allI" /> -->
                        </div>
                        <div class="allT">全选</div>
                    </div>
                    <div class="PJListli appendname">应用结果名称</div>
                    <div class="PJListli appname">应用名称</div>
                    <div class="PJListli appendex">应用结果描述</div>
                    <div class="PJListli appcreater">创建人</div>
                    <div class="PJListli apptime">创建时间</div>
                    <div class="PJListli appjindu">进度</div>
                    <div class="PJListli appfabuZT">发布状态</div>
                    <div class="PJListli appYBorJS">异步/即时</div>

                </div>
                <div class="PJListline"></div>
                <div class="PJul">
                    <div class="PJli">
                        <div class="PJliC">
                            <div class="PJXZ"></div>
                            <a href="project_appendxq.html">
                                <div class="PJliCli appendname">13例结直肠癌病人的基因表达模式研究</div>
                                <div class="PJliCli appname">基因表达研究</div>
                                <div class="PJliCli appendex">病例对照研究是以现在确诊的患有某特定疾病</div>
                                <div class="PJliCli appcreater">Peter</div>
                                <div class="PJliCli apptime">2018-4-25</div>
                                <div class="PJliCli appjindu">完成</div>
                                <div class="PJliCli appfabuZT">已发布</div>
                                <div class="PJliCli appYBorJS">即时</div>
                            </a>
                            
                            
                        </div>
                        <div class="PJliline"></div>
                    </div>
                    <div class="PJli">
                        <div class="PJliC">
                            <div class="PJXZ"></div>
                            <a href="project_appendxq.html">
                                <div class="PJliCli appendname">13例结直肠癌病人的基因表达模式研究</div>
                                <div class="PJliCli appname">基因表达研究</div>
                                <div class="PJliCli appendex">病例对照研究是以现在确诊的患有某特定疾病</div>
                                <div class="PJliCli appcreater">Peter</div>
                                <div class="PJliCli apptime">2018-4-25</div>
                                <div class="PJliCli appjindu">完成</div>
                                <div class="PJliCli appfabuZT">已发布</div>
                                <div class="PJliCli appYBorJS">即时</div>
                            </a>
                            
                        </div>
                        <div class="PJliline"></div>
                    </div>
                    <div class="PJli">
                        <div class="PJliC">
                            <div class="PJXZ"></div>
                            <a href="project_appendxq.html">
                                <div class="PJliCli appendname">13例结直肠癌病人的基因表达模式研究</div>
                                <div class="PJliCli appname">基因表达研究</div>
                                <div class="PJliCli appendex">病例对照研究是以现在确诊的患有某特定疾病</div>
                                <div class="PJliCli appcreater">Peter</div>
                                <div class="PJliCli apptime">2018-4-25</div>
                                <div class="PJliCli appjindu">完成</div>
                                <div class="PJliCli appfabuZT">已发布</div>
                                <div class="PJliCli appYBorJS">即时</div>
                            </a>
                            
                        </div>
                        <div class="PJliline"></div>
                    </div>
                </div>

                <div class="BTSX">
                    <div class="BTSXc">
                        <div class="BTSXcli">
                            <div class="BTSXcliT">排序：</div>
                            <img src="/wankangyuan/static/img/sort_up.png" alt="" class="BTSXcliI" />
                            <img src="/wankangyuan/static/img/sort_down.png" alt="" class="BTSXcliI" />
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