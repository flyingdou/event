<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":"+ request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
<head>
<title>投注赢家</title>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
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
	
	.member-list{
		margin: 0;
		padding: 0;
		list-style: none;
	}
	
	.member-li{
		padding: 20px;
		list-style: none;
		overflow: hidden;
		border-bottom: 3px solid #E5E5E5;
	}
	
	.member-li:last-child {
		border-bottom: 0;
	}
	
	.member-photo{
		float: left;
		margin-right: 10px;
		width: 40px;
		height: 40px;
	}
	
	.member-photo > img{
		width: 100%;
		height: 100%;
		border-radius: 50%;
	}
	
	.member-nick{
		float: left;
	}
	
	.get-funcoin{
		float: right;
		height: 40px;
		line-height: 40px;
		font-size: 16px;
		color: #FF9800;
	}
</style>
</head>
<body>
	<div class="wraper" id="wraper">
		<div class="member-list-box">
			<div style="text-align: center;padding:20px;text-align: center;" v-if="!init_data.memberList || init_data.memberList.length == 0">
				<img src="http://funcoin.cardcol.com/picture/wnr.png" style="opacity:0.5;width: 180px;height: 120px;">	
					<div style="margin-top: 10px;font-size: 12px;color:#545556;">暂无数据</div>		
			</div>
			<ul class="member-list">
				<li class="member-li" v-for="(item,i) in init_data.memberList" >
					<div class="member-photo">
						<img :src="'pciture/' + item.image">
					</div>
					<div class="member-nick">
						<div style="font-size: 16px;">item.name</div>
						<div style="font-size: 12px;color:#AAA;margin-top: 3px;">参加活动{{item.activeCount}}次 , 投票{{item.voteCount}}次</div>
					</div>
					<div class="get-funcoin">
						赢得{{item.funcoin}}FC
					</div>
				</li>
			</ul>
		</div>
	</div>
	<script src="event/js/jquery.min.js"></script>
	<script src="event/js/vue.min.js"></script>
	<script type="text/javascript">
		var vue = new Vue({
			el: "#wraper",
			data: {
				init_data: {}
			},
			created: function(){
				var activeId = sessionStorage.getItem("activeId");
				$.post("works/listWinnerByActiveId.html",{
						json: encodeURI(JSON.stringify({activeId:activeId}))
					},function(res){
						vue.init_data = res;
				});
			}
		});
	</script>
</body>
</html>