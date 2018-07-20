<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":"+ request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
	<head>
		<base href="<%=basePath%>">
		<title>我的</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="event/css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="event/css/iconfont.css"/>
		<style>
			.mui-bar {
				margin-top: 20px;
				background: rgba(0, 0, 0, 0);
				color: white;
			}
			
			.mui-bar-nav {
				top: 0;
				-webkit-box-shadow: 0 1px 6px #ccc;
				box-shadow: none;
			}
			
			.mui-title {
				color: white
			}
			
			.mui-icon-gear {
				color: white
			}
			
			.bannerImg {
				width: 100%;
				height: 300px;
				box-sizing: border-box;
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
			}
			
			.uesrHeard {
				width: 64px;
				height: 64px;
				border-radius: 50%;
				overflow: hidden;
				margin-top: -20px;
				margin-bottom: 20px;
			}
			
			.userNick {
				font-size: 14px;
				color: white
			}
			
			body {
				background: #f2f2f2;
			}
			
			.my_next {
				margin-bottom: 55px;
				padding: 15px;
			}
			
			.my_next_1 {
				display: -webkit-flex;
				/* Safari */
				display: flex;
				flex-direction: row;
				background: white;
				padding: 15px 0 10px 0;
				margin-bottom: 15px;
				margin-top: -50px;
			}
			
			.my_next_2 {
				flex-grow: 1;
				text-align: center;
			}
			
			.cg1 {
				color: #666666!important;
			}
			
			.cg2 {
				color: #999999;
			}
			
			.font12 {
				font-size: 12px;
			}
			
			.font13 {
				font-size: 13px;
			}
			
			.font14 {
				font-size: 14px;
			}
			
			.font15 {
				font-size: 15px;
			}
			
			.font16 {
				font-size: 16px;
			}
			
			.my_next_2a {
				position: relative;
			}
			
			.my_next_2a:after {
				content: "";
				position: absolute;
				right: 0;
				top: 25%;
				width: 100%;
				height: 50%;
				border-right: 1px solid #eaeaea;
			}
			
			.mt15 {
				margin-top: 15px;
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
			
			.mui-table-view:after {
				position: absolute;
				right: 0;
				bottom: 0;
				left: 0;
				height: 1px;
				content: '';
				-webkit-transform: scaleY(.5);
				transform: scaleY(.5);
				background-color: rgba(0, 0, 0, 0);
			}
			
			.mui-table-view-cell:last-child::after {
				position: absolute;
				right: 0;
				bottom: 0;
				left: 0px;
				height: 1px;
				content: '';
				-webkit-transform: scaleY(.5);
				transform: scaleY(.5);
				z-index: 3333;
				background-color: white;
			}
			/*备注:在GG调试会出现下划线,在手机中不存在*/
			
			.mui-navigate-right:after,
			.mui-push-left:after,
			.mui-push-right:after {
				font-family: Muiicons;
				font-size: inherit;
				line-height: 1;
				position: absolute;
				top: 50%;
				display: inline-block;
				-webkit-transform: translateY(-50%);
				transform: translateY(-50%);
				text-decoration: none;
				color: #999999!important;
				-webkit-font-smoothing: antialiased;
			}
			.act{
				margin-right: 1em;
			}
			.act1{
				margin-right: 14px;
			}
			
			.copyright{
				position: fixed;
				bottom: 0;
				left: 0;
				width: 100%;
				text-align: center;
				font-size: 12px;
				color: #BBB;
			}
		</style>
	</head>
	<body>
		<header class="mui-bar mui-bar-nav">
			<!-- <a class="mui-action-back mui-icon mui-icon-gear mui-pull-right" ></a> -->
			<h1 class="mui-title">我的</h1>
		</header>
		<a href="javascript:void(0)">
			<div class="bannerImg" style="background: url(event/img/yuantiao.jpg)no-repeat scroll center center/auto 120%;">
				<div class="uesrHeard">
					<img src="picture/${json.memberInfo.image}" width="100%" height="100%" />
				</div>
				<div class="userNick">${json.memberInfo.nick}</div>
			</div>
		</a>
		<div class="my_next">
			<div class="my_next_1">
				<div class="my_next_2 my_next_2a">
					<div class="cg1 font16">${json.memberInfo.activeCount == null ? 0 : json.memberInfo.activeCount}</div>
					<div class="cg2 font12">活动</div>
				</div>
				<div class="my_next_2 my_next_2a">
					<div class="cg1 font16">${json.memberInfo.votes == null ? 0 : json.memberInfo.votes}</div>
					<div class="cg2 font12">投票</div>
				</div>
				<div class="my_next_2 ">
					<div class="cg1 font16">${json.memberInfo.balance == null ? 0 : json.memberInfo.balance}</div>
					<div class="cg2 font12">余额</div>
				</div>
			</div>
			<ul class="mui-table-view">
				<li class="mui-table-view-cell">
					<a class="mui-navigate-right font15 cg1 " href="member/findActiveByMember.html">
						<span class="mui-icon iconfont icon-huodong act"></span>我的活动
					</a>
				</li>
			</ul>
			<ul class="mui-table-view mt15">
				<li class="mui-table-view-cell">
					<a class="mui-navigate-right font15 cg1" href="event/wdtp.jsp">
						<span class="mui-icon iconfont icon-toupiao act"></span>我的投票
					</a>
				</li>
				<li class="mui-table-view-cell">
					<a class="mui-navigate-right font15 cg1 " href="event/myWorks.jsp">
						<span class="mui-icon iconfont icon-duihuan act"style="font-size: 18px;"></span>我的作品
					</a>
				</li>
				<li class="mui-table-view-cell">
					<a class="mui-navigate-right font15 cg1" href="event/wdqb.jsp">
						<span class="mui-icon iconfont icon-qianbao act"></span>我的钱包
					</a>
				</li>
				<li class="mui-table-view-cell">
					<a class="mui-navigate-right font15 cg1 " href="event/funcoinExchange.jsp">
						<span class="mui-icon iconfont icon-duihuan act"style="font-size: 18px;"></span>funcoin兑换
					</a>
				</li>
			</ul>
			<!-- <ul class="mui-table-view mt15">
				<li class="mui-table-view-cell">
					<a class="mui-navigate-right font15 cg1" href="../mine/">
						<span class="mui-icon mui-icon-phone act1"style="font-size: 20px;"></span>联系客服
					</a>
				</li>
				<li class="mui-table-view-cell">
					<a class="mui-navigate-right font15 cg1">
						<span class="mui-icon iconfont icon-fenxiang act1"style=""></span>分享
					</a>
				</li>
			</ul> -->
		</div>
		<div class="copyright">
			<div>武汉好韵莱信息技术有限公司  版本所有</div>
			<div>鄂ICP备08004430号-3  版本号：2.12</div>
		</div>
		<script src="event/js/mui.min.js"></script>
		<script type="text/javascript">
			mui.init();
		</script>
	</body>
</html>