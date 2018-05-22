<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<!-- saved from url=(0056)http://themifycloud.com/demos/templates/janux/table.html -->
<html lang="en" class=" js inlinesvg">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- start: Meta -->

    <title>用户管理</title>
    <meta name="description" content="Bootstrap Metro Dashboard">
    <meta name="author" content="Dennis Ji">
    <meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <!-- end: Meta -->

    <!-- start: Mobile Specific -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- end: Mobile Specific -->

    <!-- start: CSS -->
    <link id="bootstrap-style" href="<%=request.getContextPath()%>/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/admin/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link id="base-style" href="<%=request.getContextPath()%>/admin/css/style.css" rel="stylesheet">
    <link id="base-style-responsive" href="<%=request.getContextPath()%>/admin/css/style-responsive.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
    <!-- end: CSS -->


    <!-- start: Favicon -->
    <link rel="shortcut icon" href="http://themifycloud.com/demos/templates/janux/img/favicon.ico">
    <!-- end: Favicon -->
    <style type="text/css">
        .jqstooltip { 
            position: absolute;
            left: 0px;
            top: 0px;
            visibility: hidden;
            background: rgb(0, 0, 0) transparent;
            background-color: rgba(0,0,0,0.6);
            filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
            color: white;
            font: 10px arial, san serif;
            text-align: left;
            white-space: nowrap;
            padding: 5px;
            border: 1px solid white;
            z-index: 10000;
        }
        .jqsfield { 
            color: white;
            font: 10px arial, san serif;
            text-align: left;
        }
    </style>
</head>

<body style="cursor: auto;">
    <!-- start: Header顶端 -->
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container-fluid">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <!-- <a class="brand" href="index.html"><span>JANUX</span></a> -->
                <a class="brand" href="usermanage.html"><img src="<%=request.getContextPath()%>/admin/img/newlogo2.png" height="70" width="218" alt="" /></a>

                <!-- start: Header Menu -->
                <div class="nav-no-collapse header-nav">
                    <ul class="nav pull-right">
                        <!-- start: User Dropdown -->
                        <li class="dropdown">
                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="http://themifycloud.com/demos/templates/janux/table.html#">
                                <i class="halflings-icon white user"></i>用户名
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-menu-title">
                                    <span>账户设置</span>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                        <i class="halflings-icon user"></i>修改密码
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                        <i class="halflings-icon off"></i>退出系统
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!-- end: User Dropdown -->
                    </ul>
                </div>
                <!-- end: Header Menu -->
            </div>
        </div>
    </div>
    <!-- end: Header -->

    <div class="container-fluid-full">
        <div class="row-fluid">

            <!-- start: Main Menu -->
            <div id="sidebar-left" class="span2">
                <div class="nav-collapse sidebar-nav">
                    <ul class="nav nav-tabs nav-stacked main-menu">
                        <li>
                            <a href="usermanage.html">
                                <!-- <i class="icon-bar-chart"></i> -->
                                <span class="hidden-tablet"> 用户管理</span>
                            </a>
                        </li>   
                        <li>
                            <a href="rolemanage.html">
                                <!-- <i class="icon-bar-chart"></i> -->
                                <span class="hidden-tablet"> 角色管理</span>
                            </a>
                        </li>
                        <li>
                            <a href="menumanage.html">
                                <!-- <i class="icon-bar-chart"></i> -->
                                <span class="hidden-tablet"> 菜单管理</span>
                            </a>
                        </li>
                        <li>
                            <a href="datamanage.html">
                                <!-- <i class="icon-bar-chart"></i> -->
                                <span class="hidden-tablet"> 格式数据管理</span>
                            </a>
                        </li>
                        <li>
                            <a href="sysmanage.html">
                                <!-- <i class="icon-bar-chart"></i> -->
                                <span class="hidden-tablet"> 系统配置</span>
                            </a>
                        </li>
                        <li>
                            <a href="promanage.html">
                                <!-- <i class="icon-bar-chart"></i> -->
                                <span class="hidden-tablet"> 项目管理</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- end: Main Menu -->

            <noscript>
                &lt;div class="alert alert-block span10"&gt;
                &lt;h4 class="alert-heading"&gt;Warning!&lt;/h4&gt;
                &lt;p&gt;You need to have &lt;a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank"&gt;JavaScript&lt;/a&gt; enabled to use this site.&lt;/p&gt;
                &lt;/div&gt;
            </noscript>

            <!-- start: Content -->
            <div id="content" class="span10" style="min-height: 479px;">
                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home"></i>
                        <a href="javascript:;">首页</a> 
                        <i class="icon-angle-right"></i>
                    </li>
                    <li>
                        <a href="javascript:;">用户管理</a>
                    </li>
                </ul>

                <!-- 数据采集表start -->
                <div class="row-fluid sortable ui-sortable">
                    <div class="box span12 datacollec">
                        <div class="box-header" data-original-title="">
                            <h2>
                                <i class="halflings-icon white user"></i>
                                <span class="break"></span>用户
                            </h2>
                        </div>
                        <div class="box-content">
                            <div class="box_xytab">
                                <div class="box_xytabz active">
                                    <div class="box_xytabzK">
                                        <!-- <div class="box_xytabzT">Donor配置</div> -->
                                        <div class="tableedit">
                                            <div class="tableeditz2">
                                                <input type="text" class="tableeditz2p" placeholder="搜索平台用户" />
                                                <input type="button" class="tableeditz2b" value="搜索" />
                                            </div>
                                            <div class="tableeditz tableeditzadd">+新增</div>
                                            <div class="tableeditz tableeditzedit">/编辑</div>
                                            <div class="tableeditz tableeditzdis">-禁用</div>
                                            <div class="tableeditz tableeditzpsre">密码重置</div>
                                        </div>
                                        <div class="tablebox">
                                            <table class="biaoge table-bordered">
                                                <div class="biaotou">
                                                    <tr role="row">
                                                        <th class="biaotouth">
                                                            <input type="checkbox" class="quanxuan">全选
                                                        </th>
                                                        <th class="biaotouth">编号</th>
                                                        <th class="biaotouth">姓名</th>
                                                        <th class="biaotouth">年龄</th>
                                                        <th class="biaotouth">性别</th>
                                                        <th class="biaotouth">电话</th>
                                                        <th class="biaotouth">邮箱</th>
                                                        <th class="biaotouth">角色</th>
                                                        <th class="biaotouth">创建时间</th>
                                                        <th class="biaotouth">更新时间</th>
                                                    </tr>
                                                </div>
                                                <div class="biaoxiang">
                                                <c:forEach items="${list }" var="user">
                                                    <tr role="row" class="trbx">
                                                        <th class="biaoxiangth"><input type="checkbox" class="xuanze"></th>
                                                        <th class="biaoxiangth">${user.id }</th>
                                                        <th class="biaoxiangth">${user.username }</th>
                                                        <th class="biaoxiangth">
                                                            <c:if test="${'0' eq user.gender }">女</c:if>
                                                            <c:if test="${'1' eq user.gender }">男</c:if>
                                                        </th>
                                                        <th class="biaoxiangth">${user.phone }</th>
                                                        <th class="biaoxiangth">${user.email }</th>
                                                        <th class="biaoxiangth">角色</th>
                                                        <th class="biaoxiangth">${user.createTime }</th>
                                                        <th class="biaoxiangth">${user.lastLoginTime }</th>
                                                    </tr>
                                                </c:forEach>
                                                    <tr role="row" class="trbx">
                                                        <th class="biaoxiangth"><input type="checkbox" class="xuanze"></th>
                                                        <th class="biaoxiangth">02</th>
                                                        <th class="biaoxiangth">李四</th>
                                                        <th class="biaoxiangth">33</th>
                                                        <th class="biaoxiangth">男</th>
                                                        <th class="biaoxiangth">18877777777</th>
                                                        <th class="biaoxiangth">645643454@qq.com</th>
                                                        <th class="biaoxiangth">创建者</th>
                                                        <th class="biaoxiangth">2018-5-1</th>
                                                        <th class="biaoxiangth">2018-5-12</th>
                                                    </tr>
                                                </div>
                                            </table>
                                        </div>

                                        <div class="pageK">
                                            <div class="pageLR">
                                                <img src="<%=request.getContextPath()%>/admin/img/pageL.png" class="pageLRi" alt="" />
                                            </div>
                                            <div class="pageNUM active">1</div>
                                            <div class="pageNUM ">2</div>
                                            <div class="pageNUM">3</div>
                                            <div class="pageLR">
                                                <img src="<%=request.getContextPath()%>/admin/img/pageR.png" class="pageLRi" alt="" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>


                            <!-- 新增用户start -->
                            <div class="user_addboxK">
                                <div class="addbiaoxT">
                                    <div class="addbiaoxTt">添加用户</div>
                                    <div class="addbiaoxTx"></div>
                                </div>
                                <div class="addbiaoxli">
                                    <div class="addbiaoxlit">用户名：</div>
                                    <input type="text" class="addbiaoxlik" />
                                </div>
                                <div class="addbiaoxli">
                                    <div class="addbiaoxlit">性别：</div>
                                    <div class="addbiaoxliR">
                                        <input type="radio" class="addbiaoxlir" name="shifouxianshi" checked="" value="ture" />男
                                        <input type="radio" class="addbiaoxlir" name="shifouxianshi" value="false" />女
                                    </div>
                                </div>
                                <div class="addbiaoxli">
                                    <div class="addbiaoxlit">年龄：</div>
                                    <input type="text" class="addbiaoxlik" />
                                </div>
                                <div class="addbiaoxli">
                                    <div class="addbiaoxlit">电话：</div>
                                    <input type="text" class="addbiaoxlik" />
                                </div>
                                <div class="addbiaoxli">
                                    <div class="addbiaoxlit">邮箱：</div>
                                    <input type="text" class="addbiaoxlik" />
                                </div>
                                <div class="addbiaoxli">
                                    <div class="addbiaoxlit">状态：</div>
                                    <select name="" id="">
                                        <option value="">参与人</option>
                                        <option value="">创建人</option>
                                        <option value="">主持人</option>
                                    </select>
                                </div>
                                <div class="addboxB">
                                    <input type="button" value="提交" class="addboxBb" />
                                </div>
                            </div>
                            <!-- 新增用户end -->

                            <!-- 修改用户start -->
                            <div class="user_editboxK">
                                <div class="addbiaoxT">
                                    <div class="addbiaoxTt">更新用户</div>
                                    <div class="addbiaoxTx"></div>
                                </div>
                                <div class="addbiaoxli">
                                    <div class="addbiaoxlit">用户名：</div>
                                    <input type="text" class="addbiaoxlik" />
                                </div>
                                <div class="addbiaoxli">
                                    <div class="addbiaoxlit">性别：</div>
                                    <div class="addbiaoxliR">
                                        <input type="radio" class="addbiaoxlir" name="shifouxianshi" checked="" value="ture" />男
                                        <input type="radio" class="addbiaoxlir" name="shifouxianshi" value="false" />女
                                    </div>
                                </div>
                                <div class="addbiaoxli">
                                    <div class="addbiaoxlit">年龄：</div>
                                    <input type="text" class="addbiaoxlik" />
                                </div>
                                <div class="addbiaoxli">
                                    <div class="addbiaoxlit">电话：</div>
                                    <input type="text" class="addbiaoxlik" />
                                </div>
                                <div class="addbiaoxli">
                                    <div class="addbiaoxlit">邮箱：</div>
                                    <input type="text" class="addbiaoxlik" />
                                </div>
                                <div class="addbiaoxli">
                                    <div class="addbiaoxlit">状态：</div>
                                    <select name="" id="">
                                        <option value="">参与人</option>
                                        <option value="">创建人</option>
                                        <option value="">主持人</option>
                                    </select>
                                </div>
                                <div class="addboxB">
                                    <input type="button" value="提交" class="addboxBb" />
                                </div>
                            </div>
                            <!-- 修改用户end -->

                            <!-- 禁用用户start -->
                            <div class="user_disboxK">
                                <div class="addbiaoxT">
                                    <div class="addbiaoxTt">通知</div>
                                    <div class="addbiaoxTx"></div>
                                </div>
                                <div class="delbiaoxM">您确认禁用选中的账户吗?（禁用后该账户无法登入系统！）</div>
                                <div class="addbiaoxB">
                                    <input type="button" value="确认" class="addbiaoxBb" />
                                    <input type="button" value="取消" class="addbiaoxBb2" />
                                </div>
                            </div>
                            <!-- 禁用用户end -->

                            <!-- 重置用户密码start -->
                            <div class="user_psreboxK">
                                <div class="addbiaoxT">
                                    <div class="addbiaoxTt">通知</div>
                                    <div class="addbiaoxTx"></div>
                                </div>
                                <div class="delbiaoxM">您确认重置选中的账户的密码吗？</div>
                                <div class="addbiaoxB">
                                    <input type="button" value="确认" class="addbiaoxBb" />
                                    <input type="button" value="取消" class="addbiaoxBb2" />
                                </div>
                            </div>
                            <!-- 重置用户密码end -->

                        </div>
                    </div>
                </div>
                <!-- 数据采集表end -->

            </div><!--/.fluid-container-->
            <!-- end: Content -->
        </div><!--/#content.span10-->
    </div><!--/fluid-row-->

    <div class="modal hide fade" id="myModal">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h3>Settings</h3>
        </div>
        <div class="modal-body">
            <p>Here settings can be configured...</p>
        </div>
        <div class="modal-footer">
            <a href="http://themifycloud.com/demos/templates/janux/table.html#" class="btn" data-dismiss="modal">Close</a>
            <a href="http://themifycloud.com/demos/templates/janux/table.html#" class="btn btn-primary">Save changes</a>
        </div>
    </div>

    <div class="clearfix"></div>

    <footer>
        <p>
            <span style="text-align:left;float:left">© 2013 <a href="http://themifycloud.com/downloads/janux-free-responsive-admin-dashboard-template/" alt="Bootstrap_Metro_Dashboard">JANUX Responsive Dashboard</a></span>

        </p>
    </footer>

    <!-- start: JavaScript-->

    <script src="<%=request.getContextPath()%>/admin/js/jquery-1.9.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/admin/js/jquery-migrate-1.0.0.min.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/jquery-ui-1.10.0.custom.min.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/jquery.ui.touch-punch.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/modernizr.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/bootstrap.min.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/jquery.cookie.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/fullcalendar.min.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/jquery.dataTables.min.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/excanvas.js"></script>
    <script src="<%=request.getContextPath()%>/admin/js/jquery.flot.js"></script>
    <script src="<%=request.getContextPath()%>/admin/js/jquery.flot.pie.js"></script>
    <script src="<%=request.getContextPath()%>/admin/js/jquery.flot.stack.js"></script>
    <script src="<%=request.getContextPath()%>/admin/js/jquery.flot.resize.min.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/jquery.chosen.min.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/jquery.uniform.min.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/jquery.cleditor.min.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/jquery.noty.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/jquery.elfinder.min.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/jquery.raty.min.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/jquery.iphone.toggle.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/jquery.uploadify-3.1.min.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/jquery.gritter.min.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/jquery.imagesloaded.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/jquery.masonry.min.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/jquery.knob.modified.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/jquery.sparkline.min.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/counter.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/retina.js"></script>

    <script src="<%=request.getContextPath()%>/admin/js/custom.js"></script>

    <script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/usermanage.js"></script>
    <!-- end: JavaScript-->
</body>
</html>