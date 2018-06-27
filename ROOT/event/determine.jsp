<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":"+ request.getServerPort() + path + "/";
%>

<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>判定成绩</title>
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link rel="stylesheet" href="event/css/mui.min.css" />
<style type="text/css">
	html,body{
		width: 100%;
		height: 100%;
		margin: 0;
		padding: 0;
	}
	
	.weui-cells{
		width: 100%;
		height: 100%;
		margin: 0 !important;
		background-color: #FFF;
	}
	
	.mui-table-view {
	margin-top: 15px; 
}

li{
	border-bottom: 1px solid #c8c7cc;
}

/*修改原图片的样式*/
.mui-table-view .mui-media-object {
	line-height: 42px;
	max-width: none;
	height: 80px;
}

.user_img {
	width: 106px;
	height: 80px;
	border-radius: 50%;
	position: relative;
	/* margin-top: 10px; */
}

.free {
	width: 20px;
	height: 20px;
	position: absolute;
	top: 11px;
	left: 15px;
}

.bt {
	font-size: 12px;
	margin: 5px 0;
	text-align: right;
}

.time {
	font-size: 12px;
	text-align: right;
}
/*日历改变样式*/
.toolbar {
	background: white;
	color: #ff4401;
}

.picker-calendar-week-days {
	background: white;
}

i.icon.icon-next {
	background: url(${pageContext.request.contextPath}/wxv45/images/arrowR.png) no-repeat scroll 1px 1px/14px 14px;
}

i.icon.icon-prev {
	background: url(${pageContext.request.contextPath}/wxv45/images/arrow.png) no-repeat scroll 1px 1px/14px 14px;
}

.picker-calendar-day.picker-calendar-day-selected span {
	background: #FF4401;
	color: #fff;
}

.mui-table-view:before {
}

.mui-table-view:before{
	position: relative;
}

.mui-table-view:after{
	position: relative;
}

.weui-cells:before {
	top: 0;
	border-top: none;
	-webkit-transform-origin: 0 0;
	transform-origin: 0 0;
	-webkit-transform: scaleY(.5);
	transform: scaleY(.5);
}

.mui-table-view:last-child::after {
	/* position: absolute;
	right: 0;
	bottom: 0;
	left: 0;
	height: 1px;
	content: '';
	-webkit-transform: scaleY(.5);
	transform: scaleY(.5);
	background-color: rgba(0, 0, 0, 0); */
}

.footer {
	width: 100%;
	height: 44px;
	line-height: 44px;
	text-align: center;
	position: fixed;
	bottom: 0;
}

.footer a {
	display:block;
	width:96%;
	height:auto;
	margin:0 auto;
	background: #ff9800;
	color: white;
	border-radius:5px;
}

.prodName {
    color: #1e1e1e;
    font-size: 15px;
    font-weight:bold;
    font-family:STxihei;
    text-align: left;
    
}

.prodPrice {
    color: #999;
    font-size: 12px;
    text-align: left;

}


.prodSummary {
    color: #999999;
    font-size: 12px;
    text-align: left;
}

.pullUp,.pullDown{
  	text-align: center;
  	color:#888;
  	font-weight:bold;
    font-size:14px;
    height:40px;
    line-height: 40px;
}

.worksImg{
	width:100px;
	height:80px;
	overflow: hidden;
}

.mui-table-view-cell:after{
	position: relative;
}

.mui-table-view-cell:last-child{
	border: 0;
}

.footer{
	position: fixed;
	bottom: 0;
	left: 0;
	display: flex;
	justify-content: space-between;
	width: 100%;
	height: 44px;
	text-align: center;
	line-height: 44px;
	font-size: 14px;
	color: #FFF;
}

.button1{
	width: 50%;
	background-color: #FF7043;
}

.button2{
	width: 50%;
	background-color: #FFA726;
}
</style>
</head>
<body>
	<div class="weui-cells" style="margin-bottom: 65px" id="work">
		<div style="text-align: center;padding:20px;text-align: center;" v-if="!works.worksList || works.worksList.length == 0">
				<img src="http://funcoin.cardcol.com/picture/wnr.png" style="opacity:0.5;width: 180px;height: 120px;">	
					<div style="margin-top: 10px;font-size: 12px;color:#545556;">暂无数据</div>		
			</div>
		<ul class="mui-table-view ul2" style="margin: 0;margin-bottom: 50px;">
			<li class="mui-table-view-cell mui-media" v-for="(work,index) in works.worksList">
					<div class="mui-media-object mui-pull-left worksImg">
						<img class="imgs" :src="'picture/'+ work.image"  width="100%" />
					</div>
					<div class="mui-media-body" style="overflow: hidden;">
						<div style="width:60%;float:left;">
							<div class="bt prodName" >{{work.name}}</div>
							<div class="bt prodPrice">
								作者: {{work.author.length > 8 ? work.author.substring(0, 8) : work.author}}
							</div>
							<p class="time prodSummary" >日期: {{work.partakeDate}}</p>
						</div>
						<div style="width:40%;height:80px;float:left;position: relative;">
							 <div style="font-size: 14px;color:lelele;text-align: right;margin-top: 5px;margin-right: 5px;">判定名次</div>
							 <div style="position: absolute; top: 50px; right: 0;width: 60px;height: 20px;display: flex;justify-content: space-between;align-items: center;">
							 	<div @click="reduce(index)">
							 		-
							 	</div>
							 	<div style="background-color:#FF7043;width:20px;height:20px;line-height:20px;text-align:center;border-radius:50%;">
							 		<span style="color:#FFF;font-size: 12px;">
							 			{{ work.ranke < 10 ? '0' + work.ranke : work.ranke}}
							 		</span>
							 	</div>
							 	<div @click="add(index)">
							 		+
							 	</div>
							 </div>
						</div>
					</div>
			</li>
		</ul>
		<div class="footer">
			<div class="button1">本活动获胜名额{{winCount}}个</div>
			<div class="button2" @click="submitRanke">确定</div>
		</div>
	</div>
	<script src="event/js/vue.min.js"></script>
	<script src="event/js/jquery.min.js"></script>
	<script type="text/javascript">
		var vue = new Vue({
			el: "#work",
			data: {
				works: [],
				winCount: 0
			},
			created: function(){
				var activeId = sessionStorage.getItem("activeId");
				// 获取作品列表
				$.post("works/listWorks.html",{
						json: encodeURI(JSON.stringify({activeId:activeId}))
					},function(res){
						res.worksList.forEach(function (item, i) {
							item.ranke = (i + 1);
						});
						vue.works = res;
						// 处理作品图片显示
						setTimeout(function(){
							$(".imgs").each(function(){
								var defaultHeight = 80;
								var imgHeight = $(this).height();
								if(imgHeight > defaultHeight){
									var deviation = 0 - ((imgHeight - defaultHeight) * 0.5);
									$(this).css({"margin-top": deviation + "px"});
								}
							});
						}, 200);
				});
				// 获取活动胜利队伍数量
				$.ajax({
					url: "works/getWinnerCount.html",
					type: "post",
					data: {
						json: encodeURI(JSON.stringify({activeId : activeId}))
					},
					dataType: "json",
					success: function (res) {
						vue.winCount = res.winCount;
					}
				});
			},
			methods: {
				reduce: function (index) {
					var ranke = this.works.worksList[index].ranke;
					ranke = (ranke - 1) < 1 ? ranke : ranke - 1;
					this.works.worksList[index].ranke = ranke;
				},
				
				add: function (index) {
					this.works.worksList[index].ranke++;
				},
				
				// 检查值是否重复
				checkValue: function () {
					var arr = this.works.worksList;
					for (var i = 0; i < arr.length; i++) {
						for (var j = (i + 1); j < arr.length; j++) {
							if (arr[i].ranke == arr[j].ranke) {
								return false;
							}
						}
					}
					return true;
				},
				
				// 提交排名
				submitRanke: function () {
					if(!this.checkValue()){
						alert("不能有相同名次的作品!");
						return;
					}
					var param = {
							activeId: sessionStorage.getItem("activeId"),
							worksList: this.works.worksList
					}
					$.ajax({
						url: "works/judge.html",
						type: "post",
						data: {
							json: encodeURI(JSON.stringify(param))
						},
						dataType: "json",
						success: function (res) {
							if(res.success){
								location.href = "event/workRank.jsp";
							} else {
								alert(res.message);
							}
						}
					});
				}
			}
		});
	</script>
</html>