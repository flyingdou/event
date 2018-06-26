<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":"+ request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
<head>
<title>充值</title>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<style type="text/css">
	html,body{
		width: 100%;
		height: 100%;
		margin: 0;
		padding: 0;
	}
	body{
		background-color: #f0f0f2;
	}
	ul,li{
		list-style: none;
		margin: 0;
		padding: 0;
	}
	/*用户信息模块*/
	.member-info{
		overflow: hidden;
		height: 80px;
		line-height: 80px;
		margin-top: 10px;
		padding: 0 10px;
		background-color: #fff;
		border-top: 1px solid #bbb;
		border-bottom: 1px solid #bbb;
	}
	.member-photo{
		float: left;
		width: 60px;
		height: 60px;
		margin-top: 10px;
	}
	.member-photo > img{
		width: 100%;
		height: 100%;
		border-radius: 50%;
	}
	.member-nick{
		float: right;
		color: #bdbdbd;
	}
	/*用户充值模块*/
	.recharge-box{
		margin-top:20px;
		padding:0 4%;
	}
	.balance{
		color: #bdbdbd;
	}
	.recharge-list{
		overflow: hidden;
		margin-top: 10px;
	}
	.recharge-li{
		float: left;
		width: 21.4%;
		height: 30px;
		line-height: 30px;
		margin-right: 4%;
		background-color: #fff;
		text-align: center;
		border: 1px solid #bbb;
		border-radius: 5px;
	}
	.last-li{
		margin-right: 0;
	}
	.select-active{
		color: #ff9800;
		border-color: #ff9800;
	}
	.amount{
		width: 98%;
		height: 22px;
		line-height: 22px;
		padding: 2 0px;
		text-align: center;
		border: 0;
		outline:none;
	}
	.wechat-pay{
		margin-top: 20px;
		font-size: 13px;
	}
	.payment{
		height: 34px;
		line-height: 34px;
		margin-top: 20px;
		background-color: #ff9800;
		text-align: center;
		color: #fff;
		border-radius: 5px;
		position: relative;
	}
	.icon-loading{
		position: absolute;
		top : 6.5px;
		left : auto;
		margin-left: -26px;
		width: 21px;
		height: 21px;
	}
	.message-title{
		margin-top: 20px;
		color: #a6a4a6;
		font-size: 14px;
	}
	.message{
		margin-top: 10px;
		color: #a6a4a6;
		font-size: 14px;
	}
</style>
</head>
<body>
	<div class="wraper" id="wraper">
		<div class="member-info">
			<div class="member-photo">
				<img :src="'picture/'+memberInfo.image"/>
			</div>
			<div class="member-nick">
				{{memberInfo.nick}}
			</div>
		</div>
		<div class="recharge-box">
			<div class="balance">余额 : {{memberInfo.balance == null ? 0 : memberInfo.balance}}FC</div>
			<ul class="recharge-list">
				<li :class="classes.row1" @click="switchActive(0)">100FC</li>
				<li :class="classes.row2" @click="switchActive(1)">500FC</li>
				<li :class="classes.row3" @click="switchActive(2)">1000FC</li>
				<li :class="classes.row4" @click="switchActive(3)">
					<input type="text" class="amount" placeholder="其他数额" v-model="model.money" @keyup="amount()" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
				</li>
			</ul>
			<div class="wechat-pay">
				微信支付 : <span style="margin-left:26px;color:#ff9800;">{{ money | moneyFilter }}元</span>
			</div>
			<div class="payment" @click="payment()">
				<span v-if="status == 0">确认支付</span>
				<span v-if="status == 1"><img class="icon-loading" src="event/img/loading.gif"/>正在处理中,请稍后</span>
			</div>
			<div class="message-title">
				温馨提示 : 
			</div>
			<div class="message">
			  FC仅用于本项目中 ，不能兑换现金 ，不能进行转账交易。
			</div>
		</div>
	</div>
	<script src="event/js/vue.min.js"></script>
	<script src="event/js/jquery.min.js"></script>
	<script type="text/javascript">
		var vue = new Vue({
			el:"#wraper",
			data:{
				memberInfo:{image:"1.jpg"},
				options:[
				  {selector:"row1",fc:100},
				  {selector:"row2",fc:500},
				  {selector:"row3",fc:1000},
				  {selector:"row4",fc:0}
				],
				selected : "select-active",
				classes : {},
				active : 0,
				money : 0,
				rate : 10,
				model : {},
				status : 0
			},
			created:function(){
				// 获取用户基本信息
				$.get("member/memberInfoAjax.html",{
					
					},function(res){
						vue.memberInfo = res.memberInfo;
				});
				
				// 页面初始化
				this.switchActive(0);
			},
			methods:{
				switchActive:function(index){
					// 充值按钮状态切换并计算价格
					this.active = index;
					this.classes = {
						row1 : ["recharge-li"],
						row2 : ["recharge-li"],
						row3 : ["recharge-li"],
						row4 : ["recharge-li","last-li"]
					}
					this.classes[this.options[index].selector].push(this.selected);
					if(index == 3 && this.model.money){
						this.amount();
					} else {
						this.money = this.options[index].fc / this.rate;
					}
				},
				amount:function(){
					// 计算价格
					this.money = this.model.money / this.rate;
				},
				payment:function(){
					// 状态:1,正在请求服务端,不需要重复执行
					if(this.status == 1){
						return;
					}
					// 未输入金额,提示用户,输入金额则更新金额
					if(this.active == 3 && !this.model.money){
						alert("请输入金额!");
						return;
					} else if(this.active == 3){
						this.money = this.model.money / this.rate;
					} 
					// 状态:1,正在请求服务器,更改状态为1
					this.status = 1;
					$.post("order/Recharge.html",{
							json : encodeURI(JSON.stringify({money : vue.money}))
						},function(res){
							if(res.success){
								// 订单生成后执行微信支付逻辑
								$.post("wechat/paySign.html",{
										orderId : res.orderId
									},function(res){
										// 状态0,服务器执行完毕,更改状态为0
										vue.status = 0;
										// 微信公众号的支付逻辑
										res = JSON.parse(res);
										if (res.success) {
											WeixinJSBridge.invoke('getBrandWCPayRequest',
												{
													appId : res.appId,
													timeStamp : res.timeStamp,
													nonceStr : res.nonceStr,
													package : res.packageValue,
													signType : res.signType,
													paySign : res.paySign
												},
												function(res) {
													if (res.err_msg == "get_brand_wcpay_request:ok") {
														alert('充值成功!');
														location.href = "event/wdqb.jsp";
													} else if (res.err_msg == "get_brand_wcpay_request:cancel") {
														alert("已取消支付!");
													} else {
														alert("支付失败,原因:" + JSON.stringify(res));
													}
												});
										} else {
											alert(JSON.stringify(res));
										}
								});
							} else {
								alert("网络异常,请稍后再试!");
							}
					});
				}
			},
			filter:{
				moneyFilter:function(value){
					// 通用金额过滤器,金额小于0返回0,金额大于0返回原金额
					return value < 0 ? 0 : value;
				}
			}
		});
	</script>
</body>
</html>