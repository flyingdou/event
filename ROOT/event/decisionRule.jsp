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
		<title>成绩判定方式</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="event/css/mui.min.css" rel="stylesheet" />
		<script src="event/js/mui.min.js"></script>
		<script src="event/js/vue.min.js"></script>
		<script src="event/js/jquery.min.js"></script>
		<script src="event/js/dou.js" ></script>
		
		
		<style>
			body {
				background: #f2f2f2;
			}
			
			input::-webkit-input-placeholder { /* WebKit browsers */ 
				font-size:15px;
				color:#999999;
			} 
			input:-moz-placeholder { /* Mozilla Firefox 4 to 18 */ 
				font-size:15px;
				color:#999999;
			} 
			input::-moz-placeholder { /* Mozilla Firefox 19+ */ 
				font-size:15px;
				color:#999999;
			} 
			input:-ms-input-placeholder { /* Internet Explorer 10+ */ 
				font-size:15px;
				color:#999999;
			} 
			
			
			.mui-bar {
				background: white;
			}
			
			.mui-icon-arrowleft,
			.mui-title {
				color: #666666;
			}
			
			
			.thisul .mui-table-view-cell {
				position: relative;
				overflow: hidden;
				padding: 11px 15px 11px 25px;
				-webkit-touch-callout: none;
			}
			
			.thisul .mui-table-view-cell a {
				color: black;
				font-size: 13px;
			}
			
			.mui-radio {
				font-size: 15px;
				color: #666666;
			}
			
			input[type=text] {
				margin: 0!important;
				padding: 0!important;
				height: 21px;
				line-height: 21px;
				text-align: right;
				border: none;
				background: rgba(0, 0, 0, 0);
				font-size: 13px;
				color: #99999!important;
			}
			
			input[type=text]::-webkit-input-placeholder {
				color: #999999;
				font-size: 12px;
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
			
			.mui-table-view:before {
				position: absolute;
				right: 0;
				left: 0;
				height: 1px;
				content: '';
				-webkit-transform: scaleY(.5);
				transform: scaleY(.5);
				background-color: rgba(0, 0, 0, 0);
				top: -1px;
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
			
			.box {
				display: flex;
				justify-content: flex-start;
				flex-wrap: wrap;
				width: 100%;
				box-sizing: border-box;
				background: white;
				padding: 0px 15px;
				overflow: hidden;
			}
			
			.item {
				padding: 10px;
				text-align: center;
			}
			
			.item img {
				width: 44px;
				height: 44px;
				border-radius: 50%;
			}
			
			
			
			input[type=submit] {
				height: 44px;
				background: rgba(0, 0, 0, 0);
				border: none;
				color: #999999;
			}
			
			#dou-header{
			   margin-top:5px;
			   padding-left: 10px;
			   padding-right: 0px;
			}
			
			#dou-win{
			   float: left;
			   height:44px;
    		   line-height: 44px;
			}
			
			#win_count{
			  float: right;
			  width: 50%;
			  margin-right: 10px;
			}
			
			#winCount{
			   float: right;
			   height: 44px;
			   width:50%;
			   line-height: 44px;
			   margin: 0;
			   padding: 0;
			   border: none;
			   text-align: center;
			}
			
			.dou-li{
			   padding-right: 12px;
			}
			
			.dou-ruleText{
			   font-size: 15px;
			}
			
			.dou-radio{
			  position: absolute;
			  left:10px;
			  line-height: 44px;
			  margin-top: 5px;
			}
			
			.dou-radio-text{
			    margin-left: 20px;
			}
			
			.dou-select-referee{
				float:right;
			    right: 10px;
			}
			
			.dou-select-gt{
			    float:right;
			    color: #989898;
			}
			body{
			   position: relative;
			}
			
			.dou-footer{
			   position: fixed;
			   bottom: 0;
			   height: 40px;
			   width: 100%;
			}
			
			.dou-sure-div{
			  float: left;
			  width: 100%;
			  height: 100%;
			}
			
			.dou-sure{
			  color: white;
			  width: 100%;
			  height: 100%;
			  border: none;
			  background-color: #FE970F;
			  
			}
			
			
			.font1{
			    font-size: 13px;
			    color: black;
			}
			
			.font2{
			   font-size: 13px;
			   color: #999999;
			}
		</style>
	</head>
	<body>
		<div class="mui-content" id = "app">
				<header class="mui-bar mui-bar-nav" id = "dou-header" >
					<div style="text-align: center;">
					      <div id="dou-win" class="font1" >获胜名额：</div><div id="win_count">
					      		<input type="number" name="winCount" id="winCount" class = "font2" placeholder="输入获胜名额" v-model = "model.winCount" onchange="saveWinCount()" />
					      </div>
					</div>
				</header>

   <div>
				<ul class="mui-table-view" style="margin-top: 55px;">
				    <li class = "mui-table-view-cell mui-left">
				       <span class = "dou-ruleText font1">成绩判定方式</span>
				    </li>
					<li class="mui-table-view-cell  mui-right dou-li" onclick="changeDecisionType()" >
						<input name="radio" type="radio" class="dou-radio" v-model = "model.decisionType" value = "0"/>
						<span class="dou-radio-text font1">由裁判判定成绩</span>
						<span class = "dou-select-referee font2" id = "refereeNick" onclick="selectReferee()"><span class="jqqqqq">{{model.refereeNick}}</span>&nbsp;&nbsp;&nbsp;<p class = "dou-select-gt">&gt;</p></span>
					</li>
					<li class="mui-table-view-cell  mui-right" >
						<input name="radio" type="radio" class="dou-radio" checked="checked" v-model = "model.decisionType" value = "1"/>
						<span class="dou-radio-text font1">观众投票判定成绩</span>
					</li>
				</ul>
				
		</div>	
<div class = "dou-footer">
	    <div class=  "dou-sure-div">
	        <button  class = "dou-sure" onclick="saveDecisionRule()">确定</button>
	    </div>
</div>

</div>

<script type="text/javascript">
    
    
    //存储的当前页面的数据
    var decisionPage = sessionStorage.decisionData;
    
    // Vue 对象
    var decisions = new Vue({
    	el:"#app",
    	data:{
    		model: {
    			decisionType:"1"
    		}
    	},
    	created: function(){
    		window.onpageshow = function () {
		    		if(sessionStorage.decisionData){
		    			decisions.model.decisionType = JSON.parse(sessionStorage.decisionData)['decisionType'];
		       			decisions.model.winCount = JSON.parse(sessionStorage.decisionData)['winCount'];
		       		}
		       		
		       		// 裁判名称
		       		var refereeNick = sessionStorage.getItem("refereeNick");
		           	if (sessionStorage.getItem("refereeNick")) {
		           		decisions.model.refereeNick = JSON.parse(refereeNick);
						$(".jqqqqq").html(JSON.parse(refereeNick));
		           	} else {
						decisions.model.refereeNick = "选择裁判";
		           	}
    		  }
        	
    		
    		
    	}
    	
    	
    	
    	
    	
    });
    
    // 当用户填完获胜名额以后，将数据存起来
    function saveWinCount(){
			sessionStorage.decisionData = JSON.stringify(decisions.model);
    }
    
    function changeDecisionType () {
    	decisions.model.decisionType = 0;
    	sessionStorage.decisionData = JSON.stringify(decisions.model);
    }
    
    
    //当用户点击选择裁判时，去后台查询裁判数据
	function selectReferee(){
		location.href = "member/selectMembers.html";
	}
	
    //当用户点击确定时，将页面数据存储起来，并返回上一页面
	function saveDecisionRule(){
		var winCount = decisions.model.winCount;
		var decisionType = decisions.model.decisionType;
		var refereeId = sessionStorage.getItem("refereeId");
		if ( winCount == null || winCount == undefined || "0" == winCount) {
			alert("请填写大于0的获胜名额！");
			return;
		}
		
		if (decisionType == null || decisionType == undefined ) {
			alert("请选择裁判方式！");
			return;
		} else {
			
				// 用户选择了裁判判定成绩，但暂未选定裁判
			if (decisionType == "0") {
				if (refereeId == undefined || refereeId == "") {
					alert("您选择了裁判判定成绩，但暂未选定裁判，请选择裁判！");
					return;
				}
			}
			
			
		}
		
		//将当前页面的数据存储起来
		sessionStorage.decisionData = JSON.stringify(decisions.model);
		history.go(-1);
	}
	
	
</script>
	</body>
</html>