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
		<title>发布活动</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" href="event/css/mui.min.css" />
		<link rel="stylesheet" href="event/css/mui.picker.min.css" />
		
		
		<style type="text/css">
		
		
		 /* placehoder样式修改 */
			input::-webkit-input-placeholder, textarea::-webkit-input-placeholder { 
				color: #999999;
				font-size: 13px;
			
			} 
			
			input:-moz-placeholder, textarea:-moz-placeholder { 
				color: #999999;
				font-size: 13px;
			} 
			
			#submit {
				    background: #FB990E;
				    border: none;
				    color: white;
				    position: fixed;
				    bottom: 0;
				    left: 0;
				    height: auto;
				    width: 100%;
				    text-align: center;
				    line-height: 44px;
			}
			
			body {
				background: #f2f2f2;
			}
			.mui-content{
				background: #f2f2f2;
			}
			
			.mui-bar {
				background: white;
				box-shadow: none;
			}
			
			#picture {
				margin-top: 44px;
				display: block;
			}
			
			.mui-icon-arrowleft,
			.mui-title {
				color: #666666;
			}
			
			.thisP {
				position: absolute;
				top: 54px;
				left: 0;
				width: 100%;
				height: 100%;
				text-align: center;
				line-height: 160px;
				color: white;
				font-size: 17px;
			}
			
			.thisul .mui-table-view-cell {
				position: relative;
				overflow: hidden;
				padding: 11px 15px;
				-webkit-touch-callout: none;
			}
			
			.thisul .mui-table-view-cell a {
				color: black;
				font-size: 13px;
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
			#demo3,#demo4{
				height: 21px;
				line-height: 21px;
				font-size: 13px;
				color:#999999;
				margin: 0;
				padding: 0;
				text-align: right;
				border:none
			}
			textarea{
				margin-bottom:50px ;
				border:none
			}
			
			.usually{
			   float: right;
			   margin-right: 4%;
			   color: #999999;
			}
			
		  
		  .font2{
		     font-size: 13px;
		     color: #999999;
		  }
			
			
		</style>

	</head>

	<body>
		<div class="mui-content" id="dou" >
			<form action="" method="post">

				<a href="#picture" class="mui-btn mui-btn-primary mui-btn-block mui-btn-outlined" style="padding: 0;margin: 0;border:none;display: flex;justify-content: center;align-items: center;height: 200px;">
					<img id="headimg" src="event/img/cbd.jpg" style="margin: 0;width: 100%; display: none"/>
					<div id="defaultPicture" style="background: #94A1A7; width: 100%; height: 100%" ></div>
					<p class="thisP">选择你要上传的图片</p>
				</a>
				
				<!-- 隐藏的file框  -->
				<input id="dou-file" type="file" name="myfile" hidden="hidden"  onchange="uploadAndPreview()" />

				<div id="picture" class="mui-popover mui-popover-action mui-popover-bottom">
					<ul class="mui-table-view">
						<li class="mui-table-view-cell">
							<a href="javascript:selectPictures(1)">拍照</a>
						</li>
						<li class="mui-table-view-cell">
							<a href="javascript:selectPictures(2)">相册</a>
						</li>
					</ul>
					<ul class="mui-table-view">
						<li class="mui-table-view-cell">
							<a href ="javascript:selectPictures(0)"><b>取消</b></a>
						</li>
					</ul>
				</div>

				<ul class="mui-table-view thisul">
					<li class="mui-table-view-cell ">
						<a class="">
							活动名称 <span class="mui-pull-right" style="width: 50%;"><input class="font2" type="text" v-model="model.name" /></span>
						</a>
					</li>
					<li class="mui-table-view-cell">
						<a  href="javascript:void(0)">
							报名截止时间<span class="mui-pull-right" style="width: 50%;">
								<div id="demo4" data-options='{"type":"date","value":"2015-10-10","beginYear":2010,"endYear":2020}' class=" btn mui-btn mui-btn-block btn2 results dou_init_date"  >{{model.registrationDeadline}}</div>
							</span> 
						</a>	

					</li>
					<li class="mui-table-view-cell">
						<a  href="javascript:void(0)">
							投票截止时间<span class="mui-pull-right" style="width: 50%;">
								<div id='demo4' data-options='{"type":"date","value":"2015-10-10","beginYear":2010,"endYear":2020}' class="btn mui-btn mui-btn-block btn2 results dou_init_date"  >{{model.voteDeadline}}</div>
							</span>

						</a>
					</li>
					<li class="mui-table-view-cell">
						<a class="mui-navigate-right" href="event/decisionRule.jsp">
							成绩判定方式<span id = "refereeName" class="usually refereeType"></span>
						</a>
					</li>
						<li class="mui-table-view-cell">
						<a class="mui-navigate-right" href="event/invitingExperts.jsp" >
							邀请专家预测 <span class="usually expert">查看专家</span>
						</a>
					</li>
						<li class="mui-table-view-cell">
						<a class="mui-navigate-right" href = "event/voteRule.jsp" >
							投票结算规则<span id = "balanceName" class="usually balanceType"></span>
						</a>
					</li>
						<li class="mui-table-view-cell">
						<a class="">
							活动规则
						</a>
					</li>
				</ul>
				
				<textarea placeholder="请输入活动规则" v-model="model.remark" class="dou_remark font2" >
					
				</textarea>

			</form>
			
			<!-- 上传图片显示遮罩  -->
			<div class="mui-backdrop" hidden="hidden">
			      <div id="uploadding" style="margin-top: 10px; text-align: center; color: #fff;" ></div>
			</div>
			
			
			<div id = "submit"  class="mui-pull-right" onclick="launchActive()" >发布</div>
			
		</div>
<script src="event/js/mui.min.js"></script>
<script src="event/js/mui.picker.min.js"></script>
<script src="event/js/jquery.min.js"></script>
<script src="event/js/ajaxfileupload.js"></script>
<script src="event/js/vue.min.js" ></script>

<!-- 事件js -->
<script>

// 载入函数
$(function(){
	// 将已有的数据显示出来
	if (sessionStorage.getItem("posterDataUrl") != undefined) {
		$("#headimg").attr({"src":sessionStorage.getItem("posterDataUrl")});
		if (sessionStorage.getItem("posterDataUrl").indexOf("data") != -1) {
			$(".thisP").html("");
		}
		$("#headimg").show();
		$("#defaultPicture").hide();
	} else {
		$("#headimg").hide();
		$("#defaultPicture").show();
	}
	
	
	
	// 赋值vue变量, 如果有值vue自动渲染到页面
	douData.model = sessionStorage.pageData == undefined ? {} : JSON.parse(sessionStorage.pageData);
});


// vue全局变量，用来渲染当前页面的数据
var douData = new Vue({
	el:"#dou",
	data:{
		model:{}
	},
	created: function () {
		// onpageshow 处理页面显示时初始化的问题
		window.onpageshow = function() {
			// 已选的成绩判定方式
			
			var dou_decision = sessionStorage.decisionData == undefined ? {} : JSON.parse(sessionStorage.decisionData);
			
			// 已选的结算方式
			var dou_balance = sessionStorage.voteRule == undefined ? {} : JSON.parse(sessionStorage.voteRule);

			
			// 处理成绩判定方式
			if (dou_decision) {
				// 裁判判定成绩
				if ( dou_decision.decisionType == 0) {
					$("#refereeName").html("裁判判定成绩");
				}
				
				// 观众投票判定成绩
				if ( dou_decision.decisionType == 1) {
					$("#refereeName").html("观众投票判定成绩");
				}
			}
			
			// 处理结算方式
			if (dou_balance) {
				// 按注分润
				if (dou_balance.balanceType == 0) {
					$("#balanceName").html("按注分润");
				}
				
				// 按率分润
				if (dou_balance.balanceType == 1) {
					$("#balanceName").html("按率分润");
				}
			}
		}
		
		
		
		
		
		
		
	}
});

// 离开当前页面时执行的方法
window.onbeforeunload = function saveCurrentData() {
	 sessionStorage.pageData = JSON.stringify(douData.model);
 }
 




// 用户点击发布按钮，对所填信息进行校验，并发布活动
function launchActive (){
	// 校验当前页面中的数据
	var page = douData.model;
	
	// 活动海报校验
	if (page.poster == undefined) {
		alert("请上传活动海报！");
		return;
	}
	
	// 活动名称校验
	if (page.name == undefined) {
		alert("请填写活动名称！");
		return;
	}
	
	// 报名截止时间校验
	if (page.registrationDeadline.indexOf("请") != -1) {
		alert("请选择报名截止时间！");
		return;
	}
	
	// 投票截止时间校验
	if (page.voteDeadline.indexOf("请") != -1) {
		alert("请选择投票截止时间！");
		return;
	}
	
	
	
	// 成绩判定方式校验
	var decisionData = sessionStorage.getItem("decisionData");
	if (decisionData == undefined) {
		alert("请选择成绩判定方式！");
		return;
	}
	// 成绩判定方式为裁判时，获取裁判数据
	decisionData = JSON.parse(decisionData);
	if (decisionData != undefined && decisionData.decisionType == 0) {
		var referee = sessionStorage.getItem("refereeId");
		douData.model.referee = referee;
	}
	// 将成绩判定方式(通过校验的)数据放入当前页面
	douData.model.decisionType = decisionData.decisionType;
	douData.model.winCount = decisionData.winCount;
	
	// 专家数据校验，并转存到当前页面
	var experts = sessionStorage.getItem("experts");
	if (experts == undefined) {
		var isInvite = confirm("您暂未邀请专家, 是否邀请专家？");
		if (isInvite) {
			// 确定去邀请专家，跳转到邀请专家页面
			location.href = "event/invitingExperts.jsp";
			return;
		}
	}
	var expertids = [];
	
	if (experts != undefined) {
		JSON.parse(experts).forEach(function(item,i){
			expertids.push(item.id);
		});
	}
	douData.model.expertIds = expertids;
	
	// 投票结算规则校验，并转存到当前页面
	var voteRule = sessionStorage.getItem("voteRule");
	if (voteRule == undefined) {
		alert("请填写投票结算规则");
		return;
	}
	// 将数据转存到当前页面
	var voteData = JSON.parse(voteRule);
	douData.model.voteParise = voteData.pariseFuncoin;
	douData.model.betMin = voteData.minFuncoin;
	douData.model.balanceType = voteData.balanceType;
	
	// 活动规则校验
	if (page.remark == undefined) {
		alert("请填写活动规则！");
		return;
	}
	
	// 数据全部校验通过，提交数据到后台，发起活动
	$.ajax({
		url: "active/launch.html",
		type: "post",
		dataType:"json",
		data: {
			json: encodeURI(JSON.stringify(douData.model))
		},
		success: function (res) {
			if (res.success) {
				// 清空sessionStorage中存储的发布活动的所有数据
				clearLaunch();
				alert("发起活动成功，请在活动详情页点击右上角分享，邀请好友来参加。");
				location.href = "active/activeDetail.html?json="+encodeURI(JSON.stringify({id:res.id}));
			} else {
				alert("发起活动异常，原因：" + res.msg);
			}
		},
		error: function (e) {
			alert("网络异常！");
			return;
		}
		
	});
	
	
}

// 清空sessionStorage中存储的发布活动的所有数据
function clearLaunch() {
	sessionStorage.removeItem("decisionData");
	sessionStorage.removeItem("experts");
	sessionStorage.removeItem("pageData");
	sessionStorage.removeItem("posterDataUrl");
	sessionStorage.removeItem("voteRule");
	if (douData.model.decisionType == 0) {
		sessionStorage.removeItem("refereeId");
	}
}



 // 选择上传图片的方式
 function selectPictures(index) {
	 if (index == 1) {
		 // 拍照
		 $("#dou-file").attr({"accept":"image/*","capture":"camera"});
		 $("#dou-file").removeAttr("capture");
		 $("#dou-file").click();
		  setTimeout(function(){
			  mui('#picture').popover('hide');
		  },1000);
	 } else if ( index == 2 ) {
		 // 相册
		 $("#dou-file").attr({"accept":"","capture":""});
		 $("#dou-file").removeAttr("capture");
		 $("#dou-file").click();
		 setTimeout(function() {
			 mui('#picture').popover('hide');
		 }, 1000);
	 } else if (index == 0 ) {
		 // 取消
		 mui('#picture').popover('hide');
	 }
	 
 }
 
 
// 上传图片，并设置图片预览
  function uploadAndPreview () {
	// 读取文件
	var file = {
			path: $("#dou-file")[0].files[0],
			size: $("#dou-file")[0].files[0].size,
			subffix: $("#dou-file")[0].value.split(".")[1].toUpperCase()
	};
	
	// 显示图片上传中的遮罩
	$("#uploadding").html("图片正在上传中，请稍后...");
	$(".mui-backdrop").show();
	    
	    // 上传文件
	    if (file.size >0 ) {
	    	if (file.size > 10*1024*1024) {
	    		alert("请选择小于10M的图片！");
	    		$(".mui-backdrop").hide();
	    		return;
	    	} else if ( file.subffix != "JPG" && file.subffix != "PNG" && file.subffix != "JPEG" && file.subffix != "GIF" ){
	    		alert("图片类型必须是.gif,jpeg,jpg,png中的一种");
	    		$(".mui-backdrop").hide();
	    		return;
	    	} else {
	    		// 异步上传图片到服务器
	    		$.ajaxFileUpload({
	    			url: "uploadFile.html",
	    			type: "post",
	    			fileElementId: "dou-file",
	    			success: function (res) {
	    				res = JSON.parse($(res).text());
	    				if (res.success) {
	    					// 将返回的图片名存储起来
	    					var douPoster = res.picture.toString();
	    					douData.model.poster = douPoster;
	    					$(".mui-backdrop").hide();
	    					alert("图片上传成功！");
	    					var reader = new FileReader();
	    					reader.readAsDataURL(file.path);
	    					reader.onloadend = function () {
	    						$("#headimg").attr({"src": this.result});
	    						sessionStorage.posterDataUrl = this.result;
	    						$(".thisP").html("");
	    					}
	    					$("#headimg").show();
	    					$("#defaultPicture").hide();
	    				} else {
	    					alert("图片上传异常，原因：" + JSON.stringify(res.msg));
	    					$(".mui-backdrop").hide();
	    					$("#headimg").attr({"src": "event/img/cbd.jpg"});
	    					sessionStorage.posterDataUrl = "event/img/cbd.jpg";
	    					return;
	    				}
	    			},
	    			error: function (e) {
	    				
	    			}
	    		});
	    	}
	    	
	    }
	    
	    
}

 
 

		window.onload = function() {
			//处理处理默认时间
			var date1 = new Date();
			
			// 处理默认today
			var today = new Date(date1);
			today.setDate(date1.getDate()+7);
			
			// 默认显示当前日期7天后的时间
			var y = today.getFullYear();
			var M = today.getMonth() + 1;
			var d = today.getDate();
			M = add(M);
			d = add(d);

			function add(i) {
				if(i < 10) {
					i = "0"+ i;
				}
				return i;
			}
		    var time = y + "-" + M + "-" + d;
		    
		   if (douData.model.registrationDeadline == undefined) {
			   douData.model.registrationDeadline = time;
			   $(".dou_init_date").eq(0).html(time);
		   }
		   if (douData.model.voteDeadline == undefined) {
			   douData.model.voteDeadline = time;
			   $(".dou_init_date").eq(1).html(time);
		   }
		   
		   
		}
	
	
		mui.init();

	(function($) {
		$.init();
		
		var btns = $('.btn');
		btns.each(function(i, btn) {
			btn.addEventListener('tap', function() {
				var optionsJson = this.getAttribute('data-options') || '{}';
				var options = JSON.parse(optionsJson);
				var id = this.getAttribute('id');
				/*
				 * 首次显示时实例化组件
				 * 示例为了简洁，将 options 放在了按钮的 dom 上
				 * 也可以直接通过代码声明 optinos 用于实例化 DtPicker
				 */
				//var picker = new $.DtPicker(options);
				    var today=new Date();
               	   	var y = today.getFullYear() + 5;
			       	var M = 11;
			        var d = today.getDate();
					var picker = new $.DtPicker({//设置日历初始视图模式
						type: "date",//真正的月份比写的多一个月。  type的类型你还是可以选择date, datetime month time  hour 
               			beginDate:new Date(),//设置开始日期   
               			endDate: new Date(y, M, d)//设置结束日期    //真正的是10.21
					});
				
				
				picker.show(function(e) {
					/*
					 * rs.value 拼合后的 value
					 * rs.text 拼合后的 text
					 * rs.y 年，可以通过 rs.y.vaue 和 rs.y.text 获取值和文本
					 * rs.m 月，用法同年
					 * rs.d 日，用法同年
					 * rs.h 时，用法同年
					 * rs.i 分（minutes 的第二个字母），用法同年
					 */
	                var datetext=e.y.text+"-"+e.m.text+"-"+e.d.text;
					/* btn.innerText=datetext; 
					 * 给vue变量赋值
					 */
					if (i == 0) {
						jQuery(".dou_init_date").eq(0).html(datetext);
						douData.model.registrationDeadline = datetext;
					}
					if (i == 1) {
						jQuery(".dou_init_date").eq(1).html(datetext);
						douData.model.voteDeadline = datetext;
					} 
			     
					/* 
					 * 返回 false 可以阻止选择框的关闭
					 * return false;
					 */
					/*
					 * 释放组件资源，释放后将将不能再操作组件
					 * 通常情况下，不需要示放组件，new DtPicker(options) 后，可以一直使用。
					 * 当前示例，因为内容较多，如不进行资原释放，在某些设备上会较慢。
					 * 所以每次用完便立即调用 dispose 进行释放，下次用时再创建新实例。
					 */
					 picker.dispose();
				});
			}, false);
		}); 
	 })(mui);
		
		
</script>		
</body>
</html>