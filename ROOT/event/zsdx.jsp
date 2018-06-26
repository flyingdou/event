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
		<title>赠送对象</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="../css/mui.min.css" rel="stylesheet" />
		<style>
			.mui-search:before {
				font-size: 20px;
				right: auto;
				left: 5px;
				display: block;
				margin-right: 0;
				font-weight: 400;
				position: absolute;
				top: 50%;
				margin-top: -12px;
				;
				content: "\e466";
				color: #999999;
			}
			
			.mui-icon-search:before {
				content: '';
			}
			
			.searchbox {
				position: relative;
				margin: 0px 10px 0px 10px;
			}
			
			input[type='search'] {
				background: rgba(0, 0, 0, 0);
				border: 1px solid #eaeaea;
				color: #666666;
				font-size: 13px;
				margin-bottom: 1px;
			}
			
			.mui-search .mui-placeholder {
				font-size: 14px;
				line-height: 44px;
				position: absolute;
				z-index: 1;
				top: 0;
				right: 0;
				bottom: 0;
				left: 0;
				display: inline-block;
				height: 34px;
				text-align: left;
				text-indent: 2em;
				color: #999;
				border: 0;
				border-radius: 6px;
				background: 0 0;
			}
			
			.mui-bar {
				display: flex;
				display: -webkit-flex;
				justify-content: space-between;
				background: white;
			}
			
			.bgw {
				width: 80%;
				margin: 0 auto;
				align-self: center;
			}
			
			.mui-icon-arrowleft {
				color: #666666;
			}
			
			body {
				background: #f2f2f2;
			}
			
			.mui-table-view-cell.mui-checkbox input[type=checkbox],
			.mui-table-view-cell.mui-radio input[type=radio] {
				top: 22px;
			}
			
			.mui-checkbox input[type=checkbox]:checked:before {
				content: '\e442';
				border-radius: 50%;
				font-size: 14px;
			}
			
			.mui-checkbox input[type=checkbox]:checked:before,
			.mui-radio input[type=radio]:checked:before {
				color: #FBBF5F;
				background: #FBBF5F;
			}
			
			.mui-checkbox input[type=checkbox]:before,
			.mui-radio input[type=radio]:before {
				font-family: Muiicons;
				font-size: 16px;
				font-weight: 400;
				line-height: 1;
				text-decoration: none;
				color: #FBBF5F;
				border-radius: 0;
				background: 0 0;
				-webkit-font-smoothing: antialiased;
			}
			
			.mui-checkbox input[type=checkbox],
			.mui-radio input[type=radio] {
				position: absolute;
				top: 4px;
				right: 10px;
				display: inline-block;
				width: 20px;
				height: 26px;
				border: 0;
				outline: 0!important;
				background-color: transparent;
				-webkit-appearance: none;
			}
			
			.mui-table-view .mui-media-object {
				border-radius: 50%;
			}
			
			.mui-table-view:before {
				position: absolute;
				right: 0;
				top: 0;
				left: 0;
				height: 1px;
				content: '';
				-webkit-transform: scaleY(.5);
				transform: scaleY(.5);
				background-color: rgba(0, 0, 0, 0);
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
			
			.mui-media-body {
				font-size: 14px;
				color: #666666;
			}
			
			.mui-media-body p {
				font-size: 12px;
				color: #999999
			}
			
			#pullrefresh{
				margin-top: 10px;
			}
		</style>
	</head>
	<body>
		<div class="mui-content">
			<header class="mui-bar mui-bar-nav">
				<a class="mui-action-back mui-icon mui-icon-arrowleft mui-pull-left"></a>
				<div class="bgw">
					<div class="mui-input-row mui-search searchbox ">
						<input type="search" class="mui-input-clear" placeholder="搜索转让对象">
					</div>
				</div>
			</header>
			<div id="pullrefresh" class="mui-content mui-scroll-wrapper">
				<div class="mui-scroll">
					<ul class="mui-table-view">
						<li class="mui-table-view-cell mui-media mui-checkbox mui-right">
							<a href="javascript:;" class="">
								<img class="mui-media-object mui-pull-left" src="http://placehold.it/40x30">
								<div class="mui-media-body">
									内陆飞鱼
									<p class="mui-ellipsis">参加活动120次&nbsp;投票300次</p>
								</div>
								<input name="checkbox" type="checkbox">
							</a>
						</li>
						<li class="mui-table-view-cell mui-media mui-checkbox mui-right">
							<a href="javascript:;" class="">
								<img class="mui-media-object mui-pull-left" src="http://placehold.it/40x30">
								<div class="mui-media-body">
									内陆飞鱼
									<p class="mui-ellipsis">参加活动120次&nbsp;投票300次</p>
								</div>
								<input name="checkbox" type="checkbox">
							</a>
						</li>
						<li class="mui-table-view-cell mui-media mui-checkbox mui-right">
							<a href="javascript:;" class="">
								<img class="mui-media-object mui-pull-left" src="http://placehold.it/40x30">
								<div class="mui-media-body">
									内陆飞鱼
									<p class="mui-ellipsis">参加活动120次&nbsp;投票300次</p>
								</div>
								<input name="checkbox" type="checkbox">
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<script src="../js/mui.min.js"></script>
		<script type="text/javascript">
			mui.init({
				swipeBack: false,
				pullRefresh: {
					container: '#pullrefresh',
					down: {
						callback: pulldownRefresh
					},
					up: {
						contentrefresh: '正在加载...',
						callback: pullupRefresh
					}
				}
			});

			function pulldownRefresh() {
				setTimeout(function() {
					/*var table = document.body.querySelector('.mui-table-view');
					var cells = document.body.querySelectorAll('.mui-table-view-cell');
					for (var i = cells.length, len = i + 3; i < len; i++) {
						var li = document.createElement('li');
						li.className = 'mui-table-view-cell';
						li.innerHTML = '<a class="mui-navigate-right">Item ' + (i + 1) + '</a>';
						//下拉刷新，新纪录插到最前面；
						table.insertBefore(li, table.firstChild);
					}*/
					mui('#pullrefresh').pullRefresh().endPulldownToRefresh(); //refresh completed
				}, 1000);
			}
			var count = 0;
			/**
			 * 上拉加载具体业务实现
			 */
			function pullupRefresh() {
				setTimeout(function() {
					mui('#pullrefresh').pullRefresh().endPullupToRefresh((++count > 2)); //参数为true代表没有更多数据了。
					/*	var table = document.body.querySelector('.mui-table-view');
						var cells = document.body.querySelectorAll('.mui-table-view-cell');
						for (var i = cells.length, len = i + 20; i < len; i++) {
							var li = document.createElement('li');
							li.className = 'mui-table-view-cell';
							li.innerHTML = '<a class="mui-navigate-right">Item ' + (i + 1) + '</a>';
							table.appendChild(li);
						}*/
				}, 1000);
			}
		</script>
	</body>
</html>