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
		<title>选择专家</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="event/css/mui.min.css" rel="stylesheet" />
		<script src="event/js/mui.min.js"></script>
		<script src="event/js/jquery.js"></script>
		<script src="event/js/vue.min.js"></script>
		
		
		
<style>
			.mui-search:before {
				font-size: 20px;
				right: auto;
				left: 5px;
				display: block;
				margin-right: 0;
				font-weight: 400;
				position: absolute;
				top: 50%;
				margin-top: -12px;
				;
				content: "\e466";
				color: #999999;
			}
			
			.mui-icon-search:before {
				content: '';
			}
			
			.searchbox {
				position: relative;
				margin: 0px 10px 0px 10px;
			}
			
			input[type='search'] {
				background: rgba(0, 0, 0, 0);
				border: 1px solid #eaeaea;
				color: #666666;
				font-size: 13px;
				margin-bottom: 1px;
			}
			
			.mui-search .mui-placeholder {
				font-size: 14px;
				line-height: 44px;
				position: absolute;
				z-index: 1;
				top: 0;
				right: 0;
				bottom: 0;
				left: 0;
				display: inline-block;
				height: 34px;
				text-align: left;
				text-indent: 2em;
				color: #999;
				border: 0;
				border-radius: 6px;
				background: 0 0;
			}
			
			.mui-bar {
				display: flex;
				display: -webkit-flex;
				justify-content: space-between;
				background: white;
			}
			input[type=submit]{
				background: rgba(0,0,0,0);
				border:none;
				color:#666666;
			}
			.bgw {
				width: 80%;
				margin: 0 auto;
				align-self: center;
			}
			
			.mui-icon-arrowleft {
				color: #666666;
			}
			
			body {
				background: #f2f2f2;
			}
			
			.mui-table-view-cell.mui-checkbox input[type=checkbox],
			.mui-table-view-cell.mui-radio input[type=radio] {
				top: 22px;
			}
			
			.mui-checkbox input[type=checkbox]:checked:before {
				content: '\e442';
				border-radius: 50%;
				font-size: 14px;
			}
			
			.mui-checkbox input[type=checkbox]:checked:before,
			.mui-radio input[type=radio]:checked:before {
				color: #FBBF5F;
				background: #FBBF5F;
			}
			
			.mui-checkbox input[type=checkbox]:before,
			.mui-radio input[type=radio]:before {
				font-family: Muiicons;
				font-size: 16px;
				font-weight: 400;
				line-height: 1;
				text-decoration: none;
				color: #FBBF5F;
				border-radius: 0;
				background: 0 0;
				-webkit-font-smoothing: antialiased;
			}
			
			.mui-checkbox input[type=checkbox],
			.mui-radio input[type=radio] {
				position: absolute;
				top: 4px;
				right: 10px;
				display: inline-block;
				width: 20px;
				height: 26px;
				border: 0;
				outline: 0!important;
				background-color: transparent;
				-webkit-appearance: none;
			}
			
			.mui-table-view .mui-media-object {
				border-radius: 50%;
			}
			
			.mui-table-view:before {
				position: absolute;
				right: 0;
				top: 0;
				left: 0;
				height: 1px;
				content: '';
				-webkit-transform: scaleY(.5);
				transform: scaleY(.5);
				background-color: rgba(0, 0, 0, 0);
			}
			
			.mui-table-view:after {
				position: absolute;
				right: 0;
				bottom: 0;
				left: 0;
				height: 1px;
				content: '';
				-webkit-transform: scaleY(.5);
				transform: scaleY(.5);
				background-color: rgba(0, 0, 0, 0);
			}
			
			.mui-table-view-cell:after {
				position: absolute;
				right: 0;
				bottom: 0;
				left: 0px;
				height: 1px;
				content: '';
				-webkit-transform: scaleY(.5);
				transform: scaleY(.5);
				background-color: #eaeaea;
			}
			
			.mui-media-body {
				font-size: 14px;
				color: #666666;
			}
			
			.mui-media-body p {
				font-size: 12px;
				color: #999999
			}
			
			#pullrefresh{
				margin-top: 59px;
			}
			
			.dou-checkbox-div{
			   float:right;
			   height: 42px;
			   line-height: 42px;
			   margin-top: -42px;
			   }
</style>

</head>
	<body>
		<div class="mui-content" id = "app">
			<header class="mui-bar mui-bar-nav">
				<div class="bgw">
					<div class="mui-input-row mui-search searchbox ">
						<input type="search" v-model = "model.name"  class="mui-input-clear" placeholder="搜索专家" onchange="search()" />
					</div>
				</div>
				<input type="submit" name="" id="" value="确定" onclick="saveExpert()" />
			</header>
			
			<div id="pullrefresh" class="mui-content mui-scroll-wrapper">
				<div class="mui-scroll">
					<ul class="mui-table-view">
					
						<li class="mui-table-view-cell mui-media mui-checkbox mui-right" v-for = "(v,i) in memberList">
							<a href="javascript:;" class="">
								<img class="mui-media-object mui-pull-left" v-bind:src="'picture/'+v.image" />
								<div class="mui-media-body">
									{{v.nick}}
									<p class="mui-ellipsis">投票{{v.voteCount | NAAN}}次，投注{{v.betCount | NAAN}}次</p>
									<div class = "dou-checkbox-div">
								         <input class = "dou-checkbox" name="expert" type="checkbox" v-model = "model.expertIds" :value = "i" dou="v.id" />
								         <input class = "dou-checkbox-value" type="hidden" :value = "v.id" >
									</div>
								</div>
							</a>
						 </li>
						

					</ul>

				</div>

			</div>

		</div>

<script type="text/javascript">
     var currentExperts = sessionStorage.getItem("experts") == undefined ? [] : JSON.parse(sessionStorage.getItem("experts")); 

     // 载入函数，加载页面时，需要将已被选中的用户选中
     $(function(){
    	 
    	 var values = $(".dou-checkbox-value");
    	 // 当前已被选中的用户
    	 for (var int = 0; int < currentExperts.length; int++) {
    		 
    		// 页面中展示的用户
			for(var x = 0; x < values.length; x++ ){
				
				// 如果两者id相同，则在页面中选中当前用户
				if ( currentExperts[int].id == $(values[x]).val() ){
					$(values[x]).prev().click();
				}
			}
		}
    	 
    	 
    	 
     })
	
	 var dou = ${json.memberList == undefined ? 0 : json.memberList};
	 var members = new Vue({
		 el:"#app",
		 data: {
			 memberList: dou,
			 model:{
				 expertIds:[]
				 
				 
			 }
		 },
		 filters: {
			 NAAN: function (value) {
				 if (null == value || "null" == value || undefined == value) {
					 value = 0;
					 return value;
				 } else {
					 return value;
				 }
			 }
		 }
		
	 });
	 
	 //用户在搜索框输入用户的名字，进行模糊查询
	 function search(){
		 var searchName = encodeURI(JSON.stringify(members.model));
		 $.ajax({
			 url: "member/selectMembersByName.html",
			 type: "POST",
			 data: {
				    "json":searchName
				   },
		     dataType:"json",
		     success: function (dou){
		    	 //改变member.memberList中的值，然后vue自己动态的渲染页面
		    	 members.memberList = dou.memberList;
		     },
		     error: function (e){
		    	 alert(JSON.stringify(e));
		     }
		 });
	 }
	 
	 //当用户点击确定按钮时，将当前专家的信息存到js对象中
	 function saveExpert(){
		 // 当前已被选中的专家的radio的下标
		 var expertIds = members.model.expertIds;
		 
		 // 当前页面选中，且符合条件的用户，存入此数组
		 var expertList = [];
		 // 当前已被选中的裁判
		 var refereeId = sessionStorage.refereeId == undefined ? "0" : sessionStorage.refereeId;
		 
		 for (var int = 0; int < expertIds.length; int++) {
			 var expertId = JSON.parse(expertIds[int]);
			// 与当前已被选中的裁判做互斥
			 if (parseInt(refereeId) == parseInt(members.memberList[expertId].id)){
				 alert(" [ " + members.memberList[expertId].nick + " ] 已被选为本活动裁判，请重新选择！");
				 return;
			 }
			 
			//将符合条件的用户，存入js中
			 expertList.push(members.memberList[expertId]);
		 };
		 sessionStorage.experts = JSON.stringify(expertList);
		 history.go(-1);
	 }
	 
	
</script>



<script type="text/javascript">
			mui.init({
				swipeBack: false,
				pullRefresh: {
					container: '#pullrefresh',
					down: {
						callback: pulldownRefresh
					},
					up: {
						contentrefresh: '正在加载...',
						callback: pullupRefresh
					}
				}
			});

			function pulldownRefresh() {
				setTimeout(function() {
					mui('#pullrefresh').pullRefresh().endPulldownToRefresh(); //refresh completed
				}, 1000);
			}
			var count = 0;
			/**
			 * 上拉加载具体业务实现
			 */
			function pullupRefresh() {
				setTimeout(function() {
					mui('#pullrefresh').pullRefresh().endPullupToRefresh((++count > 2)); //参数为true代表没有更多数据了。
				}, 1000);
			}
		</script>
	

	</body>
</html>