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
		<title>我的钱包</title>
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
				color:#666666;
			}
			
			.cg2 {
				color: #999999;
			}
			
			.mui-slider {
				margin-top: 15px;
			}
			
			.mui-slider-group {
				border-top: 1px solid #EAEAEA
			}
			
			.thisLi {
				padding-bottom: 15px;
			}
			
			.thisA {
				padding-bottom: 5px!important;
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
			.footer{
				width: 100%;
				height: 50px;
				background: white;
				position: fixed;
				bottom: 0;
				left: 0;
				display: flex;
        flex-direction: row ;
			  align-items:stretch;
			  z-index: 11;
			}
			.footer a{
				flex-grow: 1;
				line-height: 50px;
				text-align:center ;
				font-size: 14px;
			}
			.goBack{
				width:20%;
				color:#000;
			}
			.give{
				width:50%;
				background: #FF7043;
				color:#fff;
			}
			.recharge{
				width:50%;
				background: #FBBF5F;
				color:#fff;
			}
			#refreshContainer{
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
    background-color: rgba(0,0,0,0); 
}

		</style>
	</head>
	<body>
		<div class="mui-content" id="wraper">
			<header class="mui-bar mui-bar-nav" style="display: none;">
				<a class="mui-action-back mui-icon mui-icon-arrowleft mui-pull-left"></a>
				<h1 class="mui-title">我的钱包</h1>
			</header>
			<ul class="mui-table-view" style="z-index: 1;">
				<li class="mui-table-view-cell">
					<a class="font13 cg2">
						账户余额<span class="mui-pull-right cg1 font15">{{balance.balance}}FC</span>
					</a>
				</li>
			</ul>
			<!--下拉刷新容器-->
			<div id="refreshContainer" class="mui-content mui-scroll-wrapper" style="top:40px;padding-top:6px;">
				<div class="mui-scroll">
					<!--数据列表-->
					<div class="mui-slider">
						<div class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted bb2">
							<a class="mui-control-item" href="#item1">收入</a>
							<a class="mui-control-item" href="#item2">支出</a>
						</div>

						<div id="sliderProgressBar" class="mui-slider-progress-bar mui-col-xs-6"></div>

						<div class="mui-slider-group">
							<div id="item1" class="mui-slider-item mui-control-content mui-active">
								<div style="text-align: center;padding:20px;text-align: center;" v-if="!balance.income || balance.income.length == 0">
									<img src="http://funcoin.cardcol.com/picture/wnr.png" style="opacity:0.5;width: 180px;height: 120px;">	
										<div style="margin-top: 10px;font-size: 12px;color:#545556;">暂无数据</div>		
								</div>
								<ul class="mui-table-view">
									<li class="mui-table-view-cell thisLi" v-for="(v,i) in balance.income">
										<a class=" font12 thisA">
											<span class="mui-pull-left cg1">日期 :&nbsp;</span>
											<span class="mui-pull-left cg2">{{v.auto_time}}</span>
											<span class="mui-pull-right cg2">{{v.fromMemberNick}}</span>
											<span class="mui-pull-right cg1">付款人 :&nbsp;</span>
										</a>
										<a class=" font12 thisA">
											<span class="mui-pull-left cg1">{{v.product_type | judgeType}}</span>
											<span class="mui-pull-right cg2">{{v.name}}</span>
										</a>
										<a class=" font12 thisA">
											<span class="mui-pull-left cg1">金额</span>
											<span class="mui-pull-right cg2">{{v.funcoin}}</span>
										</a>
									</li>
								</ul>
							</div>
							<div id="item2" class="mui-slider-item mui-control-content">
								<div style="text-align: center;padding:20px;text-align: center;" v-if="!balance.out || balance.out.length == 0">
									<img src="http://funcoin.cardcol.com/picture/wnr.png" style="opacity:0.5;width: 180px;height: 120px;">	
										<div style="margin-top: 10px;font-size: 12px;color:#545556;">暂无数据</div>		
								</div>
								<ul class="mui-table-view">
									<li class="mui-table-view-cell thisLi" v-for="(v,i) in balance.out">
										<a class=" font12 thisA">
											<span class="mui-pull-left cg1">日期 :&nbsp;</span>
											<span class="mui-pull-left cg2">{{v.auto_time}}</span>
											<span class="mui-pull-right cg2">{{v.toMemberNick}}</span>
											<span class="mui-pull-right cg1">收款人 :&nbsp;</span>
										</a>
										<a class=" font12 thisA">
											<span class="mui-pull-left cg1">{{v.product_type | judgeType}}</span>
											<span class="mui-pull-right cg2">{{v.name == "" ? "备注" : v.name}}</span>
										</a>
										<a class=" font12 thisA">
											<span class="mui-pull-left cg1">金额</span>
											<span class="mui-pull-right cg2">{{v.funcoin}}</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
				<a href="event/give.jsp" class="give">赠送</a>
				<a href="event/recharge.jsp" class="recharge">充值</a>
			</div>
		<script src="event/js/vue.min.js"></script>
	 <script src="event/js/jquery.min.js"></script>
		<script src="event/js/mui.min.js"></script>
		<script type="text/javascript">
			mui.init();
			
			var vue = new Vue({
				el:"#wraper",
				data:{
					balance:0
				},
				created:function(){
					$.ajax({
						url:"member/myWallet.html",
						type:"post",
						data:{},
						dataType:"json",
						success:function(res){
							vue.balance = res;
						}
					});
				},
				filters:{
					judgeType:function(value){
						switch(value){
							case "A":
								return "充值";
							case "B":
								return "兑换";
							case "C":
								return "赠送";
							case "D":
								return "投注";
						}
					}
				}
			});
			
			(function($){
		        $(".mui-scroll-wrapper").scroll({
		              bounce: false,//滚动条是否有弹力默认是true
		              indicators: false, //是否显示滚动条,默认是true
		        });        
		    })(mui);
		</script>
	</body>
</html>