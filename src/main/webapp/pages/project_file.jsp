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
<link rel="stylesheet" type="text/css" href="css/project1.css" />
<script type="text/javascript" src="js/project1.js"></script>
<script type="text/javascript">
    window.onload=function(){
        project0();
        // project1();
        // pro_detail();
        pro_data();
        pro_file();
    }
</script>
<body>
    <div class="Box">
        <div class="box">
            <div class="top">
                <h1><img src="img/newlogo2.png" height="70" width="218" alt="" class="logo" /></h1>
                <a href="project_mine.html">
                    <div class="topT active">项目</div>
                </a>
                <div class="topT">格式数据</div>
                <div class="topT">应用</div>
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
                    <div class="top2Ctl active">${project.p_name }</div>
                    <a href="project_discuss.html"><div class="top2Ctr">讨论版</div></a>
                    <a href="project_member.html"><div class="top2Ctr">成员</div></a>
                    <a href="project_append.html"><div class="top2Ctr">应用结果</div></a>
                    <a href="project_app.html"><div class="top2Ctr">应用</div></a>
                    <a href="project_data.html"><div class="top2Ctr">格式数据</div></a>
                    <a href="javascript:;"><div class="top2Ctr active">文件</div></a>
                    <a href="/wankangyuan/project/getProjectDetail"><div class="top2Ctr">基本信息</div></a>
                </div>
            </div>
            <div class="prof_lb">
                <div class="prof_lbL">
                    <div class="prof_lbLt">
                        <div class="prof_lbLtL">文件树</div>
                        <div class="prof_lbLtR">
                            <input type="button" class="prof_lbLtRt prof_lbLtRadd" value="添加" />
                            <div class="prof_lbLtRline"></div>
                            <input type="button" class="prof_lbLtRt prof_lbLtRtup" value="上传" />
                            <div class="prof_lbLtRline"></div>
                            <input type="button" class="prof_lbLtRt prof_lbLtRtch" value="修改" />
                            <div class="prof_lbLtRline"></div>
                            <input type="button" class="prof_lbLtRt prof_lbLtRtde" value="删除" />
                        </div>
                    </div>
                    <div class="prof_lbLm">
                        <div class="prof_lbLmT">
                            <div class="prodainmL2">
                               	<c:forEach items="${projectFloders}" var="projectFloder">
                               		<div class="PJliB1">
                                	<div class="PJliB1L">
                                        <div class="PJliB2Lic"></div>
                                        <div class="PJliB1Lt">${projectFloder.floder_name }</div>
                                        <div class="PJliBLi PJliBLi2"></div>
                                    </div>
                                    <div class="PJliBR">
	                                    <c:if test="${projectFloder.projectFloders != null }">
	                                    	<c:forEach items="${projectFloder.projectFloders}" var="projectFloder1">
			                                    <div class="PJliB2">
		                                            <div class="PJliB2L">
		                                                <div class="PJliB2Lic"></div>
		                                                <div class="PJliB2Lt">${projectFloder1.floder_name}</div>
		                                                <div class="PJliBLi PJliBLi2"></div>
		                                            </div>
						                            <div class="PJliBR">
					                                    <c:if test="${projectFloder1.projectFloders != null }">
					                                    	<c:forEach items="${projectFloder1.projectFloders}" var="projectFloder2">
							                                    <div class="PJliB2">
						                                            <div class="PJliB2L">
						                                                <div class="PJliB2Lic"></div>
						                                                <div class="PJliB2Lt">${projectFloder2.floder_name}</div>
						                                                <div class="PJliBLi PJliBLi2"></div>
						                                            </div>
																	<div class="PJliBR">
																		<c:if test="${projectFloder2.projectFloders != null }">
																		<c:forEach items="${projectFloder2.projectFloders}" var="projectFloder3">
																			<div class="PJliB2">
																			       <div class="PJliB2L">
																			           <div class="PJliB2Lic"></div>
																			           <div class="PJliB2Lt">${projectFloder3.floder_name}</div>
																			        <div class="PJliBLi PJliBLi2"></div>
																			    </div>
																			</div>
																		</c:forEach>
																		</c:if>
																	</div>  
						                                        </div>
					                                    	</c:forEach>
					                                    </c:if>
				                                    </div>
		                                        </div>
	                                    	</c:forEach>
	                                    </c:if>
                                    </div>
                                    </div>
                               	</c:forEach>
                            </div>
                        </div>
                        <div class="prof_lbLmB">
                            <div class="prof_lbLmBt">
                                <div class="prof_lbLmBt1">总文件数：</div>
                                <div class="prof_lbLmBt2">${project.fileNum}</div>
                            </div>
                            <div class="prof_lbLmBt">
                                <div class="prof_lbLmBt1">我的文件数：</div>
                                <div class="prof_lbLmBt2">${myFileNum}</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="prof_lbR">
                    <div class="prof_lbRt">
                        <div class="prof_lbRtL">文件列表</div>
                    </div>
                    <div class="prof_lbRm">
                        <div class="prof_lbRmT">
                            <input type="button" class="prof_lbRmTl prof_lbRmTbt prof_lbRmTse" value="筛选" />
                            <input type="button" class="prof_lbRmTr prof_lbRmTbt prof_lbRmTdo " value="下载" />
                            <input type="button" class="prof_lbRmTr prof_lbRmTbt prof_lbRmTde " value="删除" />
                        </div>
                        <div class="prof_lbRmUL">
                            <div class="prof_lbRmULt">
                            
			                   	<div class="allK">
			                        <div class="quanxuanK">
			                            <input type="checkbox" class="input_check" id="check0">
			                            <label for="check0"></label>
			                        </div>
			                        <div class="allT">全选</div>
			                    </div>
			                    
                                <div class="prof_lbRmULtli prof_lbRmULt2">项目名称</div>
                                <div class="prof_lbRmULtli prof_lbRmULt3">类型</div>
                                <div class="prof_lbRmULtli prof_lbRmULt4">大小</div>
                                <div class="prof_lbRmULtli prof_lbRmULt5">创建时间</div>
                                <div class="prof_lbRmULtli prof_lbRmULt6">创建人</div>
                                <div class="prof_lbRmULtli prof_lbRmULt7">操作</div>
                            </div>
                            <div class="prof_lbRmULm">
                                <div class="prof_lbRmULmLI">
                                
	                                <div class="fuxuanK2">
		                                <input type="checkbox" class="input_check" id="check0">
		                                <label for="check0"></label>
		                            </div>
		                            
                                    <div class="prof_lbRmULmli prof_lbRmULt2">小一号里的文件1</div>
                                    <div class="prof_lbRmULmli prof_lbRmULt3">TXT</div>
                                    <div class="prof_lbRmULmli prof_lbRmULt4">15MB</div>
                                    <div class="prof_lbRmULmli prof_lbRmULt5">2018-3-10</div>
                                    <div class="prof_lbRmULmli prof_lbRmULt6">Peter</div>
                                    <div class="prof_lbRmULmli prof_lbRmULt7 prof_lbRmULmYL">预览</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="fileaddK">
                <div class="fileaddT">
                    <div class="fileaddTl">上传文件</div>
                    <div class="fileaddTr"></div>
                </div>
                <div class="fileaddT2">
                    <div class="fileaddT2l" onclick="clickFile()">+ 添加文件</div>
                    <div class="fileaddT2r">（请上传txt、jpg等格式，大小不超过10兆）</div>
                </div>
                <div class="fileaddM">
                    <div class="fileaddMt">
                        <div class="fileaddMz addMtzname">名称</div>
                        <div class="fileaddMz addMtzsize">大小</div>
                        <div class="fileaddMz addMtznum">文件数</div>
                        <div class="fileaddMz addMtzopea">操作</div>
                    </div>
                    <div class="fileaddMmK" id="fileUploadList"></div>
                </div>
                <button class="fileaddbtn">上传</button>
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
    
    <script type="text/javascript" src="/wankangyuan/js/jquery.min.js"></script>
    <script type="text/javascript">
    
    	var map = new Map();
    	
		//点击上传附加按钮
		function clickFile(){
			document.getElementById("uploadFile").click();
		}
    
	  	//ajax方式上传附件
		function upFile(){
			//获取附件内容
			var formData = new FormData($("#uploadForm")[0]);
			//上传附件
			$.ajax({
	            url: '/wankangyuan/projectFloderFile/upload' ,
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
	                            '<img src="img/file.png" height="20" width="16" alt="" class="fileaddMi" />'+
	                            '<div class="fileaddMz addMtzname">'+data.originalFilename+'</div>'+
	                            '<div class="fileaddMz addMtzsize">'+data.size+' MB</div>'+
	                            '<div class="fileaddMz addMtznum">小一号</div>'+
	                            '<div class="fileaddMz2 addMtzopea" onclick="removeFiv(\''+data.id+'\')">取消</div>'+
	                        '</div>'
	                	);
	                	map.set(1, data.id);
	                	for (var key in map) {
	                        console.log(map[key]);
	                    }
	                	
	                }else{
	                	alert(data.message);
	                }
	            },
	            error: function () {
	            	alert("联网失败");
	            }
	        });
		}
	  	
	  	//取消文件上传
	  	function removeFiv(id){
	  		var box = document.getElementById(id);  
	  		box.parentNode.removeChild(box);  	
	  		
	  	}
	  	
	 
	  	

    </script>
</body>
</html>