<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Document</title>
</head>
<link rel="stylesheet" type="text/css" href="/wankangyuan/pages/css/project1.css" />
<script type="text/javascript" src="/wankangyuan/pages/js/project1.js"></script>
<script type="text/javascript">
    window.onload=function(){
        project0();
        project1();
        pro_create();
        pro_create1();
    }
</script>
<body>
    <div class="Box">
        <div class="box">
            <div class="top">
                <h1><img src="/wankangyuan/pages/img/newlogo2.png" height="70" width="218" alt="" class="logo" /></h1>
                <div class="topT active">项目</div>
                <div class="topT">格式数据</div>
                <div class="topT">应用</div>
                <div class="touxiangK">
                    <img src="/wankangyuan/pages/img/touxiang.png" alt="" class="touxiang" />
                </div>
                <div class="nicheng">Peter</div>
                <div class="yanjiuquan">
                    <div class="yanjiuquanT">研究圈</div>
                    <img src="/wankangyuan/pages/img/redpoint.png" height="11" width="11" alt="" class="redpoint" />
                </div>
            </div>
            <div class="top2">
                <div class="top2C">
                    <a href="/wankangyuan/project/selectMyProject?user_id=1"><div class="top2Cli">我的</div></a>
                    <a href="javascript:;"><div class="top2Cli top2CliYJ">我创建的</div></a>
                    <a href="/wankangyuan/project/selectPublicProject"><div class="top2Cli">公共</div></a>
                    
                    <div class="search">
                        <div class="searchC">
                            <img src="/wankangyuan/pages/img/search.png" alt="" class="searchCi" />
                            <input type="text" class="searchCt"  placeholder="搜索项目" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="shaixuan">
                <div class="shaixuanC">
                    <div class="listZT">
                        <a href="../pages/project_create2.jsp">
                            <div class="listZTli listZT1 active">
                                <img src="/wankangyuan/pages/img/listZT1.png"alt="" class="listZT1i" />
                                <img src="/wankangyuan/pages/img/listZT1.png" alt="" class="listZT1i" />
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
                            <img src="/wankangyuan/pages/img/sanjiao_blue.png" alt="" class="shaixuanBTi" />
                        </div>
                    </div>
                    <!-- <div class="jiangeline"></div> -->
                    <!-- <div class="allK">
                        <div class="allX">
                            <img src="img/greentrue.png" alt="" class="allI active" />
                        </div>
                        <div class="allT">全选</div>
                    </div> -->
                    <div class="pro_menu pro_delete">删除</div>
                    <div class="pro_menu pro_nonpublic">取消公开</div>
                    <div class="pro_menu pro_public">公开</div>
                    <div class="pro_menu pro_create">+创建项目</div>
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
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">公开状态</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                </div>
            </div>
            <div class="PJK">
                <div class="PJeditK">
                    <div class="PJeditX"></div>
                    <div class="PJeditli">
                        <div class="PJeditliC">
                            <div class="PJeditlit">项目名称：</div>
                            <input type="text" class="PJeditlik" />
                        </div>
                    </div>
                    <div class="PJeditli">
                        <div class="PJeditliC">
                            <div class="PJeditlit">异步/同步：</div>
                            <input type="text" class="PJeditlik" />
                        </div>
                    </div>
                    <div class="PJeditli">
                        <div class="PJeditliC">
                            <div class="PJeditlit">关键字：</div>
                            <input type="text" class="PJeditlik" />
                        </div>
                    </div>
                    <input type="button" class="PJeditB" value="完成" />
                </div>
                <div class="PJList">
                    <div class="allK">
                        <div class="allX">
                            <!-- <img src="img/greentrue.png" alt="" class="allI" /> -->
                        </div>
                        <div class="allT">全选</div>
                    </div>
                    <div class="PJListli PJname">项目名称</div>
                    <div class="PJListli PJID">项目编号</div>
                    <div class="PJListli PJcreater">创建者</div>
                    <div class="PJListli PJtime">创建时间</div>
                    <div class="PJListli PJyibu">异步/同步</div>
                    <div class="PJListli PJkeyword">关键字</div>
                    <div class="PJListli PJopenor">公开状态</div>
                    <!-- <div class="PJListli PJother4">其他4</div> -->
                </div>
                <div class="PJListline"></div>
                <div class="PJul">
                
                	<c:forEach items="${projects}" var="project">
	                	<div class="PJli">
	                        <div class="PJliC">
	                            <div class="PJXZ"></div>
	                            <a href="project_detail.html">
	                                <div class="PJliCli PJname">${project.p_name}</div>
	                                <div class="PJliCli PJID">${project.p_number }</div>
	                                <div class="PJliCli PJcreater">${project.creator }</div>
	                                <div class="PJliCli PJtime">${project.create_datetime }</div>
	                                <c:if test="${project.is_asy == 0}">
	                                	<div class="PJliCli PJyibu">同步</div>
	                                </c:if>
	                                <c:if test="${project.is_asy == 1}">
	                                	<div class="PJliCli PJyibu">异步</div>
	                                </c:if>
	                                <div class="PJliCli PJkeyword">${project.key_words }</div>
	                                <c:if test="${project.is_open == 0}">
	                                	<div class="PJliCli PJopenor">未公开</div>
	                                </c:if>
	                                <c:if test="${project.is_open == 1}">
	                                	<div class="PJliCli PJopenor">已公开</div>
	                                </c:if>

	                            </a>
	                            <div class="PJliCli PJedit">编辑</div>
	                        </div>
	                        <div class="PJliline"></div>
	                    </div>
                	</c:forEach>


                </div>

                <div class="BTSX">
                    <div class="BTSXc">
                        <div class="BTSXcli">
                            <div class="BTSXcliT">排序：</div>
                            <img src="img/sort_up.png" alt="" class="BTSXcliI" />
                            <img src="img/sort_down.png" alt="" class="BTSXcliI" />
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
                    <img src="img/pageL.png" class="pageLRi" alt="" />
                </div>
                <div class="pageNUM active">1</div>
                <div class="pageNUM ">2</div>
                <div class="pageNUM">3</div>
                <div class="pageLR">
                    <img src="img/pageR.png" class="pageLRi" alt="" />
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

            <div class="createPJK">
            	<!-- form表单提交数据 -->
            	<form action="/wankangyuan/project/insertProject">

	                <div class="cre_PJKtop">
	                    <div class="cre_PJKtopT">创建项目</div>
	                    <img src="/wankangyuan/pages/img/close.png" alt="" class="cre_PJKtopI" />
	                </div>
	                <div class="cre_PJKline"></div>
	                <div class="cre_PJKmid">
	                    <div class="cre_PJKmidT">项目名称：</div>
	                    <input type="text" id="p_name" name="p_name" class="cre_PJKmidK" />
	                </div>
	                <div class="cre_PJKmid">
	                    <div class="cre_PJKmidT">项目编号：</div>
	                    <input type="text" id="p_number" name="p_number" class="cre_PJKmidK" />
	                </div>
	                <div class="cre_PJKmid">
	                    <div class="cre_PJKmidT">异步同步：</div>
	                    <select id="is_asy" name="is_asy" class="cre_PJKmidK">
							<option value="0" checked>同步</option>
							<option value="1">异步</option>
						</select>
	                </div>
	                <div class="cre_PJKmid">
	                    <div class="cre_PJKmidT">关键字：</div>
	                    <input type="text" id="key_words" name="key_words" class="cre_PJKmidK" />
	                </div>
	                <input type="submit" class="cre_PJKbt" value="创建" />
	           
	           </form>
            </div>
        </div>
    </div>
</body>
</html>