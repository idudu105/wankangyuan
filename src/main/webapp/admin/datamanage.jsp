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
<!-- saved from url=(0056)http://themifycloud.com/demos/templates/janux/table.html -->
<html lang="en" class=" js inlinesvg">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- start: Meta -->

    <title>格式数据管理</title>
    <meta name="description" content="Bootstrap Metro Dashboard">
    <meta name="author" content="Dennis Ji">
    <meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <!-- end: Meta -->

    <!-- start: Mobile Specific -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- end: Mobile Specific -->

    <!-- start: CSS -->
    <link id="bootstrap-style" href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
    <link id="base-style" href="css/style.css" rel="stylesheet">
    <link id="base-style-responsive" href="css/style-responsive.css" rel="stylesheet">
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
                <a class="brand" href="usermanage.html"><img src="img/newlogo2.png" height="70" width="218" alt="" /></a>

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
                            <a href="javascript:;">
                                <!-- <i class="icon-bar-chart"></i> -->
                                <span class="hidden-tablet"> 用户管理</span>
                            </a>
                        </li>	
                        <li>
                            <a href="javascript:;">
                                <!-- <i class="icon-bar-chart"></i> -->
                                <span class="hidden-tablet"> 角色管理</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <!-- <i class="icon-bar-chart"></i> -->
                                <span class="hidden-tablet"> 菜单管理</span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="javascript:;">
                                <!-- <i class="icon-bar-chart"></i> -->
                                <span class="hidden-tablet"> 格式数据管理</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <!-- <i class="icon-bar-chart"></i> -->
                                <span class="hidden-tablet"> 系统配置</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:;">
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
                        <a href="http://themifycloud.com/demos/templates/janux/index.html">Home</a> 
                        <i class="icon-angle-right"></i>
                    </li>
                    <li>
                        <a href="http://themifycloud.com/demos/templates/janux/table.html#">Tables</a>
                    </li>
                </ul>

                <!-- 数据采集表start -->
                <div class="row-fluid sortable ui-sortable">
                    <div class="box span12 datacollec">
                        <div class="box-header" data-original-title="">
                            <h2>
                                <i class="halflings-icon white user"></i>
                                <span class="break"></span>数据采集
                            </h2>
                        </div>
                        <div class="box-content">
                            <div class="box_xxtab">
	                            <c:forEach items="${sources}" var="source">
	                                <div class="box_xxtabz">${source.cs_name}</div>
								</c:forEach>
                                <div class="box_addxxtabz">+</div>
                            </div>
                            <div class="box_xytab">
                            	<c:forEach items="${sources}" var="source" varStatus="status">
                            		<c:if test="${status.index==0}">
	                                <div class="box_xytabz active">
	                                </c:if>
	                                <c:if test="${status.index!=0}">
	                                <div class="box_xytabz">
	                                </c:if>
	                                    <div class="box_xytabzT">${source.cs_name}配置</div>
	                                    <div class="tableedit">
	                                        <div class="tableeditz tableeditzadd">+新增</div>
	                                        <div class="tableeditz tableeditzedit">/编辑</div>
	                                        <div class="tableeditz tableeditzdel">-删除</div>
	                                    </div>
	                                    <div class="tablebox">
	                                        <table class="biaoge table-bordered">
	                                            <div class="biaotou">
	                                                <tr role="row">
	                                                    <th class="biaotouth">
	                                                        <input type="checkbox" class="quanxuan">全选
	                                                    </th>
	                                                    <th class="biaotouth">字段名</th>
	                                                    <th class="biaotouth">类型</th>
	                                                    <th class="biaotouth">校验规则</th>
	                                                    <th class="biaotouth">是否可枚举</th>
	                                                    <th class="biaotouth">是否必填</th>
	                                                    <th class="biaotouth">字段描述信息</th>
	                                                    <th class="biaotouth">错误信息提示</th>
	                                                    <th class="biaotouth">创建时间</th>
	                                                    <th class="biaotouth">更新时间</th>
	                                                    <th class="biaotouth">创建人</th>
	                                                    <th class="biaotouth">更新人</th>
	                                                </tr>
	                                            </div>
	                                            <div class="biaoxiang">
		                                            <c:forEach items="${source.sourceFileds}" var="sourceFiled">
		                                                <tr role="row" class="trbx">
		                                                    <th class="biaoxiangth"><input type="checkbox" class="xuanze"></th>
		                                                    <th class="biaoxiangth">${sourceFiled.csf_name}</th>
		                                                    <th class="biaoxiangth">${sourceFiled.type}</th>
		                                                    <th class="biaoxiangth">${sourceFiled.check}</th>
		                                                    <c:if test="${sourceFiled.enumerated== false}">
							                                	<th class="biaoxiangth">否</th>
							                  	            </c:if>
		                                                    <c:if test="${sourceFiled.enumerated== true}">
							                                	<th class="biaoxiangth">是</th>
							                  	            </c:if>
		                                                    <c:if test="${sourceFiled.not_null== false}">
							                                	<th class="biaoxiangth">否</th>
							                  	            </c:if>
		                                                    <c:if test="${sourceFiled.not_null== true}">
							                                	<th class="biaoxiangth">是</th>
							                  	            </c:if>
		                                                    <th class="biaoxiangth">${sourceFiled.description}</th>
		                                                    <th class="biaoxiangth">${sourceFiled.error_msg}</th>
		                                                    <th class="biaoxiangth">${sourceFiled.create_datetime}</th>
		                                                    <th class="biaoxiangth">${sourceFiled.update_datetime}</th>
		                                                    <th class="biaoxiangth">${sourceFiled.creator}</th>
		                                                    <th class="biaoxiangth">${sourceFiled.updater}</th>
		                                                </tr>
		                                          	</c:forEach>
	                                            </div>
	                                        </table>
	                                    </div>
	                                </div>
                          	  	</c:forEach>
                             </div>

                            <!-- 新增数据采集源start -->
                            <div class="addboxK">
	                            <!-- form表单提交数据 -->
	         				   	<form action="/wankangyuan/source/insertSource">
	                                <div class="addboxT">
	                                    <div class="addboxTt">新增数据采集源</div>
	                                    <div class="addboxTx"></div>
	                                </div>
	                                <div class="addboxli">
	                                    <div class="addboxlit">采集源名称：</div>
	                                    <input type="text" class="addboxlik"   name="cs_name"/>
	                                </div>
	                                <div class="addboxli">
	                                    <div class="addboxlit">状态（是否显示）：</div>
	                                    <div class="addboxliR">
	                                        <input type="radio"  class="addboxlir" name="is_view"  value="true" checked="checked"/>是
	                                        <input type="radio" class="addboxlir" name="is_view" value="false" />否
	                                    </div>
	                                </div>
	                                <div class="addboxB">
                                    <input type="submit" value="提交" class="addboxBb" />
                                </div>
                           		</form>
                            </div>
                            <!-- 新增数据采集源end -->

                            <!-- 新增metainfo_start -->
                            <div class="addbiaoxK">
	                            <!-- form表单提交数据 -->
	         				   	<form action="/wankangyuan/sourceFiled/insertSourceFiled">
	                                <div class="addbiaoxT">
	                                    <div class="addbiaoxTt">新增采集源字段</div>
	                                    <div class="addbiaoxTx" ></div>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">字段名：</div>
	                                    <input type="text" class="addbiaoxlik" name="csf_name"/>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">类型：</div>
	                                    <select name="type" id="">
	                                        <option value="字符"  checked="checked">字符</option>
	                                        <option value="数值">数值</option>
	                                        <option value="日期">日期</option>
	                                        <option value="图片">图片</option>
	                                        <option value="文件">文件</option>
	                                    </select>
	                                </div>		                                
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">检测规则：</div>
	                                    <input type="text" class="addbiaoxlik" name="check"/>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">是否可枚举：</div>
	                                    <select name="enumerated" id="">
	                                        <option value="true"  checked="checked" >是</option>
	                                        <option value="false">否</option>
	                                    </select>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">是否必填：</div>
	                                    <select name="not_null" id="">
	                                        <option value="true"  checked="checked">是</option>
	                                        <option value="false">否</option>
	                                    </select>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">字段描述信息：</div>
	                                    <input type="text" class="addbiaoxlik" name="description"/>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">错误信息提示：</div>
	                                    <input type="text" class="addbiaoxlik" name="error_msg"/>
	                                </div>
	                                <div class="addbiaoxB">
	                                    <input type="submit" value="提交" class="addbiaoxBb" />
	                                    <input type="button" value="关闭" class="addbiaoxBb2" />
	                                </div>
                           		</form>
                           		
                            </div>
                            <!-- 新增metainfo_end -->

                            <!-- 更新metainfo_start -->
                            <div class="addbiaoxK2">
		                        <!-- form表单提交数据 -->
	         				   	<form action="/wankangyuan/sourceFiled/updateSourceFiled">
	                                <div class="addbiaoxT">
	                                    <div class="addbiaoxTt">更新采集源字段</div>
	                                    <div class="addbiaoxTx"></div>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">字段名：</div>
	                                    <input type="text" class="addbiaoxlik" name="csf_name"/>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">类型：</div>
	                                    <select name="type" id="">
	                                        <option value="字符"  checked="checked">字符</option>
	                                        <option value="数值">数值</option>
	                                        <option value="日期">日期</option>
	                                        <option value="图片">图片</option>
	                                        <option value="文件">文件</option>
	                                    </select>
	                                </div>		                                
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">检测规则：</div>
	                                    <input type="text" class="addbiaoxlik" name="check"/>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">是否可枚举：</div>
	                                    <select name="enumerated" id="">
	                                        <option value="true"  checked="checked" >是</option>
	                                        <option value="false">否</option>
	                                    </select>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">是否必填：</div>
	                                    <select name="not_null" id="">
	                                        <option value="true"  checked="checked">是</option>
	                                        <option value="false">否</option>
	                                    </select>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">字段描述信息：</div>
	                                    <input type="text" class="addbiaoxlik" name="description"/>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">错误信息提示：</div>
	                                    <input type="text" class="addbiaoxlik" name="error_msg"/>
	                                </div>
	                                <div class="addbiaoxB">
	                                    <input type="submit" value="提交" class="addbiaoxBb" />
	                                    <input type="button" value="关闭" class="addbiaoxBb2" />
	                                </div>
                           		</form>
                            </div>
                            <!-- 更新metainfo_end -->

                            <!-- 删除metainfo_start -->
                            <div class="delbiaoxK">
                                <div class="addbiaoxT">
                                    <div class="addbiaoxTt">通知</div>
                                    <div class="addbiaoxTx"></div>
                                </div>
                                <div class="delbiaoxM">确认删除选中的metainfo项吗?（该操作无法恢复，请谨慎操作！）</div>
                                <div class="addbiaoxB">
                                    <input type="button" value="确认" class="addbiaoxBb" />
                                    <input type="button" value="取消" class="addbiaoxBb2" />
                                </div>
                            </div>
                            <!-- 删除metainfo_end -->

                        </div>
                    </div>
                    <!-- 数据采集表end -->


                    <!-- 格式化数据类型配置表start -->
                    <div class="box span12 datatypeconfig">
                        <div class="box-header" data-original-title="">
                            <h2>
                                <i class="halflings-icon white user"></i>
                                <span class="break"></span>格式化数据类型配置
                            </h2>
                        </div>
                        <div class="box-content">
                            <div class="box_xytab">
                                <div class="box_xytabz active">
                                    <div class="tableedit">
                                        <div class="tableeditz tableeditzadd">+新增</div>
                                        <div class="tableeditz tableeditzedit">/编辑</div>
                                        <div class="tableeditz tableeditzdel">-删除</div>
                                    </div>
                                    <div class="tablebox">
                                        <table class="biaoge table-bordered">
                                            <div class="biaotou">
                                                <tr role="row">
                                                    <th class="biaotouth">
                                                        <input type="checkbox" class="quanxuan">全选
                                                    </th>
                                                    <th class="biaotouth">格式化数据类型名</th>
                                                    <th class="biaotouth">创建时间</th>
                                                    <th class="biaotouth">更新时间</th>
                                                    <th class="biaotouth">创建人</th>
                                                    <th class="biaotouth">更新人</th>
                                                    <th class="biaotouth">状态</th>
                                                    <th class="biaotouth">格式化数据类别</th>
                                                    <th class="biaotouth">操作</th>
                                                </tr>
                                            </div>
                                            <div class="biaoxiang">
                                            	<c:forEach items="${formatTypes}" var="formatType">
	                                                <tr role="row" class="trbx">
	                                                    <th class="biaoxiangth"><input type="checkbox" class="xuanze"></th>
	                                                    <th class="biaoxiangth">${formatType.ft_name}</th>
	                                                    <th class="biaoxiangth">${formatType.create_datetime}</th>
	                                                    <th class="biaoxiangth">${formatType.update_datetime}</th>
	                                                    <th class="biaoxiangth">${formatType.creator}</th>
	                                                    <th class="biaoxiangth">${formatType.updater}</th>
	                                                    <c:if test="${formatType.is_view== false}">
							                            	<th class="biaoxiangth">隐藏</th>
							                  	       	</c:if>
							                  	        <c:if test="${formatType.is_view== true}">
							                            	<th class="biaoxiangth">显示</th>
							                  	       	</c:if>
	                                                    <th class="biaoxiangth">${formatType.floder}</th>
	                                                    <th class="biaoxiangth">进入</th>
	                                                </tr>
                                                </c:forEach>
                                            </div>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <!-- 添加格式化数据类型start -->
                            <div class="addbiaoxK">
                          	 	<!-- form表单提交数据 -->
	         				 	<form action="/wankangyuan/formatType/insertFormatType">
	                                <div class="addbiaoxT">
	                                    <div class="addbiaoxTt">添加格式化数据类型</div>
	                                    <div class="addbiaoxTx"></div>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">格式化数据名：</div>
	                                    <input type="text" class="addbiaoxlik" name="ft_name"/>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">状态：</div>
	                                    <select name="is_view" id="">
	                                        <option value="true">显示</option>
	                                        <option value="false">隐藏</option>
	                                    </select>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">格式化数据类别：</div>
	                                    <input type="text" class="addbiaoxlik"name="higher_ft_name" />
	                                </div>
	                                <div class="addbiaoxB">
	                                    <input type="submit" value="提交" class="addbiaoxBb" />
	                                    <input type="button" value="关闭" class="addbiaoxBb2" />
	                                </div>
	                        	</form>  
                            </div>
                            <!-- 添加格式化数据类型end -->

                            <!-- 更新结果类型start -->
                            <div class="addbiaoxK2">
                              <!-- form表单提交数据 -->
	         				 	<form action="/wankangyuan/formatType/insertFormatType">
	                                <div class="addbiaoxT">
	                                    <div class="addbiaoxTt">添加格式化数据类型</div>
	                                    <div class="addbiaoxTx"></div>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">格式化数据名：</div>
	                                    <input type="text" class="addbiaoxlik" name="ft_name"/>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">状态：</div>
	                                    <select name="is_view" id="">
	                                        <option value="true">显示</option>
	                                        <option value="false">隐藏</option>
	                                    </select>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">格式化数据类别：</div>
	                                    <input type="text" class="addbiaoxlik"name="higher_ft_name" />
	                                </div>
	                                <div class="addbiaoxB">
	                                    <input type="submit" value="提交" class="addbiaoxBb" />
	                                    <input type="button" value="关闭" class="addbiaoxBb2" />
	                                </div>
	                        	</form>  
                            </div>
                            <!-- 更新结果类型end -->

                            <!-- 删除格式化数据类型start -->
                            <div class="delbiaoxK">
                                <div class="addbiaoxT">
                                    <div class="addbiaoxTt">通知</div>
                                    <div class="addbiaoxTx"></div>
                                </div>
                                <div class="delbiaoxM">确认删除选中的格式化数据类型吗?（该操作无法恢复，请谨慎操作！）</div>
                                <div class="addbiaoxB">
                                    <input type="button" value="确认" class="addbiaoxBb" />
                                    <input type="button" value="取消" class="addbiaoxBb2" />
                                </div>
                            </div>
                            <!-- 删除格式化数据类型end -->

                        </div>
                    </div>
                    <!-- 格式化数据类型配置表end -->


                </div><!--/row-->

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

    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/jquery-migrate-1.0.0.min.js"></script>

    <script src="js/jquery-ui-1.10.0.custom.min.js"></script>

    <script src="js/jquery.ui.touch-punch.js"></script>

    <script src="js/modernizr.js"></script>

    <script src="js/bootstrap.min.js"></script>

    <script src="js/jquery.cookie.js"></script>

    <script src="js/fullcalendar.min.js"></script>

    <script src="js/jquery.dataTables.min.js"></script>

    <script src="js/excanvas.js"></script>
    <script src="js/jquery.flot.js"></script>
    <script src="js/jquery.flot.pie.js"></script>
    <script src="js/jquery.flot.stack.js"></script>
    <script src="js/jquery.flot.resize.min.js"></script>

    <script src="js/jquery.chosen.min.js"></script>

    <script src="js/jquery.uniform.min.js"></script>

    <script src="js/jquery.cleditor.min.js"></script>

    <script src="js/jquery.noty.js"></script>

    <script src="js/jquery.elfinder.min.js"></script>

    <script src="js/jquery.raty.min.js"></script>

    <script src="js/jquery.iphone.toggle.js"></script>

    <script src="js/jquery.uploadify-3.1.min.js"></script>

    <script src="js/jquery.gritter.min.js"></script>

    <script src="js/jquery.imagesloaded.js"></script>

    <script src="js/jquery.masonry.min.js"></script>

    <script src="js/jquery.knob.modified.js"></script>

    <script src="js/jquery.sparkline.min.js"></script>

    <script src="js/counter.js"></script>

    <script src="js/retina.js"></script>

    <script src="js/custom.js"></script>

    <script type="text/javascript" src="js/datamanage.js"></script>
    <!-- end: JavaScript-->
</body>
</html>