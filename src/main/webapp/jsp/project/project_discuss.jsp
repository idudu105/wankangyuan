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
        pro_discuss();
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
                    <div class="top2Ctl active">13例结直肠癌病人的基因表达</div>
                    <a href="javascript:;"><div class="top2Ctr active">讨论版</div></a>
                    <a href="project_member.html"><div class="top2Ctr">成员</div></a>
                    <a href="project_append.html"><div class="top2Ctr">应用结果</div></a>
                    <a href="/wankangyuan/projectApp/selectProjectApp?p_id=${project.id}"><div class="top2Ctr">应用</div></a>
                    <a href="/wankangyuan/projectFormatData/selectProjectFormatDataList"><div class="top2Ctr">格式数据</div></a>
                    <a href="/wankangyuan/projectFloderFile/selectProjectFloderByProjectId"><div class="top2Ctr">文件</div></a>
                    <a href="/wankangyuan/project/getProjectDetail"><div class="top2Ctr">基本信息</div></a>
                </div>
            </div>
            <div class="paixu">
                <div class="sortt">排序：</div>
                <div class="sortZ">
                    <div class="sortZc">
                        <div class="sortZt">时间</div>
                        <img src="/wankangyuan/static/img/sanjiao_blue.png" alt="" class="sortZi" />
                    </div>
                    <div class="sortulK">
                        <div class="sortul">
                            <div class="sort_timeup sortli">升序排列</div>
                            <div class="sort_timedown sortli">降序排列</div>
                        </div>
                    </div>
                </div>
                <div class="sortZ">
                    <div class="sortZc">
                        <div class="sortZt">回复/查看</div>
                        <img src="/wankangyuan/static/img/sanjiao_blue.png" alt="" class="sortZi" />
                    </div>
                    <div class="sortulK">
                        <div class="sortul">
                            <div class="sort_replyup sortli">升序排列</div>
                            <div class="sort_replydown sortli">降序排列</div>
                        </div>
                    </div>
                </div>
                <div class="addtheme">+创建主题</div>
            </div>
            <div class="themeK">
                <div class="themeT">
                    <div class="themeTt themeall">全部主题</div>
                    <div class="themeTt themeaut">作者</div>
                    <div class="themeTt themerep">回复/查看</div>
                    <div class="themeTt themelatime">最后发表时间</div>
                </div>
                <div class="themeM">
                    <div class="themeMz">
                        <a href="project_disdetail.html">
                            <div class="themeMzt1 themeall">Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus. Sed sollicitudin ipsum quis nunc sollicitudin ultrices. Donec euismod scelerisque ligula. Maecenas eu varius risus, eu aliquet arcu. Curabitur fermentum suscipit est, tinciduntCurabitur fermentum suscipit est, tincidunt</div>
                        </a>
                        <div class="themeMzt2 themeaut">
                            <div class="themeauthor">Peter</div>
                            <div class="themetime">2018-4-13 18：00</div>
                        </div>
                        <div class="themeMzt2 themerep">
                            <span class="themehf">58</span>
                            /
                            <span class="themeck">200</span>
                        </div>
                        <div class="themeMzt2 themelatime">4-13 18：00</div>
                    </div>
                    <div class="themeMz">
                        <a href="project_disdetail.html">
                            <div class="themeMzt1 themeall">Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus. Sed sollicitudin ipsum quis nunc sollicitudin ultrices. Donec euismod scelerisque ligula. Maecenas eu varius risus, eu aliquet arcu. Curabitur fermentum suscipit est, tinciduntCurabitur fermentum suscipit est, tincidunt</div>
                        </a>
                        <div class="themeMzt2 themeaut">
                            <div class="themeauthor">Peter</div>
                            <div class="themetime">2018-4-13 18：00</div>
                        </div>
                        <div class="themeMzt2 themerep">
                            <span class="themehf">58</span>
                            /
                            <span class="themeck">200</span>
                        </div>
                        <div class="themeMzt2 themelatime">4-13 18：00</div>
                    </div>
                    <div class="themeMz">
                        <a href="project_disdetail.html">
                            <div class="themeMzt1 themeall">Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus. Sed sollicitudin ipsum quis nunc sollicitudin ultrices. Donec euismod scelerisque ligula. Maecenas eu varius risus, eu aliquet arcu. Curabitur fermentum suscipit est, tinciduntCurabitur fermentum suscipit est, tincidunt</div>
                        </a>
                        <div class="themeMzt2 themeaut">
                            <div class="themeauthor">Peter</div>
                            <div class="themetime">2018-4-13 18：00</div>
                        </div>
                        <div class="themeMzt2 themerep">
                            <span class="themehf">58</span>
                            /
                            <span class="themeck">200</span>
                        </div>
                        <div class="themeMzt2 themelatime">4-13 18：00</div>
                    </div>
                    <div class="themeMz">
                        <a href="project_disdetail.html">
                            <div class="themeMzt1 themeall">Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus. Sed sollicitudin ipsum quis nunc sollicitudin ultrices. Donec euismod scelerisque ligula. Maecenas eu varius risus, eu aliquet arcu. Curabitur fermentum suscipit est, tinciduntCurabitur fermentum suscipit est, tincidunt</div>
                        </a>
                        <div class="themeMzt2 themeaut">
                            <div class="themeauthor">Peter</div>
                            <div class="themetime">2018-4-13 18：00</div>
                        </div>
                        <div class="themeMzt2 themerep">
                            <span class="themehf">58</span>
                            /
                            <span class="themeck">200</span>
                        </div>
                        <div class="themeMzt2 themelatime">4-13 18：00</div>
                    </div>
                </div>
                <div class="themeadd">
                    <div class="themeaddX"></div>
                    <div class="themeaddT">创建主题</div>
                    <div class="themeaddM">
                        <div class="themeaddMt">内容：</div>
                        <textarea name="" id="" class="themeaddMk" maxlength="600"></textarea>
                        <div class="themeaddMt2">600字以内</div>
                    </div>
                    <div class="themeaddB">
                        <div class="themeaddBc">取消</div>
                        <input type="button" class="themeaddBs" value="发送" />
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