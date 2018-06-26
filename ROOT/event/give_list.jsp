<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":"+ request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
<head>
<title>赠送对象</title>
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
		background-color: #fff;
	}
	ul,li{
		list-style: none;
		margin: 0;
		padding: 0;
	}
	input{
		outline: none;
	}
	/*搜索框*/
	.search-box{
		padding: 10px;
		background-color: #ccc;
	}
	.search{
		width:100%;
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
		top:25%;
		left:5px;
		width:16px;
		height:16px;
	}
	/*分隔条*/
	.split-line{
		height: 10px;
		background-color: #f0f0f2;
	}
	/*列表部分*/
	.member-list{
		border-bottom: 1px solid #bbb;
	}
	.member-li{
		padding: 10px;
		overflow: hidden; 
		border-top: 1px solid #bbb;
	}
	.member-photo{
		float: left;
		width: 40px;
		height: 40px;
	}
	.member-photo > img{
		width: 100%;
		height: 100%;
		border-radius: 50%;
	}
	.member-info{
		float: left;
		height: 40px;
		margin-left: 10px;
	}
	.select-radio{
		float: right;
		height: 40px;
		line-height: 40px;
	}
</style>
</head>
<body>
	<div class="wraper" id="wraper">
		<div class="search-box">
			<div class="search">
				<img src="event/img/search.png" class="icon-search">
				<input type="search" placeholder="搜索赠送对象" v-model="model.name" @keyup="search()"/>
			</div>
		</div>
		<div class="split-line"></div>
		<div>
			<ul class="member-list">
				<li class="member-li" v-for="(member,i) in memberList">
					<div class="member-photo">
						<img :src="'picture/'+member.image"/>
					</div>
					<div class="member-info">
						<span style="font-size: 14px;color:#5c5b5c;">{{member.nick}}</span><br/>
						<span style="font-size: 13px;color:#9c959c;">
							参加活动{{member.activeCount}}次 投票{{member.voteCount}}次 胜率{{member.probability}}%
						</span>
					</div>
					<div class="select-radio" @click="selected(i)">
						<input type="radio"/>
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
			memberList:[],
			model:{}
		},
		created:function(){
			$.get("member/selectGiveMembers.html",{
					
				},function(res){
					vue.memberList = res.memberList;
			});
		},
		methods:{
			selected:function(index){
				sessionStorage.setItem("member", JSON.stringify(this.memberList[index]));
				history.go(-1);
			},
			search:function(){
				$.get("member/selectGiveMembers.html",{
					json : encodeURI(JSON.stringify({name:vue.model.name}))
				},function(res){
					vue.memberList = res.memberList;
			});
			}
		}
	});
</script>
</body>
</html>