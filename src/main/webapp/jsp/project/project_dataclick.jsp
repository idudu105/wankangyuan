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
                    <div class="top2Ctl active">
                        <a href="/wankangyuan/projectFormatData/getSourceDataById?cs_id=${formatTypeFolders[0].cs_id}&sourceDataId=${sourceDataId}">
                            <img src="/wankangyuan/static/img/back.png" height="20" width="20" alt="" class="backI" />
                        </a>${sourceData[1]}
                        <input id="cs_id" value="${formatTypeFolders[0].cs_id }" style="display:none;"/>
                        <input id="ft_id" value="${data[0].ft_id }" style="display:none;"/>
                        <input id="formatNodeId" value="${formatNodeId}" style="display:none;"/>
                        <input id="sourceDataId" value="${sourceDataId}" style="display:none;"/>
                    </div>
                </div>
            </div>
            <div class="prodainm">
                <div class="prodainmL">
            		<div class="PJliBK">
						<c:forEach items="${formatTypeFolders}" var="formatTypeTemp" varStatus="status">
							<div class="PJliB1">
	                            <div class="PJliB1L">
	                                <div class="fuxuanK4 fuxuanK41">
	                                    <input type="checkbox" class="input_check" name="${formatTypeTemp.ft_id }" id="check1_${formatTypeTemp.ft_id }">
	                                    <label for="check1_${formatTypeTemp.ft_id }"></label>
	                                </div>
	                                <div class="PJliB1Lt">${formatTypeTemp.ft_name }</div>
	                                <div class="PJliBLi PJliBLi2"></div>
	                            </div>
	                            <div class="PJliBR">
	                            	<c:forEach items="${formatTypeTemp.formatDataNodes}" var="formatDataNodeTemp" varStatus="status">
										<div class="PJliB2">
		                                    <div class="PJliB2L">
		                                        <div class="fuxuanK4 fuxuanK42">
		                                            <input type="checkbox" class="input_check" value="${formatTypeTemp.ft_id }" name="${formatDataNodeTemp.key}" id="check1_${formatDataNodeTemp.key}">
		                                            <label for="check1_${formatDataNodeTemp.key}"></label>
		                                        </div>
		                                        <div class="PJliB2Lt" id="${formatDataNodeTemp.key}"
		                                        	onclick="dataNodeClick('${formatDataNodeTemp.key}','${formatTypeTemp.ft_id }')">${formatDataNodeTemp.value}
		                                        </div>
		                                        
		                                    </div>
		                                </div>
									</c:forEach>
	                            </div>
	                        </div>
						</c:forEach>
                    </div>
                </div>
                
                
                <div class="prodaclmR">
                    <div class="prodaclmRz">
                        <div class="pdclmRz_ul">
                        </div>
                        <div class="prodaclmRzT">
                            
                            <div class="prodaclmRzTt prodaclmRzTtmz">名称</div>
                            <div class="prodaclmRzTt prodaclmRzTtnr">内容</div>
                        </div>
                        <div class="prodaclmRzB">
                      		<c:forEach items="${metaDatas}" var="metaDataListTemp">
	                            <div class="prodaclmRzBz">
			                        <div class="prodaclmRzBzt prodaclmRzTtmz">${metaDataListTemp[1] }</div>
			                        <div class="prodaclmRzBzt prodaclmRzTtmz">
			                        	${metaDataListTemp[2] }
			                        </div>			                        
	                            </div>
							</c:forEach>
                        </div>
                    </div>
                    <br>
                    <div class="prodaclmRz2">
                        <div class="prodaclmRsxK">
                            <div class="prodaclmRsx">
                                <div class="prodaclmRsxT">筛选</div>
                                <img src="/wankangyuan/static/img/sanjiao_blue.png" alt="" class="prodaclmRsxI" />
                            </div>
                        </div>
                        <div class="shaixuanZK">
                        	<c:forEach items="${data}" var="dataTemp">
	                            <div class="shaixuanZKli">
	                                <div class="shaixuanZKliT">${dataTemp.ff_name }</div>
	                                <div class="shaixuanZKliI active"></div>
	                            </div>
							</c:forEach>
                        </div>
                        <div class="prodaclmRsjK">
                            <div class="prodaclmRzT">
                                <div class="quanxuanK fxK1">
                                    <input type="checkbox" class="input_check" id="check4_0">
                                    <label for="check4_0"></label>
                                </div>
                                <c:forEach items="${data}" var="dataTemp">
		                            <div class="prodaclmRzTt2">${dataTemp.ff_name }</div>
								</c:forEach>
                            </div>
                            <div class="prodaclmRzB">
                                    <c:forEach items="${dataDatas}" var="dataDataTemp">
                                    	<div class="prodaclmRzBz">
		                                    <c:forEach items="${dataDataTemp}" var="dataDataTempTemp" varStatus="status">
		                                    	<c:if test="${status.index == 0 }">
		                                    		<div class="fuxuanK5 fxK1 fx4">
				                                        <input type="checkbox" class="input_check" name="${dataDataTempTemp}" id="check4_${dataDataTempTemp}">
				                                        <label for="check4_${dataDataTempTemp}"></label>
				                                    </div>
		                                    	</c:if>
		                                    	<c:if test="${status.index != 0 }">
		                                    		<div class="prodaclmRzTt3 prodaclmRzTtsj3">${dataDataTempTemp}</div>
		                                    	</c:if>
											</c:forEach>
										</div>   
									</c:forEach>
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
    
    <script type="text/javascript" src="/wankangyuan/static/js/jquery.min.js"></script>
    
    <script type="text/javascript">
    
	    function dataNodeClick(formatNodeId , ft_id){
			var cs_id = $('#cs_id').val();
			var sourceDataId = $("#sourceDataId").val();
			window.location.href="/wankangyuan/projectFormatData/getFormatNodeById?cs_id="
					+cs_id+"&sourceDataId="+sourceDataId+"&ft_id="+ft_id+"&formatNodeId="+formatNodeId;
		}
	
	</script>
	
</body>
</html>