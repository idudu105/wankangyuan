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
<link rel="stylesheet" type="text/css" href="/wankangyuan/static/css/project1.css" />
<script type="text/javascript" src="/wankangyuan/static/js/project1.js"></script>
<script type="text/javascript">
    window.onload=function(){
        project0();
        project1();
        // pro_mine();
        pro_dataLB();
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
                    <div class="top2Ctl active">13例结直肠癌病人的基因表达</div>
                    <a href="project_discuss.html"><div class="top2Ctr">讨论版</div></a>
                    <a href="project_member.html"><div class="top2Ctr">成员</div></a>
                    <a href="project_append.html"><div class="top2Ctr">应用结果</div></a>
                    <a href="project_app.html"><div class="top2Ctr">应用</div></a>
                    <a href="/wankangyuan/projectFormatData/selectProjectFormatDataList"><div class="top2Ctr active">格式数据</div></a>
                    <a href="/wankangyuan/projectFloderFile/selectProjectFloderByProjectId"><div class="top2Ctr">文件</div></a>
                    <a href="/wankangyuan/project/getProjectDetail"><div class="top2Ctr">基本信息</div></a>
                </div>
            </div>
            <div class="shaixuan">
                <div class="shaixuanC">
                    <div class="listZT">
                        <div class="listZTli listZT1 active">
                            <img src="/wankangyuan/static/img/listZT1.png"alt="" class="listZT1i" />
                            <img src="/wankangyuan/static/img/listZT1.png" alt="" class="listZT1i" />
                        </div>
                        <div class="listZTli listZT2">
                            <div class="listZT2d"></div>
                            <div class="listZT2d"></div>
                            <div class="listZT2d"></div>
                        </div>
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
<<<<<<< HEAD
					<!-- <div class="pro_menu pro_exit">退出</div> -->
					<div class="pro_menu pro_rem">移除</div>
					
					<select name="" id="source_Select" class="pro_menusel" onchange="sourceOnChange(this.value)" >
						<c:forEach items="${sources}" var="source">
							<option value="${source.cs_id }" >${source.cs_name}</option>
						</c:forEach>						
					</select>
					
					<!-- <div class="pro_menu pro_run">运行</div> -->
					<div class="search2">
						<div class="search2C">
							<img src="img/search.png" alt="" class="search2Ci" /> <input
								type="text" class="search2Ct" placeholder="搜索数据" />
						</div>
					</div>
				</div>
				<div class="shaixuanZK">
					<c:forEach items="${sourceFileds}" var="sourceFiled">
						<div class="shaixuanZKli">
							<div class="shaixuanZKliT">${sourceFiled.csf_name}</div>
							<div class="shaixuanZKliI active"></div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="PJK">
				<div class="PJList">
					<div class="allK">
						<div class="allX">
							<!-- <img src="img/greentrue.png" alt="" class="allI" /> -->
						</div>
						<div class="allT">全选</div>
					</div>
						<c:forEach items="${sourceFileds}" var="sourceFiled">
							<div class="PJListli">${sourceFiled.csf_name}</div>
						</c:forEach>					
				</div>
				<div class="PJListline"></div>
				<div class="PJul">
					<c:forEach items="${sourceDatas}" var="sourceData">
						<div class="PJli">
							<div class="PJliC">
								<div class="PJXZ"></div>
								<c:forEach items="${sourceData}" var="sourceDataField" varStatus="status">	
									<c:if test="${status.index==0}">
										<div class="PJliCli2 dataname">
											<a href="/wankangyuan/formatType/selectFormatType?datainname=${sourceDataField}&cs_id=1"> <span>${sourceDataField}</span>
											</a>
										</div>
									</c:if>
									<c:if test="${status.index!=0}">
										<div class="PJliCli2">${sourceDataField}</div>
									</c:if>
								</c:forEach>		
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
					</c:forEach>	 
				</div>

				<div class="BTSX">
					<div class="BTSXc">
						<div class="BTSXcli">
							<div class="BTSXcliT">排序：</div>
							<img src="img/sort_up.png" alt="" class="BTSXcliI" /> <img
								src="img/sort_down.png" alt="" class="BTSXcliI" />
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
				</a> <a href="javascript:;">
					<div class="bot_guanyu">关于</div>
				</a> <a href="javascript:;">
					<div class="bot_jianyi">反馈建议</div>
				</a>
				<div class="botT">Copyright @2018天津万康源科技有限公司</div>
			</div>
		</div>
	</div>
=======
                    <!-- <div class="pro_menu pro_exit">退出</div> -->
                    <div class="pro_menu pro_rem">移除</div>
                    <select name="" id="" class="pro_menusel">
                        <option value="man">人</option>
                    </select>
                    <!-- <div class="pro_menu pro_run">运行</div> -->
                    <div class="search2">
                        <div class="search2C">
                            <img src="/wankangyuan/static/img/search.png" alt="" class="search2Ci" />
                            <input type="text" class="search2Ct"  placeholder="搜索数据" />
                        </div>
                    </div>
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
                    <!-- <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">数据6</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">数据7</div>
                        <div class="shaixuanZKliI active"></div>
                    </div> -->
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
                <div class="PJList">
                    <div class="allK">
                        <div class="allX">
                            <!-- <img src="/wankangyuan/static/img/greentrue.png" alt="" class="allI" /> -->
                        </div>
                        <div class="allT">全选</div>
                    </div>
                    <div class="PJListli dataname">姓名</div>
                    <div class="PJListli dataage">年龄</div>
                    <div class="PJListli datasex">性别</div>
                    <div class="PJListli datahistory">病史</div>
                    <div class="PJListli datainfor">个人信息</div>
                    <!-- <div class="PJListli data_data6">数据6</div>
                    <div class="PJListli data_data7">数据7</div> -->
                    <div class="PJListli datacreater">创建人</div>
                    <div class="PJListli datatime">创建时间</div>
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
                            <!-- <div class="PJliCli2 data_data6">数据6</div>
                            <div class="PJliCli2 data_data7">数据7</div> -->
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
                    <div class="PJli">
                        <div class="PJliC">
                            <div class="PJXZ"></div>
                            <div class="PJliCli2 dataname">
                                <a href="project_datain.html">
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
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="PJli">
                        <div class="PJliC">
                            <div class="PJXZ"></div>
                            <div class="PJliCli2 dataname">
                                <a href="project_datain.html">
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
                                    <div class="PJliB1Lt">临床数据</div>
                                    <div class="PJliBLi PJliBLi2"></div>
                                </div>
                                <div class="PJliBR">
                                    <div class="PJliB2">
                                        <div class="PJliB2L">
                                            <div class="PJliB2Lk"></div>
                                            <div class="PJliB2Lt">CT</div>
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
>>>>>>> 50a50c0084ad9f63c16df3e18b36be8e820962e7

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