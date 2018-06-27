<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html >
<html>

	<head>
	<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>${json.detail.name}</title>
		<meta name="description" content='${ecartoonDetail.prod_summary == null || ecartoonDetail.prod_summary == "" ? "暂无简介" : ecartoonDetail.prod_summary}'/>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<link rel="stylesheet" type="text/css" href="event/css/app.css" />
		<link rel="stylesheet" type="text/css" href="event/css/mui.min.css" />
		<link rel="stylesheet" type="text/css" href="event/css/mui.picker.min.css" />

		<style>
		
			html,body{
			 width: 100%;
			 height: 100%;
			 margin: 0;
			 padding: 0;
			 position: relative;
			}
			
			.fright {
				float: right;
			}
			
			.fleft {
				float: left;
			}
			
			.red {
				color: red
			}
			.cb{
				color:#1e1e1e;
			}
			
			.cgrey {
				color: #999999
			}
			
			.corange {
				color: #ff4401
			}
			
			.cgreen {
				color: green;
			}
			
			.font7 {
				font-weight: 700;
			}
			
			.font12 {
				font-size: 12px;
			}
			.font13{
				font-size: 13px;
			}
			.font15{
				font-size: 15px;
			}
			.colorR{
				color:#ff4401;
			}
			.border-radiu8{
				border:1px solid #ff4401;
				border-radius:8px;
				padding: 0px 5px;
				color:#FF4401;
			}
			
			.header-a {
				width: 100%;
				overflow: hidden;
		
			}
			.header-div{
				width: 300%;
				height: 100%;
				position: relative;
				box-sizing: border-box;
				overflow: hidden;
			}
			.header-img {
				/*高斯模糊*/
				filter: url(blur.svg#blur);
				/* FireFox, Chrome, Opera */
				-webkit-filter: blur(13px) brightness(50%);;
				-moz-filter: blur(3px) brightness(50%);;
				-o-filter: blur(3px) brightness(50%);;
				-ms-filter: blur(3px) brightness(50%);;
				filter: blur(3px) brightness(50%);;
				filter: progid:DXImageTransform.Microsoft.Blur(PixelRadius=3, MakeShadow=false);
				/* IE6~IE9 */
			}
	
			.header-say {
				position: absolute;
				top:0;
				z-index: 2;
				width: 100%;
				height: 100%;
				padding: 10px;
				display: -webkit-box;
				-webkit-box-orient: vertical;
				box-sizing: border-box;
				overflow: hidden;
				
                   
			}
			.ml-10{
				height: 100%;
				margin-left:10px ;
			}
			.h33{
				height: 33%;
				padding: 5px;
				box-sizing: border-box;
                overflow: hidden;
                color:white
			}
			.header-smallimg {
				width: 100%;
				-webkit-box-align: center;
				height: 76%;
				padding: 5px 0 15px;
				box-sizing: border-box;
				overflow: hidden;
			   
			}
			
			.header-where {
				width: 100%;
				box-sizing: border-box;
				border-top: 1px solid #f2f2f2;
				height: 24%;
				display: -webkit-box;
				-webkit-box-orient: vertical;
				 -webkit-box-pack: center
			}
			.cishu{
				color:white;
				font-size: 13px;
			}
	
			.content-say {
				width: 100%;
				box-sizing: border-box;
			}
			
			.content-bottombox {
				box-sizing: border-box;
				width: 100%;
				height: 45px;
				line-height: 45px;
				font-size: 14px;
				padding: 0 10px;
				border-bottom: 1px solid #eaeaea;
				
				text-indent: 20px;
			}
			.img-card{
				display: block;
                float:left ;
                }
			
			.jtnr {
				width: 100%;
				padding: 5px 10px;
				margin-top: 10px;
				background: white;
				font-size: 13px;
			}
			
			#result {
				text-indent: 2em;
				display: inline-block;
			}
			
			#demo4 {
				width: 100px;
				position: absolute;
				left: 5em;
				top: 0em;
				opacity: 0;
				height: 100%;
				z-index: 33
			}
			
			a{
			  text-decoration:none;
			  color:#000;
			}
			
			.memberInfo{
			  list-style: none;
			  width:100%;
			  height: auto;
			  text-align: left;
			  padding:0;
			}
			
			li{
			  list-style: none;
			  width:60px;
			  height: 80px;
			  margin: 0;
			  padding: 0;
			  overflow: hidden;
			}
			
			.memberImage{
			 position:relative;
			 width: 50px;
			 height: 50px;
			 border-radius: 50%;
			 margin: 0;
			 padding: 0;
			 float: left;
			}
			
			.memberName{
			 width:50px;
			 height:30px;
			 line-height:30px;
			 text-align: left !important;
			 float: left;
			 margin-left: -16px;
			 font-size: 11px;
			}
			.dou-ul{
			padding: 0;
			overflow: hidden;
			margin-bottom: 10px;
			}
			
			.dou-li{
			text-align: center;
			float: left;
			margin-left: 20px;
			margin-top: 15px;
			}
			.memberRole{
			position:absolute;
			width: 30px;
			height: 20px;
			border-radius:10%;
			background-color: red;
			z-index: 999;
			text-align: center;
			margin-top: 30px;
			margin-left: -28px;
			border: none;
			line-height:20px;
			}
			.dou-roleFont{
			width:100%;
			height:100%;
			font-size: 10px;
			color: white;
			}
			
			
			/*尾部*/
			.box-footer{
				position: fixed;
				bottom: 0;
				left:0;
				width:100%;
				height:38px;
				line-height:38px;
				text-align:center;
				background-color: #fff;
				overflow: hidden;
				z-index: 999;
			}
			
			.box-footer-buttons{
				width:100%;
				height: 100%;
				float:left;
				overflow:hidden;
				color: white;
				font-size: 14px;
			}
			.box-footer-partake{
				width:50%;
				height:100%;
				float: left;
				background-color: #FE6F43;
			}
			.box-footer-seeWorks{
				width:50%;
				height:100%;
				float: left;
				background-color: #FEA62A;
			}
			
			
			/* 头像上的文字css */
			.head-dou{
			  color: white;
			  font-size: 13px;
			  line-height: 20px;
			}
			
			.xdou-parise{
			  float: right;
			  margin-right: 25px;
			}
			
			.refereeName{
				position:absolute;
				width: 30px;
				height: 20px;
				border-radius:25%;
				background-color: #FEF11D;
				z-index: 999;
				text-align: center;
				margin-top: 30px;
				margin-left: -34px;
				border: none;
				padding: 0;
				padding-top:2px;
				line-height: 20px;
			}
			
			.expertName{
				position:absolute;
				width: 30px;
				height: 20px;
				border-radius:25%;
				background-color: #289CF0;
				z-index: 999;
				text-align: center;
				margin-top: 30px;
				margin-left: -34px;
				border: none;
				padding: 0;
				padding-top:2px;
				line-height: 20px;
			}
			
			.block{
			  height: 20px;
			  width: 100%;
			  background-color: #EEEEF3;
			}
			
			.dou-remark{
			   margin-left: 20px;
			   width: 340px;
			   white-space:normal;
			}
		</style>
	</head>

	<body>
		<form action="" method="post" id="xxapp">
			
			<div class="mui-content" id = "app">
				<div class="header-a">
						<div class="header-div">
								<img :src="'picture/'+activeDetail.poster" class="header-img"/>
								<div class="header-say ">
								 	   <div class="header-smallimg ">
					                           <img :src="'picture/'+activeDetail.poster" height="100%" class="img-card"/>
					                           <div class="fleft ml-10">
							                           	<div class="h33" style="white-space:normal;width:200px;height:45px;">{{activeDetail.name}}</div>
							                           	<div class="h33 font12">
							                           			<span>发起人：{{activeDetail.creatorName}}</span> &nbsp;&nbsp; <span>{{activeDetail.workCount == null ? 0 : activeDetail.workCount}}个参赛作品</span>
							                           	</div>
							                           	<div class="h33 font12">
							                           	        <span>投票：{{activeDetail.voteCount == null ? 0 : activeDetail.voteCount}}人</span> &nbsp;&nbsp; 
							                           	        <span>投注：{{activeDetail.betCount == null ? 0 : activeDetail.betCount}}人</span>
							                           	        <span v-if="activeDetail.status == 0">&nbsp;&nbsp;&nbsp;{{activeDetail.totalBet}}FC</span>
							                           	</div>
					                           </div>
								 	    </div>
							 	        <div class="header-where" id = "xdou-head">
					 		                    <div class = "font12 head-dou">
					 		                         <span class = "xdou-count">获胜名额：{{activeDetail.win_count == null ? 0 : activeDetail.win_count}}</span>&nbsp;&nbsp;
					 		                    	 <span class = "xdou-type">{{activeDetail.referee_model|decisionType}}</span>&nbsp;&nbsp;&nbsp;&nbsp;
					 		                    	 <span class = "xdou-parise">投票可获得{{activeDetail.vote_parise == null ? 0 : activeDetail.vote_parise}}FC</span>&nbsp;&nbsp;
					 		                    </div> 
							 	         </div>
						  		 </div>
					      </div>
				 </div>
				
				
				<div class="mui-slider dou" >
						<div class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
						</div>
						<div class="mui-slider-group">
							<div id="item1">
							    <div class="block" ></div>
								<ul class="mui-table-view bg0 dou-ul">
											<div class="content-bottombox jg" >
												参赛截止时间：
												<span class="fright corange font7 " id = "moneyDou">{{activeDetail.registration_deadline}}</span>
											</div>
										    <div class="content-bottombox font15 srdm">
										                    投票截止时间：<span id ="fitStore" class="fright cgrey font13">{{activeDetail.vote_deadline}}</span>
										    </div>
										    <div v-if="hasActiveExperts" class = "content-bottombox font 15  memberInfo">
										        <ul class = "dou-ul">
											          <li v-for ="v in activeExperts" class = "dou-li">
											             <img :src="'picture/'+v.image" class = "memberImage"/>
											              <button class = "memberRole">
											             	<span class = "dou-roleFont">{{v.role}}</span> 
											              </button>
											              <p class = "memberName">{{v.name}}</p>
											          </li>
										        </ul>
										    </div>
										    
										    <div class = "content-bottombox font 15" style="height: 100px; height: auto; width: 100%;">
										         	活动规则<br>
										         	<p style="line-height: 20px;" v-html="activeDetail.remark"></p>
										    </div>
								</ul>
							</div>
						</div>
					</div>
			</div>
				

				

				
			
		</form>
		
		
		<!-- footer 按钮设置 -->
				<div id="footer" class="box-footer">
					<div class="box-footer-buttons">
						<div v-if="activeDetail.status == 0">
							<div class="box-footer-partake" onclick="submitWorks()" >
								提交作品参赛
							</div>
							<div class="box-footer-seeWorks" onclick="watchWorks()">
								查看参赛作品
							</div>
						</div>
						<div v-if="activeDetail.status == 1" >
							<div class="box-footer-partake" onclick="submitWorks1()" >
								查看投注赢家
							</div>
							<div class="box-footer-seeWorks" onclick="watchWorks1()">
								查看参赛作品
							</div>						
						</div>
						<div v-if="activeDetail.status == 2" >
							<div class="box-footer-partake" onclick="toDetermine()">
								等候裁判成绩
							</div>
							<div class="box-footer-seeWorks" onclick="watchWorks()">
								查看参赛作品
							</div>						
						</div>
					</div>
				</div>
		
	</body>
		<script src="event/js/mui.min.js"></script>
		<script src="event/js/jquery.min.js" type="text/javascript"></script>
		<script src="event/js/jquery.js" type="text/javascript"></script>
		<script src="event/js/mui.picker.min.js" type="text/javascript" ></script>
		<script src="event/js/vue.min.js"></script>
		
		
		<script type="text/javascript">
		  $(function(){
			  var height = window.screen.height;
			  $("#item1").css({"padding-bottom":(height-550)});
			  var width = window.screen.width;
			  $("#xdou-head").css({"width":width});
			  
			  // jsapi签名，获得微信分享接口权限
			  $.ajax({
				  url: 'wechat/sign.html',
				  data: {
					  url: location.href.split("#")[0]
				  },
				  success: function (sign) {
					  sign = JSON.parse(sign);
						wx.config({
							    debug: true, 
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
		  
		  
		  //vue获取后台数据
		  var activeDetail = '${json}';
		  activeDetail = JSON.parse(activeDetail);
		  var hasActiveExperts = false;
		  // 判断当前活动中是否存在专家或裁判
		  if (activeDetail) {
			  var douActiveExperts = activeDetail.activeExperts;
			  if (douActiveExperts != undefined && douActiveExperts.length > 0) {
				  hasActiveExperts = true;
			  }
		  }
		  var active = new Vue ({
			  el:"#app",
			  data: {
				        activeDetail: activeDetail.detail,
				   		activeExperts: activeDetail.activeExperts,
				   		activeName: '',
				   		hasActiveExperts: hasActiveExperts
			        },
			  filters: {
				  decisionType: function (value) {
					  if (value == 0) {
						  value = "裁判判定成绩";
					  } 
					  
					  if (value == 1) {
						  value = "观众投票判定成绩";
					  }
					  return value;
					  
				  }
			  },
			  // vue初始化函数
			  created: function () {
				  var obj = active.activeDetail;
				  obj.link = '<%=basePath%>active/activeDetail.html?json=' + encodeURI(JSON.stringify({"id":obj.id}));
				  obj.img = '<%=basePath%>picture/' + obj.poster;
				  obj.desc = '活动详情页面分享';
				  
				  console.log('link: ' + obj.link + ', img: ' + obj.img + ', desc: ' + obj.desc);
				  wx.ready(function () {
				        wx.onMenuShareTimeline({
				            title: obj.name,
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
		  });
		  
		  var vue = new Vue({
			  el: "#footer",
			  data: {
				  activeDetail: activeDetail.detail
			  }
		  });
		  
		  //根据用户角色不同，切换不同的class，以便后续修改样式
		 
		 $(".memberRole").each(function(i,item){
			  var html = $(".dou-roleFont").eq(i).html();
			  if ("裁判" == html){
				  $(item).attr({"class":"refereeName"});
				  $(".dou-roleFont").eq(i).css({"color":"black"});
			  }
			  if ("专家" == html){
				  $(item).attr({"class":"expertName"});
			  }
		  });
		 
		  
		  
		 function submitWorks(){
			 var role = active.activeDetail.role;
			 var hasDead = active.activeDetail.hasDead;
			 if (role == "referee") {
				 alert("你是当前活动裁判，不能提交参赛作品！");
				 return;
			 }

			 if (parseInt(hasDead) == 1) {
				 alert("当前活动，已停止提交参赛作品！");
				 return;
			 }
			 
			 var activeId = "${json.detail.id}";
			 sessionStorage.setItem("activeId", activeId);
			 location.href = "event/releaseWorks.jsp";
		 }
		  
		 function watchWorks(){
			 var activeId = "${json.detail.id}";
			 sessionStorage.setItem("activeId", activeId);
			 location.href = "event/works.jsp";
		 }
		 
		 function submitWorks1(){
			 var activeId = "${json.detail.id}";
			 sessionStorage.setItem("activeId", activeId);
			 location.href = "event/winnerMember.jsp";
		 }
		  
		 function watchWorks1(){
			 var activeId = "${json.detail.id}";
			 sessionStorage.setItem("activeId", activeId);
			 location.href = "event/workRank.jsp";
		 }
		 
		 function toDetermine() {
			 var activeId = "${json.detail.id}";
			 sessionStorage.setItem("activeId", activeId);
			 location.href = "event/determine.jsp";
		 } 
		  
		</script>
 
 <script>
 			
	
			window.onload = function() {
			//处理头部的图片高度
			var headeraheight=$(".header-a").width()/2;
			$('.header-a').css("height",headeraheight);
			var imgwidth=$('.header-div').width();
			var imgheight=imgwidth/4*3;
			$('.header-img').css('height',imgheight);
		    var imgcardheight=$(".img-card").height();
		    var imgcardwidth=imgcardheight/3*4;
		    $('.img-card').css("width",imgcardwidth);
			
			
			
		}
	
	
	
	
		mui.init();

	(function($) {
		$.init();
		var result = $('#result')[0];
		var btns = $('.btn');
		btns.each(function(i, btn) {
			btn.addEventListener('tap', function() {
				var optionsJson = this.getAttribute('data-options') || '{}';
				var options = JSON.parse(optionsJson);
				var id = this.getAttribute('id');
				/*
				 * 首次显示时实例化组件
				 * 示例为了简洁，将 options 放在了按钮的 dom 上
				 * 也可以直接通过代码声明 optinos 用于实例化 DtPicker
				 */
				//var picker = new $.DtPicker(options);
				    var today=new Date();
               	   	var y = today.getFullYear();
			       	var M = today.getMonth() + 1;
			        var d = today.getDate();
					var picker = new $.DtPicker({//设置日历初始视图模式
						type: "date ",//真正的月份比写的多一个月。  type的类型你还是可以选择date, datetime month time  hour 
               			beginDate:new Date(),//设置开始日期   
               			endDate: new Date(y, M, d)//设置结束日期    //真正的是10.21
					});
				
				
				picker.show(function(e) {
					/*
					 * rs.value 拼合后的 value
					 * rs.text 拼合后的 text
					 * rs.y 年，可以通过 rs.y.vaue 和 rs.y.text 获取值和文本
					 * rs.m 月，用法同年
					 * rs.d 日，用法同年
					 * rs.h 时，用法同年
					 * rs.i 分（minutes 的第二个字母），用法同年
					 */
	                var datetext=e.y.text+"-"+e.m.text+"-"+e.d.text;
					result.innerText=datetext;
			     
					/* 
					 * 返回 false 可以阻止选择框的关闭
					 * return false;
					 */
					/*
					 * 释放组件资源，释放后将将不能再操作组件
					 * 通常情况下，不需要示放组件，new DtPicker(options) 后，可以一直使用。
					 * 当前示例，因为内容较多，如不进行资原释放，在某些设备上会较慢。
					 * 所以每次用完便立即调用 dispose 进行释放，下次用时再创建新实例。
					 */
					 picker.dispose();
				});
			}, false);
		}); 
	 })(mui);  
	
	</script>

</html>