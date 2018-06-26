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
<title>作品图片</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<link rel="stylesheet" href="event/css/amazeui.min.css" />
<style type="text/css">
	html,body{
		width: 100%;
		height: 100%;
		margin: 0;
		padding: 0;
	}
	
	.wraper{
		width: 100%;
		height: 100%;
	}
	
	.imgs{
		width: 400px;
		height: 300px;
		line-height: 300px;
	}
	
	input{
		width:100%;
		height: 20px;
		margin:0;
		padding:0;
		background-color: transparent;
		border:0;
		text-align: center;
		font-size: 12px;
		color:#999;
		outline: none;
	}
	
	.footer{
		position: fixed;
		bottom: 0;
		left: 0;
		width: 100%;
		height: 44px;
		line-height: 44px;
		text-align: center;
		background-color: #FFA726;
		color: #fff;
	}
</style>
</head>
<body>
	<div class="wraper" id="wraper">
		<div data-am-widget="slider" class="am-slider am-slider-a1" data-am-slider='{&quot;directionNav&quot;:false}' >
		  <ul class="am-slides">
	      <li class="imgs" v-for="(img,i) in imgs">
	        	<img :src="'picture/'+ img.image"/>
	      </li>
		  </ul>
		</div>
		<input type="text" id="imgRemark" placeholder="请输入图片描述"  v-model="model.remark" />
		<div class="footer" @click="saveImgsRemark()">
			保存图片描述
		</div>
	</div>
	<script type="text/javascript" src="event/js/jquery.min.js"></script>
	<script type="text/javascript" src="event/js/amazeui.min.js"></script>
	<script src="event/js/vue.min.js"></script>
	<script src="event/js/swipe.min.js"></script>
	<script type="text/javascript">
		var vue = new Vue({
			el: "#wraper",
			data: {
				imgs: [],
				currentIndex: 0,
				model: {}
			},
			created: function(){
				this.imgs = JSON.parse(sessionStorage.getItem("imgs"));
				
				setTimeout(function(){
					$("img").each(function(){
						var defaultWidth = 400;
						var defaultHeight = 300;
						var imgWidth = $(this).width();
						var imgHeight = $(this).height();
						if(imgWidth > imgHeight){
							$(this).css({"width":"100%"});
							$(this).css({"height": defaultWidth * (imgHeight / imgWidth) + "px"});
						} else {
							$(this).css({"height":"100%"});
							$(this).css({"width": defaultHeight * (imgWidth / imgHeight) + "px"});
						}
						$(this).css({"margin":"0 auto"});
					});
				}, 500);
				
				$("body").rhuiSwipe("swipeLeft",function(){
					document.querySelector("#imgRemark").value = "";
					if(vue.currentIndex == 0){
						vue.currentIndex = vue.imgs.length;
					} else {
						vue.currentIndex--;
					}
				});
				
			  $("body").rhuiSwipe("swipeRight",function(){
				  document.querySelector("#imgRemark").value = "";
				  if(vue.currentIndex == vue.imgs.length){
						vue.currentIndex = 0;
					} else {
						vue.currentIndex++;
					}
				});
			  
			// 键盘弹起隐藏按钮
				var oHeight = document.body.offsetHeight;
				$(window).resize(function(){
					var nowHeight = document.body.offsetHeight;
			    if(nowHeight < oHeight){
			    	$(".footer").css("display","none");
					} else {
			    	$(".footer").css("display","block");
					}
				});
			},
			methods: {
				saveImgsRemark: function(){
					var img = this.imgs[this.currentIndex].image;
					var param = {
							image: img,
							imageRemark: vue.model.remark
					}
					$.post("works/updateWorkImageRemark.html",{
							json: encodeURI(JSON.stringify(param))
						},function(res){
							if(res.success){
								alert("修改成功");
								history.go(-1);
							} else {
								alert("程序异常");
							}
					});
				}
			}
		});
	</script>
</body>
</html>