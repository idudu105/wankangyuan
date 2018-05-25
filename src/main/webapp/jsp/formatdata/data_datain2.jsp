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
        // project1();
        // pro_mine();
        // pro_dataLB();
        pro_data();
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
                <a href="/wankangyuan/sourceData/firstIn?type=1">
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
                    <div class="top2Ctl active">
                        <a href="javascript:history.go(-1);">
                            <img src="img/back.png" height="20" width="20" alt="" class="backI" />
                        </a>张三
                    </div>
                    <div class="app_expexport">导出</div>
                </div>
            </div>
            <div class="prodainm">
                <div class="prodainmL">
                    <div class="PJliBK">
                        <div class="PJliB1">
                            <div class="PJliB1L">
                                <div class="fuxuanK4">
                                    <input type="checkbox" class="input_check" id="check0">
                                    <label for="check0"></label>
                                </div>
                                <div class="PJliB1Lt">临床数据</div>
                                <div class="PJliBLi PJliBLi2"></div>
                            </div>
                            <div class="PJliBR">
                                <div class="PJliB2">
                                    <div class="PJliB2L">
                                        <div class="fuxuanK4">
                                            <input type="checkbox" class="input_check" id="check1">
                                            <label for="check1"></label>
                                        </div>
                                        <div class="PJliB2Lt">CT</div>
                                        <div class="PJliBLi PJliBLi2"></div>
                                    </div>
                                    <div class="PJliBR">
                                        <div class="PJliB2">
                                            <div class="PJliB2L">
                                                <div class="fuxuanK4">
                                                    <input type="checkbox" class="input_check" id="check2">
                                                    <label for="check2"></label>
                                                </div>
                                                <a href="data_dataclick2.html">
                                                    <div class="PJliB2Lt">CT1</div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="PJliB2">
                                            <div class="PJliB2L">
                                                <div class="fuxuanK4">
                                                    <input type="checkbox" class="input_check" id="check3">
                                                    <label for="check3"></label>
                                                </div>
                                                <a href="data_dataclick2.html">
                                                    <div class="PJliB2Lt">CT2</div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="PJliB2">
                                            <div class="PJliB2L">
                                                <div class="fuxuanK4">
                                                    <input type="checkbox" class="input_check" id="check4">
                                                    <label for="check4"></label>
                                                </div>
                                                <a href="data_dataclick2.html">
                                                    <div class="PJliB2Lt">CT3</div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="PJliB2">
                                    <div class="PJliB2L">
                                        <div class="fuxuanK4">
                                            <input type="checkbox" class="input_check" id="check5">
                                            <label for="check5"></label>
                                        </div>
                                        <div class="PJliB2Lt">XG</div>
                                        <div class="PJliBLi PJliBLi2"></div>
                                    </div>
                                    <div class="PJliBR">
                                        <div class="PJliB2">
                                            <div class="PJliB2L">
                                                <div class="fuxuanK4">
                                                    <input type="checkbox" class="input_check" id="check6">
                                                    <label for="check6"></label>
                                                </div>
                                                <a href="data_dataclick2.html">
                                                    <div class="PJliB2Lt">XG1</div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="PJliB2">
                                            <div class="PJliB2L">
                                                <div class="fuxuanK4">
                                                    <input type="checkbox" class="input_check" id="check7">
                                                    <label for="check7"></label>
                                                </div>
                                                <a href="data_dataclick2.html">
                                                    <div class="PJliB2Lt">XG2</div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="PJliB2">
                                            <div class="PJliB2L">
                                                <div class="fuxuanK4">
                                                    <input type="checkbox" class="input_check" id="check8">
                                                    <label for="check8"></label>
                                                </div>
                                                <a href="data_dataclick2.html">
                                                    <div class="PJliB2Lt">XG3</div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="PJliB1">
                            <div class="PJliB1L">
                                <div class="fuxuanK4">
                                    <input type="checkbox" class="input_check" id="check1_0">
                                    <label for="check1_0"></label>
                                </div>
                                <div class="PJliB1Lt">分子数据</div>
                                <div class="PJliBLi PJliBLi2"></div>
                            </div>
                            <div class="PJliBR">
                                <div class="PJliB2">
                                    <div class="PJliB2L">
                                        <div class="fuxuanK4">
                                            <input type="checkbox" class="input_check" id="check1_1">
                                            <label for="check1_1"></label>
                                        </div>
                                        <div class="PJliB2Lt">CT</div>
                                        <div class="PJliBLi PJliBLi2"></div>
                                    </div>
                                    <div class="PJliBR">
                                        <div class="PJliB2">
                                            <div class="PJliB2L">
                                                <div class="fuxuanK4">
                                                    <input type="checkbox" class="input_check" id="check1_2">
                                                    <label for="check1_2"></label>
                                                </div>
                                                <a href="data_dataclick2.html">
                                                    <div class="PJliB2Lt">CT1</div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="PJliB2">
                                            <div class="PJliB2L">
                                                <div class="fuxuanK4">
                                                    <input type="checkbox" class="input_check" id="check1_3">
                                                    <label for="check1_3"></label>
                                                </div>
                                                <a href="data_dataclick2.html">
                                                    <div class="PJliB2Lt">CT2</div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="PJliB2">
                                            <div class="PJliB2L">
                                                <div class="fuxuanK4">
                                                    <input type="checkbox" class="input_check" id="check1_4">
                                                    <label for="check1_4"></label>
                                                </div>
                                                <a href="data_dataclick2.html">
                                                    <div class="PJliB2Lt">CT3</div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="PJliB2">
                                    <div class="PJliB2L">
                                        <div class="fuxuanK4">
                                            <input type="checkbox" class="input_check" id="check1_5">
                                            <label for="check1_5"></label>
                                        </div>
                                        <div class="PJliB2Lt">XG</div>
                                        <div class="PJliBLi PJliBLi2"></div>
                                    </div>
                                    <div class="PJliBR">
                                        <div class="PJliB2">
                                            <div class="PJliB2L">
                                                <div class="fuxuanK4">
                                                    <input type="checkbox" class="input_check" id="check1_6">
                                                    <label for="check1_6"></label>
                                                </div>
                                                <a href="data_dataclick2.html">
                                                    <div class="PJliB2Lt">XG1</div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="PJliB2">
                                            <div class="PJliB2L">
                                                <div class="fuxuanK4">
                                                    <input type="checkbox" class="input_check" id="check1_7">
                                                    <label for="check1_7"></label>
                                                </div>
                                                <a href="data_dataclick2.html">
                                                    <div class="PJliB2Lt">XG2</div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="PJliB2">
                                            <div class="PJliB2L">
                                                <div class="fuxuanK4">
                                                    <input type="checkbox" class="input_check" id="check1_8">
                                                    <label for="check1_8"></label>
                                                </div>
                                                <a href="data_dataclick2.html">
                                                    <div class="PJliB2Lt">XG3</div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="prodainmR">
                    <div class="prodainmRz1">
                        <div class="prodainmRz1L">姓名：</div>
                        <div class="prodainmRz1R">张三</div>
                    </div>
                    <div class="prodainmRz1">
                        <div class="prodainmRz1L">年龄：</div>
                        <div class="prodainmRz1R">25</div>
                    </div>
                    <div class="prodainmRz1">
                        <div class="prodainmRz1L">性别：</div>
                        <div class="prodainmRz1R">男</div>
                    </div>
                    <div class="prodainmRz1">
                        <div class="prodainmRz1L">病史：</div>
                        <div class="prodainmRz1R">无</div>
                    </div>
                    <div class="prodainmRz2">
                        <div class="prodainmRz2T">个人信息：</div>
                        <div class="prodainmRz2B"></div>
                    </div>
                    <div class="prodainmRz2">
                        <div class="prodainmRz2T">个人信息2：</div>
                        <div class="prodainmRz2B"></div>
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