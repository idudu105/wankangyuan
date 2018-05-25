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
        // project1();
        // pro_mine();
        // pro_dataLB();
        pro_data();
        pro_dataclick();
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
                <a href="/wankangyuan/formatData/firstIn?type=1">
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
                    <div class="top2Ctl active">
                        <a href="javascript:history.go(-1);">
                            <img src="/wankangyuan/static/img/back.png" height="20" width="20" alt="" class="backI" />
                        </a>张三
                    </div>
                </div>
            </div>
            <div class="prodainm">
                <div class="prodainmL">
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
                    <div class="PJliB1">
                        <div class="PJliB1L">
                            <div class="PJliB1Lt">分子数据</div>
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
                <div class="prodaclmR">
                    <div class="prodaclmRz">
                        <div class="prodaclmRzT">
                            <div class="prodaclmRzTi"></div>
                            <div class="prodaclmRzTt prodaclmRzTtmz">名称</div>
                            <div class="prodaclmRzTt prodaclmRzTtnr">内容</div>
                        </div>
                        <div class="prodaclmRzB">
                            <div class="prodaclmRzBz">
                                <div class="prodaclmRzTi"></div>
                                <div class="prodaclmRzBzt prodaclmRzTtmz">机器1</div>
                                <div class="prodaclmRzBzt prodaclmRzTtnr">机器人信息1</div>
                            </div>
                            <div class="prodaclmRzBz">
                                <div class="prodaclmRzTi"></div>
                                <div class="prodaclmRzBzt prodaclmRzTtmz">采集人1</div>
                                <div class="prodaclmRzBzt prodaclmRzTtnr">采集人信息1</div>
                            </div>
                            <div class="prodaclmRzBz">
                                <div class="prodaclmRzTi"></div>
                                <div class="prodaclmRzBzt prodaclmRzTtmz">XX</div>
                                <div class="prodaclmRzBzt prodaclmRzTtnr"></div>
                            </div>
                            <!-- <div class="prodaclmRzBz">
                                <div class="prodaclmRzTi"></div>
                                <div class="prodaclmRzBzt prodaclmRzTtmz">XX</div>
                                <div class="prodaclmRzBzt prodaclmRzTtnr"></div>
                            </div> -->
                        </div>
                    </div>
                    <div class="prodaclmRz2">
                        <div class="prodaclmRsxK">
                            <div class="prodaclmRsx">
                                <div class="prodaclmRsxT">筛选</div>
                                <img src="/wankangyuan/static/img/sanjiao_blue.png" alt="" class="prodaclmRsxI" />
                            </div>
                            <div class="prodaclmRss">
                                <div class="prodaclmRssC">
                                    <img src="/wankangyuan/static/img/search.png" alt="" class="searchCi" />
                                    <input type="text" class="searchCt"  placeholder="搜索项目" />
                                </div>
                            </div>
                        </div>
                        <div class="shaixuanZK">
                            <div class="shaixuanZKli">
                                <div class="shaixuanZKliT">数据1</div>
                                <div class="shaixuanZKliI active"></div>
                            </div>
                            <div class="shaixuanZKli">
                                <div class="shaixuanZKliT">数据2</div>
                                <div class="shaixuanZKliI active"></div>
                            </div>
                            <div class="shaixuanZKli">
                                <div class="shaixuanZKliT">数据3</div>
                                <div class="shaixuanZKliI active"></div>
                            </div>
                        </div>
                        <div class="prodaclmRsjK">
                            <div class="prodaclmRzT">
                                <div class="prodaclmRzTi"></div>
                                <div class="prodaclmRzTit">全选</div>
                                <div class="prodaclmRzTt2 prodaclmRzTtsj1">数据1</div>
                                <div class="prodaclmRzTt2 prodaclmRzTtsj2">数据2</div>
                                <div class="prodaclmRzTt2 prodaclmRzTtsj3">数据3</div>
                            </div>
                            <div class="prodaclmRzB">
                                <div class="prodaclmRzBz">
                                    <div class="prodaclmRzTi"></div>
                                    <div class="prodaclmRzBzid">李四</div>
                                    <div class="prodaclmRzTt3 prodaclmRzTtsj1">数据11</div>
                                    <div class="prodaclmRzTt3 prodaclmRzTtsj2">数据22</div>
                                    <div class="prodaclmRzTt3 prodaclmRzTtsj3">数据33</div>
                                </div>
                                <div class="prodaclmRzBz">
                                    <div class="prodaclmRzTi"></div>
                                    <div class="prodaclmRzBzid">李四</div>
                                    <div class="prodaclmRzTt3 prodaclmRzTtsj1">数据11</div>
                                    <div class="prodaclmRzTt3 prodaclmRzTtsj2">数据22</div>
                                    <div class="prodaclmRzTt3 prodaclmRzTtsj3">数据33</div>
                                </div>
                                <div class="prodaclmRzBz">
                                    <div class="prodaclmRzTi"></div>
                                    <div class="prodaclmRzBzid">李四</div>
                                    <div class="prodaclmRzTt3 prodaclmRzTtsj1">数据11</div>
                                    <div class="prodaclmRzTt3 prodaclmRzTtsj2">数据22</div>
                                    <div class="prodaclmRzTt3 prodaclmRzTtsj3">数据33</div>
                                </div>
                            </div>

                        </div>
                    </div>
                    
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