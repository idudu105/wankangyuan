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
<link rel="stylesheet" type="text/css" href="/wankangyuan/jsp/project/css/project1.css" />
<script type="text/javascript" src="/wankangyuan/jsp/project/js/project1.js"></script>
<script type="text/javascript">
    window.onload=function(){
    	pro_appendre2();
    }
</script>
<body>
    <div class="Box">
        <div class="box2">
            <div class="proreK2">
                <div class="inportT">
                    <div class="inportTt">选择格式数据</div>
                </div>
                <div class="proreKC">
                	<!-- 格式数据字段需要根据不同的数据源进行变化 -->
                    <div class="proreT">
                        <div class="proreTli datali">数据名称</div>
                        <div class="proreTli datali">数据1</div>
                        <div class="proreTli datali">数据2</div>
                        <div class="proreTli datali">数据3</div>
                        <div class="proreTli datali">数据4</div>
                        <div class="proreTli datali">创建人</div>
                        <div class="proreTli datali">创建时间</div>
                        <div class="proreTli datacreater">创建人</div>
                    </div>
                    <div class="proreM">
                    	
                    	<!-- begin -->
                        <div class="proreMz">
                            <div class="proreMzc">
                                <div class="proreMli datali">张三</div>
                                <div class="proreMli datali">临床数据</div>
                                <div class="proreMli datali">分子数据</div>
                                <div class="proreMli datali">数据31</div>
                                <div class="proreMli datali">数据41</div>
                                <div class="proreMli datali">创建人1</div>
                                <div class="proreMli datali">创建时间1</div>
                                <div class="proreMli datacreater">创建人1</div>
                            </div>
                            <div class="PJliB active">
                                <div class="PJliB1">
                                    <div class="PJliB1L">
                                        <div class="PJliB1Lt">临床数据</div>
                                    </div>
                                    <div class="PJliBR">
                                        <div class="PJliB2">
                                            <div class="PJliB2L">
                                                <div class="fuxuanK">
                                                    <input type="checkbox" class="input_check" id="check1_1">
                                                    <label for="check1_1"></label>
                                                </div>
                                                <div class="PJliB2Lt">CT</div>
                                            </div>
                                            <div class="PJliBR">
                                                <div class="PJliB2">
                                                    <div class="PJliB2L">
                                                        <div class="fuxuanK">
                                                            <input type="checkbox" class="input_check" id="check1_2">
                                                            <label for="check1_2"></label>
                                                        </div>
                                                        <div class="PJliB2Lt">CT1</div>
                                                    </div>
                                                </div>
                                                <div class="PJliB2">
                                                    <div class="PJliB2L">
                                                        <div class="fuxuanK">
                                                            <input type="checkbox" class="input_check" id="check1_3">
                                                            <label for="check1_3"></label>
                                                        </div>
                                                        <div class="PJliB2Lt">CT2</div>
                                                    </div>
                                                </div>
                                                <div class="PJliB2">
                                                    <div class="PJliB2L">
                                                        <div class="fuxuanK">
                                                            <input type="checkbox" class="input_check" id="check1_4">
                                                            <label for="check1_4"></label>
                                                        </div>
                                                        <div class="PJliB2Lt">CT3</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="PJliB2">
                                            <div class="PJliB2L">
                                                <div class="fuxuanK">
                                                    <input type="checkbox" class="input_check" id="check1_5">
                                                    <label for="check1_5"></label>
                                                </div>
                                                <div class="PJliB2Lt">XG</div>
                                            </div>
                                            <div class="PJliBR">
                                                <div class="PJliB2">
                                                    <div class="PJliB2L">
                                                        <div class="fuxuanK">
                                                            <input type="checkbox" class="input_check" id="check1_6">
                                                            <label for="check1_6"></label>
                                                        </div>
                                                        <div class="PJliB2Lt">XG1</div>
                                                    </div>
                                                </div>
                                                <div class="PJliB2">
                                                    <div class="PJliB2L">
                                                        <div class="fuxuanK">
                                                            <input type="checkbox" class="input_check" id="check1_7">
                                                            <label for="check1_7"></label>
                                                        </div>
                                                        <div class="PJliB2Lt">XG2</div>
                                                    </div>
                                                </div>
                                                <div class="PJliB2">
                                                    <div class="PJliB2L">
                                                        <div class="fuxuanK">
                                                            <input type="checkbox" class="input_check" id="check1_8">
                                                            <label for="check1_8"></label>
                                                        </div>
                                                        <div class="PJliB2Lt">XG3</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
						<!-- end -->
						
                    </div>
                </div>
                <div class="proreB">
               		<input type="button" class="proreb proreb1" value="提交" />
                </div>
            </div>
        </div>
    </div>
</body>
</html>