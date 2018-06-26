<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":"+ request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
<head>
<title>选择活动</title>
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
		background-color: #f0f0f2;
	}
	p{
		margin:0;
		paddin:0;
	}
	input{
		outline: none;
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
		margin-left: 60px;
		text-align: center;
		position: relative;
	}
	.search > input{
		width:100%;
		height:30px;
		padding-left:24px;
		border-radius:5px;
		border:0;
	}
	.icon-search{
		position: absolute;
		top:37%;
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
	.content > ul{
		border-bottom: 1px solid #bbb;
	}
	.content li{
		padding:10px 10px;
		overflow: hidden;
		border-top: 1px solid #bbb;
		background-color: #fff;
	}
	.activeImg{
		float:left;
	}
	.activeImg > img{
		width:94px;
		height:70px;	
	}
	.activeContent{
		float:left;
		margin-left: 10px;
	}
	.activeSelector{
		float:right;
		height: 74px;
		line-height: 74px;
	}
</style>
</head>
<body>
	<div class="wraper" id="wraper">
		<div class="nav">
			<!-- <div class="goBack">
				<img src="event/img/back.png" class="icon-back" onclick="javascript:history.go(-1)">
			</div> -->
			<div class="search">
				<img src="event/img/search.png" class="icon-search">
				<input type="search" placeholder="搜索活动" v-model="model.activeName" @keyup="searchActive()"/>
			</div>
			<div class="submitButton" @click="submitWork()">
				确定
			</div>
		</div>
		<div class="content">
			 <ul>
			 	<li v-for="(active,i) in activeList">
					<div class="activeImg">
						<img :src="'picture/' + active.poster" />
					</div>
					<div class="activeContent">
						<p style="margin-top:3px;color:#525052;font-weight:bold;">{{active.name}}</p>
						<p style="margin-top:8px;color:#8a8a8a;font-size: 12px;">
							获胜名额 : {{active.win_count}}   &nbsp;&nbsp;观众投票判定成绩
						</p>
					</div>
					<div class="activeSelector">
						<input type="checkbox" name="selector" :value="active.id" v-model="model.activeList"/>
					</div>
			 	</li>
			 </ul>
		</div>
	</div>
	<script src="event/js/vue.min.js"></script>
	<script src="event/js/jquery.min.js"></script>
	<script type="text/javascript">
		var vue = new Vue({
			el:"#wraper",
			data:{
				activeList:0,
				model:{
					activeList:[]
				}
			},
			created:function(){
				var param = sessionStorage.getItem("workId"); 
				$.ajax({
					url:"active/searchActive.html",
					type:"post",
					data:{
						json : encodeURI(JSON.stringify({workId:param}))
					},
					dataType:"json",
					success:function(res){
						vue.activeList = res.activeList;
					}
				});
			},
			methods:{
				searchActive:function(){
					vue.model.workId = sessionStorage.getItem("workId");
					$.ajax({
						url:"active/searchActive.html",
						type:"post",
						data:{
							json:encodeURI(JSON.stringify(vue.model))
						},
						dataType:"json",
						success:function(res){
							vue.activeList = res.activeList;
						}
					});
				},
				submitWork:function(){
					// 判断是否最少选择了一个活动
					if(vue.model.activeList.length == 0){
						alert("请先选择活动!");
						return;
					}
					// 请求服务端
					var param = sessionStorage.getItem("workId");
					this.model.workId = param;
					$.ajax({
						url:"works/releaseWorksFromMyWorks.html",
						type:"post",
						data:{
							json:encodeURI(JSON.stringify(vue.model))
						},
						dataType:"json",
						success:function(res){
							if(res.success){
								alert("发布成功!");
								var json = {
										workId : vue.model.workId,
										activeId : sessionStorage.getItem("activeId")
								}
								sessionStorage.setItem("json", encodeURI(JSON.stringify(json)));
								location.href = "event/workDetail.jsp";
							}else{
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