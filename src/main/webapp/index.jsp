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
    <title>首页</title>
</head>
<link rel="stylesheet" type="text/css" href="/wankangyuan/static/css/index.css" />
<script type="text/javascript" src="/wankangyuan/static/js/project1.js"></script>
<script type="text/javascript">
    window.onload=function(){
        index();
    }
</script>
<body>
    <div class="Box">
        <div class="box">
            <div class="top">
                <h1><img src="/wankangyuan/static/img/newlogo2.png" class="logo" height="70" width="218" alt="" /></h1>
                <a href="javascript:;"><div class="link">链接</div></a>
                <a href="register.html"><div class="register">注册</div></a>
                <a href="login.html"><div class="login">登录</div></a>
                <img src="/wankangyuan/static/img/search.png" alt="" class="searchI2" />
                <div class="searchK">
                    <img src="/wankangyuan/static/img/search.png" alt="" class="searchI" />
                    <img src="/wankangyuan/static/img/close2.png" alt="" class="searchX" />
                    <input type="text" class="searchP" placeholder="搜索平台公开项目"  />
                </div>
            </div>
            <div class="xiangmu">
                <div class="xiangmuL">
                    <div class="xiangmuLT">
                        <div class="xiangmuLC">平台项目</div>
                    </div>
                    <div class="xiangmuLM">
                        <div class="xiangmuLMz">
                            <div class="xiangmuLMzT">13例结直肠癌病人的基因表达模式研究13例结直肠癌病人的基因表达模式研究13例结直肠</div>
                            <div class="xiangmuLMzM">病例对照研究是以现在确诊的患有某特定疾病的病人作为病例，以不患有该病但具有可比性的个体作为对照，通过询问，实验室检查或复查病史，搜集既往各种可能的危险因素的暴露史，测量并比较病例组与对照组中各因素的暴露比例，经统计学检验，若两组差别有意义，则可认为因素与疾病之间存在着统计学上的关联。</div>
                        </div>
                        <div class="xiangmuLMz">
                            <div class="xiangmuLMzT">13例结直肠癌病人的基因表达模式研究13例结直肠癌病人的基因表达模式研究13例结直肠</div>
                            <div class="xiangmuLMzM">病例对照研究是以现在确诊的患有某特定疾病的病人作为病例，以不患有该病但具有可比性的个体作为对照，通过询问，实验室检查或复查病史，搜集既往各种可能的危险因素的暴露史，测量并比较病例组与对照组中各因素的暴露比例，经统计学检验，若两组差别有意义，则可认为因素与疾病之间存在着统计学上的关联。</div>
                        </div>
                        <div class="xiangmuLMz">
                            <div class="xiangmuLMzT">13例结直肠癌病人的基因表达模式研究13例结直肠癌病人的基因表达模式研究13例结直肠</div>
                            <div class="xiangmuLMzM">病例对照研究是以现在确诊的患有某特定疾病的病人作为病例，以不患有该病但具有可比性的个体作为对照，通过询问，实验室检查或复查病史，搜集既往各种可能的危险因素的暴露史，测量并比较病例组与对照组中各因素的暴露比例，经统计学检验，若两组差别有意义，则可认为因素与疾病之间存在着统计学上的关联。</div>
                        </div>
                    </div>
                </div>
                <div class="xiangmuR">
                    <div class="xiangmuRT">13例结直肠癌病人的基因表达模式研究</div>
                    <div class="xiangmuRM">
                        <div class="xiangmuRMzK">
                            <div class="xiangmuRMzKC">
                                <div class="xiangmuRMz">
                                    <img src="/wankangyuan/static/img/prodetail1_1.png" name="25例糖尿病患者的基因表达模式研究1" alt="" class="xiangmuRMi" />
                                </div>
                                <div class="xiangmuRMz">
                                    <img src="/wankangyuan/static/img/prodetail1_2.png" name="25例糖尿病患者的基因表达模式研究2" alt="" class="xiangmuRMi" />
                                </div>
                                <div class="xiangmuRMz">
                                    <img src="/wankangyuan/static/img/prodetail1_3.png" name="25例糖尿病患者的基因表达模式研究3" alt="" class="xiangmuRMi" />
                                </div>
                            </div>
                        </div>
                        <div class="xiangmuRMt">25例糖尿病患者的基因表达模式研究</div>
                        <div class="xiangmuRMB">
                            <div class="xiangmuRMb active"></div>
                            <div class="xiangmuRMb"></div>
                            <div class="xiangmuRMb"></div>
                        </div>
                    </div>
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
                    <img src="img/weixin.png" alt="" class="bottomR" />
                </a>
                <a href="javascript:;">
                    <img src="img/weibo.png" alt="" class="bottomR" />
                </a>
            </div>
            <div class="bottom2">
                <div class="bottom2z">京ICP备09083200号 合字B2-20160007 人才服务许可证:120116174002号 京公网安备 11010502035189号</div>
                <div class="bottom2z">Copyright © 2006-2018 xxxxxx.com All Rights Reserved</div>
            </div>
        </div>
    </div>
</body>
</html>