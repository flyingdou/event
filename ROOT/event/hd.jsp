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
		<title>活动</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="event/css/mui.min.css" rel="stylesheet" />
		<style>
			.cg1 {
				color: #666666;
			}
			.cg2 {
				color: #999999!important;
			}
			/*原生search样式更改*/
			
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
				background: #f2f2f2;
				border: 1px solid #eaeaea;
				color: #666666;
				font-size: 13px;
				margin-bottom: 1px;
			}
			
			.mui-search .mui-placeholder {
				font-size: 13px;
				line-height: 34px;
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
			
			.bgw {
				background: white;
				padding-top: 10px;
				box-sizing: border-box;
				overflow: hidden;
				width: 100%;
				border-bottom: 1px solid #eaeaea;
			}
			
			.mui-col-xs-24 {
				width: 20%;
				position: relative;
			}
			
			.mui-col-xs-24:after {
				position: absolute;
				content: "";
				width: 80%;
				height: 2px;
				left: 10%;
				top: 0;
				background: #fbbf5f;
			}
			
			.mui-segmented-control.mui-segmented-control-inverted {
				background: white;
			}
			
			.mui-segmented-control.mui-segmented-control-inverted .mui-control-item {
				font-size: 13px;
			}
			
			.mui-segmented-control.mui-segmented-control-inverted .mui-control-item.mui-active {
				color: #666666!important;
				border-bottom: 2px solid #fbbf5f;
				font-size: 15px;
				background: 0 0;
			}
			
			.mui-segmented-control.mui-segmented-control-inverted~.mui-slider-progress-bar {
				background-color: rgba(0, 0, 0, 0);
			}
			
			.img-title {
				position: absolute;
				width: 100%;
				height: 100%;
				padding: 20px;
				top: 0;
				left: 0;
				display: -webkit-flex;
				flex-direction: column;
				justify-content: space-between;
			}
			
			.img-title div {
				color: white
			}
			
			.mui-slider .mui-segmented-control.mui-segmented-control-inverted~.mui-slider-group .mui-slider-item {
				border-top: none;
				border-bottom: none;
			}
		</style>
	</head>

	<body>

		<div id="pullrefresh" class="mui-content mui-scroll-wrapper">
			<div class="mui-scroll">
				<div class="bgw">
					<div class="mui-input-row mui-search searchbox">
						<input type="search" class="mui-input-clear" placeholder="搜索评选候选人">
					</div>
				</div>

				<div class="mui-slider">
					<div class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
						<a class="mui-control-item cg2 mui-active" href="#item1">全部</a>
						<a class="mui-control-item cg2" href="#item2">关注度</a>
						<a class="mui-control-item cg2" href="#item3">赔率</a>
						<a class="mui-control-item cg2" href="#item4">时间</a>
						<a class="mui-control-item cg2" href="#item5">进行中</a>

					</div>
					<div style="width: 100%;background: white;">
						<div id="sliderProgressBar" class="mui-slider-progress-bar mui-col-xs-24"></div>
					</div>
					<div class="mui-slider-group">
						<!--第一个子选项-->
						<div id="item1" class="mui-slider-item mui-control-content mui-active">

							<ul class="mui-table-view mui-grid-view " style="padding:15px 20px 0;margin-top: 10px;">
								<li class="mui-table-view-cell mui-media mui-col-xs-12" style="padding-top: 0;padding-bottom: 5px;padding-right: 5px;position:relative">
									<a href="#">
										<img class="mui-media-object" src="http://placehold.it/400x200">

									</a>
									<div class="img-title ">
										<div style="margin-top: 30px;">1111</div>
										<div>111111</div>
										<div style="align-self:flex-end;">111111</div>
									</div>
								</li>
								<li class="mui-table-view-cell mui-media mui-col-xs-12" style="padding-top: 0;padding-bottom: 5px;padding-right: 5px;position:relative">
									<a href="#">
										<img class="mui-media-object" src="http://placehold.it/400x200">

									</a>
									<div class="img-title ">
										<div style="margin-top: 30px;">1111</div>
										<div>111111</div>
										<div style="align-self:flex-end;">111111</div>
									</div>
								</li>
								<li class="mui-table-view-cell mui-media mui-col-xs-12" style="padding-top: 0;padding-bottom: 5px;padding-right: 5px;position:relative">
									<a href="#">
										<img class="mui-media-object" src="http://placehold.it/400x200">

									</a>
									<div class="img-title ">
										<div style="margin-top: 30px;">1111</div>
										<div>111111</div>
										<div style="align-self:flex-end;">111111</div>
									</div>
								</li>

							</ul>
						</div>
						<!--第二个子选项-->
						<div id="item2" class="mui-slider-item mui-control-content">
							<ul class="mui-table-view">
								<li class="mui-table-view-cell">第2个选项卡子项</li>
								<li class="mui-table-view-cell">第2个选项卡子项</li>
							</ul>
						</div>
						<!--第三个子选项-->
						<div id="item3" class="mui-slider-item mui-control-content">
							<ul class="mui-table-view">
								<li class="mui-table-view-cell">第3个选项卡子项</li>
								<li class="mui-table-view-cell">第2个选项卡子项</li>
							</ul>
						</div>
						<!--第四个子选项-->
						<div id="item4" class="mui-slider-item mui-control-content">
							<ul class="mui-table-view">
								<li class="mui-table-view-cell">第4个选项卡子项</li>
								<li class="mui-table-view-cell">第2个选项卡子项</li>
							</ul>
						</div>
						<!--第五个子选项-->
						<div id="item5" class="mui-slider-item mui-control-content">
							<ul class="mui-table-view">
								<li class="mui-table-view-cell">第5个选项卡子项</li>
								<li class="mui-table-view-cell">第2个选项卡子项</li>
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>

		<script src="event/js/mui.min.js"></script>
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

			document.querySelector('.mui-slider').addEventListener('slide', function(event) {
				if(event.detail.slideNumber === 0) {
					debugger;
					count = 0;
					//切换到第三个选项卡
					//根据具体业务，动态获得第三个选项卡内容；
					// var content = ....
					//显示内容
					//  document.getElementById("item3").innerHTML = content;
					//改变标志位，下次直接显示
					// item3Show = true;
					mui('#pullrefresh').pullRefresh().enablePullupToRefresh();
					//解除控制上拉效果
				} else if(event.detail.slideNumber === 1) {
					count = 1;
					mui('#pullrefresh').pullRefresh().enablePullupToRefresh();
					//切换到第二个选项卡
					//根据具体业务，动态获得第二个选项卡内容；
					// var content = ....
					//显示内容
					//document.getElementById("item2").innerHTML = content;
					//改变标志位，下次直接显示
					// item2Show = true;
				} else if(event.detail.slideNumber === 2) {
					count = 2;
					mui('#pullrefresh').pullRefresh().enablePullupToRefresh();

					//切换到第三个选项卡
					//根据具体业务，动态获得第三个选项卡内容；
					// var content = ....
					//显示内容
					//  document.getElementById("item3").innerHTML = content;
					//改变标志位，下次直接显示
					// item3Show = true;
				} else if(event.detail.slideNumber === 3) {
					count = 2;
					mui('#pullrefresh').pullRefresh().enablePullupToRefresh();

					//切换到第三个选项卡
					//根据具体业务，动态获得第三个选项卡内容；
					// var content = ....
					//显示内容
					//  document.getElementById("item3").innerHTML = content;
					//改变标志位，下次直接显示
					// item3Show = true;
				} else if(event.detail.slideNumber === 4) {
					count = 2;
					mui('#pullrefresh').pullRefresh().enablePullupToRefresh();

					//切换到第三个选项卡
					//根据具体业务，动态获得第三个选项卡内容；
					// var content = ....
					//显示内容
					//  document.getElementById("item3").innerHTML = content;
					//改变标志位，下次直接显示
					// item3Show = true;
				} else if(event.detail.slideNumber === 5) {
					count = 2;
					mui('#pullrefresh').pullRefresh().enablePullupToRefresh();

					//切换到第三个选项卡
					//根据具体业务，动态获得第三个选项卡内容；
					// var content = ....
					//显示内容
					//  document.getElementById("item3").innerHTML = content;
					//改变标志位，下次直接显示
					// item3Show = true;
				}
			});
		</script>
	</body>
</html>