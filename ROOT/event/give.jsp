<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":"+ request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
<head>
<title>赠送</title>
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
	input{
		outline: none;
	}
	.form{
		margin-top: 10px;
		background-color: #fff;
		border-bottom: 1px solid #bbb;
	}
	.form-li{
		overflow: hidden;
		padding: 10px 10px;
		border-top: 1px solid #bbb;
	}
	.form-li > div{
		float: left;
		width: 50%;
	}
	.form-li-right{
		text-align: right;
	}
	.form-row1-left{
		height: 40px;
		line-height: 40px;
	}
	.member-photo{
		float: right;
		width: 40px;
		height: 40px;
		margin-right: 10px;
	}
	.member-photo > img{
		width: 100%;
		height: 100%;
		border-radius: 50%;
	}
	.member-nick{
		float: right;
		height: 40px;
		line-height: 40px;
		color: #bdbdbd;
	}
	.amount{
		outline: none;
		width: 80px;
		text-align: center;
	}
	.remark{
		outline: none;
		width: 90%;
		height: 50px;
		overflow: scroll;
		padding: 2px;
		resize: none;
		border: 1px solid #bbb;
	}
	.buttons{
		overflow: hidden;
		padding: 10px 10px;
	}
	.button-success{
		float: right;
		width: 80px;
		height: 30px;
		line-height: 30px;
		text-align: center;
		color: #fff;
		background-color: #ff9800;
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
	.button-cancel{
		float: right;
		width: 80px;
		height: 30px;
		line-height: 30px;
		margin-right: 20px;
		text-align: center;
		color: #555;
		background-color: #fff;
		border-radius: 5px;
	}
</style>
</head>
<body>
	<div class="wraper" id="wraper">
		<ul class="form">
			<li class="form-li from-row1">
				<div class="form-row1-left">
					赠送对象
				</div>
				<div class="form-li-right" onclick="location.href='event/give_list.jsp'">
					<div class="member-nick">
						{{toMember.nick}}  >
					</div>
					<div class="member-photo">
						<img :src="'picture/'+toMember.image"/>
					</div>
				</div>
			</li>
			<li class="form-li">
				<div>
					赠送金额
				</div>
				<div class="form-li-right">
					<input type="number" class="amount" placeholder="输入金额" v-model="model.funcoin" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
				</div>
			</li>
			<li class="form-li">
				<div>
					备注 : 
				</div>
				<div class="form-li-right">
					<textarea class="remark" placeholder="输入备注" v-model="model.remark"></textarea>
				</div>
			</li>
		</ul>
		<div class="buttons">
			<div class="button-success" @click="give()">确定</div>
			<div class="button-cancel" onclick="history.go(-1)">取消</div>
		</div>
	</div>
	<script src="event/js/vue.min.js"></script>
	<script src="event/js/jquery.min.js"></script>
	<script type="text/javascript">
		var vue = new Vue({
			el:"#wraper",
			data:{
				toMember:{image:"user.jpg",nick:"请选择用户"},
				model:{},
				status:0
			},
			created:function(){
				window.onpageshow = function(){
					if(sessionStorage.getItem("member")){
						vue.toMember = JSON.parse(sessionStorage.getItem("member"));
					}
				}
			},
			methods:{
				give : function(){
					// 状态:1,正在请求服务端,不需要重复执行
					if(this.status == 1){
						alert("正在处理中,请稍候后...");
						return;
					}
					// 赠送
					if(!this.toMember.id || !this.model.funcoin){
						alert("请选择赠送用户和填写赠送金额");
						return;
					}
					
					// 状态:1,正在请求服务器,更改状态为1
					this.status = 1;
					// 请求服务端生成赠送订单
					var param = {toMember:this.toMember.id,funcoin:this.model.funcoin,remark:this.model.remark}
					$.post("product/give.html",{
							json : encodeURI(JSON.stringify(param))
						},function(res){
							// 状态0,服务器执行完毕,更改状态为0
							vue.status = 0;
							if(res.success){
								alert("赠送成功!");
								history.go(-1);
							} else {
								if(res.msg){
									alert(res.msg);
								} else {
									alert("网络异常,请稍后再试!");
								}
							}
					});
				}
			}
		});
	</script>
</body>
</html>