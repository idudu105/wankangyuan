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
<link rel="stylesheet" type="text/css" href="css/project1.css" />
<script type="text/javascript" src="js/project1.js"></script>
<script type="text/javascript">
    window.onload=function(){
        project0();
        project2();
        data_mine();
    }
</script>
<body>
    <div class="Box">
        <div class="box">
            <div class="top">
                <h1><img src="img/newlogo2.png" height="70" width="218" alt="" class="logo" /></h1>
                <a href="project_mine.html">
                    <div class="topT">项目</div>
                </a>
                <a href="javascript:;">
                    <div class="topT active">格式数据</div>
                </a>
                <a href="app_mine.html">
                    <div class="topT">应用</div>
                </a>
                <div class="touxiangK">
                    <img src="img/touxiang.png" alt="" class="touxiang" />
                </div>
                <div class="nicheng">Peter</div>
                <div class="yanjiuquan">
                    <div class="yanjiuquanT">研究圈</div>
                    <img src="img/redpoint.png" height="11" width="11" alt="" class="redpoint" />
                </div>
            </div>
            <div class="top2">
                <div class="top2C">
                    <a href="javascript:;"><div class="top2Cli top2CliYJ">我的</div></a>
                    <a href="data_create.html"><div class="top2Cli">我创建的</div></a>
                    <a href="data_public.html"><div class="top2Cli">公共</div></a>
                    <div class="search">
                        <div class="searchC">
                            <img src="img/search.png" alt="" class="searchCi" />
                            <input type="text" class="searchCt"  placeholder="搜索项目" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="shaixuan">
                <div class="shaixuanC">
                    <div class="listZT">
                        <a href="javascript:;">
                            <div class="listZTli listZT1">
                                <img src="img/listZT1.png"alt="" class="listZT1i" />
                                <img src="img/listZT1.png" alt="" class="listZT1i" />
                            </div>
                        </a>
                        <a href="data_mine.html">
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
                            <img src="img/sanjiao_blue.png" alt="" class="shaixuanBTi" />
                        </div>
                    </div>
                    <div class="jiangeline"></div>
                    <div class="allK">
                        <div class="allX"></div>
                        <div class="allT">全选</div>
                    </div>
                    <!-- <div class="pro_menu pro_exit">退出</div> -->
                    <div class="pro_menu pro_addK">
                        <div class="pro_addk">
                            <div class="pro_addT">添加至项目</div>
                            <div class="pro_addI"></div>
                        </div>
                    </div>
                    <div class="pro_menu pro_rem">移除</div>
                    <div class="pro_menu pro_export">导出</div>
                    <select name="" id="" class="pro_menusel">
                        <option value="man">人</option>
                    </select>
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
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <a href="project_detail.html">
                            <div class="PJK2litopT">数据名称</div>
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
                    
                </div>
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <a href="project_detail.html">
                            <div class="PJK2litopT">数据名称</div>
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
                    
                </div>
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <a href="project_detail.html">
                            <div class="PJK2litopT">数据名称</div>
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
                    
                </div>
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <a href="project_detail.html">
                            <div class="PJK2litopT">数据名称</div>
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
                    
                </div>
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <a href="project_detail.html">
                            <div class="PJK2litopT">数据名称</div>
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
                    
                </div>
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <a href="project_detail.html">
                            <div class="PJK2litopT">数据名称</div>
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
        </div>
    </div>
</body>
</html>