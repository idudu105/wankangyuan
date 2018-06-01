<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Document</title>
</head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/project1.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/project1.js"></script>
<script type="text/javascript">
    window.onload=function(){
        // project0();
        // project1();
        // pro_mine();
        // user_info();
        // system_message();
        friend_manage();
    }
</script>
<body>
    <div class="Box">
        <div class="box">
            <div class="top">
                <h1><img src="<%=request.getContextPath()%>/static/img/newlogo2.png" height="70" width="218" alt="" class="logo" /></h1>
                <a href="project_mine.html">
                    <div class="topT">项目</div>
                </a>
                <a href="data_mine.html">
                    <div class="topT">格式数据</div>
                </a>
                <a href="app_mine.html">
                    <div class="topT">应用</div>
                </a>
                <div class="touxiangK">
                    <a href="user_info.html">
                        <img src="<%=request.getContextPath()%>/static/img/touxiang.png" alt="" class="touxiang" />
                    </a>
                    <div class="userbutK">
                        <a href="user_info.html">
                            <div class="userbut">用户信息</div>
                        </a>
                        <a href="system_message.html">
                            <div class="userbut">系统消息
                                <img src="<%=request.getContextPath()%>/static/img/redpoint.png" height="11" width="11" alt="" class="redpoint2" />
                            </div>
                        </a>
                        <div class="userbutline"></div>
                        <a href="javascript:;">
                            <div class="userbut">退出登录</div>
                        </a>
                    </div>
                </div>
                <div class="nicheng">Peter</div>
                <a href="friend_manage.html">
                    <div class="yanjiuquan active">
                        <div class="yanjiuquanT">研究圈</div>
                        <!-- <img src="<%=request.getContextPath()%>/static/img/redpoint.png" height="11" width="11" alt="" class="redpoint" /> -->
                    </div>
                </a>
            </div>
            <div class="top2">
                <div class="top2C">
                    <a href="friend_manage.html"><div class="top2Cli top2CliYJ">好友管理</div></a>
                    <a href="message_list.html">
                        <div class="top2Cli">好友消息
                            <img src="<%=request.getContextPath()%>/static/img/redpoint.png" height="11" width="11" alt="" class="redpoint3" />
                        </div>
                    </a>
                </div>
            </div>
            <div class="friendM">
                <div class="friendMT">
                    
                    <!-- 组织结构添加框 -->
                    <div class="zzjgK">
                        <div class="zzjgM">
                            <div class="zzjgMz">
                                <div class="zzjgMzt">组织结构名称</div>
                                <input type="text" class="zzjgMzp" />
                            </div>
                            <div class="zzjgMz">
                                <div class="zzjgMzt">真实姓名</div>
                                <input type="text" class="zzjgMzp" />
                            </div>
                            <div class="zzjgMz">
                                <div class="zzjgMzt">联系电话</div>
                                <input type="text" class="zzjgMzp" />
                            </div>
                            <div class="zzjgMz">
                                <div class="zzjgMzt">单位简介</div>
                                <textarea name=""class="zzjgMzta"></textarea>
                            </div>
                        </div>
                        <div class="zzjgB">
                            <input type="button" class="zzjgBb" value="提交审核" />
                        </div>
                    </div>

                    <!-- 组添加框 -->
                    <div class="zzsyK">
                        <div class="zzsyKT">添加组到组织结构</div>
                        <input type="text" class="zzsyKpd" style="display:none;" />
                        <div class="zzsyM">
                            <div class="zzsyMz">
                                <div class="zzsyMzt">组名称：</div>
                                <input type="text" class="zzsyMzp" />
                            </div>
                        </div>
                        <div class="zzsyB">
                            <input type="button" class="zzsyBb" value="确定" />
                        </div>
                    </div>
                    
                    <!-- 组修改框 -->
                    <div class="zzsy_editK">
                        <div class="zzsyKT">修改组名称</div>
                        <input type="text" class="zzsy_editKpd" style="display:none;" />
                        <div class="zzsyM">
                            <div class="zzsyMz">
                                <div class="zzsyMzt">组名称：</div>
                                <input type="text" class="zzsy_editMzp" />
                            </div>
                        </div>
                        <div class="zzsyB">
                            <input type="button" class="zzsyBb" value="确定" />
                        </div>
                    </div>

                    <!-- 组删除框 -->
                    <div class="zzsy_delK">
                        <div class="zzsyKT">确定删除选中组吗？（删除后不可恢复！）</div>
                        <input type="text" class="zzsy_delKpd" style="display:none;" />
                        <div class="zzsyB">
                            <input type="button" class="zzsyBb2" value="确定" />
                        </div>
                    </div>

                    <!-- 添加成员框 -->
                    <div class="chengyuan_addK">
                        <div class="cyaddKT">添加成员</div>
                        <div class="cyaddKT2">
                            <input type="text" class="cyaddKT2p" placeholder="输入要搜索的用户名" />
                            <input type="button" class="cyaddKT2b" value="搜索" />
                        </div>
                        <div class="cyaddKM">
                            <table class="cyaddKMtb">
                                <tr class="biaotou">
                                    <th class="touxiang">头像</th>
                                    <th class="yonghuming">用户名</th>
                                    <th class="youxiang">邮箱</th>
                                    <th class="caozuo">操作</th>
                                </tr>
                                <tr class="biaoxiang">
                                    <th class="touxiang"><img src="<%=request.getContextPath()%>/static/img/touxiang_1.png" alt="" class="touxiangi" /></th>
                                    <th class="yonghuming">用户名1</th>
                                    <th class="youxiang">133675888@163.com</th>
                                    <th class="caozuo">
                                        <input type="checkbox" class="caozuochk" />
                                    </th>
                                </tr>
                                <tr class="biaoxiang">
                                    <th class="touxiang"><img src="<%=request.getContextPath()%>/static/img/touxiang_2.png" alt="" class="touxiangi" /></th>
                                    <th class="yonghuming">用户名2</th>
                                    <th class="youxiang">133675888@163.com</th>
                                    <th class="caozuo">
                                        <input type="checkbox" class="caozuochk" />
                                    </th>
                                </tr>
                                <tr class="biaoxiang">
                                    <th class="touxiang"><img src="<%=request.getContextPath()%>/static/img/touxiang_3.png" alt="" class="touxiangi" /></th>
                                    <th class="yonghuming">用户名3</th>
                                    <th class="youxiang">133675888@163.com</th>
                                    <th class="caozuo">
                                        <input type="checkbox" class="caozuochk" />
                                    </th>
                                </tr>
                            </table>
                        </div>

                        <div class="cyaddKB">
                            <div class="cyaddKBt">添加到</div>
                            <select name="" id="" class="cyaddKBs">
                                <option value="" style="display:none;">请选择</option>
                                <option value="">组1_1</option>
                                <option value="">组2_1</option>
                                <option value="">组3_1</option>
                                <option value="">组4_1</option>
                            </select>
                            <input type="button" class="cyaddKBb" value="添加" />
                        </div>
                    </div>
                        
                    <!-- 群发消息框 -->
                    <div class="qunfaK">
                        <div class="qunfaT">
                            <div class="qunfaTt">群发消息</div>
                            <img src="<%=request.getContextPath()%>/static/img/close.png" alt="" class="qunfaTi" />
                        </div>
                        <div class="qunfaM">
                            <div class="qunfaMt">内容：</div>
                            <textarea name="" id="" class="qunfaMta" maxlength="600"></textarea>
                        </div>
                        <div class="qunfaB">
                            <input type="button" class="qunfaBb qunfaBb_cancel" value="取消" />
                            <input type="button" class="qunfaBb qunfaBb_send" value="发送" />
                        </div>
                    </div>

                    <!-- 从组中移除框 -->
                    <div class="zuyichuK">
                        <div class="zzsyKT">确定从组中移除选中成员吗？</div>
                        <input type="text" class="zzsy_delKpd" style="display:none;" />
                        <div class="zzsyB">
                            <input type="button" class="zzsyBb2" value="确定" />
                        </div>
                    </div>

                    <!-- 移除好友 -->
                    <div class="yichuhyK">
                        <div class="zzsyKT">确定移除选中的好友吗？</div>
                        <input type="text" class="zzsy_delKpd" style="display:none;" />
                        <div class="zzsyB">
                            <input type="button" class="zzsyBb2" value="确定" />
                        </div>
                    </div>

                    
                    <!-- 按钮栏 -->
                    <div class="friendMTl">
                        <div class="friendMTl_l">
                            <div class="friendMTl_lt">组织结构</div>
                        </div>
                        <div class="friendMTl_r">
                            <div class="friendMTl_rb friend_addzzs">添加组织结构</div>
                            <div class="jiangeline2"></div>
                            <div class="friendMTl_rb friend_addy">添加组</div>
                            <div class="jiangeline2"></div>
                            <div class="friendMTl_rb friend_addmem">添加成员</div>
                            <div class="jiangeline2"></div>
                            <div class="friendMTl_rb friend_edity">修改组</div>
                            <div class="jiangeline2"></div>
                            <div class="friendMTl_rb friend_dely">删除组</div>
                        </div>
                    </div>
                    <div class="friendMTr">
                        <div class="search_2">
                            <div class="searchC">
                                <img src="<%=request.getContextPath()%>/static/img/search.png" alt="" class="searchCi" />
                                <input type="text" class="searchCt"  placeholder="搜索" />
                            </div>
                        </div>
                        <div class="friendMTrb friend_qunfa">群发消息</div>
                        <div class="friendMTrb friend_yichuzu">从组中移除</div>
                        <div class="friendMTrb friend_yichuhy">移除好友</div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="friendMM">

                    <!-- 添加好友框 -->
                    <div class="haoyou_addK">
                        <div class="hyaddKT">
                            <div class="hyaddKTt">添加好友</div>
                            <img src="<%=request.getContextPath()%>/static/img/close.png" alt="" class="hyaddKTi" />
                        </div>
                        <div class="cyaddKT2">
                            <input type="text" class="cyaddKT2p" placeholder="输入要搜索的用户名" />
                            <input type="button" class="cyaddKT2b" value="搜索" />
                        </div>
                        <div class="cyaddKM">
                            <table class="cyaddKMtb">
                                <tr class="biaotou">
                                    <th class="touxiang">头像</th>
                                    <th class="yonghuming">用户名</th>
                                    <th class="youxiang">邮箱</th>
                                    <th class="caozuo">操作</th>
                                </tr>
                                <tr class="biaoxiang">
                                    <th class="touxiang"><img src="<%=request.getContextPath()%>/static/img/touxiang_1.png" alt="" class="touxiangi" /></th>
                                    <th class="yonghuming">用户名1</th>
                                    <th class="youxiang">133675888@163.com</th>
                                    <th class="caozuo">
                                        <input type="checkbox" class="caozuochk" />
                                    </th>
                                </tr>
                                <tr class="biaoxiang">
                                    <th class="touxiang"><img src="<%=request.getContextPath()%>/static/img/touxiang_2.png" alt="" class="touxiangi" /></th>
                                    <th class="yonghuming">用户名2</th>
                                    <th class="youxiang">133675888@163.com</th>
                                    <th class="caozuo">
                                        <input type="checkbox" class="caozuochk" />
                                    </th>
                                </tr>
                                <tr class="biaoxiang">
                                    <th class="touxiang"><img src="<%=request.getContextPath()%>/static/img/touxiang_3.png" alt="" class="touxiangi" /></th>
                                    <th class="yonghuming">用户名3</th>
                                    <th class="youxiang">133675888@163.com</th>
                                    <th class="caozuo">
                                        <input type="checkbox" class="caozuochk" />
                                    </th>
                                </tr>
                            </table>
                        </div>
                        <div class="cyaddKB">
                            <input type="button" class="cyaddKBb" value="添加" />
                            <input type="button" class="cyaddKBb hyaddKBb_close" value="关闭" />
                        </div>
                    </div>

                    <div class="friendMMl">
                        <div class="friendMMlT"><!-- 除添加好友外 -->
                            <div class="friendMMlTT"><!-- 除我的好友外 -->
                                <c:forEach items="${orgList }" var="org">
                                <div class="friendMMlTTz active" name="${org.id }"><!-- 每个组织结构 -->
                                    <div class="friendMMlTTzT">
                                        <span class="fri_name">${org.organizationName }（</span><span>20</span><span>）</span>
                                        <div class="friendMMlTTzTi"></div>
                                        <img src="<%=request.getContextPath()%>/static/img/shenhe1.png" alt="" class="friendMMlTTzTi2" />
                                    </div>
                                    <div class="friendMMlTTzB">
                                        <div class="friendMMlTTzBz" name="zu1">
                                            <img src="<%=request.getContextPath()%>/static/img/folder.png" alt="" class="friendMMlTTzBzi" />
                                            <div class="friendMMlTTzBzt">组1_1</div>
                                        </div>
                                        <div class="friendMMlTTzBz" name="zu2">
                                            <img src="<%=request.getContextPath()%>/static/img/folder.png" alt="" class="friendMMlTTzBzi" />
                                            <div class="friendMMlTTzBzt">组1_2</div>
                                        </div>
                                        <div class="friendMMlTTzBz" name="zu3">
                                            <img src="<%=request.getContextPath()%>/static/img/folder.png" alt="" class="friendMMlTTzBzi" />
                                            <div class="friendMMlTTzBzt">组1_3</div>
                                        </div>
                                        <div class="friendMMlTTzBz" name="zu4">
                                            <img src="<%=request.getContextPath()%>/static/img/folder.png" alt="" class="friendMMlTTzBzi" />
                                            <div class="friendMMlTTzBzt">组1_4</div>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                                <div class="friendMMlTTz" name="zuzhijiegou2">
                                    <div class="friendMMlTTzT">
                                        <span class="fri_name">组织结构2（</span><span>20</span><span>）</span>
                                        <div class="friendMMlTTzTi"></div>
                                        <img src="<%=request.getContextPath()%>/static/img/shenhe2.png" alt="" class="friendMMlTTzTi2" />
                                    </div>
                                    <div class="friendMMlTTzB">
                                        <div class="friendMMlTTzBz" name="zu5">
                                            <img src="<%=request.getContextPath()%>/static/img/folder.png" alt="" class="friendMMlTTzBzi" />
                                            <div class="friendMMlTTzBzt">组2_1</div>
                                        </div>
                                        <div class="friendMMlTTzBz" name="zu6">
                                            <img src="<%=request.getContextPath()%>/static/img/folder.png" alt="" class="friendMMlTTzBzi" />
                                            <div class="friendMMlTTzBzt">组2_2</div>
                                        </div>
                                        <div class="friendMMlTTzBz" name="zu7">
                                            <img src="<%=request.getContextPath()%>/static/img/folder.png" alt="" class="friendMMlTTzBzi" />
                                            <div class="friendMMlTTzBzt">组2_3</div>
                                        </div>
                                        <div class="friendMMlTTzBz" name="zu8">
                                            <img src="<%=request.getContextPath()%>/static/img/folder.png" alt="" class="friendMMlTTzBzi" />
                                            <div class="friendMMlTTzBzt">组2_4</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="friendMMlTTz" name="zuzhijiegou3">
                                    <div class="friendMMlTTzT">
                                        <span class="fri_name">组织结构3（</span><span>20</span><span>）</span>
                                        <div class="friendMMlTTzTi"></div>
                                        <img src="<%=request.getContextPath()%>/static/img/shenhe3.png" alt="" class="friendMMlTTzTi2" />
                                    </div>
                                    <div class="friendMMlTTzB">
                                        <div class="friendMMlTTzBz" name="zu9">
                                            <img src="<%=request.getContextPath()%>/static/img/folder.png" alt="" class="friendMMlTTzBzi" />
                                            <div class="friendMMlTTzBzt">组3_1</div>
                                        </div>
                                        <div class="friendMMlTTzBz" name="zu10">
                                            <img src="<%=request.getContextPath()%>/static/img/folder.png" alt="" class="friendMMlTTzBzi" />
                                            <div class="friendMMlTTzBzt">组3_2</div>
                                        </div>
                                        <div class="friendMMlTTzBz" name="zu11">
                                            <img src="<%=request.getContextPath()%>/static/img/folder.png" alt="" class="friendMMlTTzBzi" />
                                            <div class="friendMMlTTzBzt">组3_3</div>
                                        </div>
                                        <div class="friendMMlTTzBz" name="zu12">
                                            <img src="<%=request.getContextPath()%>/static/img/folder.png" alt="" class="friendMMlTTzBzi" />
                                            <div class="friendMMlTTzBzt">组3_4</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="friendMMlTB">
                                <a href="javascript:;" class="friendMMlTBa">
                                    <span>我的好友（</span><span>20</span><span>）</span>
                                </a>
                            </div>
                        </div>
                        <div class="friendMMlB">
                            <div class="friendMMlb">添加好友</div>
                        </div>
                    </div>
                    <div class="friendMMr">
                        <div class="friendMMrz active">
                            <div class="friMMrtabK">
                                <table class="friMMrtab">
                                    <tr class="biaotou">
                                        <th class="xuanze">
                                            <div class="quanxuanK">
                                                <input type="checkbox" class="input_check" id="check1_0">
                                                <label for="check1_0"></label>
                                            </div>全选
                                        </th>
                                        <th class="touxiangk">头像</th>
                                        <th class="yonghuming">用户名</th>
                                        <th class="youxiang">邮箱</th>
                                        <th class="juese">角色</th>
                                        <th class="caozuo">操作</th>
                                    </tr>
                                    <tr class="">
                                        <td class="xuanze">
                                            <div class="fuxuanK2">
                                                <input type="checkbox" class="input_check" id="check1_1">
                                                <label for="check1_1"></label>
                                            </div>
                                        </td>
                                        <td class="touxiangk">
                                            <img src="<%=request.getContextPath()%>/static/img/touxiang_6.png" alt="" class="touxiangi" />
                                        </td>
                                        <td class="yonghuming"><span>用户1</span></td>
                                        <td class="youxiang"><span>133675888@163.com</span></td>
                                        <td class="juese"><span>管理员</span></td>
                                        <td class="caozuo bukecaozuo"><span>已添加</span></td>
                                    </tr>
                                    <tr class="">
                                        <td class="xuanze">
                                            <div class="fuxuanK2">
                                                <input type="checkbox" class="input_check" id="check1_2">
                                                <label for="check1_2"></label>
                                            </div>
                                        </td>
                                        <td class="touxiangk">
                                            <img src="<%=request.getContextPath()%>/static/img/touxiang_2.png" alt="" class="touxiangi" />
                                        </td>
                                        <td class="yonghuming"><span>用户2</span></td>
                                        <td class="youxiang"><span>133675888@163.com</span></td>
                                        <td class="juese"><span>无</span></td>
                                        <td class="caozuo bukecaozuo"><span>已添加</span></td>
                                    </tr>
                                    <tr class="">
                                        <td class="xuanze">
                                            <div class="fuxuanK2">
                                                <input type="checkbox" class="input_check" id="check1_3">
                                                <label for="check1_3"></label>
                                            </div>
                                        </td>
                                        <td class="touxiangk">
                                            <img src="<%=request.getContextPath()%>/static/img/touxiang_3.png" alt="" class="touxiangi" />
                                        </td>
                                        <td class="yonghuming"><span>用户3</span></td>
                                        <td class="youxiang"><span>133675888@163.com</span></td>
                                        <td class="juese"><span>无</span></td>
                                        <td class="caozuo kecaozuo"><span>加好友</span></td>
                                    </tr>
                                    <tr class="">
                                        <td class="xuanze">
                                            <div class="fuxuanK2">
                                                <input type="checkbox" class="input_check" id="check1_4">
                                                <label for="check1_4"></label>
                                            </div>
                                        </td>
                                        <td class="touxiangk">
                                            <img src="<%=request.getContextPath()%>/static/img/touxiang_4.png" alt="" class="touxiangi" />
                                        </td>
                                        <td class="yonghuming"><span>用户4</span></td>
                                        <td class="youxiang"><span>133675888@163.com</span></td>
                                        <td class="juese"><span>无</span></td>
                                        <td class="caozuo kecaozuo"><span>加好友</span></td>
                                    </tr>
                                    <tr class="">
                                        <td class="xuanze">
                                            <div class="fuxuanK2">
                                                <input type="checkbox" class="input_check" id="check1_5">
                                                <label for="check1_5"></label>
                                            </div>
                                        </td>
                                        <td class="touxiangk">
                                            <img src="<%=request.getContextPath()%>/static/img/touxiang_5.png" alt="" class="touxiangi" />
                                        </td>
                                        <td class="yonghuming"><span>用户5</span></td>
                                        <td class="youxiang"><span>133675888@163.com</span></td>
                                        <td class="juese"><span>无</span></td>
                                        <td class="caozuo kecaozuo"><span>加好友</span></td>
                                    </tr>
                                    <tr class="">
                                        <td class="xuanze">
                                            <div class="fuxuanK2">
                                                <input type="checkbox" class="input_check" id="check1_6">
                                                <label for="check1_6"></label>
                                            </div>
                                        </td>
                                        <td class="touxiangk">
                                            <img src="<%=request.getContextPath()%>/static/img/touxiang_6.png" alt="" class="touxiangi" />
                                        </td>
                                        <td class="yonghuming"><span>用户6</span></td>
                                        <td class="youxiang"><span>133675888@163.com</span></td>
                                        <td class="juese"><span>无</span></td>
                                        <td class="caozuo kecaozuo"><span>加好友</span></td>
                                    </tr>
                                    <tr class="">
                                        <td class="xuanze">
                                            <div class="fuxuanK2">
                                                <input type="checkbox" class="input_check" id="check1_7">
                                                <label for="check1_7"></label>
                                            </div>
                                        </td>
                                        <td class="touxiangk">
                                            <img src="<%=request.getContextPath()%>/static/img/touxiang_7.png" alt="" class="touxiangi" />
                                        </td>
                                        <td class="yonghuming"><span>用户7</span></td>
                                        <td class="youxiang"><span>133675888@163.com</span></td>
                                        <td class="juese"><span>无</span></td>
                                        <td class="caozuo kecaozuo"><span>加好友</span></td>
                                    </tr>
                                    <tr class="">
                                        <td class="xuanze">
                                            <div class="fuxuanK2">
                                                <input type="checkbox" class="input_check" id="check1_8">
                                                <label for="check1_8"></label>
                                            </div>
                                        </td>
                                        <td class="touxiangk">
                                            <img src="<%=request.getContextPath()%>/static/img/touxiang_4.png" alt="" class="touxiangi" />
                                        </td>
                                        <td class="yonghuming"><span>用户8</span></td>
                                        <td class="youxiang"><span>133675888@163.com</span></td>
                                        <td class="juese"><span>无</span></td>
                                        <td class="caozuo kecaozuo"><span>加好友</span></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="pageK">
                                <div class="pageLR">
                                    <img src="<%=request.getContextPath()%>/static/img/pageL.png" class="pageLRi" alt="" />
                                </div>
                                <div class="pageNUM active">1</div>
                                <div class="pageNUM ">2</div>
                                <div class="pageNUM">3</div>
                                <div class="pageLR">
                                    <img src="<%=request.getContextPath()%>/static/img/pageR.png" class="pageLRi" alt="" />
                                </div>
                            </div>
                        </div>
                        <div class="friendMMrz">
                            <div class="friMMrtabK">
                                <table class="friMMrtab">
                                    <tr class="biaotou">
                                        <th class="xuanze">
                                            <div class="quanxuanK">
                                                <input type="checkbox" class="input_check" id="check2_0">
                                                <label for="check2_0"></label>
                                            </div>全选
                                        </th>
                                        <th class="touxiangk">头像</th>
                                        <th class="yonghuming">用户名</th>
                                        <th class="youxiang">邮箱</th>
                                        <th class="juese">角色</th>
                                        <th class="caozuo">操作</th>
                                    </tr>
                                    <tr class="">
                                        <td class="xuanze">
                                            <div class="fuxuanK2">
                                                <input type="checkbox" class="input_check" id="check2_1">
                                                <label for="check2_1"></label>
                                            </div>
                                        </td>
                                        <td class="touxiangk">
                                            <img src="<%=request.getContextPath()%>/static/img/touxiang_6.png" alt="" class="touxiangi" />
                                        </td>
                                        <td class="yonghuming"><span>用户1</span></td>
                                        <td class="youxiang"><span>133675888@163.com</span></td>
                                        <td class="juese"><span>管理员</span></td>
                                        <td class="caozuo faxiaoxi"><span>发消息</span></td>
                                    </tr>
                                    <tr class="">
                                        <td class="xuanze">
                                            <div class="fuxuanK2">
                                                <input type="checkbox" class="input_check" id="check2_2">
                                                <label for="check2_2"></label>
                                            </div>
                                        </td>
                                        <td class="touxiangk">
                                            <img src="<%=request.getContextPath()%>/static/img/touxiang_2.png" alt="" class="touxiangi" />
                                        </td>
                                        <td class="yonghuming"><span>用户2</span></td>
                                        <td class="youxiang"><span>133675888@163.com</span></td>
                                        <td class="juese"><span>无</span></td>
                                        <td class="caozuo faxiaoxi"><span>发消息</span></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="pageK">
                                <div class="pageLR">
                                    <img src="<%=request.getContextPath()%>/static/img/pageL.png" class="pageLRi" alt="" />
                                </div>
                                <div class="pageNUM active">1</div>
                                <div class="pageNUM ">2</div>
                                <div class="pageNUM">3</div>
                                <div class="pageLR">
                                    <img src="<%=request.getContextPath()%>/static/img/pageR.png" class="pageLRi" alt="" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
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