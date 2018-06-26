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
		<title>我的活动</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="event/css/mui.min.css" rel="stylesheet" />
		<script src="event/js/jquery.min.js"></script>
		
		<style>
			header {
				background: white!important;
				box-shadow: none!important;
				border-bottom: 1px solid #eaeaea!important;
			}
			
			.mui-icon-arrowleft {
				color: #666666;
			}
			
			.mui-title {
				color: #666666;
			}
			
			.bb2 {
				background: white;
				height: 40px;
			}
			
			.mui-segmented-control.mui-segmented-control-inverted~.mui-slider-progress-bar {
				background-color: rgba(0, 0, 0, 0);
				position: relative;
				margin-top: -2px;
				margin-bottom: 10px;
			}
			
			.mui-segmented-control.mui-segmented-control-inverted~.mui-slider-progress-bar:after {
				background-color: #FBBF5F;
				position: absolute;
				content: "";
				bottom: 0;
				left: 25%;
				width: 50%;
				height: 2px;
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
			
			.mui-segmented-control.mui-segmented-control-inverted .mui-control-item {
				color: #666666;
				font-size: 13px;
				background: 0 0;
			}
			
			.mui-segmented-control.mui-segmented-control-inverted .mui-control-item.mui-active {
				color: #333333;
				font-size: 15px;
				background: 0 0;
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
		<div class="mui-content">
			<header class="mui-bar mui-bar-nav">
				<a class="mui-action-back mui-icon mui-icon-arrowleft mui-pull-left"></a>
				<h1 class="mui-title">我的活动</h1>
			</header>
			<!--下拉刷新容器-->
			<div id="refreshContainer" class="mui-content mui-scroll-wrapper">
				<div class="mui-scroll">
					<!--数据列表-->
					<div class="mui-slider">
						<div class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted bb2">
							<a class="mui-control-item" href="#item1">我参加的活动</a>
							<a class="mui-control-item" href="#item2">我发起的活动</a>
						</div>
						<div id="sliderProgressBar" class="mui-slider-progress-bar mui-col-xs-6"></div>
						<div class="mui-slider-group">
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
							<div id="item2" class="mui-slider-item mui-control-content mui-active">
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
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="event/js/mui.min.js"></script>
   <script type="text/javascript">
       var active = ${active};
       console.log(active);
      
   
   </script>
	    
	    
	    
		<script type="text/javascript">
			mui.init({
				pullRefresh: {
					container: '#refreshContainer',
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

				}, 1000);
			}
			var count = 0;
			/**
			 * 上拉加载具体业务实现
			 */
			function pullupRefresh() {
				setTimeout(function() {
					//参数为true代表没有更多数据了。
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
					count = 0;
					//切换到第三个选项卡
					//根据具体业务，动态获得第三个选项卡内容；
					// var content = ....
					//显示内容
					//  document.getElementById("item3").innerHTML = content;
					//改变标志位，下次直接显示
					// item3Show = true;

					//解除控制上拉效果
				} else if(event.detail.slideNumber === 1) {
					count = 1;

					//切换到第二个选项卡
					//根据具体业务，动态获得第二个选项卡内容；
					// var content = ....
					//显示内容
					//document.getElementById("item2").innerHTML = content;
					//改变标志位，下次直接显示
					// item2Show = true;
				}
			});
		</script>
	
	
	</body>
</html>