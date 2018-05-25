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
        pro_dataLB();
        pro_data();
        // data_mine();
        // data_create();
    }
</script>
<body>
    <div class="Box">
        <div class="box">
            <div class="top">
                <h1><img src="/wankangyuan/static/img/newlogo2.png" height="70" width="218" alt="" class="logo" /></h1>
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
                    <a href="/wankangyuan/sourceData/firstIn?type=1"><div class="top2Cli">我的</div></a>
                    <a href="/wankangyuan/sourceData/firstIn?type=2"><div class="top2Cli">我创建的</div></a>
                    <a href="/wankangyuan/sourceData/firstIn?type=3"><div class="top2Cli top2CliYJ">公共</div></a>
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
                        <a href="data_public2.html">
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

                    <div class="pro_menu">添加至我的</div>
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
                <div class="shaixuanZK">
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">姓名</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">年龄</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">性别</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">病史</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">个人信息</div>
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
                </div>
            </div>
            <div class="PJK">
                <div class="inportK">
                    <div class="inportT">
                        <div class="inportTt">导入数据</div>
                        <div class="inportTx"></div>
                    </div>
                    <div class="inportM">
                        <div class="inportMt">请把相关数据按照分类准确输入到EXCEL表格模板中，上传数据后，表格会自动配置相关内容。</div>

                        <a href="javascript:;" class="inportMz inportMd">下载EXCEL模板</a>
                        <div class="inportMz inportMu">上传数据</div>
                        <input type="file" class="inportMf" />
                    </div>
                    <input type="button" class="inportB" value="提交" />
                </div>
                <div class="adddataK">
                    <div class="adddataT">
                        <div class="adddataTt">添加源数据</div>
                        <div class="adddataTx"></div>
                    </div>
                    <div class="adddataM">
                        <div class="adddataMli">
                            <div class="adddataMlit">姓名：</div>
                            <input type="text" class="adddataMliTT adddataMliT" />
                        </div>
                        <div class="adddataMli">
                            <div class="adddataMlit">年龄：</div>
                            <input type="text" class="adddataMliTT adddataMliT2" />
                        </div>
                        <div class="adddataMli">
                            <div class="adddataMlit">性别：</div>
                            <select name="" id="" class="adddataMliS">
                                <option value="">男</option>
                                <option value="">女</option>
                            </select>
                        </div>
                        <div class="adddataMli">
                            <div class="adddataMlit">病史：</div>
                            <input type="text" class="adddataMliTT adddataMliT" />
                        </div>
                        <div class="adddataMli">
                            <div class="adddataMlit">个人信息：</div>
                            <textarea name="" id=""  class="adddataMliTT adddataMliT3" ></textarea>
                        </div>
                    </div>
                    <div class="adddataB">
                        <input type="button" class="adddataBb" value="提交" />
                    </div>
                </div>
                <div class="PJList">
                    <div class="allK">
                        <div class="quanxuanK">
                            <input type="checkbox" class="input_check" id="check0">
                            <label for="check0"></label>
                        </div>
                        <div class="allT">全选</div>
                    </div>
                    <div class="PJListli dataname">姓名</div>
                    <div class="PJListli dataage">年龄</div>
                    <div class="PJListli datasex">性别</div>
                    <div class="PJListli datahistory">病史</div>
                    <div class="PJListli datainfor">个人信息</div>
                    <div class="PJListli datacreater">创建人</div>
                    <div class="PJListli datatime">创建时间</div>
                </div>
                <div class="PJListline"></div>
                <div class="PJul">
                    <div class="PJli">
                        <div class="PJliC">
                            <div class="fuxuanK2">
                                <input type="checkbox" class="input_check" id="check1">
                                <label for="check1"></label>
                            </div>
                            <div class="PJliCli2 dataname">
                                <a href="data_datain2.html">
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
                                    <div class="fuxuanK4">
                                        <input type="checkbox" class="input_check" id="check1_1">
                                        <label for="check1_1"></label>
                                    </div>
                                    <div class="PJliB1Lt">临床数据</div>
                                    <div class="PJliBLi PJliBLi2"></div>
                                </div>
                                <div class="PJliBR">
                                    <div class="PJliB2">
                                        <div class="PJliB2L">
                                            <div class="fuxuanK4">
                                                <input type="checkbox" class="input_check" id="check1_2">
                                                <label for="check1_2"></label>
                                            </div>
                                            <div class="PJliB2Lt">CT</div>
                                            <div class="PJliBLi PJliBLi2"></div>
                                        </div>
                                        <div class="PJliBR">
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="fuxuanK4">
                                                        <input type="checkbox" class="input_check" id="check1_3">
                                                        <label for="check1_3"></label>
                                                    </div>
                                                    <div class="PJliB2Lt">CT1</div>
                                                </div>
                                            </div>
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="fuxuanK4">
                                                        <input type="checkbox" class="input_check" id="check1_4">
                                                        <label for="check1_4"></label>
                                                    </div>
                                                    <div class="PJliB2Lt">CT2</div>
                                                </div>
                                            </div>
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="fuxuanK4">
                                                        <input type="checkbox" class="input_check" id="check1_5">
                                                        <label for="check1_5"></label>
                                                    </div>
                                                    <div class="PJliB2Lt">CT3</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="PJliB2">
                                        <div class="PJliB2L">
                                            <div class="fuxuanK4">
                                                <input type="checkbox" class="input_check" id="check1_6">
                                                <label for="check1_6"></label>
                                            </div>
                                            <div class="PJliB2Lt">XG</div>
                                            <div class="PJliBLi PJliBLi2"></div>
                                        </div>
                                        <div class="PJliBR">
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="fuxuanK4">
                                                        <input type="checkbox" class="input_check" id="check1_7">
                                                        <label for="check1_7"></label>
                                                    </div>
                                                    <div class="PJliB2Lt">XG1</div>
                                                </div>
                                            </div>
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="fuxuanK4">
                                                        <input type="checkbox" class="input_check" id="check1_8">
                                                        <label for="check1_8"></label>
                                                    </div>
                                                    <div class="PJliB2Lt">XG2</div>
                                                </div>
                                            </div>
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="fuxuanK4">
                                                        <input type="checkbox" class="input_check" id="check1_9">
                                                        <label for="check1_9"></label>
                                                    </div>
                                                    <div class="PJliB2Lt">XG3</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="PJli">
                        <div class="PJliC">
                            <div class="fuxuanK2">
                                <input type="checkbox" class="input_check" id="check2">
                                <label for="check2"></label>
                            </div>
                            <div class="PJliCli2 dataname">
                                <a href="data_datain2.html">
                                    <span>李四</span>
                                </a>
                            </div>
                            <div class="PJliCli2 dataage">36</div>
                            <div class="PJliCli2 datasex">男</div>
                            <div class="PJliCli2 datahistory">无</div>
                            <div class="PJliCli2 datainfor">个人信息</div>
                            <!-- <div class="PJliCli2 data_data6">数据6</div>
                            <div class="PJliCli2 data_data7">数据7</div> -->
                            <div class="PJliCli2 datacreater">赵七</div>
                            <div class="PJliCli2 datatime">2018-4-22</div>
                        </div>
                        <div class="PJliline"></div>
                        <div class="PJliB">
                            <div class="PJliB1">
                                <div class="PJliB1L">
                                    <div class="fuxuanK4">
                                        <input type="checkbox" class="input_check" id="check1_10">
                                        <label for="check1_10"></label>
                                    </div>
                                    <div class="PJliB1Lt">临床数据</div>
                                    <div class="PJliBLi PJliBLi2"></div>
                                </div>
                                <div class="PJliBR">
                                    <div class="PJliB2">
                                        <div class="PJliB2L">
                                            <div class="fuxuanK4">
                                                <input type="checkbox" class="input_check" id="check1_11">
                                                <label for="check1_11"></label>
                                            </div>
                                            <div class="PJliB2Lt">CT</div>
                                            <div class="PJliBLi PJliBLi2"></div>
                                        </div>
                                        <div class="PJliBR">
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="fuxuanK4">
                                                        <input type="checkbox" class="input_check" id="check1_12">
                                                        <label for="check1_12"></label>
                                                    </div>
                                                    <div class="PJliB2Lt">CT1</div>
                                                </div>
                                            </div>
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="fuxuanK4">
                                                        <input type="checkbox" class="input_check" id="check1_13">
                                                        <label for="check1_13"></label>
                                                    </div>
                                                    <div class="PJliB2Lt">CT2</div>
                                                </div>
                                            </div>
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="fuxuanK4">
                                                        <input type="checkbox" class="input_check" id="check1_14">
                                                        <label for="check1_14"></label>
                                                    </div>
                                                    <div class="PJliB2Lt">CT3</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="PJliB2">
                                        <div class="PJliB2L">
                                            <div class="fuxuanK4">
                                                <input type="checkbox" class="input_check" id="check1_15">
                                                <label for="check1_15"></label>
                                            </div>
                                            <div class="PJliB2Lt">XG</div>
                                            <div class="PJliBLi PJliBLi2"></div>
                                        </div>
                                        <div class="PJliBR">
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="fuxuanK4">
                                                        <input type="checkbox" class="input_check" id="check1_16">
                                                        <label for="check1_16"></label>
                                                    </div>
                                                    <div class="PJliB2Lt">XG1</div>
                                                </div>
                                            </div>
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="fuxuanK4">
                                                        <input type="checkbox" class="input_check" id="check1_17">
                                                        <label for="check1_17"></label>
                                                    </div>
                                                    <div class="PJliB2Lt">XG2</div>
                                                </div>
                                            </div>
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="fuxuanK4">
                                                        <input type="checkbox" class="input_check" id="check1_18">
                                                        <label for="check1_18"></label>
                                                    </div>
                                                    <div class="PJliB2Lt">XG3</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="PJli">
                        <div class="PJliC">
                            <div class="fuxuanK2">
                                <input type="checkbox" class="input_check" id="check3">
                                <label for="check3"></label>
                            </div>
                            <div class="PJliCli2 dataname">
                                <a href="data_datain2.html">
                                    <span>王五</span>
                                </a>
                            </div>
                            <div class="PJliCli2 dataage">32</div>
                            <div class="PJliCli2 datasex">男</div>
                            <div class="PJliCli2 datahistory">无</div>
                            <div class="PJliCli2 datainfor">个人信息</div>
                            <!-- <div class="PJliCli2 data_data6">数据6</div>
                            <div class="PJliCli2 data_data7">数据7</div> -->
                            <div class="PJliCli2 datacreater">赵七</div>
                            <div class="PJliCli2 datatime">2018-4-21</div>
                        </div>
                        <div class="PJliline"></div>
                        <div class="PJliB">
                            <div class="PJliB1">
                                <div class="PJliB1L">
                                    <div class="fuxuanK4">
                                        <input type="checkbox" class="input_check" id="check1_19">
                                        <label for="check1_19"></label>
                                    </div>
                                    <div class="PJliB1Lt">临床数据</div>
                                    <div class="PJliBLi PJliBLi2"></div>
                                </div>
                                <div class="PJliBR">
                                    <div class="PJliB2">
                                        <div class="PJliB2L">
                                            <div class="fuxuanK4">
                                                <input type="checkbox" class="input_check" id="check1_20">
                                                <label for="check1_20"></label>
                                            </div>
                                            <div class="PJliB2Lt">CT</div>
                                            <div class="PJliBLi PJliBLi2"></div>
                                        </div>
                                        <div class="PJliBR">
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="fuxuanK4">
                                                        <input type="checkbox" class="input_check" id="check1_21">
                                                        <label for="check1_21"></label>
                                                    </div>
                                                    <div class="PJliB2Lt">CT1</div>
                                                </div>
                                            </div>
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="fuxuanK4">
                                                        <input type="checkbox" class="input_check" id="check1_22">
                                                        <label for="check1_22"></label>
                                                    </div>
                                                    <div class="PJliB2Lt">CT2</div>
                                                </div>
                                            </div>
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="fuxuanK4">
                                                        <input type="checkbox" class="input_check" id="check1_23">
                                                        <label for="check1_23"></label>
                                                    </div>
                                                    <div class="PJliB2Lt">CT3</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="PJliB2">
                                        <div class="PJliB2L">
                                            <div class="fuxuanK4">
                                                <input type="checkbox" class="input_check" id="check1_24">
                                                <label for="check1_24"></label>
                                            </div>
                                            <div class="PJliB2Lt">XG</div>
                                            <div class="PJliBLi PJliBLi2"></div>
                                        </div>
                                        <div class="PJliBR">
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="fuxuanK4">
                                                        <input type="checkbox" class="input_check" id="check1_25">
                                                        <label for="check1_25"></label>
                                                    </div>
                                                    <div class="PJliB2Lt">XG1</div>
                                                </div>
                                            </div>
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="fuxuanK4">
                                                        <input type="checkbox" class="input_check" id="check1_26">
                                                        <label for="check1_26"></label>
                                                    </div>
                                                    <div class="PJliB2Lt">XG2</div>
                                                </div>
                                            </div>
                                            <div class="PJliB2">
                                                <div class="PJliB2L">
                                                    <div class="fuxuanK4">
                                                        <input type="checkbox" class="input_check" id="check1_27">
                                                        <label for="check1_27"></label>
                                                    </div>
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