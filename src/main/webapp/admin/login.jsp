<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>登录</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/css/login.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/login.js"></script>
</head>

<body>
    <div class="container">
        <div class="row row-centered">
            <div class="col-md-6 col-centered">
            <form action="/wankangyuan/login"  method="post">
            
                <div class="top">
                    <div class="topT">OA 后台管理登录</div>
                    <img src="<%=request.getContextPath()%>/admin/img/newlogo2.png" height="70" width="218" alt="" class="topI" />
                </div>
                <div class="middle">
                    <input name="loginType" type="hidden" value="adminLogin">
                    <div class="middlez">
                        <div class="middlezL">用户名：</div>
                        <input name="username" type="text" class="middlezRp1" />
                    </div>
                    <div class="middlez">
                        <div class="middlezL">密码：</div>
                        <input name="password" type="password" class="middlezRp1" />
                    </div>
                    <div class="middlez">
                        <div class="middlezL">验证码：</div>
                        <div class="middlezR">
                            <input name="randomcode" type="text" class="middlezRp2" />
                            <div class="yanzhengK">
                                <img src="/wankangyuan/open/getGifCode" class="yanzhengI" onclick="random(this)"  title="点击图片刷新验证码，不区分大小写"/>
                                <div class="yanzhengps">点击图片刷新验证码，不区分大小写</div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="bottom">
                    <input type="submit" class="login" value="登录" />
                    <input type="button" class="reset" value="重置" />
                </div>
            </form>
            </div>
        </div>
    </div>
    
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/layer/layer.js"></script>
<c:if test="${not empty error}">
    <script type="text/javascript">
    layer.msg("${error}");
    </script>
</c:if>
<c:if test="${not empty msg}">
    <script type="text/javascript">
    layer.msg("${msg}");
    </script>
</c:if>
<script type="text/javascript">
function random(tmp){  
    tmp.src = '/wankangyuan/open/getGifCode?'  + Math.random();
}
</script>
</body>
</html>