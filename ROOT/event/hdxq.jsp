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
		<title>活动详情</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="../css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="../css/iconfont.css" />
		<style>
			.mui-bar {
				margin-top: 20px;
				background: rgba(0, 0, 0, 0);
				color: white;
				position:absolute;
				top:0;
				left: 0;
			}
			.mui-bar-nav {
				top: 0;
				-webkit-box-shadow: 0 1px 6px #ccc;
				box-shadow: none;
			}
			
			.mui-title {
				color: white
			}
			
			.mui-icon-arrowleft {
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
				/*padding: 15px;*/
			}
			
			.my_next_1 {
				display: -webkit-flex;
				/* Safari */
				display: flex;
				margin: 0 15px;
				flex-direction: column;
				justify-content: center;
				background: white;
				padding: 15px 0 10px 0;
				margin-bottom: 15px;
				margin-top: -50px;
				text-align: center;
			}
			
			.box {
				display: -webkit-flex;
			}
			
			.my_next_2 {
				line-height: 31px;
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
			
			.box1,
			.box3 {
				width: 100%;
				padding: 11px 15px;
				display: -webkit-flex;
				background: white;
				flex-direction: column;
			}
			
			
			.pxName {
				text-align: center;
				color: #333333;
				font-size: 15px;
				line-height: 31px;
			}
			
			.hjmd {
				color: #666666;
				font-size: 14px;
			}
			
			.item {
				width: 44px;
				flex-shrink: 0;
				margin: 0 10px;
			}
			
			.item p {
				width: 44px;
				text-align: center;
			}
			
			.box2 {
				padding: 10px;
				display: flex;
				flex-wrap: wrap;
				justify-content: flex-start;
			}
			.box2A {
				padding: 10px;
				display: flex;
				flex-wrap: wrap;
				justify-content: center;
			}
			
			p {
				font-size: 12px;
				color: #999999;
			}
			
			.kk {
				color: #FBBF5F;
				font-size: 12px;
				
				margin: 8px;
			}
			.img3{
				border-radius: 50%;
			}
		</style>
	</head>
	<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-arrowleft mui-pull-left"></a>
			<h1 class="mui-title">活动详情</h1>
		</header>
		<div class="bannerImg" style="background: url(../images/yuantiao.jpg)no-repeat scroll center center/120% 120%;">
			<div class="uesrHeard">
				<img src="../images/shuijiao.jpg" width="100%" height="100%" />
			</div>
			<div class="userNick">内陆飞鱼</div>
		</div>
		<div class="my_next">
			<div class="my_next_1">
				<div>早餐评选</div>
				<div class="box">
					<div class="my_next_2 my_next_2a">
						<div class="cg2 font12">参加：15人</div>
					</div>
					<div class="my_next_2 my_next_2a">
						<div class="cg2 font12">内陆飞鱼</div>
					</div>
					<div class="my_next_2 ">
						<div class="cg2 font12">投票：200人</div>
					</div>
				</div>
			</div>
			<div class="box1">
				<div class="pxName">投票结果</div>
				<div class="hjmd">获奖名单</div>
				<div class="box2">
					<div class="item">
						<img src="../images/shuijiao.jpg" width="44" height="44" alt="" />
						<p>100票</p>
					</div>
					<div class="item">
						<img src="../images/shuijiao.jpg" width="44" height="44" alt="" />
						<p>100票</p>
					</div>
					<div class="item">
						<img src="../images/shuijiao.jpg" width="44" height="44" alt="" />
						<p>100票</p>
					</div>
					<div class="item">
						<img src="../images/shuijiao.jpg" width="44" height="44" alt="" />
						<p>100票</p>
					</div>
					<div class="item">
						<img src="../images/shuijiao.jpg" width="44" height="44" alt="" />
						<p>100票</p>
					</div>
					<div class="item">
						<img src="../images/shuijiao.jpg" width="44" height="44" alt="" />
						<p>100票</p>
					</div>
					<div class="item">
						<img src="../images/shuijiao.jpg" width="44" height="44" alt="" />
						<p>100票</p>
					</div>
					<div class="item">
						<img src="../images/shuijiao.jpg" width="44" height="44" alt="" />
						<p>100票</p>
					</div>
					<div class="item">
						<img src="../images/shuijiao.jpg" width="44" height="44" alt="" />
						<p>100票</p>
					</div>
					<div class="item">
						<img src="../images/shuijiao.jpg" width="44" height="44" alt="" />
						<p>100票</p>
					</div>
				</div>
			</div>
			<div class="box3" style="margin-top: 15px;margin-bottom: 50px;">
				<div class="hjmd">投注优秀者</div>
				<div class="kk">156人赢得了800FC</div>
				<div class="box2A">
					<div class="item">
						<img src="../images/shuijiao.jpg" width="44" height="44" alt=""class="img3" />
						<p>100票</p>
					</div>
					<div class="item">
						<img src="../images/shuijiao.jpg" width="44" height="44" alt=""class="img3" />
						<p>100票</p>
					</div>
					<div class="item">
						<img src="../images/shuijiao.jpg" width="44" height="44" alt=""class="img3" />
						<p>100票</p>
					</div>
					<div class="item">
						<img src="../images/shuijiao.jpg" width="44" height="44" alt=""class="img3" />
						<p>100票</p>
					</div>
				</div>
			</div>
		</div>
		<script src="../js/mui.min.js"></script>
		<script type="text/javascript">
			mui.init();
		</script>
	</body>
</html>