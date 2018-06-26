<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
   String path = request.getContextPath();
   String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>竞彩</title>
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

#dou-image{
    width: 100%;
    height: 200px;
}

.activeDate{
   float:right;
   margin-right: 5px;
}

#app{
   position: relative;
}

.launchActiveButton{
  position: fixed;
  bottom: 10px;
  right: 10px;
  z-index: 999;
  width: 50px;
  height: 50px;
}

.launchActiveButton-img{
   width: 100%;
   height: 100%;
}

.noData-div{
 width: 100%;
 height: 90%;
 }
 
.noData-img{
   width: 100%;
   height: 100%;
}


</style>
</head>

<body>
	<div class="mui-content" id="app">
	   <div id = "headImage">
	      <img id = "dou-image" src="picture/show_fengjingta_281299_11.jpg">
	   </div>
		<div class="mui-slider dou" >
			<div class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
				<a class="mui-control-item control-item cG mui-active" href="#item1">进行中</a>
				<a class="mui-control-item control-item" href="#item2">已结束</a>
			</div>
			<div id="sliderProgressBar" class="mui-slider-progress-bar mui-col-xs-6"></div>
			<div class="mui-slider-group">
				<div id="item1" class="mui-slider-item mui-control-content mui-active">
					<ul class="mui-table-view bg0">
						<li class="mui-table-view-cell mui-media p10  bgW" v-for = "v in goingList">
							<div class="bgw cG">
									  <a href="#" class="m0 goingDetail">
									        <img class="mui-media-object mui-pull-left" :src="'picture/'+v.poster" width="106px" height="80px">
												<div class="mui-media-body font15 pd5 cB">
													{{v.name}}
													<p class="mui-ellipsis font13 cG">
													{{v.voteCount == undefined ? 0 : v.voteCount}}人投票&nbsp;&nbsp;&nbsp;&nbsp;
													{{v.betCount == undefined ? 0 : v.betCount}}人投注<span class="activeDate">{{v.create_date}}</span></p>
													<p class="mui-ellipsis font13 cG">{{v.remark}}</p>
												</div>
									  </a>
							</div> 
						</li>
					</ul>
					
					<div v-show="model.hasNoData1" class="noData-div" >
					    <img  src="event/img/no-data.jpg" class="noData-img">
					</div>
				</div>
				<div id="item2" class="mui-slider-item mui-control-content">
					<ul class="mui-table-view  bg0">
						<li class="mui-table-view-cell mui-media p10 bgW" v-for="v in overList">
							<div class="bgw cG">
										<a href="#" class="m0 overDetail"> 
										<img class="mui-media-object mui-pull-left" :src="'picture/'+v.poster" width="106px" height="80px">
												<div class="mui-media-body font15 pd5 cB">
													{{v.name}}
													<p class="mui-ellipsis font13 cG">
													{{v.voteCount == undefined ? 0 : v.voteCount}}人投票&nbsp;&nbsp;&nbsp;&nbsp;
													{{v.betCount == undefined ? 0 : v.betCount}}人投注<span class="activeDate">{{v.create_date}}</span></p>
													<p class="mui-ellipsis font13 cG">{{v.remark}}</p>
												</div>
										</a>
							</div> 
					    </li>
				    </ul>
				    <div v-show="model.hasNoData2" class="noData-div" >
					    <img  src="event/img/no-data.jpg" class="noData-img">
					</div>
			   </div>
		 </div>
	</div>
	
	<!-- launchAtiveButton -->
	<div class="launchActiveButton" onclick="javascript:location.href='active/launchActive.html'">
	     <img src="event/img/launchActive.png" class="launchActiveButton-img">
	</div>
	
</div>
	<script src="event/js/mui.min.js"></script>
	<script src="event/js/vue.min.js"></script>
	<script type="text/javascript">
		mui.init()
	</script>
	<script type="text/javascript">
	
	
	$(function(){
	
		var goingDetail = $(".goingDetail");
		var goingList = ${json.goingList};
		goingList.forEach(function(item,i){
			var dd = item.id;
			var url = "active/activeDetail.html?json="+encodeURI(JSON.stringify({id:dd}));
			goingDetail.eq(i).attr({"href":url});
		});
		
		var overDetail = $(".overDetail");
		var overList = ${json.overList};
		overList.forEach(function(item,i){
			var dd = item.id;
			var url = "active/activeDetail.html?json="+encodeURI(JSON.stringify({id:dd}));
			overDetail.eq(i).attr({"href":url});
		});
		
	}); 
	
	 var data = ${json == null ? 0 : json};
	 var hasNoData1 = data.goingList.length == 0 ? true : false;
	 var hasNoData2 = data.overList.length == 0 ? true : false;
	 var active =	new Vue({
			el : "#app",
			data : {
				goingList : data.goingList,
				overList : data.overList,
				model:{
					hasNoData1:hasNoData1,
					hasNoData2:hasNoData2
				}
			}
		});
	 
	 
	</script>
</body>
</html>