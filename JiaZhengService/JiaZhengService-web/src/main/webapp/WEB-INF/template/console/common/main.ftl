<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${message("console.main.title")} - 家政服务管理平台</title>
    <meta name="keywords" content="家政服务管理平台">
    <meta name="description" content="家政服务管理平台">
    [#include "/console/include/resources.ftl" /]
</head>
<body class="fixed-navigation">
	<div id="wrapper">
	
	  <!-- start  导航 -->
       [#include "/console/include/nav.ftl" /]
       <!-- end 导航-->
	
	   <div id="page-wrapper" class="gray-bg dashbard-1">
		   <!-- start 头部 -->
	       [#include "/console/include/header.ftl" /]
	       <!-- end 头部-->
	       
		       <!-- start 头部面包屑区域 -->
		       <div class="row wrapper border-bottom white-bg page-heading">
	                <div class="col-lg-10">
	                    <h2>${message("console.index.title")} </h2>
	                </div>
	                <div class="col-lg-2">
	
	                </div>
	            </div>
		       <!-- end 头部面包屑区域 -->
		       
		        <div class="wrapper wrapper-content">
		        <!--start横条幅-->
		        <div class="row">
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <span class="label label-success pull-right" style="background-color: #57C9FD;"><i class="fa fa-university"></i></span>
                                <h5>校园名称</h5>
                            </div>
                            <div class="ibox-content" style="clear: none;">
                                <div style="padding-bottom:10px;">0</div>
                                <div class="stat-percent font-bold text-success" style="color:#57C9FD;">School <i class="fa fa-university"></i>
                                </div>
                                <small>校园</small>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <span class="label label-info pull-right" style="background-color: #57C9FD;"><i class="fa fa-user"></i></span>
                                <h5>校长</h5>
                            </div>
                            <div class="ibox-content" style="clear: none;">
                             	<div style="padding-bottom:10px;">0</div>
                                <div class="stat-percent font-bold text-info" style="color:#57C9FD;">Master<i class="fa fa-user"></i>
                                </div>
                                <small>校长</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <span class="label label-primary pull-right" style="background-color: #57C9FD;"><i class="fa fa-phone"></i></span>
                                <h5>联系方式</h5>
                            </div>
                            <div class="ibox-content" style="clear: none;">
                             	<div style="padding-bottom:10px;">0</div>
                                <div class="stat-percent font-bold text-navy" style="color:#57C9FD;">Mobile <i class="fa fa-phone"></i>
                                </div>
                                <small>联系方式</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <span class="label label-danger pull-right" style="background-color: #57C9FD;"><i class="fa fa-home"></i></span>
                                <h5>地址</h5>
                            </div>
                            <div class="ibox-content" style="clear: none;">
                                <div style="padding-bottom:10px;">0</div>
                                <div class="stat-percent font-bold text-danger" style="color:#57C9FD;">Address <i class="fa fa-home"></i>
                                </div>
                                <small>地址</small>
                            </div>
                        </div>
                    </div>
                </div>
		        <!--end  横条幅-->
		        
		        
                <!--描述和统计start-->
                <div class="row">
                		<!--描述start-->
                        <div class="col-lg-10">
                            <div class="ibox float-e-margins">
                                <div class="ibox-content" style="overflow-x: hidden;">
									0
                                </div>
                            </div>
                        </div>
                        <!--描述 end -->
                        <div class="col-lg-2">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5><span class="fa fa-list-ol"></span>校园数据统计</h5>
                                </div>
                                <div class="ibox-content">
                                	<div class="row" style="padding-left: 10px;padding-right: 5px">
                                        <label class="stats-label">学生人数</label>
                                        <i class="fa fa-users pull-right"></i><br>
                                        <h4>0/人</h4>
                                    </div>
                                </div>
                                <div class="ibox-content">
	                                <div class="row" style="padding-left: 10px;padding-right: 5px">
                                        <label class="stats-label">老师人数</label>
                                        <i class="fa fa-user-plus pull-right"></i><br>
                                        <h4>0/人</h4>
                                    </div>
                                </div>
                                <div class="ibox-content">
	                                <div class="row" style="padding-left: 10px;padding-right: 5px">
                                        <label class="stats-label">家长人数</label>
                                        <i class="fa fa-hand-o-right pull-right"></i><br>
                                        <h4>0/人</h4>
                                    </div>
                                </div>
                                <div class="ibox-content">
                                	<div class="row" style="padding-left: 10px;padding-right: 5px">
                                        <label class="stats-label">班级数目</label>
                                        <i class="fa fa-tasks pull-right"></i><br>
                                        <h4>0/个班级</h4>
                                    </div>
                                </div>
                                <div class="ibox-content">
                                	<div class="row" style="padding-left: 10px;padding-right: 5px">
                                        <a>共0条新闻</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                <!--描述和统计 end -->

	       [#include "/console/include/footer.ftl" /]
      </div>
    </div>
</body>
</html>