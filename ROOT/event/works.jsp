<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":"+ request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
<head>
<title>作品列表</title>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<link rel="stylesheet" href="event/css/mui.min.css" />
<style>
html,body{
	width:100%;
	height:100%;
	margin:0;
	padding:0;
}
.mui-table-view {
	margin-top: 15px; 
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
	position: absolute;
	right: 0;
	left: 0;
	height: 1px;
	content: '';
	-webkit-transform: scaleY(.5);
	transform: scaleY(.5);
	background: rgba(0, 0, 0, 0);
	top: -1px;
}

.weui-cells:before {
	top: 0;
	border-top: none;
	-webkit-transform-origin: 0 0;
	transform-origin: 0 0;
	-webkit-transform: scaleY(.5);
	transform: scaleY(.5);
}

.weui-cells {
	margin-top: 10px !important;
}

.mui-table-view:last-child::after {
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
</style>
</head>
<body>
	<div class="weui-cells" style="margin-bottom: 65px" id="works">
		<div style="text-align: center;padding:20px;text-align: center;" v-if="!works.worksList || works.worksList.length == 0">
			<img src="http://funcoin.cardcol.com/picture/wnr.png" style="opacity:0.5;width: 180px;height: 120px;">	
				<div style="margin-top: 10px;font-size: 12px;color:#545556;">暂无数据</div>		
		</div>
		<ul class="mui-table-view ul2" style="margin: 2px;">
			<li class="mui-table-view-cell mui-media" v-for="(work,index) in works.worksList">
				<a href="javascript:void(0)" @click="workDetail(index)">
					<div class="mui-media-object mui-pull-left worksImg">
						<img class="imgs" :src="'picture/'+ work.image"  width="100%" />
					</div>
					<div class="mui-media-body" style="overflow: hidden;">
						<div style="width:60%;float:left;">
							<div class="bt prodName" >{{work.name}}</div>
							<div class="bt prodPrice" >作者: {{work.author}}</div>
							<p class="time prodSummary" >日期: {{work.partakeDate}}</p>
						</div>
						<div style="width:40%;height:80px;line-height:80px;float:left;text-align: right;">
							 <p style="color:#FF9800;" v-if="work.winRate != 0">
							 	{{work.winRate + '%'}}胜率
							 </p>
							 <p style="color:#FF9800;" v-if="work.winRate == 0">
							 	暂无预测
							 </p>
						</div>
					</div>
				</a>
			</li>
		</ul>
	</div>
	<script src="event/js/vue.min.js"></script>
	<script src="event/js/jquery.min.js"></script>
	<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	
	<script type="text/javascript">
	    //页面载入函数
		$(function(){
			// 获取jsapi 分享接口权限
			$.ajax({
				url: 'wechat/sign.html',
				data: {
					url: location.href.split("#")[0]
				},
				success: function (sign) {
					sign = JSON.parse(sign);
					wx.config({
						    debug: false, 
						    appId: sign.appid,
						    timestamp: sign.timestamp,
						    nonceStr: sign.nonceStr,
						    signature: sign.signature,
						    jsApiList: [        
								   "onMenuShareTimeline", //分享给好友
						           "onMenuShareAppMessage", //分享到朋友圈
						    ] 
					});
				},
				error: function (e) {
					console.log('网络异常');
				}
			})
		})
		var vue = new Vue({
			el:'#works',
			data:{
				works:[]
			},
			created:function(){
				var activeId = sessionStorage.getItem("activeId");
				if (!activeId) {
					activeId = '${activeId}';
				}
				$.ajax({
					url:'works/listWorks.html',
					type:'post',
					data:{json:encodeURI(JSON.stringify({activeId:activeId}))},
					dataType:'json',
					success:function(res){
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
						vue.share();
					},
					error:function(e){
						//alert(JSON.stringify(e));
					}
				});
				
				 
			},
			methods:{
				workDetail:function(i){
					// 去作品详情
					var workId = vue.works.worksList[i].id;
					var param = {
							id : workId,
							activeId : sessionStorage.getItem("activeId")
					}
					sessionStorage.setItem("json", encodeURI(JSON.stringify(param)));
					location.href = "event/workDetail.jsp";
				},
				// 分享方法
				share: function () {
					 var obj = this.work.activeInfo;
					  obj.link = '<%=basePath%>works/getWorksList.html?json=' + encodeURI(JSON.stringify({"activeId": obj.id}));
					  obj.img = '<%=basePath%>picture/' + obj.poster;
					  obj.desc = obj.name + '的作品列表';
					  obj.title = '作品列表'; 
					  
					  wx.ready(function () {
					        wx.onMenuShareTimeline({
					            title: obj.title,
					            link: obj.link,
					            imgUrl: obj.img,
					            trigger: function (res) {
					                console.log(JSON.stringify(res));
					            },
					            success: function (res) {
					            	console.log(JSON.stringify(res));
					            },
					            cancel: function (res) {
					            	console.log(JSON.stringify(res));
					            },
					            fail: function (res) {
					            	console.log(JSON.stringify(res));
					            }
					        });
					        wx.onMenuShareAppMessage({
					            title: obj.name, 
					            desc: obj.desc, 
					            link: obj.link, 
					            imgUrl: obj.img, 
					            type: 'link', 
					            success: function () {
					                console.log(1);
					            },
					            cancel: function () {
					                console.log(2);
					            }
					        });
					        wx.error(function (res) {
					            alert(res.errMsg);
					        });
					    });
				}
			}
		});
	</script>
</body>
</html>