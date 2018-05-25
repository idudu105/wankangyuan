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
        pro_dataLB();
        pro_data();
        data_mine()
    }
</script>
<body>
    <div class="Box">
        <div class="box">
            <div class="top">
                <h1><img src="/wankangyuan/static/img/newlogo2.png" height="70" width="218" alt="" class="logo" /></h1>
                <a href="/wankangyuan/project/selectMyProject">
                	<div class="topT">项目</div>
                </a>
                <a href="/wankangyuan/sourceData/firstIn?type=1">
                    <div class="topT active">格式数据</div>
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
                    <a href="/wankangyuan/sourceData/firstIn?type=1"><div class="top2Cli top2CliYJ">我的</div></a>
                    <a href="/wankangyuan/sourceData/firstIn?type=2"><div class="top2Cli">我创建的</div></a>
                    <a href="/wankangyuan/sourceData/firstIn?type=3"><div class="top2Cli">公共</div></a>
                    <div class="search">
                        <div class="searchC">
                            <img src="/wankangyuan/static/img/search.png" alt="" class="searchCi" />
                            <input type="text" class="searchCt"  placeholder="搜索项目" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="shaixuan">
                <div class="shaixuanC">
                    <div class="listZT">
                        <a href="data_mine2.html">
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
                    <div class="pro_menu pro_addK">
                        <div class="pro_addk">
                            <div class="pro_addT">添加至项目</div>
                            <div class="pro_addI"></div>
                        </div>
                    </div>
                    <div class="pro_menu pro_rem">移除</div>
                    <div class="pro_menu pro_export">导出</div>
                    <!-- 展示数据源列表 ， 需要为select 的option 的onclick设置事件监听-->
                    <select name="" id="" class="pro_menusel">
                    	<c:forEach items="${sources}" var="source">
							<option value="${source.cs_id }" >${source.cs_name}</option>
						</c:forEach>
                    </select>
                    
                </div>
                <div class="pro_addul">
                	<c:forEach items="${projects}" var="projectTemp">
						<div class="pro_addli" id="${projectTemp.id }" >${projectTemp.p_name}</div>
					</c:forEach>
                </div>
                <div class="shaixuanZK">
                	<c:forEach items="${source.sourceFields}" var="sourceFieldTemp">
						<div class="shaixuanZKli">
	                        <div class="shaixuanZKliT">${sourceFieldTemp.csf_name}</div>
	                        <div class="shaixuanZKliI active"></div>
	                    </div>	
					</c:forEach>	
                </div>
            </div>
            <div class="PJK">
                <div class="PJList">
                    <div class="allK">
                        <div class="allX"></div>
                        <div class="allT">全选</div>
                    </div>
                    <c:forEach items="${source.sourceFields}" var="sourceFieldTemp">
	                	<div class="PJListli">${sourceFieldTemp.csf_name}</div>
					</c:forEach>
                </div>
                <div class="PJListline"></div>
                <div class="PJul">
                    <div class="PJli">
                        <div class="PJliC">
                            <div class="PJXZ"></div>
                            
                            
                            <div class="PJliCli2 dataname">
                                <a href="project_datain.html">
                                    <span>张三</span>
                                </a>
                            </div>
                            <div class="PJliCli2 dataage">25</div>
                            <div class="PJliCli2 datasex">男</div>
                            <div class="PJliCli2 datahistory">无</div>
                            <div class="PJliCli2 datainfor">个人信息</div>
                            <div class="PJliCli2 datacreater">赵七</div>
                            <div class="PJliCli2 datatime">2018-4-20</div>

                        </div>
                        <div class="PJliline"></div>
                        <div class="PJliB active">
                            <div class="PJliB1">
                                <div class="PJliB1L">
                                    <div class="PJliB1Lt">临床数据</div>
                                    <div class="PJliBLi PJliBLi2"></div>
                                </div>
                                <div class="PJliBR">
                                    <div class="PJliB2">
                                        <div class="PJliB2L">
                                            <div class="PJliB2Lk"></div>
                                            <div class="PJliB2Lt">CT</div>
                                            <div class="PJliBLi PJliBLi2"></div>
                                        </div>
                                        <div class="PJliBR">
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="PJliB2Lk"></div>
                                                    <div class="PJliB2Lt">CT1</div>
                                                </div>
                                            </div>
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="PJliB2Lk"></div>
                                                    <div class="PJliB2Lt">CT2</div>
                                                </div>
                                            </div>
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="PJliB2Lk"></div>
                                                    <div class="PJliB2Lt">CT3</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="PJliB2">
                                        <div class="PJliB2L">
                                            <div class="PJliB2Lk"></div>
                                            <div class="PJliB2Lt">XG</div>
                                            <div class="PJliBLi PJliBLi2"></div>
                                        </div>
                                        <div class="PJliBR">
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="PJliB2Lk"></div>
                                                    <div class="PJliB2Lt">XG1</div>
                                                </div>
                                            </div>
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="PJliB2Lk"></div>
                                                    <div class="PJliB2Lt">XG2</div>
                                                </div>
                                            </div>
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="PJliB2Lk"></div>
                                                    <div class="PJliB2Lt">XG3</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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