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
<link rel="stylesheet" type="text/css" href="/wankangyuan/static/css/project1.css" />
<script type="text/javascript" src="/wankangyuan/static/js/project1.js"></script>
<script type="text/javascript">
    window.onload=function(){
        project0();
        project2();
        // pro_mine();
        pro_member();
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
                    <div class="top2Ctl active">13例结直肠癌病人的基因表达</div>
                    <a href="/wankangyuan/projectTopic/selectProjectTopic"><div class="top2Ctr">讨论版</div></a>
                    <a href="/wankangyuan/projectMember/selectProjectMember"><div class="top2Ctr active">成员</div></a>
                    <a href="/wankangyuan/projectAppEnd/selectProjectAppEnd"><div class="top2Ctr">应用结果</div></a>
                    <a href="/wankangyuan/projectApp/selectProjectApp?p_id=${project.id}"><div class="top2Ctr">应用</div></a>
                    <a href="/wankangyuan/projectFormatData/getSourceDatas?p_id=${project.id}"><div class="top2Ctr">格式数据</div></a>
                    <a href="/wankangyuan/projectFloderFile/selectProjectFloderByProjectId"><div class="top2Ctr">文件</div></a>
                    <a href="/wankangyuan/project/getProjectDetail"><div class="top2Ctr">基本信息</div></a>
                </div>
            </div>
            <div class="shaixuan">
                <div class="shaixuanC">
                    <div class="listZT">
                        <a href="javascript:;">
                            <div class="listZTli listZT1">
                                <img src="/wankangyuan/static/img/listZT1.png"alt="" class="listZT1i" />
                                <img src="/wankangyuan/static/img/listZT1.png" alt="" class="listZT1i" />
                            </div>
                        </a>
                        <a href="/wankangyuan/jsp/project/project_member.jsp">
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
                            <img src="/wankangyuan/static/img/sanjiao_blue.png" alt="" class="shaixuanBTi" />
                        </div>
                    </div>
                    <div class="jiangeline"></div>
                    <div class="allK">
                        <div class="allX"></div>
                        <div class="allT">全选</div>
                    </div>
                    <!-- <div class="jiangeline"></div> -->
                    <!-- <div class="allK">
                        <div class="allX">
                            <img src="/wankangyuan/static/img/greentrue.png" alt="" class="allI active" />
                        </div>
                        <div class="allT">全选</div>
                    </div> -->
                    <!-- <div class="pro_menu pro_exit">退出</div> -->
                    <!-- <div class="pro_menu pro_rem">移除</div>
                    <div class="pro_menu pro_canfabu">取消发布</div>
                    <div class="pro_menu pro_fabu">发布</div>
                    <div class="pro_menu pro_rerun">重新运行</div> -->
                    <div class="pro_menu pro_mandel">删除成员</div>
                    <div class="pro_menu pro_manGL">权限管理</div>
                    <div class="pro_menu pro_manadd">添加成员</div>
                    <div class="search2">
                        <div class="search2C">
                            <img src="/wankangyuan/static/img/search.png" alt="" class="search2Ci" />
                            <input type="text" class="search2Ct"  placeholder="搜索成员" />
                        </div>
                    </div>
                </div>
                <div class="shaixuanZK">
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">名称</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">角色</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">联系人</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">进组时间</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">上传文件</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                    <div class="shaixuanZKli">
                        <div class="shaixuanZKliT">发表/回复话题</div>
                        <div class="shaixuanZKliI active"></div>
                    </div>
                </div>
            </div>
            <div class="memaddK">
                <input type="button" class="memaddB" value="提交" />
                <div class="memaddKx"></div>
                <div class="memaddT">
                    <div class="memaddTl">组织树</div>
                    <div class="memaddTr">
                        <img src="/wankangyuan/static/img/search.png" alt="" class="memaddTri" />
                        <input type="text" class="memaddTrt" placeholder="搜索成员"/>
                    </div>
                </div>
                <div class="memaddM">
                    <div class="mimaddMl">
                        <div class="mimaddMlz1">
                            <div class="mimaddMlz1Z">
                                <div class="mimaddMlz1ZT">
                                    <div class="mimaddMlz1ZTt">
                                        <span>组织结构1</span>
                                        <span>（</span><span>20</span><span>）</span>
                                    </div>
                                    <div class="mimaddMlz1ZTi"></div>
                                </div>
                                <div class="mimaddMlz1ZB">
                                    <div class="mimaddMlz1ZBz">
                                        <img src="/wankangyuan/static/img/folder.png" alt="" class="mimaddMlz1ZBzi" />
                                        <div class="mimaddMlz1ZBzt">一</div>
                                    </div>
                                    <div class="mimaddMlz1ZBz">
                                        <img src="/wankangyuan/static/img/folder.png" alt="" class="mimaddMlz1ZBzi" />
                                        <div class="mimaddMlz1ZBzt">二</div>
                                    </div>
                                    <div class="mimaddMlz1ZBz">
                                        <img src="/wankangyuan/static/img/folder.png" alt="" class="mimaddMlz1ZBzi" />
                                        <div class="mimaddMlz1ZBzt">三</div>
                                    </div>
                                    <div class="mimaddMlz1ZBz">
                                        <img src="/wankangyuan/static/img/folder.png" alt="" class="mimaddMlz1ZBzi" />
                                        <div class="mimaddMlz1ZBzt">四</div>
                                    </div>
                                </div>
                            </div>
                            <div class="mimaddMlz1Z">
                                <div class="mimaddMlz1ZT">
                                    <div class="mimaddMlz1ZTt">
                                        <span>组织结构2</span>
                                        <span>（</span><span>20</span><span>）</span>
                                    </div>
                                    <div class="mimaddMlz1ZTi"></div>
                                </div>
                                <div class="mimaddMlz1ZB">
                                    <div class="mimaddMlz1ZBz">
                                        <img src="/wankangyuan/static/img/folder.png" alt="" class="mimaddMlz1ZBzi" />
                                        <div class="mimaddMlz1ZBzt">一</div>
                                    </div>
                                    <div class="mimaddMlz1ZBz">
                                        <img src="/wankangyuan/static/img/folder.png" alt="" class="mimaddMlz1ZBzi" />
                                        <div class="mimaddMlz1ZBzt">二</div>
                                    </div>
                                    <div class="mimaddMlz1ZBz">
                                        <img src="/wankangyuan/static/img/folder.png" alt="" class="mimaddMlz1ZBzi" />
                                        <div class="mimaddMlz1ZBzt">三</div>
                                    </div>
                                    <div class="mimaddMlz1ZBz">
                                        <img src="/wankangyuan/static/img/folder.png" alt="" class="mimaddMlz1ZBzi" />
                                        <div class="mimaddMlz1ZBzt">四</div>
                                    </div>
                                </div>
                            </div>
                            <div class="mimaddMlz1Z">
                                <div class="mimaddMlz1ZT">
                                    <div class="mimaddMlz1ZTt">
                                        <span>组织结构3</span>
                                        <span>（</span><span>20</span><span>）</span>
                                    </div>
                                    <div class="mimaddMlz1ZTi"></div>
                                </div>
                                <div class="mimaddMlz1ZB">
                                    <div class="mimaddMlz1ZBz">
                                        <img src="/wankangyuan/static/img/folder.png" alt="" class="mimaddMlz1ZBzi" />
                                        <div class="mimaddMlz1ZBzt">一</div>
                                    </div>
                                    <div class="mimaddMlz1ZBz">
                                        <img src="/wankangyuan/static/img/folder.png" alt="" class="mimaddMlz1ZBzi" />
                                        <div class="mimaddMlz1ZBzt">二</div>
                                    </div>
                                    <div class="mimaddMlz1ZBz">
                                        <img src="/wankangyuan/static/img/folder.png" alt="" class="mimaddMlz1ZBzi" />
                                        <div class="mimaddMlz1ZBzt">三</div>
                                    </div>
                                    <div class="mimaddMlz1ZBz">
                                        <img src="/wankangyuan/static/img/folder.png" alt="" class="mimaddMlz1ZBzi" />
                                        <div class="mimaddMlz1ZBzt">四</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mimaddMlz2">
                            <div class="mimaddMlz2z">
                                <span>我的好友</span>
                                <span>（</span><span>20</span><span>）</span>
                            </div>
                        </div>
                    </div>
                    <div class="mimaddMr">
                        <div class="mimaddMrT">
                            <div class="miadMrTzallK">
                                <div class="miadMrTzallX"></div>
                                <div class="miadMrTzallT">全选</div>
                            </div>
                            <div class="miadMrTz miadMrThead">头像</div>
                            <div class="miadMrTz miadMrTid">用户名</div>
                            <div class="miadMrTz miadMrTmail">邮箱</div>
                            <div class="miadMrTz miadMrTrole">角色</div>
                        </div>
                        <div class="mimaddMrM">
                            <div class="mimaddMrMz">
                                <div class="miadMrMzXZ">
                                    <div class="miadMrMzXZx"></div>
                                </div>
                                <div class="miadMrMhead">
                                    <img src="/wankangyuan/static/img/touxiang1.png" alt="" class="miadMrTheadi" />
                                </div>
                                <div class="miadMrMz miadMrTid">TXT1</div>
                                <div class="miadMrMz miadMrTmail">133675888@163.com</div>
                                <div class="miadMrMz miadMrTrole">管理员</div>
                            </div>
                            <div class="mimaddMrMz">
                                <div class="miadMrMzXZ">
                                    <div class="miadMrMzXZx"></div>
                                </div>
                                <div class="miadMrMhead">
                                    <img src="/wankangyuan/static/img/touxiang2.png" alt="" class="miadMrTheadi" />
                                </div>
                                <div class="miadMrMz miadMrTid">TXT2</div>
                                <div class="miadMrMz miadMrTmail">133675888@163.com</div>
                                <div class="miadMrMz miadMrTrole">无</div>
                            </div>
                            <div class="mimaddMrMz">
                                <div class="miadMrMzXZ">
                                    <div class="miadMrMzXZx"></div>
                                </div>
                                <div class="miadMrMhead">
                                    <img src="/wankangyuan/static/img/touxiang3.png" alt="" class="miadMrTheadi" />
                                </div>
                                <div class="miadMrMz miadMrTid">TXT3</div>
                                <div class="miadMrMz miadMrTmail">133675888@163.com</div>
                                <div class="miadMrMz miadMrTrole">无</div>
                            </div>
                            <div class="mimaddMrMz">
                                <div class="miadMrMzXZ">
                                    <div class="miadMrMzXZx"></div>
                                </div>
                                <div class="miadMrMhead">
                                    <img src="/wankangyuan/static/img/touxiang4.png" alt="" class="miadMrTheadi" />
                                </div>
                                <div class="miadMrMz miadMrTid">TXT4</div>
                                <div class="miadMrMz miadMrTmail">133675888@163.com</div>
                                <div class="miadMrMz miadMrTrole">无</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="PJK2">
                <div class="QXGLk">
                    <div class="QXGLkT">
                        <div class="QXGLkTl">权限管理</div>
                        <div class="QXGLkTr"></div>
                    </div>
                    <div class="QXGLkM">
                        <div class="QXGLkMl">
                            <div class="QXGLkMlt">创建角色</div>
                            <div class="QXGLkMlm">
                                <div class="QXGLkMlz active">
                                    <div class="QXGLkMlzt">主持人</div>
                                    <div class="QXGLkMlzi"></div>
                                </div>
                                <div class="QXGLkMlz">
                                    <div class="QXGLkMlzt">创建人</div>
                                    <div class="QXGLkMlzi"></div>
                                </div>
                            </div>
                        </div>
                        <div class="QXGLkMr">
                            <div class="QXGLkMrz">
                                <div class="QXGLkMrzT">文件</div>
                                <div class="QXGLkMrzM">
                                    <div class="QXGLkMrzMz">
                                        <div class="QXGLkMrzMzi"></div>
                                        <div class="QXGLkMrzMzt">添加</div>
                                    </div>
                                    <div class="QXGLkMrzMz">
                                        <div class="QXGLkMrzMzi"></div>
                                        <div class="QXGLkMrzMzt">修改</div>
                                    </div>
                                </div>
                            </div>
                            <div class="QXGLkMrz">
                                <div class="QXGLkMrzT">格式数据</div>
                                <div class="QXGLkMrzM">
                                    <div class="QXGLkMrzMz">
                                        <div class="QXGLkMrzMzi"></div>
                                        <div class="QXGLkMrzMzt">发布</div>
                                    </div>
                                    <div class="QXGLkMrzMz">
                                        <div class="QXGLkMrzMzi"></div>
                                        <div class="QXGLkMrzMzt">修改</div>
                                    </div>
                                </div>
                            </div>
                            <div class="QXGLkMrz">
                                <div class="QXGLkMrzT">应用</div>
                                <div class="QXGLkMrzM">
                                    <div class="QXGLkMrzMz">
                                        <div class="QXGLkMrzMzi"></div>
                                        <div class="QXGLkMrzMzt">发布</div>
                                    </div>
                                    <div class="QXGLkMrzMz">
                                        <div class="QXGLkMrzMzi"></div>
                                        <div class="QXGLkMrzMzt">修改</div>
                                    </div>
                                </div>
                            </div>
                            <div class="QXGLkMrz">
                                <div class="QXGLkMrzT">应用结果</div>
                                <div class="QXGLkMrzM">
                                    <div class="QXGLkMrzMz">
                                        <div class="QXGLkMrzMzi"></div>
                                        <div class="QXGLkMrzMzt">发布</div>
                                    </div>
                                    <div class="QXGLkMrzMz">
                                        <div class="QXGLkMrzMzi"></div>
                                        <div class="QXGLkMrzMzt">修改</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="button" class="QXGLkB" value="提交" />
                </div>
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <div class="PJK2litopT">张三</div>
                        <div class="PJK2litopI"></div>
                    </div>
                    <div class="PJK2licre">
                        <div class="PJK2licreT1">角色：</div>
                        <div class="PJK2licreT2">创建人</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">2017-4-10</div>
                        <div class="PJK2litimeT2">12：00</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">联系人：</div>
                        <div class="PJK2litimeT2">李四</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">上传文件：</div>
                        <div class="PJK2litimeT2">11</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">发表/回复话题：</div>
                        <div class="PJK2litimeT2">241</div>
                    </div>

                </div>
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <div class="PJK2litopT">李四</div>
                        <div class="PJK2litopI"></div>
                    </div>
                    <div class="PJK2licre">
                        <div class="PJK2licreT1">角色：</div>
                        <div class="PJK2licreT2">参与人</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">2017-8-21</div>
                        <div class="PJK2litimeT2">12：00</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">联系人：</div>
                        <div class="PJK2litimeT2">王五</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">上传文件：</div>
                        <div class="PJK2litimeT2">3</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">发表/回复话题：</div>
                        <div class="PJK2litimeT2">35</div>
                    </div>
                </div>
                <div class="PJK2li">
                    <div class="PJK2litop">
                        <div class="PJK2litopT">王五</div>
                        <div class="PJK2litopI"></div>
                    </div>
                    <div class="PJK2licre">
                        <div class="PJK2licreT1">角色：</div>
                        <div class="PJK2licreT2">主持人</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">2018-4-10</div>
                        <div class="PJK2litimeT2">12：00</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">联系人：</div>
                        <div class="PJK2litimeT2">李四</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">上传文件：</div>
                        <div class="PJK2litimeT2">5</div>
                    </div>
                    <div class="PJK2litime">
                        <div class="PJK2litimeT1">发表/回复话题：</div>
                        <div class="PJK2litimeT2">10</div>
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