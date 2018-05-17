<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>注册</title>
</head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/index.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/project1.js"></script>
<script type="text/javascript">
    window.onload=function(){
        // index();
        forget_ps();
    }
</script>
<body>
    <div class="Box">
        <div class="box">
            <div class="top">
                <h1><img src="<%=request.getContextPath()%>/static/img/newlogo2.png" class="logo" height="70" width="218" alt="" /></h1>
                <div class="link">链接</div>
            </div>
            <div class="xiangmu">
                <div class="loginK">
                    <div class="loginT">注册</div>
                    <a href="/wankangyuan/login">
                        <div class="loginBB1">已有账号</div>
                    </a>
                    
                    <form id="_form" method="post">
                    <div class="loginM_2">
                        <div class="loginMz">
                            <div class="loginMzL">账户名称：</div>
                            <div class="loginMzR">
                                <input id="username" name="username" type="text" class="loginMzRp" placeholder="" />
                            </div>
                            <div class="loginMzt">*不少于6个字符</div>
                        </div>
                        <div class="loginMz">
                            <div class="loginMzL">密码：</div>
                            <div class="loginMzR">
                                <input id="password" name="password" type="password" class="loginMzRp" placeholder="" />
                            </div>
                            <div class="loginMzt">*不少于8个字符</div>
                        </div>
                        <div class="loginMz">
                            <div class="loginMzL">再次输入：</div>
                            <div class="loginMzR">
                                <input id="re_password" type="password" class="loginMzRp" placeholder="" />
                            </div>
                        </div>
                        <div class="loginMz">
                            <div class="loginMzL">手机号：</div>
                            <div class="loginMzR">
                                <input id="phone" name="phone" type="text" class="loginMzRp for_zh" placeholder="" />
                            </div>
                            <div class="loginMzt">*请填写常用手机号</div>
                        </div>
                        <div class="loginMz">
                            <div class="loginMzL">验证码：</div>
                            <div class="loginMzR">
                                <input id="phonecode" name="phonecode" type="text" class="loginMzRp3" placeholder="" />
                                <div class="loginMzRbK">
                                    <input type="button" class="loginMzRb" value="发送验证码" />
                                    <div class="loginMzRb2"></div>
                                </div>
                            </div>
                        </div>
                        <div class="loginMz">
                            <div class="loginMzL">邮箱：</div>
                            <div class="loginMzR">
                                <input id="email" name="email" type="email" class="loginMzRp for_zh" placeholder="" />
                            </div>
                            <div class="loginMzt">*请务必正确填写常用邮箱</div>
                        </div>
                        <div class="loginMz">
                            <div class="loginMzL">动态验证码：</div>
                            <div class="loginMzR">
                                <input name="randomcode" type="text" class="loginMzRp2" />
                                <div class="loginMzRiK">
                                    <img src="/wankangyuan/open/getGifCode" class="loginMzRi" onclick="random(this)" title="点击更换"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- <div class="loginM3">
                        <div class="loginMt">*手机号不能接受验证码，请联系客服</div>
                    </div> -->
                    <div class="loginB">
                        <input type="button" class="loginb pro_enter" value="注册" onclick="register()" />
                    </div>
                    </form>
                </div>
            </div>
            <div class="bottom">
                <a href="javascript:;">
                    <div class="bottomL">关于我们</div>
                </a>
                <a href="javascript:;">
                    <div class="bottomL">用户协议</div>
                </a>
                <a href="javascript:;">
                    <div class="bottomL">企业服务</div>
                </a>
                <a href="javascript:;">
                    <div class="bottomL">帮助中心</div>
                </a>
                <a href="javascript:;">
                    <div class="bottomL">联系我们</div>
                </a>
                <a href="javascript:;">
                    <img src="<%=request.getContextPath()%>/static/img/weixin.png" alt="" class="bottomR" />
                </a>
                <a href="javascript:;">
                    <img src="<%=request.getContextPath()%>/static/img/weibo.png" alt="" class="bottomR" />
                </a>
            </div>
            <div class="bottom2">
                <div class="bottom2z">京ICP备09083200号 合字B2-20160007 人才服务许可证:120116174002号 京公网安备 11010502035189号</div>
                <div class="bottom2z">Copyright © 2006-2018 xxxxxx.com All Rights Reserved</div>
            </div>
        </div>
    </div>
    
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/layer/layer.js"></script>

<c:if test="${not empty error}">
    <script type="text/javascript">
    layer.msg("${error}");
    </script>
</c:if>
<script type="text/javascript">

function register(){
	
	if($("#username").val().length < 6){
		return layer.msg('账户名称不少于6个字符！',function(){}),!1;
	}
	
	if($("#password").val().length < 8){
		return layer.msg('密码不少于8个字符！',function(){}),!1;
	}
	
	if($("#password").val() != $("#re_password").val()){
        return layer.msg('2次密码输出不一样！',function(){}),!1;
    }
	
	if($('#phonecode').val().length !=4){
        return layer.msg('验证码的长度为4位！',function(){}),!1;
    }
	
	$("#_form").submit();
	
}


function random(tmp){  
     tmp.src = '/wankangyuan/open/getGifCode?'  + Math.random();
}
   
</script>  
</body>
</html>