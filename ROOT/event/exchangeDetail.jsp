<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":"+ request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
<head>
<title>兑换详情</title>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<style>
	html,body{
		width:100%;
		height:100%;
		margin:0;
		padding:0;
	}
	body{
		background-color: #f0f0f2;
	}
	p{
		margin:0;
		padding:0;
	}
	input,textarea{
		outline: none;
	}
	.productImg{
		height:160px;
	}
	.productImg > img{
		width:100%;
		height:100%;
	}
	.productDetail{
		background-color:#fff;
		overflow: hidden;
	}
	.productName{
		float:left;
		width:60%;
		height:50px;
		margin:10px 0;
		padding:0 10px;
		border-right: 1px solid #bbb; 
	}
	.productPrice{
		float:left;
		width:30%;
		height:50px;
		margin:10px 0;
		line-height:50px;
		text-align: center;
	}
	.form{
		margin-top: 10px;
		background-color: #fff;
	}
	.form > ul, .form li{
		list-style: none;
		margin:0;
		padding:0;
	}
	.form li{
		border-top:1px solid #bbb;
	}
	.form-cell{
		height:30px;
		padding:10px !important;
		line-height:30px;
		overflow: hidden;
	}
	.form-cell > div{
		float:left;
		width:50%;
		color:#5c5b5c;
	}
	.form-cell-right{
		text-align: right;
	}
	.form-cell input{
		padding:0;
		height:20px;
		line-height:20px;
		font-size:13px;
		border:0;
		text-align: right;
	}
	.mobilphoneCode{
		width:80px;
	}
	.codeButton{
		width:80px;
		height:30px !important;
		line-height: 30px !important;
		background-color: #ffa726;
		color:#fff;
		border-radius:5px;
		text-align: center !important;
	}
	.form-textarea{
		margin-bottom:44px !important;
		padding:10px !important;
		color:#5c5b5c;
	}
	.address{
		width:80%;
		height:120px;
		border: 0;
		resize:none;
	}
	/*底部按钮*/
	.footer{
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
	.footer-goBack{
		width:20%;
		height: 100%;
		float: left;
	}
	.footer-buttons{
		width:100%;
		height: 100%;
		float:left;
		overflow:hidden;
		color: #fff;
	}
	.footer-oneButton{
		background-color: #ffa726;
		text-align: center;
	}
</style>
</head>
<body>
	<div class="wraper" id="wraper">
		<div class="productImg">
			<img :src="'picture/' + init_data.product.image">
		</div>
		<div class="productDetail">
			<div class="productName">
				<p style="height:30px;color:#555;">{{init_data.product.name}}</p>
				<p style="text-align: right;color:#aea4b9;font-size: 14px;">剩余{{init_data.product.count}}个</p>
			</div>
			<div class="productPrice"> 
				<span style="color:#ff5722;font-size: 30px;font-weight: bold;">{{init_data.product.funcoin}}</span>
				<span style="color:#a6a4a6;">FC</span>
			</div>
		</div>
		<div class="form">
			<ul>
				<li class="form-cell">
					<div>
						我的FunCoin : {{init_data.balance}}
					</div>
					<div class="form-cell-right">
					    剩余FunCoin : {{init_data.deBalance}}
					</div>
				</li>
				<li class="form-cell">
					<div>
						收货人
					</div>
					<div class="form-cell-right">
						<input type="text" placeholder="请输入姓名" v-model="model.memberName"/>
					</div>
				</li>
				<li class="form-cell">
					<div>
						手机
					</div>
					<div class="form-cell-right">
						<input type="number" placeholder="请输入手机" v-model="model.mobilephone" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/>
					</div>
				</li>
				<li class="form-cell">
					<div>
						验证码
					</div>
					<div class="form-cell-right">
						<input type="number" placeholder="输入验证码" class="mobilphoneCode" v-model="model.code" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/>
						<input type="button" class="codeButton" :disabled="codeButton.disabled" :value="codeButton.value" @click="getCode()">
					</div>
				</li>
				<li class="form-textarea">
					<p>收货地址</p>
					<div style="text-align: center;margin-top:10px;">
						<textarea placeholder="请输入详细地址" class="address" v-model="model.address"></textarea>
					</div>
				</li>
			</ul>
		</div>
		<div class="footer">
			<!-- <div class="footer-goBack" @click="goBack()">
				&lt; 返回
			</div> -->
			<div class="footer-buttons">
				<div class="footer-oneButton" @click="exchange()">兑换</div>
			</div>
		</div>
	</div>
<script src="event/js/vue.min.js"></script>
<script src="event/js/jquery.min.js"></script>
<script type="text/javascript">
	var vue = new Vue({
		el:"#wraper",
		data:{
			init_data:{
				product:{
					image:""
				},
				balance:0,
				deBalance:0
			},
			model:{},
			code:"",
			codeButton:{
				disabled:false,
				value:"点击获取"
			}
		},
		created:function(){
			// 获取商品详情
			var param = {
					id : sessionStorage.getItem("productId")
			}
			$.ajax({
				url:"product/productDetail.html",
				type:"post",
				data:{
					json:encodeURI(JSON.stringify(param))
				},
				dataType:"json",
				success:function(res){
					vue.init_data.product = res.product;
				}
			});
			// 获取用户余额
			$.ajax({
				url:"member/myWallet.html",
				type:"post",
				data:{},
				dataType:"json",
				success:function(res){
					vue.init_data.balance = res.balance;
					var deBalance = parseInt(vue.init_data.balance) - parseInt(vue.init_data.product.funcoin);
					vue.init_data.deBalance = deBalance < 0 ? 0 : deBalance;
				}
			});
			
			// 键盘弹起隐藏按钮
			var oHeight = $(".footer")[0].offsetTop;
			$(window).resize(function(){
		    if($(".footer")[0].offsetTop < oHeight){
		    	$(".footer").css("z-index","-1");
				} else {
		    	$(".footer").css("z-index","1");
				}
			});
		},
		methods:{
			goBack:function(){
				// 返回上个页面
				history.go(-1);
			},
			getCode:function(){
				$.post("message/sendMessage.html",{
						json : encodeURI(JSON.stringify({mobilephone:vue.model.mobilephone}))
					},function(result){
						if(result.success){
							vue.code = result.code;
							alert("验证码已发送至您的手机，请注意查收！");
							var x = 60;
							setTimeout(function(){
								x--;
								if( x > 0){ 
									vue.codeButton.disabled = true;
									vue.codeButton.value = "重新发送(" + x + ")";
									setTimeout(arguments.callee,1000);
								}else{
									vue.codeButton.disabled = false;
									vue.codeButton.value = "获取验证码";
									x = 60; 
								}
							},0);
						} else {
							alert(result.message);
						}
				});
			},
			exchange:function(){
				if(vue.init_data.product.count < 1){
					alert("抱歉!商品数量不足");
					return;
				}
				if(!vue.model.memberName || !vue.model.address){
					alert("请填写收货人和收货地址");
					return;
				}
				if(!vue.model.mobilephone){
					alert("请先验证手机号");
					return;
				}
				if(vue.code != vue.model.code){
					alert("验证码错误!");
					return;
				}
				// 调用服务端兑换商品接口
				vue.model.product = sessionStorage.getItem("productId");
				$.ajax({
					url:"product/exchange.html",
					type:"post",
					data:{
						json : encodeURI(JSON.stringify(vue.model))
					},
					dataType:"json",
					success:function(res){
						if(res.success){
							alert("您兑换该商品的申请已经发送成功。管理员审核通过后将寄出兑换产品，请注意查收。");
							history.go(-1);
						}else{
							alert(res.msg ? res.msg : "网络异常,请稍后再试");
						}
					}
				});
			}
		}
	});
</script>
</body>
</html>