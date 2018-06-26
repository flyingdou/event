<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":"+ request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
<head>
<title>我的作品</title>
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
	.wraper{
		width:100%;
		height:100%;
	}
	.content > ul, .content li{
		list-style: none;
		margin: 0;
		padding: 0;
	}
	.content > ul{
		padding-bottom:30px;
		background-color: #fff;
	}
	.content li{
		width:94%;
		margin:0 auto;
		padding:10px 0;
		overflow: hidden;
		border-bottom: 1px solid #bbb;
	}
	.workImg{
		float:left;
		width: 94px;
		height: 70px;
		overflow: hidden;
	}
	.workImg > img{
		width: 100%;	
	}
	.workContent{
		float:left;
		margin-left: 10px;
	}
	.workSelector{
		float:right;
		height: 74px;
		line-height: 74px;
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
	<div class="wraper" id="works">
		<div class="content">
			<div style="text-align: center;padding:20px;text-align: center;" v-if="!init_data.myWorks || init_data.myWorks.length == 0">
				<img src="http://funcoin.cardcol.com/picture/wnr.png" style="opacity:0.5;width: 180px;height: 120px;">	
					<div style="margin-top: 10px;font-size: 12px;color:#545556;">暂无数据</div>		
			</div>
			
			<ul v-if="init_data.myWorks && init_data.myWorks.length != 0">
				<li v-for="(work,index) in init_data.myWorks">
					<div class="workImg">
						<img class="imgs" :src="'picture/'+ work.image" />
					</div>
					<div class="workContent">
						<p style="margin-top:3px;color:#525052;font-weight:bold;">{{work.name}}</p>
						<p style="margin-top:8px;color:#a6a4a6;font-size: 12px;">提交时间 : {{work.partakeDate}}</p>
						<p style="margin-top:8px;color:#8a8a8a;font-size: 12px;">
							{{work.remark == "" ? "暂无描述" : (work.remark.length > 14 ? work.remark.length.split(0,14) + "..." : work.remark)}}
						</p>
					</div>
					<div class="workSelector">
						<input type="radio" name="selector" :value="work.id" v-model="model.work"/>
					</div>
				</li>
			</ul>
			<div style="height:30px;"></div>
		</div>
		<div class="footer">
			<div class="footer-buttons">
				<div class="footer-oneButton" @click="submitWork()">提交参赛</div>
			</div>
		</div>
	</div>
	<script src="event/js/vue.min.js"></script>
	<script src="event/js/jquery.min.js"></script>
	<script type="text/javascript">
		var vue = new Vue({
			el:'#works',
			data:{
				init_data:[],
				model:{}
			},
			created:function(){
				$.post("member/myWorks.html",
					{},
					function(res){
						vue.init_data = res;
						if(res.myWorks.length > 0){
							vue.model.work = res.myWorks[0].id;
						}
						// 处理作品图片显示
						setTimeout(function(){
							$(".imgs").each(function(){
								var defaultHeight = 70;
								var imgHeight = $(this).height();
								if(imgHeight > defaultHeight){
									var deviation = 0 - ((imgHeight - defaultHeight) * 0.5);
									$(this).css({"margin-top": deviation + "px"});
								}
							});
						}, 200);
					}
				);
			},
			methods:{
				submitWork:function(){
					if(!vue.model.work){
						alert("请先选择作品,再进行发布!");
						return;
					}
					sessionStorage.setItem("workId", vue.model.work);
					location.href = "event/selectActive.jsp";
				}
			}
		});
	</script>
</body>
</html>