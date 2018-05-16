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
        data_mine();
        data_create();
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
            <!-- <div class="top2">
                <div class="top2C">
                    <div class="top2Ctl active">13例结直肠癌病人的基因表达</div>
                    <a href="project_discuss.html"><div class="top2Ctr">讨论版</div></a>
                    <a href="project_member.html"><div class="top2Ctr">成员</div></a>
                    <a href="project_append.html"><div class="top2Ctr">应用结果</div></a>
                    <a href="project_app.html"><div class="top2Ctr">应用</div></a>
                    <a href="javascript:;"><div class="top2Ctr active">格式数据</div></a>
                    <a href="project_file.html"><div class="top2Ctr">文件</div></a>
                    <a href="project_detail.html"><div class="top2Ctr">基本信息</div></a>
                </div>
            </div> -->
            <div class="top2">
                <div class="top2C">
                    <a href="data_mine.html"><div class="top2Cli">我的</div></a>
                    <a href="javascript:;"><div class="top2Cli top2CliYJ">我创建的</div></a>
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
                        <a href="data_create2.html">
                            <div class="listZTli listZT1 active">
                                <img src="img/listZT1.png"alt="" class="listZT1i" />
                                <img src="img/listZT1.png" alt="" class="listZT1i" />
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
                            <img src="img/sanjiao_blue.png" alt="" class="shaixuanBTi" />
                        </div>
                    </div>
                    <!-- <div class="jiangeline"></div> -->
                    <!-- <div class="allK">
                        <div class="allX">
                            <img src="img/greentrue.png" alt="" class="allI active" />
                        </div>
                        <div class="allT">全选</div>
                    </div> -->
                    <!-- <div class="pro_menu pro_exit">退出</div> -->
                    <div class="pro_menu pro_addK">
                        <div class="pro_addk">
                            <div class="pro_addT">添加至项目</div>
                            <div class="pro_addI"></div>
                        </div>
                    </div>
                    <div class="pro_menu pro_open">公开</div>
                    <div class="pro_menu pro_canopen">取消公开</div>
                    <div class="pro_menu pro_inport">导入</div>
                    <div class="pro_menu pro_export">导出</div>
                    <div class="pro_menu pro_rem">移除</div>
                    <div class="pro_menu pro_adddata">+添加源数据</div>
                    	<select name="" id="source_Select" class="pro_menusel"  >
						<c:forEach items="${sources}" var="source">
							<option value="${source.cs_id }" >${source.cs_name}</option>
						</c:forEach>						
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
					<c:forEach items="${sourceFileds}" var="sourceFiled">
						<div class="shaixuanZKli">
							<div class="shaixuanZKliT">${sourceFiled.csf_name}</div>
							<div class="shaixuanZKliI active"></div>
						</div>
					</c:forEach>
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
                    <input type="button"  class="fileaddbtn" onclick="upFiles()" value="提交" />
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
        </div>
    </div>
    <!-- 文件上传form，但是实际的文件上传是通过ajax实现的 -->
	<form id="uploadForm" style="display:none;">
	    <input type="file" name="file" onchange="upFile()" id="uploadFile"/>
	</form>
    
    <script type="text/javascript" src="/wankangyuan/static/js/jquery.min.js"></script>
    <script type="text/javascript">
     	//ajax方式上传附件
		function upFile(){
			//获取附件内容
			var formData = new FormData($("#uploadForm")[0]);
			//上传附件
			$.ajax({
	            url: '/wankangyuan/formatData/upload' ,
	            type: 'POST',
	            data: formData,
	            dataType:'json',
	            cache: false,
	            contentType: false,
	            processData: false,
	            success: function (data) {
	                if(data.result == true){
	                	
	                	var fileUploadList = $("#fileUploadList");
	                	fileUploadList.append(
	                		'<div class="fileaddMm" id=\"'+data.id+'\">'+
	                            '<img src="/wankangyuan/static/img/file.png" height="20" width="16" alt="" class="fileaddMi" />'+
	                            '<div class="fileaddMz addMtzname">'+data.originalFilename+'</div>'+
	                            '<div class="fileaddMz addMtzsize">'+data.size+' KB</div>'+
	                            '<div class="fileaddMz addMtznum">小一号</div>'+
	                            '<div class="fileaddMz2 addMtzopea" onclick="removeFiv(\''+data.id+'\')">取消</div>'+
	                        '</div>'
	                	);
	                	ids.push(data.id);

	                }else{
	                	alert(data.message);
	                }
	            },
	            error: function () {
	            	alert("联网失败");
	            }
	        });
		}
</body>
</html>