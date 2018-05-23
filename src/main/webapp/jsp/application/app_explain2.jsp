<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Document</title>
</head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/project1.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/project1.js"></script>
<script type="text/javascript">
    window.onload=function(){
        project0();
        // project1();
        // pro_mine();
        // app_mine();
        app_exp2();
    }
</script>
<body>
    <div class="Box">
        <div class="box">
            <div class="top">
                <h1><img src="<%=request.getContextPath()%>/static/img/newlogo2.png" height="70" width="218" alt="" class="logo" /></h1>
                <a href="/wankangyuan/project/selectMyProject">
                    <div class="topT">项目</div>
                </a>
                <a href="/wankangyuan/admin/formatdata">
                    <div class="topT">格式数据</div>
                </a>
                <a href="/wankangyuan/application/viewMine">
                    <div class="topT active">应用</div>
                </a>
                <div class="touxiangK">
                    <a href=" ">
                        <img src="${user.headimg }" alt="" class="touxiang" />
                    </a>
                    <div class="userbutK">
                        <a href="/wankangyuan/userInfo">
                            <div class="userbut">用户信息</div>
                        </a>
                        <a href="javascript:;">
                            <div class="userbut">系统消息
                                <img src="<%=request.getContextPath()%>/static/img/redpoint.png" height="11" width="11" alt="" class="redpoint2" />
                            </div>
                        </a>
                        <div class="userbutline"></div>
                        <a href="/wankangyuan/logout">
                            <div class="userbut">退出登录</div>
                        </a>
                    </div>
                </div>
                <div class="nicheng"><shiro:principal/></div>
                <div class="yanjiuquan">
                    <div class="yanjiuquanT">研究圈</div>
                    <img src="<%=request.getContextPath()%>/static/img/redpoint.png" height="11" width="11" alt="" class="redpoint" />
                </div>
            </div>
            <div class="top2">
                <div class="top2C">
                    <div class="top2Cli top2CliYJ">
                        <!-- <div class="backbtnK1"> -->
                            <a href="javascript:history.go(-1);">
                                <div class="backbtn1"></div>
                            </a>
                        <!-- </div> -->
                        <div class="top2Ct">${application.appName }</div>
                    </div>
                    <div class="app_expsave" onclick="to_update()">保存</div>
                </div>
            </div>
            <div class="appexpM">
            <form id="appSub" action="/wankangyuan/application/update${index }" method="post">
                <div class="appexpML">
                    <div class="appexpMLz">
                        <div class="appexpMLzt1">应用编号：</div>
                        <div class="appexpMLzt2">${application.id }</div>
                        <input name="id" type="hidden" class="appexpMLzt2" value="${application.id }">
                    </div>
                    <div class="appexpMLz">
                        <div class="appexpMLzt1">应用名称：</div>
                        <!-- <div class="appexpMLzt2">张三</div> -->
                        <input name="appName" type="text" class="appexpMLzp1" value="${application.appName }" />
                    </div>
                    <div class="appexpMLz">
                        <div class="appexpMLzt1">创建人：</div>
                        <div class="appexpMLzt2">${application.creator }</div>
                    </div>
                    <div class="appexpMLz">
                        <div class="appexpMLzt1">应用类别：</div>
                        <!-- <div class="appexpMLzt2">测序</div> -->
                        <select name="appType" id="" class="appexpMLzs1">
                            <option value="测序" <c:if test="${'测序' eq application.appType }">selected="selected"</c:if>>测序</option>
                            <option value="排查" <c:if test="${'排查' eq application.appType }">selected="selected"</c:if>>排查</option>
                        </select>
                        
                    </div>
                    <div class="appexpMLz">
                        <div class="appexpMLzt1">关键字：</div>
                        <!-- <div class="appexpMLzt2">DNA</div> -->
                        <!-- <div class="appexpMLzt2">RNA</div> -->
                        <input name="keywords" type="hidden" value="" >
                        <div class="appexpGJZK">
                            <div class="appexpGJZKC">
                            
                                <!-- <div class="appexpGJZ">
                                    <div class="appexpGJZt">DNA</div>
                                    <div class="appexpGJZx"></div>
                                </div>
                                <div class="appexpGJZ">
                                    <div class="appexpGJZt">RNA</div>
                                    <div class="appexpGJZx"></div>
                                </div> -->
                            <c:forEach items="${keywords }" var="keyword">
                                <div class="appexpGJZ">
                                    <div class="appexpGJZt">${keyword }</div>
                                    <div class="appexpGJZx"></div>
                                </div>
                            </c:forEach>
                                
                            </div>
                            <div class="appexpGJZadk">
                                <input type="text" class="appexpGJZadp" />
                                <div class="appexpGJZadb">添加</div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="appexpMLz">
                        <div class="appexpMLzt1">版本：</div>
                        <!-- <div class="appexpMLzt2">VER1.00</div> -->
                        <input type="text" name="versions" class="appexpMLzp1" value="${application.versions }" />
                    </div>
                    <div class="appexpMLz">
                        <div class="appexpMLzt1">创建时间：</div>
                            <fmt:formatDate type="date" value="${application.createTime }" />
                        <div class="appexpMLzt2">
                        
                        </div>
                    </div>
                    <div class="appexpMLz">
                        <div class="appexpMLzt1">状态：</div>
                        <!-- <div class="appexpMLzt2">隐藏</div> -->
                        <select name="status" class="appexpMLzs1">
                            <option value="私有" <c:if test="${'私有' eq application.status }">selected="selected"</c:if>>私有</option>
                            <option value="公开" <c:if test="${'公开' eq application.status }">selected="selected"</c:if>>公开</option>
                        </select>
                    </div>
                    <div class="appexpMLz">
                        <div class="appexpMLzt1">参数1：</div>
                        <div class="appexpMLzt2">${application.paraA }</div>
                    </div><div class="appexpMLz">
                        <div class="appexpMLzt1">参数2：</div>
                        <div class="appexpMLzt2">${application.paraB }</div>
                    </div>
                    <div class="appexpMLz">
                        <div class="appexpMLzt1">应用概述：</div>
                        <!-- <div class="appexpMLzt3">张三</div> -->
                        <textarea name="appOverview" class="appexpMLzta1" >${application.appOverview }</textarea>
                    </div>
                    <div class="appexpMLz">
                        <div class="appexpMLzt1">格式数据：</div>
                        <textarea name="dataFormat" class="appexpMLzta1">${application.dataFormat }</textarea>
                    </div>
                </div>
                <div class="appexpMR"></div>
            </form>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/layer/layer.js"></script>
<c:if test="${not empty msg}">
    <script type="text/javascript">
    layer.msg("${msg}");
    </script>
</c:if>
<script type="text/javascript">
function to_update(){
	var maxIndex = $('.appexpGJZt').length - 1;
    var result = '';
    $('.appexpGJZt').text(function(index, content){
        result += (index === maxIndex) ? content : content + ','; 
    });
    $("input[name='keywords']").val(result);
    //alert(result);
    $("#appSub").submit();
}

</script>
</body>
</html>