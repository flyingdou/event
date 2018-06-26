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
		<title>详情</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="../css/mui.min.css" rel="stylesheet" />
		<style>
			.mui-bar {
				background: white;
			}
			
			.mui-icon-arrowleft,
			.mui-title {
				color: #666666;
			}
			
			body {
				color: #666666;
				font-size: 15px;
			}
			
			.font12 {
				font-size: 12px;
			}
			
			.mui-media-object {
				border-radius: 50%;
			}
			
			.num {
				font-size: 12px;
				margin: 0 5px;
				color: #999999;
			}
			
			.box {
				display: flex;
				width: 100%;
				height: 200px;
				padding: 11px 15px;
				background: white;
				justify-content: center;
				align-items: center;
				overflow: hidden;
			}
			
			.item {
				overflow: hidden;
				width: 100%;
				height: 100%;
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
				bottom: 0;
				left: 0;
				height: 1px;
				content: '';
				-webkit-transform: scaleY(.5);
				transform: scaleY(.5);
				background-color: rgba(0, 0, 0, 0);
			}
			
			.box1 {
				display: -webkit-flex;
				flex-direction: column;
				width: 100%;
				padding: 0 15px;
				background: white;
			}
			
			.item1 {
				padding-bottom: 11px;
			}
			
			.item2 {
				display: flex;
				justify-content: space-between;
			}
			
			.item3 {
				display: -webkit-flex;
				justify-content: center;
				align-items: center;
				width: 35px;
				height: 35px;
				background: #f2f2f2;
				border-radius: 50%;
				flex-shrink: 0;
				font-size: 13px;
				color: #999999
			}
			
			.item4 {
				height: 35px;
				flex-shrink: 1;
				flex-grow: 1;
				box-sizing: border-box;
				overflow: hidden;
			}
			
			.mui-segmented-control.mui-segmented-control-inverted .mui-control-item.mui-active {
				color: #007aff;
				border-bottom: none;
				background: 0 0;
			}
			
			.scroll-img {
				border-radius: 50%;
				width: 35px;
				height: 35px;
			}
			
			.mui-segmented-control.mui-scroll-wrapper .mui-control-item {
				display: inline-block;
				width: auto;
				padding: 0 8px;
				border: 0;
			}
			
			.cg {
				color: #999999;
			}
			
			.cg1 {
				color: #666666;
			}
			
			.footer {
				width: 100%;
				height: 55px;
				position: absolute;
				bottom: 0;
				background: white;
				display: flex;
				padding: 5px 15px 10px 15px;
				justify-content: space-between;
			}
			
			.footer input[type="submit"] {
				background: #FBBF5F;
				margin-left: 15px;
				border: none
			}
			
			.pen {
				width: 30px;
				height: 30px;
				position: absolute;
				top: 10px;
				left: 20px;
				background: url(../images/笔.png)no-repeat scroll center center/25px auto;
			}
			
			input[type="text"] {
				text-indent: 25px;
			}

			.mui-table-view-cell:after {
				position: absolute;
				right: 0;
				bottom: 0;
				left: 15px;
				height: 1px;
				content: '';
				-webkit-transform: scaleY(.5);
				transform: scaleY(.5);
				background-color: rgba(0, 0, 0, 0);
			}
		</style>
	</head>
	<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-arrowleft mui-pull-left"></a>
			<h1 class="mui-title">标题</h1>
		</header>
		<div class="mui-content">
			<ul class="mui-table-view">
				<li class="mui-table-view-cell mui-media">
					<a href="javascript:;">
						<img class="mui-media-object mui-pull-left" src="http://placehold.it/40x30">
						<div class="mui-media-body">
							幸福 <span class="mui-pull-right font12">2018-01-12</span>
							<p class="mui-ellipsis">
								<span class="mui-pull-left icon"><img src="../images/活动 (2).png"width="12"/></span>
								<span class="mui-pull-left icon num">8</span>
								<span class="mui-pull-left icon"><img src="../images/投票 (4).png"width="12"/></span>
								<span class="mui-pull-left icon num">20</span>
								<span class="mui-pull-left icon"><img src="../images/奖杯，胜利.png"width="12"/></span>
								<span class="mui-pull-left icon num">80%</span>
							</p>
						</div>
					</a>
				</li>
			</ul>
			<div class="box">
				<div class="item" style="background: url(../images/cbd.jpg)no-repeat scroll center center /140% auto">
				</div>
			</div>
			<div class="box1">
				<div class="item1">那件幸福的小事</div>
				<div class="item1 item2">
					<div class="item3">
						<img src="../images/点赞.png" alt="" width="25" />
					</div>
					<div class="item4">
						<div class="mui-scroll-wrapper mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
							<div class="mui-scroll">
								<a class="mui-control-item mui-active">
									<img src="../images/60x60.gif" class="scroll-img" />
								</a>
								<a class="mui-control-item">
									<img src="../images/60x60.gif" class="scroll-img" />
								</a>
								<a class="mui-control-item">
									<img src="../images/60x60.gif" class="scroll-img" />
								</a>
								<a class="mui-control-item">
									<img src="../images/60x60.gif" class="scroll-img" />
								</a>
								<a class="mui-control-item">
									<img src="../images/60x60.gif" class="scroll-img" />
								</a>
								<a class="mui-control-item">
									<img src="../images/60x60.gif" class="scroll-img" />
								</a>
							</div>
						</div>
					</div>
					<div class="item3">
						235
					</div>
				</div>
			</div>
			<div style="margin-bottom: 55px;">
				<ul class="mui-table-view">
					<li class="mui-table-view-cell mui-media">
						<a href="javascript:;">
							<img class="mui-media-object mui-pull-left" src="http://placehold.it/40x30">
							<div class="mui-media-body cg">
								幸福 <span class="mui-pull-right font12">2小时前</span>
								<p class="mui-ellipsis cg1">
									不错啊
								</p>
							</div>
						</a>
					</li>
					<li class="mui-table-view-cell mui-media">
						<a href="javascript:;">
							<img class="mui-media-object mui-pull-left" src="http://placehold.it/40x30">
							<div class="mui-media-body cg">
								幸福 <span class="mui-pull-right font12">2小时前</span>
								<p class="mui-ellipsis cg1">
									不错啊
								</p>
							</div>
						</a>
					</li>
					<li class="mui-table-view-cell mui-media">
						<a href="javascript:;">
							<img class="mui-media-object mui-pull-left" src="http://placehold.it/40x30">
							<div class="mui-media-body cg">
								幸福 <span class="mui-pull-right font12">2小时前</span>
								<p class="mui-ellipsis cg1">
									不错啊
								</p>
							</div>
						</a>
					</li>
				</ul>
			</div>
			<div class="footer">
				<input type="text" name="" id="text1" value="" />
				<input type="submit" value="发送" />
				<div class="pen">
				</div>
			</div>
		</div>
		<script src="../js/mui.min.js"></script>
		<script type="text/javascript">
			mui.init()
		</script>
	</body>
</html>