<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
        // pro_mine();
        // data_mine();
        // data_create();
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
                    <a href="/wankangyuan/userInfo">
                        <img src="${user.headimg }" alt="" class="touxiang" />
                    </a>
                    <div class="userbutK">
                        <a href="/wankangyuan/userInfo">
                            <div class="userbut">用户信息</div>
                        </a>
                        <a href="/wankangyuan/message/viewMessage">
                            <div class="userbut">系统消息
                            <c:if test="${systemMSG }">
                                <img src="<%=request.getContextPath()%>/static/img/redpoint.png" height="11" width="11" alt="" class="redpoint2" />
                            </c:if>
                            </div>
                        </a>
                        <div class="userbutline"></div>
                        <a href="/wankangyuan/logout">
                            <div class="userbut">退出登录</div>
                        </a>
                    </div>
                </div>
                <div class="nicheng"><shiro:principal/></div>
                <a href="/wankangyuan/friends/viewFriendsManage">
                <div class="yanjiuquan">
                    <div class="yanjiuquanT">研究圈</div>
                    <c:if test="${friendMSG}">
                        <img src="<%=request.getContextPath()%>/static/img/redpoint.png" height="11" width="11" alt="" class="redpoint" />
                    </c:if>
                </div>
                </a>
            </div>
            <div class="top2">
                <div class="top2C">
                    <a href="/wankangyuan/sourceData/firstIn?type=1"><div class="top2Cli">我的</div></a>
                    <a href="/wankangyuan/sourceData/firstIn?type=2"><div class="top2Cli">我创建的</div></a>
                    <a href="/wankangyuan/sourceData/firstIn?type=3"><div class="top2Cli top2CliYJ">公共</div></a>
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
                        <a href="data_public.html">
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
                        <div class="quanxuanK">
                            <input type="checkbox" class="input_check" id="check0">
                            <label for="check0"></label>
                        </div>
                        <div class="allT">全选</div>
                    </div>
                    <!-- <div class="pro_menu pro_exit">退出</div> -->
                    <!-- <div class="pro_menu pro_addK">
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
                    <div class="pro_menu pro_adddata">+添加源数据</div> -->
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
            </div>
            <div class="PJK2">
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
                <div class="PJ2list">
                    <div class="PJK2li">
                        <div class="PJK2litop">
                            <a href="data_datain2.html">
                                <div class="PJK2litopT">数据名称</div>
                            </a>
                            <div class="fuxuanK3">
                                <input type="checkbox" class="input_check" id="check1">
                                <label for="check1"></label>
                            </div>
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
                            <a href="data_datain2.html">
                                <div class="PJK2litopT">数据名称</div>
                            </a>
                            <div class="fuxuanK3">
                                <input type="checkbox" class="input_check" id="check2">
                                <label for="check2"></label>
                            </div>
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
                            <a href="data_datain2.html">
                                <div class="PJK2litopT">数据名称</div>
                            </a>
                            <div class="fuxuanK3">
                                <input type="checkbox" class="input_check" id="check3">
                                <label for="check3"></label>
                            </div>
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
                            <a href="data_datain2.html">
                                <div class="PJK2litopT">数据名称</div>
                            </a>
                            <div class="fuxuanK3">
                                <input type="checkbox" class="input_check" id="check4">
                                <label for="check4"></label>
                            </div>
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
                            <a href="data_datain2.html">
                                <div class="PJK2litopT">数据名称</div>
                            </a>
                            <div class="fuxuanK3">
                                <input type="checkbox" class="input_check" id="check5">
                                <label for="check5"></label>
                            </div>
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
                            <a href="data_datain2.html">
                                <div class="PJK2litopT">数据名称</div>
                            </a>
                            <div class="fuxuanK3">
                                <input type="checkbox" class="input_check" id="check6">
                                <label for="check6"></label>
                            </div>
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
                
            </div>

        	<div class="pageK" id="box"></div>

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
    	<script type="text/javascript" src="/wankangyuan/static/js/paging.js"></script>
		
    <script type="text/javascript">
    
    	$(".pro_menu").click(function (){
			var afuxuanK=document.querySelectorAll('.fuxuanK2');
    		
            var afuxuan=[];
            for(var i=0;i<afuxuanK.length;i++){
                afuxuan.push(afuxuanK[i].querySelectorAll('.input_check')[0]);
            }
            
            var ids = [];
            for(var i=0;i<afuxuanK.length;i++){
            	if(afuxuan[i].checked){
            		ids.push(afuxuan[i].name);
            	}
            }
            
            if(ids == ""){
            	alert("请勾选源数据！");
            	return;
            }else{
            	var cs_id = $("#source_Select").val();
            	$.ajax({
        			url:"/wankangyuan/sourceData/addMySource",
        			type:"post",
        			data:{
        				cs_id:cs_id,
        				sourceDataIds:ids.join(",")
        			},
        			success : function(data){
        				alert(data.message);
        				cs_id = $("#source_Select").val();
        				window.location.href="/wankangyuan/sourceData/getSourceDatas?type=1&cs_id="+cs_id;
        			},
        			error : function(){
        				alert("联网失败");
        			}
        			
        		});
            }
    	});
    	
    	//更换数据源时，更新列表
	  	$("#source_Select").change(function(){
    		cs_id = $("#source_Select").val();
   			window.location.href="/wankangyuan/sourceData/getSourceDatas?type=3&cs_id="+cs_id;
    	});
    	
    	//进入到详情页
    	function datainHref(sourceDataId){
    		var cs_id = $("#source_Select").val();
    		window.location.href="/wankangyuan/sourceData/getSourceDataById?cs_id="+cs_id+"&sourceDataId="+sourceDataId+"&type=3";
    	}
    	$('#box').paging({
    		initPageNo: ${page}, // 初始页码
    		totalPages: Math.ceil(${total}/${rows}), //总页数
    		totalCount: '合计&nbsp;' + ${total} + '&nbsp;条数据', // 条目总数
    		slideSpeed: 600, // 缓动速度。单位毫秒
    		jump: true, //是否支持跳转
    		callback: function(page) { // 回调函数
    			console.log(page);
    			var user_id=${user.id};
    			var cs_id = $("#source_Select").val();
    			if(page!=${page}){
    				window.location.href="/wankangyuan/sourceData/getSourceDatas?type=3&cs_id="+cs_id+"&user_id="+user_id+"&page="+page+"&strip=${rows}";
    			}
    		}
    	}); 
    </script>
</body>
</html>