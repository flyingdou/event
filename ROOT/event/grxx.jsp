<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<title>个人信息</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link href="event/css/mui.min.css" rel="stylesheet" />
<style>
body {
	color: #666666
}

.mui-bar {
	background: white;
}

.mui-icon-arrowleft, .mui-title {
	color: #666666;
}

.mui-media-body {
	line-height: 42px;
}

.mui-table-view-cell a {
	color: #666666;
	font-size: 15px
}

.mr15 {
	margin-right: 15px;
	font-size: 13px;
	color: #999999;
}

.mui-table-view:before {
	position: absolute;
	right: 0;
	left: 0;
	height: 1px;
	content: '';
	-webkit-transform: scaleY(.5);
	transform: scaleY(.5);
	background-color: rgba(0, 0, 0, 0);
	top: -1px;
}

.mui-table-view:after {
	position: absolute;
	right: 0;
	left: 0;
	height: 1px;
	content: '';
	-webkit-transform: scaleY(.5);
	transform: scaleY(.5);
	background-color: rgba(0, 0, 0, 0);
	bottom: 1px;
}

.mui-table-view-cell:after {
	position: absolute;
	right: 0;
	bottom: 0;
	left: 0px;
	height: 1px;
	content: '';
	-webkit-transform: scaleY(.5);
	transform: scaleY(.5);
	background-color: #eaeaea;
}
</style>
</head>
<body>
	<div class="mui-content" id="wraper">
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-arrowleft mui-pull-left"></a>
			<h1 class="mui-title">个人信息</h1>
		</header>
		<ul class="mui-table-view" style="margin-top: 54px;">
			<li class="mui-table-view-cell mui-media"><a href="javascript:;">
					<img class="mui-media-object mui-pull-right"
					src="http://placehold.it/40x30" style="border-radius: 50%">
					<div class="mui-media-body">头像</div>
			</a></li>
		</ul>
		<ul class="mui-table-view" style="margin-top: 10px;">
			<li class="mui-table-view-cell"><a class="mui-navigate-right">
					昵称 <span class="mui-pull-right mr15">{{member.nick}}</span>
			</a></li>
			<li class="mui-table-view-cell"><a class="mui-navigate-right">
					手机 <span class="mui-pull-right mr15">{{member.mobilephone}}</span>
			</a></li>
			<li class="mui-table-view-cell"><a class="mui-navigate-right">
					密码 <span class="mui-pull-right mr15">点击修改</span>
			</a></li>
			<li class="mui-table-view-cell"><a class="mui-navigate-right">
					地区 <span class="mui-pull-right mr15">{{member.county + member.city + member.address}}</span>
			</a></li>
		</ul>
		<!-- <ul class="mui-table-view" style="margin-top: 10px;">
			<li class="mui-table-view-cell"><a class=""> 退出登录 </a></li>
		</ul> -->
	</div>
	<script src="event/js/mui.min.js"></script>
	<script src="event/js/vue.min.js"></script>
	<script src="event/js/jquery.min.js"></script>
	<script type="text/javascript">
		mui.init();
		var vue = new Vue({
			el:"#wraper",
			data:{
				member:{}
			},
			created:function(){
				$.get("member/memberInfoAjax.html",{},
						function(res){
							vue.member = res.memberInfo;
				});
			}
		});
	</script>
</body>
</html>