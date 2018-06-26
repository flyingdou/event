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
		<title>图像修改</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<script type="text/javascript" src="../js/common.js"></script>
		<link href="../css/mui.min.css" rel="stylesheet" />
		<style>
			body{
				background: #f2f2f2;
			}
			.mui-bar{
				background: white;
			}
			.mui-icon-arrowleft,.mui-title{
				color:#666666;
			}
			.imgbox{
				margin: 0 auto;
				width: 300px;
				height: 300px;
				display:flex;
				background: url(../images/60x60.gif)no-repeat scroll 0 0/100% auto;
				margin-top: 100px;
				justify-content: center;
				align-items: center;
				box-sizing: border-box;
				overflow: hidden;
			}
		</style>
	</head>
<script type="text/javascript">
	
	
	
</script>
	<body>
		<div class="mui-content">
		    <header class="mui-bar mui-bar-nav">
		        <a class="mui-action-back mui-icon mui-icon-arrowleft mui-pull-left"></a>
		        <h1 class="mui-title">图像</h1>
		    </header>
		    
		    <div class="imgbox ">
		    	<a href="#picture" class="mui-btn mui-btn-primary mui-btn-block mui-btn-outlined" style="0;">
		    		<img src="../images/cbd.jpg"/>
		    	</a>
		       
		    </div>
		    
		    <div id="picture" class="mui-popover mui-popover-action mui-popover-bottom">
			<ul class="mui-table-view">
				<li class="mui-table-view-cell">
					<a href="#">拍照</a>
				</li>
				<li class="mui-table-view-cell">
					<a href="#">相册</a>
				</li>
			</ul>
			<ul class="mui-table-view">
				<li class="mui-table-view-cell">
					<a href="#picture"><b>取消</b></a>
				</li>
			</ul>
		</div>
		   
		</div>
		<script src="../js/mui.min.js"></script>
		<script type="text/javascript" src="../js/immersed.js" ></script>
		<script type="text/javascript">
			mui.init();
		
			    			
				mui('body').on('shown', '.mui-popover', function(e) {
			//console.log('shown', e.detail.id);//detail为当前popover元素
		});
		mui('body').on('hidden', '.mui-popover', function(e) {
			//console.log('hidden', e.detail.id);//detail为当前popover元素
		});
		var info = document.getElementById("info");
		mui('body').on('tap', '.mui-popover-action li>a', function() {
			var a = this,
				parent;
			//根据点击按钮，反推当前是哪个actionsheet
			for (parent = a.parentNode; parent != document.body; parent = parent.parentNode) {
				if (parent.classList.contains('mui-popover-action')) {
					break;
				}
			}
			//关闭actionsheet
			mui('#' + parent.id).popover('toggle');
			alert("你刚点击了\"" + a.innerHTML + "\"按钮");
			
			if(a.innerText=="拍照"){
				getImage() 
			}else if(a.innerText=="相册"){
				getImage() 
			}
		})
		
		function getImage() {
    var cmr = plus.camera.getCamera();
    cmr.captureImage( function (p) {
        plus.io.resolveLocalFileSystemURL( p, function ( entry ) {    
            var localurl = entry.toLocalURL();//
            $("#report").html('<img src="'+localurl+'">');
            cutImg();
            mui('#picture').popover('toggle');
        });
    });
}
//相册选取
function galleryImgs(){
    plus.gallery.pick( function(e){
        $("#report").html('<img src="'+e.files[0]+'">');
        cutImg();
        mui('#picture').popover('toggle');
    }, function ( e ) {
        //outSet( "取消选择图片" );
    },{filter:"image",multiple:true});
}
		</script>
	</body>
</html>