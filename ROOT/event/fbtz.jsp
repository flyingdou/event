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
		<title>发布帖子</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="../css/mui.min.css" rel="stylesheet" />
		<style>
			.mui-bar{
				background: white;
			}
			.mui-icon{
				color:#666666;
                font-size: 14px!important;
                line-height: 27px;
			}
			textarea{
				margin-top: 59px;
				margin-bottom: 0px;
				border:none;
			}
			textarea::-webkit-input-placeholder{
				font-size: 13px;
				
			}
			.box{
				display: flex;
				justify-content: flex-start;
				background: white;
				margin-top:-5px!important;
			}
			.item{
				padding: 10px 10px;
			}
			.item img{
				width: 18px;
			}
		</style>
	</head>
	<body>
		<header class="mui-bar mui-bar-nav">
		    <a class=" mui-icon  mui-pull-left">取消</a>
		   
		     <a class=" mui-icon  mui-pull-right">发布</a>
		</header>
		
		<textarea name="" rows="10" cols=""placeholder="多行输入"></textarea>
		<div class="box">
			<div class="item"><img src="../images/表情 (1).png"/></div>
			<div class="item"><img src="../images/图片.png"/></div>
		</div>
		<script src="../js/mui.min.js"></script>
		<script type="text/javascript">
			mui.init()
		</script>
	</body>
</html>