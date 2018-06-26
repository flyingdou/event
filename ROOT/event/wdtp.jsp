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
		<title>我的投票</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="event/css/mui.min.css" rel="stylesheet" />
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
			}
			
			.mui-segmented-control.mui-segmented-control-inverted~.mui-slider-progress-bar:after {
				background-color: #FBBF5F;
				position: absolute;
				content: "";
				bottom: 0;
				left: 40%;
				width: 20%;
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
			
			.font12 {
				font-size: 12px;
			}
			
			.font13 {
				font-size: 13px
			}
			
			.font15 {
				font-size: 15px
			}
			
			.cg1 {
				color: #666666;
			}
			
			.cg2 {
				color: #999999;
			}
			
			.mui-slider-group {
				border-top: 1px solid #EAEAEA;
				margin-top: 15px;
			}
			
			.thisLi {
				padding-bottom: 15px;
			}
			
			.thisA {
				padding-top: 5px!important;
				padding-bottom: 5px!important;
			}
			
			.thisA1 {
				padding-top: 10px!important;
				padding-bottom: 10px!important;
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
			
			.footer {
				width: 100%;
				height: 50px;
				background: white;
				position: fixed;
				bottom: 0;
				left: 0;
				display: flex;
				flex-direction: row;
				align-items: stretch;
				z-index: 11;
			}
			
			.footer a {
				flex-grow: 1;
				color: #666666;
				line-height: 50px;
				text-align: center;
				font-size: 14px;
			}
			
			.footer a:last-child {
				background: #FBBF5F;
				color: white
			}
			
			#refreshContainer {
				margin-bottom: 50px;
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
			.mr15{
				margin-right: 15px;
			}
		</style>
	</head>
	<body>
		<div class="mui-content" id="vote">
			<!-- <header class="mui-bar mui-bar-nav">
				<a class="mui-action-back mui-icon mui-icon-arrowleft mui-pull-left"></a>
				<h1 class="mui-title">我的投票</h1>
			</header> -->
			<!--下拉刷新容器-->
			<div id="refreshContainer" class="mui-content mui-scroll-wrapper">
				<div class="mui-scroll">
					<!--数据列表-->
					<div class="mui-slider" style="position: relative;">
						<!-- <span class="mui-icon mui-icon-arrowleft" style="border:0;position: absolute;left:10px;top:8px;z-index:1;" onclick="javascript:history.go(-1)"></span> -->
						<div class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted bb2">
							<a class="mui-control-item" href="#item1">已结束</a>
							<a class="mui-control-item" href="#item2">进行中</a>
						</div>
						<div id="sliderProgressBar" class="mui-slider-progress-bar mui-col-xs-6"></div>
						<div class="mui-slider-group">
							<div id="item1" class="mui-slider-item mui-control-content mui-active">
								<div style="text-align: center;padding:20px;text-align: center;" v-if="!vote1.myVote || vote1.myVote.length == 0">
									<img src="http://funcoin.cardcol.com/picture/wnr.png" style="opacity:0.5;width: 180px;height: 120px;">	
										<div style="margin-top: 10px;font-size: 12px;color:#545556;">暂无数据</div>		
								</div>
								<ul class="mui-table-view">
									<li class="mui-table-view-cell thisLi" v-for="(votes,i) in vote1.myVote">
										<a class="font13 cg1 thisA1">{{votes[0].activeName}}</a>
										<a class=" font12 thisA" v-for="(v,i) in votes">
											<span class="mui-pull-left cg1">投票 :</span>
											<span class="mui-pull-left cg2 mr15">&nbsp;{{v.worksName}}</span>
											<span class="mui-pull-left cg1">投注 :</span>
											<span class="mui-pull-left cg2 ">&nbsp;{{v.betMoney != 0 ? v.betMoney + 'FC' : v.betMoney}}</span>
											<span class="mui-pull-right cg2">{{v.value == 1 ? '胜' : '负'}}</span>
										</a>
									</li>
								</ul>
							</div>
							<div id="item2" class="mui-slider-item mui-control-content">
								<div style="text-align: center;padding:20px;text-align: center;" v-if="!vote2.myVote || vote2.myVote.length == 0">
									<img src="http://funcoin.cardcol.com/picture/wnr.png" style="opacity:0.5;width: 180px;height: 120px;">	
										<div style="margin-top: 10px;font-size: 12px;color:#545556;">暂无数据</div>		
								</div>
								<ul class="mui-table-view">
									<li class="mui-table-view-cell thisLi" v-for="(votes,i) in vote2.myVote">
										<a class="font13 cg1 thisA1">{{votes[0].activeName}}</a>
										<a class=" font12 thisA" v-for="(v,i) in votes">
											<span class="mui-pull-left cg1">投票 :</span>
											<span class="mui-pull-left cg2 mr15">&nbsp;{{v.worksName}}</span>
											<span class="mui-pull-left cg1">投注 :</span>
											<span class="mui-pull-left cg2 "> &nbsp;{{v.betMoney != 0 ? v.betMoney + 'FC' : v.betMoney}}</span>
											<span class="mui-pull-right cg2">进行中</span>
										 </a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- <div class="footer">
			<a href="">赠送</a>
			<a href="">充值</a>
		</div> -->
		<script src="event/js/mui.min.js"></script>
		<script src="event/js/vue.min.js"></script>
		<script src="event/js/jquery.min.js"></script>
		<script type="text/javascript">
			var vue = new Vue({
				el:'#vote',
				data:{
					vote1 : '',
					vote2 : ''
				},
				created:function(){
				  $.ajax({
						url:'member/myVote.html',
						type:'post',
						data:{json:encodeURI(JSON.stringify({status:0}))},
						dataType:'json',
						success:function(res){
							vue.vote1 = res;
						},
						error:function(e){
							/* alert(JSON.stringify(e)); */
						}
					}); 
					
					$.ajax({
						url:'member/myVote.html',
						type:'post',
						data:{json:encodeURI(JSON.stringify({status:1}))},
						dataType:'json',
						success:function(res){
							vue.vote2 = res;
						},
						error:function(e){
							/* alert(JSON.stringify(e)); */
						}
					});
				}
			});
		</script>
	</body>
</html>