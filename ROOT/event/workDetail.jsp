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
<title>作品详情</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<script src="event/js/html5media.min.js"></script>
<style type="text/css">
	html,body{
		width:100%;
		height:100%;
		margin:0;
		padding:0;
	}
	input{
		outline: none;
	}
	/* 最外层 */
	.wraper{
		width:100%;
		height:100%;
		background-color: #f0f0f0;
	}
	/*头部*/
	.box-header{
		width:100%;
		height:auto;
		background-color: #fff;
		padding:10px 0; 
	}
	.box-header-top{
		margin:0 10px;
		margin-bottom:10px;
	}
	.box-header-bottom{
		margin-left:10px;
		overflow:hidden;
		font-size:12px;
		color:#999;
	}
	/*中间*/
	.box-middle{
		width:100%;
		height:auto;
		margin-top:10px;
		background-color: #fff;
	}
	/* 作品图片 */
	.box-middle-imgBox{
		border-bottom:1px solid #bbb;
	}
	.box-middle-imgBoxTitle{
		margin:10px;
		padding-top: 10px;
	}
	.box-middle-imgBoxBody{
		overflow: scroll;
	}
	.box-middle-imgs{
		float: left;
		margin-left: 20px;
		padding-bottom: 10px;
		width: 133px;
		text-align: center;
		overflow: hidden;
	}
	.box-middle-imgs img{
		width:100%;
	}
	.box-middle-imgReamrk{
		text-align: center;
		font-size: 12px;
		color:#999;
	}
	/* 作品视频 */
	.box-middle-videoBox{
		padding-bottom:10px;
		border-bottom:1px solid #bbb;
	}
	.box-middle-videoBoxTitle{
		margin:10px;
	}
	.box-middle-videoBoxBody{
		height:300px;
		margin:0 10px;
		padding-bottom:10px;
	}
	.box-middle-remarkBoxTitle{
		margin:10px;
	}
	.box-middle-remarkBoxBody{
		margin:0 10px;
		margin-bottom:44px;
		padding-bottom:10px;
		height: 50px;
		font-size: 12px;
		color:#999;
	}
	/*底部按钮*/
	.box-footer{
		position: fixed;
		bottom: 0;
		left:0;
		width:100%;
		height:44px;
		line-height:44px;
		text-align:center;
		background-color: #fff;
		overflow: hidden;
	}
	.box-footer-goBack{
		width:20%;
		height: 100%;
		float: left;
	}
	.box-footer-buttons{
		width:100%;
		height: 100%;
		float:left;
		overflow:hidden;
		color: #fff;
	}
	.box-footer-voteButton{
		width:50%;
		height:100%;
		float: left;
		background-color: #aaa;
	}
	.box-footer-bettingButton{
		width:50%;
		height:100%;
		float: left;
		background-color: #ffa726;
	}
	.box-footer-oneButton{
		background-color: #ffa726;
		text-align: center;
	}
	/*投票弹窗,投注弹窗*/
	.vote-mask,.betting-mask{
		position:fixed;
		top:0;
		left:0;
		z-index: 1;
		width:100%;
		height:100%;
		background-color: rgba(0,0,0,.3);
	}
	.vote-mask-message{
		background-color:#fff;
		width:300px;
		height:150px;
		margin:0 auto;
		text-align: center;
		padding:10px 0;
		position: relative;
	}
	.vote-mask-button{
		margin:20px auto;
		width:80%;
		height:34px;
		line-height:34px;
		background-color: #ff9800;
		color:#fff;
		border-radius:5px;
	}
	.close{
		position:absolute;
		top:0;
		right:0; 
		background-image: url("event/img/close.png");
		background-size:100% 100%;
		width:20px;
		height:20px;
	}
	.betting-mask-message{
		background-color:#fff;
		width:300px;
		height:150px;
		margin:0 auto;
		text-align: center;
		padding:10px 0;
		position: relative;
	}
	.betting-mask-input{
		overflow: hidden;
		margin-top:20px;
	}
	.betting-mask-input > div{
		width:45%;
		font-size:13px;
	}
	.betting-mask-cell{
		width: 60px;
		border: 1px solid #d7d7d7;
		border-radius: 8px;
		padding: 0 5px;
	}
	.betting-mask-balance{
		font-size: 12px;
		color:#999;
		margin-top:20px;
	}
	.betting-mask-button{
		margin:20px auto;
		width:100px;
		height:34px;
		line-height:34px;
		background-color: #ff9800;
		color:#fff;
		border-radius:5px;
	}
	/* 判定成绩 */
	.determine-mask{
		margin-top:10px;
		background-color: #fff;
	}
	.determine-mask-list,determine-mask-li{
		margin:0;
		padding:0;
		list-style: none;
	}
	.determine-mask-li{
		overflow: hidden;
		padding:0 10px;
		border-top:1px solid #bbb;
		height:40px;
		line-height:40px;
	}
	.border-bottom{
		border-bottom:1px solid #bbb;
	}
	.determine-mask-li > div{
		width:50%;
		float:left;
	}
	.text-right{
		text-align: right;
	}
	.determine-mask-input{
		width:80px;	
	}
	.determine-mask-buttons{
		padding-top:10px;
		overflow: hidden;
		background-color: #f0f0f0;
		
	}
	.determine-mask-cancel{
		float:left;
		position:relative;
		width:46%;
	}
	.determine-mask-ok{
		float:right;
		width:46%;
		height:40px;
		line-height:40px;
	}
	.determine-mask-cancel > p{
		position:absolute;
		top:0;
		right:0;
		margin:0;
		padding:0;
		width:80px;
		height:40px;
		line-height:40px;
		background-color: #fff;
		text-align: center;
	}
	.determine-mask-ok > p{
		margin:0;
		padding:0;
		width:80px;
		height:40px;
		line-height:40px;
		background-color: #ffa726;;
		text-align: center;
		color:#fff;
	}
	/* 预测胜率  */
	.forecast-mask{
		margin-top:10px;
		padding:10px 0;
		background-color: #fff;
	}
	.forecast-mask-range{
		height:30px;
		width:86%;
		margin:0 auto;
		margin-top:10px;
		position: relative;
	}
	.forecast-mask-range > input{
		-webkit-appearance: none;
		width:100%;
		height:5px;
		border:1px solid #bbb;
		border-radius:5px;
	}
	.forecast-mask-range > input::-webkit-slider-thumb {
    -webkit-appearance: none;
    appearance: none;
    height: 25px;
    width: 25px;
    border-radius: 100%;
    background-color: #fff;
    cursor: pointer;
    -webkit-box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.4);
    box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.4);
	}
	.evaluateBox{
		width:90%;
		margin:0 auto;
		margin-top:10px;
		overflow: hidden;
	}
	.evaluate{
		width:98%;
		height:100px;
		overflow: hidden;
		resize:none;
	}
	.evaluateButtons{
		margin-top:10px;
	}
	.evaluateButton-cancal{
		float:right;
		width:78px;
		height: 28px;
		margin-right:10px;
		line-height:28px;
		background-color: #fff;
		text-align: center;
		border:1px solid #bbb;
		border-radius:5px;
		color:#555;
	}
	.evaluateButton-ok{
		float:right;
		width:80px;
		height: 30px;
		line-height:30px;
		background-color: #ffa726;;
		text-align: center;
		color:#fff;
		border-radius:5px;
	}
	/* 设定赔率 */
	.setUp-mask ul,.setUp-mask li{
		margin:0;
		padding:0;
		list-style: none;
	}
	.setUp-mask-li{
		overflow: hidden;
		height:50px;
		line-height:50px;
		background-color: #fff;
		border-bottom:1px solid #bbb;
	}
	.setUp-mask-li div{
		float:left;
		width:45%;
		padding:0 2%;
	}
	.setUp-mask-right{
		text-align: right;
	}
	.setUp-button-ok{
		width:90%;
		margin:10px auto;
		height:40px;
		line-height: 40px;
		color:#fff;
		background-color: #ffa726;
		text-align: center;
		border-radius:5px; 
	}
</style>
</head>
<body>
	<div class="wraper" id="workDetail">
		<!-- 头部:作品名称,作者,赔率 -->
		<div class="box-header">
			<div class="box-header-top">
				{{init_data.works.name}}
			</div>
			<div class="box-header-bottom">
				<div style="float:left;margin-left:10px;">
					作者 : {{init_data.works.author}}
				</div>
				<div style="float:right;margin-right:30px;">
					赔率 : {{init_data.works.payRate == "" ? "暂未设定赔率" : init_data.works.payRate / 100}}
				</div>   
			</div>
		</div>
		<div class="box-middle">
			<!-- 作品图片 -->
			<div class="box-middle-imgBox">
				<div class="box-middle-imgBoxTitle">作品图片</div>
				<div class="box-middle-imgBoxBody">
					<div style="width:1330px;overflow: hidden;">
						<div class="box-middle-imgs" v-for="(img,i) in init_data.imgs" @click="showImageDetail(i)">
							<div style="float:left;width:100%;height:100px;overflow: hidden;">
								<img class="imgs" :src="'picture/'+ img.image">
							</div>
							<div class="box-middle-imgReamrk">
								{{ img.imageRemark == "" ? "该图片暂无描述" : img.imageRemark }}
							</div>
						</div>
					</div>
				</div>		
			</div>
			<!-- 作品视频 -->
			<div class="box-middle-videoBox">
				<div class="box-middle-videoBoxTitle">作品视频</div>
				<div class="box-middle-videoBoxBody">
					<video :src="init_data.works.video" width="100%" height="100%" controls preload></video> 
				</div>
			</div>
			<!-- 作品简介 -->
			<div class="box-middle-remarkBox">
				<div class="box-middle-remarkBoxTitle">作品简介</div>
				<div class="box-middle-remarkBoxBody">
					{{init_data.works.remark == "" ? "该作品暂无描述" : init_data.works.remark}}
				</div>
			</div>
		</div>
		<!-- 底部按钮 -->
		<div class="box-footer" v-if="init_data.activeStatus == 0 && init_data.role != 1">
			<div class="box-footer-buttons" v-html="footer_buttons">
			</div>
		</div>
		<!-- 投票弹窗 -->
		<div class="vote-mask" hidden="hidden">
			<div class="vote-mask-message" id="ms">
				<p style="color:#ff5722;font-size:13px;margin-top:20px;">您已成功为{{vote_result.id}}号作品投票</p>
				<p style="color:#ff5722;font-size:12px;">{{vote_result.message}}</p>
				<p class="vote-mask-button" @click="betting(0,2)">为该作品投注,赢得更多FC</p>
				<span class="close" @click="vote(0)"></span>
			</div>
		</div>
		<!-- 投注弹窗 -->
		<div class="betting-mask" hidden="hidden">
			<div class="betting-mask-message">
				<div class="betting-mask-input">
					<div style="text-align:right;float:left;">输入投注数量</div>
					<div style="text-align:left;float:right;">
						<input type="number" class="betting-mask-cell" v-model="model.betting" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/>
					</div>
				</div>
				<p class="betting-mask-balance">您可使用的funcion总额 : {{betting_result.balance}}FC</p>
				<div class="betting-mask-button" @click="betting(1)">确定</div>
				<span class="close" @click="betting(0,1)"></span>
			</div>
		</div>
		<!-- 判定成绩 -->
		<div class="determine-mask" hidden="hidden"> 
			<ul class="determine-mask-list">
				<li class="determine-mask-li">
					<div>本活动获胜名额</div>
					<div class="text-right">{{determine_result.winCount}}</div>
				</li>
				<li class="determine-mask-li">
					<div>已经判定名次</div>
					<div class="text-right">
						<span v-if="determine_result.list == 0">暂无判定名次的作品</span>
						<span v-if="determine_result.list != 0">
							<span v-for="(ranke,index) in determine_result.list">
								<span v-if="index != determine_result.length-1">{{ranke}}、</span>
								<span v-if="index == determine_result.length-1">{{ranke}}</span>
							</span>
						</span>
					</div>
				</li>
				<li class="determine-mask-li border-bottom">
					<div>判定本作品名次为 :</div>
					<div class="text-right">
						<input type="number" class="determine-mask-input" v-model="model.determine" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/>
					</div>
				</li>
			</ul>
			<div class="determine-mask-buttons">
				<div class="determine-mask-cancel">
					<p @click="determine(2)">取消</p>
				</div>
				<div class="determine-mask-ok">
					<p @click="determine(1)">确定</p>
				</div>
			</div>
		</div>
		<!-- 预测胜率 -->
		<div class="forecast-mask" hidden="hidden">
			<p style="margin:0;padding:0;">&nbsp;&nbsp;预测胜率:  {{processPoint}}%</p>
			<div class="forecast-mask-range">
				<input id="processRange" type="range" min="0" max="100" :value="processPoint" step="1" @input = "changeProcess()" 
				 :style="{background: '-webkit-linear-gradient(top, #059CFA, #059CFA) 0% 0% / '+ processPoint*100/100 +'% 100% no-repeat'}">
			</div>
			<div class="evaluateBox">
				<div class="evaluateButtons">
					<div class="evaluateButton-ok" @click="forecast(2)">
						确定
					</div>
					<div class="evaluateButton-cancal" @click="forecast(1)">
						取消
					</div>
				</div>
			</div>
		</div>
		<!-- 设定赔率 -->
		<div class="setUp-mask" hidden="hidden">
			<ul>
				<li class="setUp-mask-li">
					<div>专家预测保守赔率</div>
					<div class="setUp-mask-right">{{setUp_result.down_winRate}}</div>
				</li>
				<li class="setUp-mask-li">
					<div>专家预测积极赔率</div>
					<div class="setUp-mask-right">{{setUp_result.up_winRate}}</div>				
				</li>
				<li class="setUp-mask-li">
					<div>发起人设定赔率</div>
					<div class="setUp-mask-right">
						<input type="number" v-model="model.setUp" style="width:80%;" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"/>
					</div>
				</li>			
			</ul>
			<div class="setUp-button-ok" @click="setUp(1)">
				确定
			</div>
		</div>
	</div>
	<script src="event/js/vue.min.js"></script>
	<script src="event/js/jquery.min.js"></script>
	<script src="event/js/scollBar.js"></script>
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
			el:"#workDetail",
			data:{
				model:{},
				vote_result:0,
				betting_result:0,
				determine_result:0,
				setUp_result:0,
				footer_buttons:0,
				processPoint:0,
				init_data:{
					"works":{
						"image2Remark":"",
						"image3":"",
						"image3Remark":"",
						"author":0,
						"image1Remark":"",
						"remark":"",
						"video":"",
						"image1":"",
						"image2":"",
						"partakeDate":"",
						"activeWorkId":0,
						"name":"",
						"id":0
					}
				}
			},
			created:function(){
				//页面载入,获取初始数据
				var param = sessionStorage.getItem("json");
				if (!param) {
					param = '${worksDetailParam}';
				}
				$.ajax({
					url:"works/worksDetail.html",
					type:"post",
					data:{
						json : param
					},
					dataType:"json",
					success:function(res){
						// 根据用户角色渲染对应页面
						vue.init_data = res;
						vue.init_data.param = JSON.parse(decodeURI(param));
						vue.share();
						//根据用户角色显示对应界面
						if(res.role == 0){
							// 观众进入
							vue.footer_buttons = '<div class="box-footer-voteButton" onclick="vue.vote(1)">投票</div>';
							vue.footer_buttons += '<div class="box-footer-bettingButton" onclick="vue.betting(0,0)">投注</div>';
						}else if(res.role == 1){
							// 裁判进入
							vue.init_data.param.type = 0;
							$.post("works/judge.html",
									{
										json : encodeURI(JSON.stringify(vue.init_data.param))
									},
									function(res){
										if(res.ranke > 0){
											vue.footer_buttons = '<div class="box-footer-oneButton">判定名次为 : '+res.ranke+'</div>';
										}else{
											vue.footer_buttons = '<div class="box-footer-oneButton" onclick="vue.determine(0)">判定成绩</div>';	
										}
									}
							);
						}else if(res.role == 2){
							// 专家进入
							vue.footer_buttons = '<div class="box-footer-oneButton" onclick="vue.forecast(0)">预测</div>';
						}else if(res.role == 3){
							// 发起人进入
							vue.init_data.param.type = 0;
							$.post("works/setTheOdds.html",{
									json : encodeURI(JSON.stringify(vue.init_data.param))
								},
								function(res){
									if(res.payRate > 0){
										vue.footer_buttons = '<div class="box-footer-oneButton">已成功设定赔率</div>';
									}else{
										vue.footer_buttons = '<div class="box-footer-oneButton" onclick="vue.setUp(0)">设定赔率</div>';
									}
							});
						}
						
						// 处理作品图片显示
						setTimeout(function(){
							$(".imgs").each(function(){
								var defaultHeight = 133;
								var imgHeight = $(this).height();
								if(imgHeight > defaultHeight){
									var deviation = 0 - ((imgHeight - defaultHeight) * 0.5);
									$(this).css({"margin-top": deviation + "px"});
								}
							});
						}, 200);
						
						// 保存页面视频组件
						vue.model.box_middle_videoBoxBody = document.querySelector(".box-middle-videoBoxBody");
						vue.model.video = document.querySelector("video");
					},
					error:function(e){
						//alert(JSON.stringify(e));
					}
				});
				
			},
			methods:{
				goBack: function(){
					//返回
					history.go(-1);
				},
				showImageDetail: function(currentIndex){
					var _img = vue.init_data.imgs[0];
					vue.init_data.imgs[0] = vue.init_data.imgs[currentIndex];
					vue.init_data.imgs[currentIndex] = _img;
					sessionStorage.setItem("imgs", JSON.stringify(vue.init_data.imgs));
					location.href = "event/workImage.jsp";
				},
				vote: function(type){
					// 投票
					var box = document.getElementsByClassName("vote-mask")[0];
					if(type == 0){
						//隐藏投票弹窗
						box.setAttribute("hidden",true);
						$(vue.model.box_middle_videoBoxBody).append(vue.model.video);
					}else if(type == 1){
						//请求服务端
						var param = {
								activeId : vue.init_data.param.activeId,
								contestant : vue.init_data.param.id
						}
						$.ajax({
							url:"works/vote.html",
							type:"post",
							data:{
								json : encodeURI(JSON.stringify(param))
							},
							dataType:"json",
							success:function(res){
								if(res.success){
									vue.vote_result = res;
									if(res.funcoin > 0){
										vue.vote_result.message = "您已获得活动发起人奖励的"+res.funcoin+"FC";
									}else{
										vue.vote_result.message = "抱歉!活动发起人暂未设置投票奖励";
									}
									//请求完成后,显示窗体
									$(vue.model.video).remove();
									var box_box = document.getElementsByClassName("vote-mask-message")[0];
									var boxHeight = document.getElementsByTagName("body")[0].clientHeight;
									var box_boxHeight = window.getComputedStyle(box_box).height.split("p")[0];
									$(box_box).css({"margin-top" : ((boxHeight-box_boxHeight)/2) + "px"});
									box.removeAttribute("hidden");
								}else{
									alert(res.msg ? res.msg : "网络异常,请稍后再试");
								}
							},
							error:function(e){
								//alert(JSON.stringify(e));
							}
						});
					}
				},
				betting: function(type,index){
					//投注
					if(type == 0){
						//显示投注弹窗
						$(vue.model.video).remove();
						var box = document.getElementsByClassName("betting-mask")[0];
						var box_box = document.getElementsByClassName("betting-mask-message")[0];
						var boxHeight = document.getElementsByTagName("body")[0].clientHeight;
						var box_boxHeight = window.getComputedStyle(box_box).height.split("p")[0];
						
						if(index == 0 || index == 2){
							$.ajax({
								url:"member/myWallet.html",
								type:"post",
								data:{},
								dataType:"json",
								success:function(res){
									if(res == false){
										alert("网络异常,请稍后再试!");
										return;
									}
									vue.betting_result = res;
									$(box_box).css({"margin-top" : ((boxHeight-box_boxHeight)/2) + "px"});
									if(index == 0){
										box.removeAttribute("hidden");
									}else if(index == 2){
										document.getElementsByClassName("vote-mask")[0].setAttribute("hidden",true);
										box.removeAttribute("hidden");
									}
								},
								error:function(e){
									//alert(JSON.stringify(e));
								}
							});
						}else{
							box.setAttribute("hidden",true);
							$(vue.model.box_middle_videoBoxBody).append(vue.model.video);
						}
					}else if(type == 1){
						//检查输入的funcoin数量是否小于余额
						if(this.model.betting > this.betting.balance){
							alert("抱歉!输入数量大于余额!");
							return;
						}
						//请求服务端
						var param = {
								activeId : vue.init_data.param.activeId,
								contestant : vue.init_data.param.id,
								betMoney : vue.model.betting
						}
						$.ajax({
							url:"works/betting.html",
							type:"post",
							data:{
								json : encodeURI(JSON.stringify(param))
							},
							dataType:"json",
							success:function(res){
								if(res.success){
									vue.model.betting = "";
									alert("投注成功!");
									//隐藏窗体
									var box = document.getElementsByClassName("betting-mask")[0];
									box.setAttribute("hidden",true);
									$(vue.model.box_middle_videoBoxBody).append(vue.model.video);
								}else{
									if(res.msg){
										alert(res.msg);
									}else{
										alert("网络异常,请稍后再试");
									}
								}
							},
							error:function(e){
								//alert(JSON.stringify(e));
							}
						});
					}
				},
				determine: function(type){
					// 判定成绩
					var determineBox = document.getElementsByClassName("determine-mask")[0];
					var box_middle = document.getElementsByClassName("box-middle")[0];
					var box_footer = document.getElementsByClassName("box-footer")[0];
					
					// 点击取消按钮,隐藏判定界面
					if(type == 2){
						determineBox.setAttribute("hidden",true);
						box_middle.removeAttribute("hidden");
						box_footer.removeAttribute("hidden");
						document.getElementsByTagName("Title")[0].innerHTML = "作品详情";
						return;
					}
					
					// 请求服务端数据
					var ajax_param = 0;
					if(type == 0){
						// 设置请求参数
						vue.init_data.param.type = 1;
						// 设置ajax参数
						ajax_param = {
								url:"works/judge.html",
								type:"post",
								data:{
									json : encodeURI(JSON.stringify(vue.init_data.param))
								},
								dataType:"json",
								success:function(res){
									if(res.list.length == 0){
										res.list = 0;
									}else{
										res.length = res.list.length;
									}
									vue.determine_result = res;
									// 请求数据成功后,显示判定界面
									box_middle.setAttribute("hidden",true);
									box_footer.setAttribute("hidden",true);
									determineBox.removeAttribute("hidden");
									document.getElementsByTagName("Title")[0].innerHTML = "判定成绩";
								},
								error:function(e){
									// alert(JSON.stringify(e));
								}
						}
					}else if(type == 1){
						var returnIs = false;
						if(vue.determine_result.list.length > 0){
							vue.determine_result.list.forEach(function(item){
								if(vue.model.determine == item){
									returnIs = true;
								}
							});
						}
						if(returnIs){
							alert("该名次已有所属队伍!");
							return;
						}
						if(vue.model.determine > vue.determine_result.winCount){
							alert("输入名次超过活动胜利队伍数量!");
							return;
						}
						// 设置请求参数
						vue.init_data.param.type = 2;
						vue.init_data.param.ranke = vue.model.determine; 
						// 设置ajax参数
						ajax_param = {
								url:"works/judge.html",
								type:"post",
								data:{
									json : encodeURI(JSON.stringify(vue.init_data.param))
								},
								dataType:"json",
								success:function(res){
									if(res.success){
										vue.footer_buttons = '<div class="box-footer-oneButton">判定名次为 : '+ vue.model.determine +'</div>';
										alert("判定成功!");
										if(res.endWork){
											// 调用结算
											var activeId = sessionStorage.getItem("activeId");
											$.post("balanceByReferee.html",{
													json: encodeURI(JSON.stringify({activeId:activeId}))
												},function(res){
													console.log(res);
											});
										}
									}else{
										alert("网络异常,请稍后再试");
									}
									// 请求成功,隐藏判定界面
									determineBox.setAttribute("hidden",true);
									box_middle.removeAttribute("hidden");
									box_footer.removeAttribute("hidden");
									document.getElementsByTagName("Title")[0].innerHTML = "作品详情";
								},
								error:function(e){
									// alert(JSON.stringify(e));
								}
						}
					}
					// 请求服务端
					$.ajax(ajax_param);
				},
				forecast: function(type,index){
					//预测胜率
					var forecastBox = document.getElementsByClassName("forecast-mask")[0];
					var box_middle = document.getElementsByClassName("box-middle")[0];
					var box_footer = document.getElementsByClassName("box-footer")[0];
					
					if(type == 0){
						// 显示预测胜率界面
						box_middle.setAttribute("hidden",true);
						box_footer.setAttribute("hidden",true);
						forecastBox.removeAttribute("hidden");
						document.getElementsByTagName("Title")[0].innerHTML = "专家预测";
					}else if(type == 1){
						// 隐藏预测胜率界面
						forecastBox.setAttribute("hidden",true);
						box_middle.removeAttribute("hidden");
						box_footer.removeAttribute("hidden");
						document.getElementsByTagName("Title")[0].innerHTML = "作品详情";
					}else if(type == 2){
						// 请求服务端
						vue.init_data.param.winRate = vue.processPoint;
						vue.init_data.param.evaluate = "我对“"+ vue.init_data.works.name +"”的胜率评估为" + vue.processPoint + "%。" + vue.model.evaluate;
						$.post("works/forecast.html",{
								json : encodeURI(JSON.stringify(vue.init_data.param))
							},
							function(res){
								if(res.success){
									alert("预测成功");
									// 隐藏预测胜率界面
									forecastBox.setAttribute("hidden",true);
									box_middle.removeAttribute("hidden");
									box_footer.removeAttribute("hidden");
									document.getElementsByTagName("Title")[0].innerHTML = "作品详情";
									// 清空滑动条
									vue.processPoint = 0;
									// 清空评论输入框
									vue.model.evaluate = "";
								}else{
									alert("网络异常,请稍后再试");
								}
							}
						);
					}
				},
				setUp: function(type){
					// 设定赔率
					var setUpBox = document.getElementsByClassName("setUp-mask")[0];
					var box_header = document.getElementsByClassName("box-header")[0];
					var box_middle = document.getElementsByClassName("box-middle")[0];
					var box_footer = document.getElementsByClassName("box-footer")[0];
					if(type == 0){
						vue.init_data.param.type = 1;
						$.post("works/setTheOdds.html",{
							 json : encodeURI(JSON.stringify(vue.init_data.param))
						 },function(res){
							 vue.setUp_result = res;
							 if(res.winRate == ""){
								 vue.setUp_result.down_winRate = "暂无专家预测胜率";
								 vue.setUp_result.up_winRate = "暂无专家预测胜率";
							 }else{
								 vue.setUp_result.down_winRate = (res.winRate / 100) + 1;
								 vue.setUp_result.up_winRate = res.winRate / 100
							 }
							 // 显示设定赔率界面
							 box_header.setAttribute("hidden",true);
							 box_middle.setAttribute("hidden",true);
							 box_footer.setAttribute("hidden",true);
							 setUpBox.removeAttribute("hidden");
							 document.getElementsByTagName("Title")[0].innerHTML = "设定赔率";
						});
					}else if(type == 1){
						vue.init_data.param.type = 2;
						
						if(!vue.model.setUp){
							alert("请输入赔率!");
							return;
						}
						
						if(vue.model.setUp < 1){
							vue.init_data.param.payRate =  vue.model.setUp * 100;	
						} else {
							vue.init_data.param.payRate =  vue.model.setUp;
						}
						
						$.post("works/setTheOdds.html",{
							 json : encodeURI(JSON.stringify(vue.init_data.param))
						 },function(res){
							alert("设定成功");
							// 更新作品详情显示的赔率
							vue.init_data.works.payRate = vue.init_data.param.payRate;
							// 完成后切换
							setUpBox.setAttribute("hidden",true);
							box_header.removeAttribute("hidden");
							box_middle.removeAttribute("hidden");
							box_footer.removeAttribute("hidden");
							vue.footer_buttons = '<div class="box-footer-oneButton">已成功设定赔率</div>';
							document.getElementsByTagName("Title")[0].innerHTML = "作品详情";
						});
					}
				},
				changeProcess: function(){
					var range = document.getElementById('processRange');
	        this.processPoint = range.value;
				},
				
				// 分享方法
				share: function () {
					  var obj = this.init_data;
					  obj.link = '<%=basePath%>works/getWorksDetail.html?json=' + encodeURI(JSON.stringify(obj.param));
					  obj.img = '<%=basePath%>picture/' + obj.imgs[0].image;
					  obj.desc = obj.works.name + '详情';
					  obj.title = '作品详情'; 
					  
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