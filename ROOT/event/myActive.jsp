<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
   String path = request.getContextPath();
   String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>我的活动</title>
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link href="event/css/mui.min.css" rel="stylesheet" />
<script src="event/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
.colorR {
	color: #ff4401;
}

.font7 {
	font-weight: 700;
}

.font12 {
	font-size: 12px;
}

.font13 {
	font-size: 13px;
}

.font15 {
	font-size: 15px;
}

.font16 {
	font-size: 16px;
}

.f18 {
	font-size: 18px;
}

.mui-control-item {
	height: 45px !important;
	line-height: 45px !important;
	background: white;
	position: relative;
}

.mui-segmented-control.mui-segmented-control-inverted .mui-control-item
	{
	color: #999999
}

.control-item:after {
	content: "";
	position: absolute;
	width: 100%;
	height: 33%;
	top: 33%;
	left: -1px;
	border-right: 1px solid #f2f2f2;
}

.mui-slider-progress-bar {
	background: rgba(0, 0, 0, 0) !important;
	position: relative;
}

.mui-slider-progress-bar:after {
	content: "";
	position: absolute;
	width: 30%;
	height: 100%;
	background: #FF4401;
	left: 35%;
}

.mui-slider-indicator {
	outline: 2px solid #f2f2f2 !important;
}

.p10 {
	padding: 10px 10px 5px 10px !important;
}

.p0 {
	padding-left: 0 !important;
}

.m0 {
	margin: -10px 0 !important;
}

.mui-table-view .mui-media-object {
	line-height: 80px;
	max-width: 106px;
	height: 80px;
}

.pd5 {
	padding-top: 5px;
}

.mui-table-view-cell:after {
	position: absolute;
	right: 0;
	bottom: 0;
	left: 10px;
	content: '';
	transform: scaleY(.5);
	background-color: #f2f2f2;
}

.bg0 {
	background: rgba(0, 0, 0, 0);
}

.mt10 {
	margin-bottom: 10px;
}

.bgW {
	background: white;
}

.cG {
	color: #999999
}

.cB {
	color: #1e1e1e
}

.mui-segmented-control.mui-segmented-control-inverted .mui-control-item.mui-active
	{
	color: #1e1e1e;
	background: white;
}

.mui-slider .mui-segmented-control.mui-segmented-control-inverted ~.mui-slider-group .mui-slider-item
	{
	border: none;
}

.img_success {
	position: absolute;
	top: 0;
	right: 0;
	z-index: 2;
	width: 50px !important;
	height: 50px !important;
}


.dou{
  position: relative;
}


.noData-div{
 width: 100%;
 height: 100%;
 }
 
.noData-img{
   width: 100%;
   height: 100%;
}

</style>
</head>

<body>
	<div class="mui-content" id="app">
		<div class="mui-slider dou" >
			<div class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
				<a class="mui-control-item control-item cG mui-active" href="#item1">我参加的活动</a>
				<a class="mui-control-item control-item" href="#item2">我发起的活动</a>
			</div>
			<div id="sliderProgressBar" class="mui-slider-progress-bar mui-col-xs-6"></div>
			<div class="mui-slider-group">
				<div id="item1" class="mui-slider-item mui-control-content mui-active">
					<ul class="mui-table-view bg0">
						<li class="mui-table-view-cell p10  bgW" v-for="v in partakeList" v-if="partakeList.length != 0" >
							<div class="bgw cG">
								<ul class="mui-table-view">
									<li class="mui-table-view-cell mui-media p0">
									  <a href="#" class="m0 partakeDetail">
									        <img class="mui-media-object mui-pull-left" :src="'picture/'+v.poster" width="106px" height="80px">
											<div class="mui-media-body font15 pd5 cB">
												{{v.name}}
												<p class="mui-ellipsis font13 cG">{{v.voteCount}}人投票&nbsp;&nbsp;&nbsp;&nbsp;{{v.betCount}}人投注</p>
												<p class="mui-ellipsis font13 cG">{{v.remark}}</p>
											</div>
									  </a>
									</li>
								</ul>
							</div> 
							
						</li>
					</ul>
					
					<!-- 暂无数据  -->
					<div v-show="model.hasNoPartakeData" class="noData-div" >
					     <img src="event/img/no-data.jpg" class="noData-img">
					</div>
					
				</div>
				<div id="item2" class="mui-slider-item mui-control-content">
					<ul class="mui-table-view  bg0">
						<li class="mui-table-view-cell p10 mt10 bgW" v-if="launchList.length != 0" >
							<div class="bgw cG">
								<ul class="mui-table-view">
									<li class="mui-table-view-cell mui-media p0 bgW" v-for = "v in launchList" >
										<a href="#" class="m0 launchDetail"> <img
												class="mui-media-object mui-pull-left"
												:src="'picture/'+v.poster" width="106px" height="80px">
												<div class="mui-media-body font15 pd5 cB">
													{{v.name}}
													<p class="mui-ellipsis font13 cG">{{v.voteCount}}人投票&nbsp;&nbsp;&nbsp;&nbsp;{{v.betCount}}人投注</p>
													<p class="mui-ellipsis font13 cG">{{v.remark}}</p>
												</div>
										</a>
									</li>
								</ul>
							</div> 
						</li>
						
					</ul>
					
				    <!-- 暂无数据  -->
					<div v-show="model.hasNoLaunchData" class="noData-div" >
					     <img src="event/img/no-data.jpg" class="noData-img">
					</div>
			</div>
		</div>
	</div>
	</div>
	<script src="event/js/mui.min.js"></script>
	<script src="event/js/vue.min.js"></script>
	<script type="text/javascript">
		mui.init()
	</script>
	<script type="text/javascript">
	$(function(){
		
		var partakeDetail = $(".partakeDetail");
		var partakeList = ${active.partakeList};
		partakeList.forEach(function(item,i){
			var dd = item.id;
			var url = "active/activeDetail.html?json="+encodeURI(JSON.stringify({id:dd}));
			partakeDetail.eq(i).attr({"href":url});
		});
		
		var launchDetail = $(".launchDetail");
		var launchList = ${active.launchList};
		launchList.forEach(function(item,i){
			var dd = item.id;
			var url = "active/activeDetail.html?json="+encodeURI(JSON.stringify({id:dd}));
			launchDetail.eq(i).attr({"href":url});
		});
		
	});
	 var data = ${active == null ? 0 : active};
	 var hasNoLaunchData = data.launchList.length == 0 ? true : false;
	 var hasNoPartakeData = data.partakeList.length == 0 ? true : false;
	 
	 var active =	new Vue({
			el : "#app",
			data : {
				launchList : data.launchList,
				partakeList : data.partakeList,
				model: {
					hasNoLaunchData:hasNoLaunchData,
					hasNoPartakeData:hasNoPartakeData
				}
				
			}
		});
	 
	</script>
</body>
</html>