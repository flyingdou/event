<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":"+ request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
<head>
<title>funcoin兑换</title>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<style type="text/css">
	html,body{
		width:100%;
		height:100%;
		margin:0;
		padding:0;
	}
	body{
		background-color: #fff;
	}
	p{
		margin:0;
		paddin:0;
	}
	.wraper{
		width:100%;
		height:100%;
	}
	.nav{
		overflow: hidden;
		height: 50px;
		line-height: 50px;
	}
	.goBack{
		float:left;
		width:20%;
		text-align: center;
	}
	.icon-back{
		width:16px;
		height: 16px;
		margin-bottom: -3px;
	}
	.search{
		float:left;
		width:60%;
		text-align: center;
		position: relative;
	}
	.search > input{
		width:90%;
		height:30px;
		padding-left:24px;
		border-radius:5px;
		border:0;
	}
	.icon-search{
		position: absolute;
		top:35%;
		left:5px;
		width:16px;
		height:16px;
	}
	.submitButton{
		float:left;
		width:20%;
		text-align: center;
		color:#ff9800;
	}
	.content > ul, .content li{
		list-style: none;
		margin:0;
		padding:0;
	}
	.content li{
		padding:10px 10px;
		overflow: hidden;
		border-bottom: 1px solid #bbb;
		background-color: #fff;
	}
	.productImg{
		float:left;
	}
	.productImg > img{
		width:94px;
		height:70px;	
	}
	.productContent{
		float:left;
		margin-left:10px;
		width:69%;
		height:73px;
	}
	.productName{
		width:100%;
		height: 45%;
		padding-top:3px;
	}
	.exchangePrice{
		float:left;
		height:30px;
		line-height:30px;
		color:#bbb5c5;
		font-size:14px;
	}
	.exchangeButton{
		float:right;
		width:80px;
		height:30px;
		line-height:30px;
		text-align:center;
		border-radius:5px;
		color:#fff;
		background-color: #ff7043;
		text-decoration: none;
	}
</style>
</head>
<body>
	<div class="wraper" id="products">
		<div class="content">
			<div style="text-align: center;padding:20px;text-align: center;" v-if="!init_data.productList || init_data.productList.length == 0">
				<img src="http://funcoin.cardcol.com/picture/wnr.png" style="opacity:0.5;width: 180px;height: 120px;">	
					<div style="margin-top: 10px;font-size: 12px;color:#545556;">暂无数据</div>		
			</div>
			<ul>
			 	<li v-for="(product,i) in init_data.productList">
					<div class="productImg">
						<img :src="'picture/'+product.image" />
					</div>
					<div class="productContent">
						<div class="productName">
							{{product.name}}
						</div>
						<div style="width:100%;overflow: hidden;">
							<div class="exchangePrice">{{product.funcoin}}FC</div>
							<a class="exchangeButton" href="javascript:void(0)" @click="exchangeDetail(i)">兑换</a>
						</div>
					</div>
			 	</li>
			 </ul>
		</div>
	</div>
	<script src="event/js/vue.min.js"></script>
	<script src="event/js/jquery.min.js"></script>
	<script type="text/javascript">
		var vue = new Vue({
			el:"#products",
			data:{
				init_data:0
			},
			created:function(){
				$.post("product/listProduct.html",
					{},
					function(res){
						vue.init_data = res;
				});
			},
			methods:{
				exchangeDetail:function(i){
					var productId = vue.init_data.productList[i].id;
					sessionStorage.setItem("productId", productId);
					location.href="event/exchangeDetail.jsp";
				}
			}
		});
	</script>
</body>
</html>