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

                
                <div class="row-fluid sortable ui-sortable">
                	<!-- 数据采集表start -->
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
	                                <div class="box_xxtabz" id="${source.cs_id }">${source.cs_name}</div>
								</c:forEach>
								
                                <div class="box_addxxtabz">+</div>
                            </div>
                            
                            <div class="box_xytab">
                            	
                                <div class="box_xytabz active">
                                    <div class="box_xytabzK">
                                        <div class="box_xytabzT" id="cs_name">配置</div>
                                        <div class="tableedit">
                                            <div class="tableeditz tableeditzadd">+新增</div>
                                            <div class="tableeditz tableeditzedit">/编辑</div>
                                            <div class="tableeditz tableeditzdel">-删除</div>
                                        </div>
                                        <div class="tablebox">
                                            <table class="biaoge table-bordered" id="sourceFieldTable"></table>
                                        </div>
	                                </div>
	                                <div class=box_xytabzK2>
                                        <div class="box_xytabzT" >格式化数据类型配置</div>
                                        <div class="tableedit">
	                                        <div class="tableeditz tableeditzadd">+新增</div>
	                                        <div class="tableeditz tableeditzedit">/编辑</div>
	                                        <div class="tableeditz tableeditzdel">-删除</div>
                                    	</div>
                                        <div class="tablebox">
                                        	<table class="biaoge table-bordered" id="formatTypeTable"></table>
                                    	</div>
	                                </div>
                                </div> 
                                  
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
                  		    	<form name="insertSourceFieldForm" >
	         				   		<input name="cs_id" style="display:none;"/>
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
	                                        <option value="字符" checked="checked">字符</option>
	                                        <option value="数值">数值</option>
	                                        <option value="日期">日期</option>
	                                        <option value="图片">图片</option>
	                                        <option value="文件">文件</option>
	                                    </select>
	                                </div>		                                
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">检测规则：</div>
	                                    <input type="text" class="addbiaoxlik" name="check_rule"/>
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
	                                    <input type="button" value="提交" class="addbiaoxBb" id="insertSourceFieldSubmit"/>
	                                    <input type="button" value="关闭" class="addbiaoxBb2" />
	                                </div>
                           		</form>
                           		
                            </div>
                            <!-- 新增metainfo_end -->

                            <!-- 更新metainfo_start -->
                            <div class="addbiaoxK2">
                            	<form name="updateSourceFieldForm" >
                            		<input name="edit_csf_id" id="edit_csf_id" style="display:none;"/>
	                                <div class="addbiaoxT">
	                                    <div class="addbiaoxTt">更新采集源字段</div>
	                                    <div class="addbiaoxTx"></div>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">字段名：</div>
	                                    <input type="text" class="addbiaoxlik" name="edit_csf_name" id="edit_csf_name"/>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">类型：</div>
	                                    <select name="edit_type" id="edit_type">
	                                        <option value="字符"  checked="checked">字符</option>
	                                        <option value="数值">数值</option>
	                                        <option value="日期">日期</option>
	                                        <option value="图片">图片</option>
	                                        <option value="文件">文件</option>
	                                    </select>
	                                </div>		                                
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">检测规则：</div>
	                                    <input type="text" class="addbiaoxlik" name="edit_check_rule" id="edit_check_rule"/>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">是否可枚举：</div>
	                                    <select name="edit_enumerated" id="edit_enumerated">
	                                        <option value="true"  checked="checked" >是</option>
	                                        <option value="false">否</option>
	                                    </select>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">是否必填：</div>
	                                    <select name="edit_not_null" id="edit_not_null">
	                                        <option value="true"  checked="checked">是</option>
	                                        <option value="false">否</option>
	                                    </select>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">字段描述信息：</div>
	                                    <input type="text" class="addbiaoxlik" name="edit_description" id="edit_description"/>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">错误信息提示：</div>
	                                    <input type="text" class="addbiaoxlik" name="edit_error_msg" id="edit_error_msg"/>
	                                </div>
	                                <div class="addbiaoxB">
	                                    <input type="button" value="提交" class="addbiaoxBb" id="updateSourceFieldSubmit"/>
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
                                    <input type="button" value="确认" class="addbiaoxBb" id="deleteSourceFieldSubmit"/>
                                    <input type="button" value="取消" class="addbiaoxBb2" />
                                </div>
                            </div>
                            <!-- 删除metainfo_end -->
                            
                            <!-- 添加格式化数据类型start -->
                            <div class="addbiaoxK_2">
                            	<form name="insertFormatTypeForm">
	                            	<input name="format_add_cs_id" id="format_add_cs_id" style="display:none;"/>
	                                <div class="addbiaoxT">
	                                    <div class="addbiaoxTt">添加格式化数据类型</div>
	                                    <div class="addbiaoxTx"></div>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">格式化数据名：</div>
	                                    <input type="text" class="addbiaoxlik" name="format_add_ft_name" id="format_add_ft_name"/>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">状态：</div>
	                                    <select name="format_add_is_view" id="format_add_is_view">
	                                        <option value="true">显示</option>
	                                        <option value="false">隐藏</option>
	                                    </select>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">格式化数据类别：</div>
	                                    <input type="text" class="addbiaoxlik" name="format_add_floder" id="format_add_floder"/>
	                                </div>
	                                <div class="addbiaoxB">
	                                    <input type="button" value="提交" class="addbiaoxBb" id="insertFormatTypeSubmit"/>
	                                    <input type="button" value="关闭" class="addbiaoxBb2" />
	                                </div>
                                </form>
                            </div>
                            <!-- 添加格式化数据类型end -->



                            <!-- 更新结果类型start -->
                            <div class="addbiaoxK2_2">
                              <!-- form表单提交数据 -->
	         				 	<form name="updateFormatTypeForm">
	         				 		<input type="text" id="edit_ft_id" style="display:none;"/>
	                                <div class="addbiaoxT">
	                                    <div class="addbiaoxTt">添加格式化数据类型</div>
	                                    <div class="addbiaoxTx"></div>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">格式化数据名：</div>
	                                    <input type="text" class="addbiaoxlik" name="edit_ft_name" id="edit_ft_name"/>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">状态：</div>
	                                    <select name="edit_is_view" id="edit_is_view">
	                                        <option value="true">显示</option>
	                                        <option value="false">隐藏</option>
	                                    </select>
	                                </div>
	                                <div class="addbiaoxli">
	                                    <div class="addbiaoxlit">格式化数据类别：</div>
	                                    <input type="text" class="addbiaoxlik" name="edit_floder" id="edit_floder"/>
	                                </div>
	                                <div class="addbiaoxB">
	                                    <input type="button" value="提交" class="addbiaoxBb" id="updateFormatTypeFormSubmit"/>
	                                    <input type="button" value="关闭" class="addbiaoxBb2" />
	                                </div>
	                        	</form>  
                            </div>
                            <!-- 更新结果类型end -->

                            <!-- 删除格式化数据类型start -->
                            <div class="delbiaoxK_2">
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
                            
                            <!-- 配置结果类型框start -->
                            <div class="endconfigK" id="endConfig">
                                <div class="endconfigT">
                                    <div class="endconfigTt">配置结果类型</div>
                                    <input id="ft_id" style="display:none;"/>
                                    <div class="endconfigTx" onclick="exitEnter()"></div>
                                </div>
                                <div class="endconfigM">
                                    
                                    <div class="endconfigz2">
                                        <div class="endconfigzB">
                                            <div class="endconfigzb encozadd">+新增</div>
                                            <div class="endconfigzb encozedit">/修改</div>
                                            <div class="endconfigzb encozdel">-删除</div>
                                        </div>
                                        <div class="tablebox">
                                            <table class="biaoge table-bordered">
                                                <div class="biaotou">
                                                    <tr role="row">
                                                        <th class="biaotouth">
                                                            <input type="checkbox" class="quanxuan">全选
                                                        </th>
                                                        <th class="biaotouth">metainfo</th>
                                                        <th class="biaotouth">字段名</th>
                                                        <th class="biaotouth">类型</th>
                                                        <th class="biaotouth">校验规则</th>
                                                        <th class="biaotouth">是否可枚举</th>
                                                        <th class="biaotouth">是否必填</th>
                                                        <th class="biaotouth">是否显示</th>
                                                        <th class="biaotouth">字段描述信息</th>
                                                        <th class="biaotouth">错误提示信息</th>
                                                        <th class="biaotouth">创建时间</th>
                                                        <th class="biaotouth">更新时间</th>
                                                        <th class="biaotouth">创建人</th>
                                                        <th class="biaotouth">更新人</th>
                                                    </tr>
                                                </div>
                                                <div class="biaoxiang">
                                                    <tr role="row" class="trbx">
                                                        <th class="biaoxiangth"><input type="checkbox" class="xuanze"></th>
                                                        <th class="biaoxiangth">Column1</th>
                                                    </tr>
                                                    <tr role="row" class="trbx">
                                                        <th class="biaoxiangth"><input type="checkbox" class="xuanze"></th>
                                                        <th class="biaoxiangth">Column1</th>
                                                    </tr>
                                                </div>
                                            </table>
                                        </div>


                                        <div class="enco2aK">
                                            <div class="endconfigT">
                                                <div class="endconfigTt">新增</div>
                                                <div class="endconfigTx"></div>
                                            </div>
                                            <div class="encoM">
                                                <div class="encoMz">
                                                    <div class="encoMzt">metainfo:</div>                          
                                                    <select class="encoMzp" id="add_ff_is_meta">
                                                    	<option value="true">是</option>
                                                    	<option value="false">否</option>
                                                    </select>
                                                </div>
                                                <div class="encoMz">
                                                    <div class="encoMzt" >字段名:</div>                          
                                                    <input type="text" class="encoMzp" id="add_ff_ff_name"/>
                                                </div>
                                                <div class="encoMz">
                                                    <div class="encoMzt" >类型:</div>                          
                                                    <input type="text" class="encoMzp" id="add_ff_type" />
                                                </div>
                                                <div class="encoMz">
                                                    <div class="encoMzt" >校验规则:</div>                          
                                                    <input type="text" class="encoMzp" id="add_ff_check_rule"/>
                                                </div>
                                                <div class="encoMz">
                                                    <div class="encoMzt">可枚举:</div>                          
                                                    <select class="encoMzp"  id="add_ff_enumerated">
                                                    	<option value="true">是</option>
                                                    	<option value="false">否</option>
                                                    </select>
                                                </div>
                                                <div class="encoMz">
                                                    <div class="encoMzt" >必填:</div>                          
                                                    <select class="encoMzp" id="add_ff_not_null">
                                                    	<option value="true">是</option>
                                                    	<option value="false">否</option>
                                                    </select>
                                                </div>
                                                <div class="encoMz">
                                                    <div class="encoMzt" >显示:</div>                          
                                                    <select class="encoMzp" id="add_ff_is_view">
                                                    	<option value="true">是</option>
                                                    	<option value="false">否</option>
                                                    </select>
                                                </div>
                                                <div class="encoMz">
                                                    <div class="encoMzt" >字段描述:</div>                          
                                                    <input type="text" class="encoMzp" id="add_ff_description"/>
                                                </div>
                                                <div class="encoMz">
                                                    <div class="encoMzt" >错误提示:</div>                          
                                                    <input type="text" class="encoMzp" id="add_ff_error_msg" />
                                                </div>
                                                
                                            </div>
                                            <div class="encoB">
                                                <input type="button" class="encob" value="提交" id="addFormatFieldSubmit"/>
                                            </div>
                                        </div>
                                        
                                        
										<!-- 更新格式类型结果字段悬浮窗 -->
                                        <div class="enco2eK">
                                            <div class="endconfigT">
                                                <div class="endconfigTt">更新data</div>
                                                <div class="endconfigTx"></div>
                                            </div>
                                            <div class="encoM">
                                                <div class="encoMz">
                                                    <div class="encoMzt">格式字段名：</div>
                                                    <input type="text" class="encoMzp" />
                                                </div>
                                            </div>
                                            <div class="encoB">
                                                <input type="button" class="encob" value="提交" />
                                            </div>
                                        </div>
                                        <div class="enco2dK">
                                            <div class="endconfigT">
                                                <div class="endconfigTt">删除data</div>
                                                <div class="endconfigTx"></div>
                                            </div>
                                            <div class="encodM">确认删除选中的data项吗?（该操作无法恢复，请谨慎操作！）</div>
                                            <div class="encoB">
                                                <input type="button" class="encob" value="确认" />
                                                <input type="button" class="encob2" value="关闭" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 配置结果类型框end -->
                            

                        </div>
                    </div>
                    <!-- 数据采集表end -->

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
	       	<span style="text-align:left;float:left">© 2013 
		       	<a href="http://themifycloud.com/downloads/janux-free-responsive-admin-dashboard-template/" alt="Bootstrap_Metro_Dashboard">
		       		JANUX Responsive Dashboard
		       	</a>
	       	</span>
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
    <!-- end: JavaScript -->
    
    <script type="text/javascript">
    	
	    //获取某个采集源的基本信息配置以及格式数据类型配置
	    $(".box_xxtabz").click(function(){
	    	
	        $("input[name='cs_id']").val(this.id);
	        $("input[name='format_add_cs_id']").val(this.id);
	        
	        var cs_id = this.id;
	       	var sourceFieldTable = $("#sourceFieldTable");
	       	var formatTypeTable = $("#formatTypeTable");
	       	
	       	$.ajax({
	       		url:"/wankangyuan/source/getSourceAll",
	       		type:"post",
	       		data:{
	       			cs_id:cs_id
	       		},
	       		dataType:"json",
	       		success : function(data){
	       			if(data.result == true){
	       				//设置数据源的名称
	       				$("#cs_name").text(data.source.cs_name+'-配置');
	       				
	       				//获取基本字段并展示
	       				var sourceFields = data.source.sourceFields;
	       				sourceFieldTable.empty();
	       				
	       				var str = '';
	       				str+='<div class="biaotou">';
	       				str+='<tr role="row">';
	       				str+='<th class="biaotouth">';
	       				str+='<input type="checkbox" class="quanxuan">全选';
	       				str+='</th>';
	       				str+='<th class="biaotouth">字段名</th>';
	       				str+='<th class="biaotouth">类型</th>';
	       				str+='<th class="biaotouth">校验规则</th>';
	       				str+='<th class="biaotouth">是否可枚举</th>';
	       				str+='<th class="biaotouth">是否必填</th>';
	       				str+='<th class="biaotouth">字段描述信息</th>';
	       				str+='<th class="biaotouth">错误信息提示</th>';
	       				str+='<th class="biaotouth">创建时间</th>';
	       				str+='<th class="biaotouth">更新时间</th>';
	       				str+='<th class="biaotouth">创建人</th>';
	       				str+='<th class="biaotouth">更新人</th>';
	       				str+='</tr>';
	       				str+='</div>';
	       				str+='<div class="biaoxiang">';
	       				for(var i in sourceFields){
	       					str+='<tr role="row" class="trbx" >';
	       					str+='<th class="biaoxiangth"><input type="checkbox" class="xuanze source_field_checkbox" id="'+sourceFields[i].csf_id+'"></th>';
	       					str+='<th class="biaoxiangth" id="csf_name'+sourceFields[i].csf_id+'">'+sourceFields[i].csf_name+'</th>';
							str+='<th class="biaoxiangth" id="type'+sourceFields[i].csf_id+'">'+sourceFields[i].type+'</th>';
							str+='<th class="biaoxiangth" id="check_rule'+sourceFields[i].csf_id+'">'+sourceFields[i].check_rule+'</th>';
							if(sourceFields[i].enumerated == false){
								str+='<th class="biaoxiangth" id="enumerated'+sourceFields[i].csf_id+'">否</th>';
							}else{
								str+='<th class="biaoxiangth" id="enumerated'+sourceFields[i].csf_id+'">是</th>';
							}
							
							if(sourceFields[i].enumerated == false){
								str+='<th class="biaoxiangth" id="enumerated'+sourceFields[i].not_null+'">否</th>';
							}else{
								str+='<th class="biaoxiangth" id="enumerated'+sourceFields[i].not_null+'">是</th>';
							}
							str+='<th class="biaoxiangth" id="description'+sourceFields[i].csf_id+'">'+sourceFields[i].description+'</th>';
							
							str+='<th class="biaoxiangth" id="error_msg'+sourceFields[i].csf_id+'">'+sourceFields[i].error_msg+'</th>';
							str+='<th class="biaoxiangth">'+sourceFields[i].create_datetime+'</th>';
							str+='<th class="biaoxiangth">'+sourceFields[i].update_datetime+'</th>';
							str+='<th class="biaoxiangth">'+sourceFields[i].creator+'</th>';
							str+='<th class="biaoxiangth">'+sourceFields[i].updater+'</th>';
	
	       					str+='</tr>';
	       				}
	       				str+='</div>';
	       				sourceFieldTable.html(str);
	       				
	       				
	       				//获取格式字段并展示
	       				var formatTypes = data.source.formatTypes;
	       				formatTypeTable.empty();
	       				
	       				var strFormatTypes = '';
	       				strFormatTypes+='<div class="biaotou">';
	       				strFormatTypes+='<tr role="row">';
	       				strFormatTypes+='<th class="biaotouth">';
	       				strFormatTypes+='<input type="checkbox" class="quanxuan">全选';
	       				strFormatTypes+='</th>';
	       				strFormatTypes+='<th class="biaotouth">格式化数据类型名</th>';
	       				strFormatTypes+='<th class="biaotouth">创建时间</th>';
	       				strFormatTypes+='<th class="biaotouth">更新时间</th>';
	       				strFormatTypes+='<th class="biaotouth">创建人</th>';
	       				strFormatTypes+='<th class="biaotouth">更新人</th>';
	       				strFormatTypes+='<th class="biaotouth">状态</th>';
	       				strFormatTypes+='<th class="biaotouth">格式化数据类别</th>';
	       				strFormatTypes+='<th class="biaotouth">操作</th>';
	       				strFormatTypes+='</tr>';
	       				strFormatTypes+='</div>';
	       				strFormatTypes+='<div class="biaoxiang">';
	       				for(var i in formatTypes){
	       					strFormatTypes+='<tr role="row" class="trbx" >';
	       					strFormatTypes+='<th class="biaoxiangth"><input type="checkbox" class="xuanze format_type_checkbox" id="'+formatTypes[i].ft_id+'"></th>';
	       					strFormatTypes+='<th class="biaoxiangth" id="ft_name'+formatTypes[i].ft_id+'">'+formatTypes[i].ft_name+'</th>';
							strFormatTypes+='<th class="biaoxiangth" id="create_datetime'+formatTypes[i].ft_id+'">'+formatTypes[i].create_datetime+'</th>';
							strFormatTypes+='<th class="biaoxiangth" id="check_rule'+formatTypes[i].ft_id+'">'+formatTypes[i].update_datetime+'</th>';
							strFormatTypes+='<th class="biaoxiangth" id="creator'+formatTypes[i].ft_id+'">'+formatTypes[i].creator+'</th>';
							strFormatTypes+='<th class="biaoxiangth" id="updater'+formatTypes[i].ft_id+'">'+formatTypes[i].updater+'</th>';
							if(formatTypes[i].is_view == false){
								strFormatTypes+='<th class="biaoxiangth" id="is_view'+formatTypes[i].ft_id+'">隐藏</th>';
							}else{
								strFormatTypes+='<th class="biaoxiangth" id="is_view'+formatTypes[i].ft_id+'">显示</th>';
							}
							strFormatTypes+='<th class="biaoxiangth" id="floder'+formatTypes[i].ft_id+'">'+formatTypes[i].floder+'</th>';
							strFormatTypes+='<th class="biaoxiangth biaoxiangthin" onclick="enter('+formatTypes[i].ft_id+')">进入</th>';
	
	       					strFormatTypes+='</tr>';
	       				}
	       				strFormatTypes+='</div>';
	       				formatTypeTable.html(strFormatTypes);

	       			}else{
	       				alert(data.message);
	       			}
	       		},
	       		error : function(){
	       			alert("联网失败");
	       		}
	       		
	       	});
	        
	    });
	    
	    //新增数据源基本信息字段提交按钮，OK
	    $("#insertSourceFieldSubmit").click(function (){
	    	$.ajax({
				url:"/wankangyuan/sourceFiled/insertSourceFiled",
				type:"post",
				dataType:"json",
				data:{
					cs_id:insertSourceFieldForm.cs_id.value,
					csf_name:insertSourceFieldForm.csf_name.value,
					type:insertSourceFieldForm.type.value,
					check_rule:insertSourceFieldForm.check_rule.value,
					enumerated:insertSourceFieldForm.enumerated.value,
					not_null:insertSourceFieldForm.not_null.value,
					description:insertSourceFieldForm.description.value,
					error_msg:insertSourceFieldForm.error_msg.value
				},
				success : function(data){
					if(data.result == true){
						window.location.href=data.url;
					}else{
						alert(data.message);
					}
				},
				error : function(){
					alert("联网失败");
				}
			});		
	    });
	    
	    //更新数据源基本信息字段提交按钮，OK
	    $("#updateSourceFieldSubmit").click(function (){
	
	    	$.ajax({
				url:"/wankangyuan/sourceField/updateSourceField",
				type:"post",
				dataType:"json",
				data:{
					csf_id:updateSourceFieldForm.edit_csf_id.value,
					csf_name:updateSourceFieldForm.edit_csf_name.value,
					type:updateSourceFieldForm.edit_type.value,
					check_rule:updateSourceFieldForm.edit_check_rule.value,
					enumerated:updateSourceFieldForm.edit_enumerated.value,
					not_null:updateSourceFieldForm.edit_not_null.value,
					description:updateSourceFieldForm.edit_description.value,
					error_msg:updateSourceFieldForm.edit_error_msg.value
				},
				success : function(data){
					if(data.result == true){
						alert("数据源字段更新成功！");
						window.location.href="/wankangyuan/admin/formatdata";
					}else{
						alert(data.message);
					}
				},
				error : function(){
					alert("联网失败");
				}
			});
	    	
	    });
	    
	    //删除采集源基本信息字段，NOT OK
	    $("#deleteSourceFieldSubmit").click(function (){
	    	
	    	//首先是获取所有选中的基本信息字段
	    	var ids = [];
	    	var source_field_checkbox=document.querySelectorAll('.source_field_checkbox');
	    	for(var i = 0 ;  i < source_field_checkbox.length ; i++){
	    		if(source_field_checkbox[i].checked == true){
	    			ids.push(source_field_checkbox[i].id);
	    		}
	    	}
	    	//进行ajax请求
	    	$.ajax({
	    		url:"/wankangyuan/*****/****",
	    		type:"post",
	    		data:{
	    			ids:ids.join(",")
	    		},
	    		dataType:"json",
	    		success : function(data){
					if(data.result == true){
						//进行删除成功后的跳页处理
						alert("删除成功！");
						window.location.href="/wankangyuan/admin/formatdata";

					}else{
						alert("部分行删除失败!");
					}
	    		},
	    		error : function(){
	    			alert("联网失败");
	    		}	
	    	});
	    });
	    

	    //新增数据源格式数据字段提交按钮，
	    $("#insertFormatTypeSubmit").click(function (){
	    	$.ajax({
				url:"/wankangyuan/formatType/insertFormatType",
				type:"post",
				dataType:"json",
				data:{
					cs_id:insertFormatTypeForm.format_add_cs_id.value,
					ft_name:insertFormatTypeForm.format_add_ft_name.value,
					is_view:insertFormatTypeForm.format_add_is_view.value,
					floder:insertFormatTypeForm.format_add_floder.value,
				},
				success : function(data){
					if(data.result == true){
						window.location.href=data.url;
					}else{
						alert(data.message);
					}
				},
				error : function(){
					alert("联网失败");
				}
			});		
	    });

	    //编辑数据源格式数据字段提交按钮，
	    $("#updateFormatTypeFormSubmit").click(function (){
	    	
	    	$.ajax({
				url:"/wankangyuan/formatType/updateFormatType",
				type:"post",
				dataType:"json",
				data:{
					ft_id:updateFormatTypeForm.edit_ft_id.value,
					ft_name:updateFormatTypeForm.edit_ft_name.value,
					is_view:updateFormatTypeForm.edit_is_view.value,
					floder:updateFormatTypeForm.edit_floder.value,
				},
				success:function(data){
					if(data.result == true){
						alert("格式数据类型更新成功！");
						window.location.href="/wankangyuan/admin/formatdata";
					}else{
						alert(data.message);
					}
				},
				error:function(){
					alert("联网失败");
				}
			});
	    });
	    
	    function enter(id){
	    	var oendconfigK=document.querySelectorAll('.endconfigK')[0];//配置结果类型框
	    	oendconfigK.style.display="block";
	    	$("#ft_id").val(id);//设置进入的格式类型ID
	    	
	    	
	    	//此处需要去数据库中查询当前格式类型下面的格式字段列表并对弹出的格式字段列表进行更新展示。
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    }
	    
	    function exitEnter(){
	    	document.querySelectorAll('.endconfigK')[0].style.display="none";
	    }
	    
	    
	    $("#addFormatFieldSubmit").click(function (){
	    	
	    	//提交格式数据字段
	    	var ft_id = $("#ft_id").val();
	    	var is_meta = $("#add_ff_is_meta").val();
	    	var ff_name = $("#add_ff_ff_name").val();
	    	var type = $("#add_ff_type").val();
	    	var check_rule = $("#add_ff_check_rule").val();
	    	var enumerated = $("#add_ff_enumerated").val();
	    	var not_null = $("#add_ff_not_null").val();
	    	var is_view = $("#add_ff_is_view").val();
	    	var description = $("#add_ff_description").val();
	    	var error_msg = $("#add_ff_error_msg").val();
	    	
	    	$.ajax({
	    		url:"/wankangyuan/formatField/insertFormatField",
	    		type:"post",
	    		data:{
	    			ft_id:ft_id,
	    			is_meta:is_meta,
	    			ff_name:ff_name,
	    			type:type,
	    			check_rule:check_rule,
	    			enumerated:enumerated,
	    			not_null:not_null,
	    			is_view:is_view,
	    			description:description,
	    			error_msg:error_msg
	    		},
	    		dataType:"json",
	    		success : function(data){
	    			if(data.result == true){
	    				alert("增加格式字段成功");
	    			}else{
	    				alert(data.message);
	    			}
	    		},
	    		error : function(){
	    			alert("联网失败");
	    		}
	    		
	    	});
	    	

	    	
	    });
	    
		
		//提交新建的结果
		/*
		function insertSourceFiled1(){
			//进行ajax请求
			$.ajax({
				url:"/wankangyuan/formatType/insertFormatType",
				type:"post",
				dataType:"json",
				data:{
					cs_id:insertFormatTypeForm.cs_id.value,
					ft_name:insertFormatTypeForm.ft_name.value,
					is_view:insertFormatTypeForm.is_view.value,
					floder:insertFormatTypeForm.floder.value
				},
				success : function(data){
					if(data.result == true){
						window.location.href=data.url;
					}else{
						alert(data.message);
					}
				},
				error : function(){
					alert("联网失败");
				}
			});			
		}*/
    	
    </script>
    
</body>

</html>