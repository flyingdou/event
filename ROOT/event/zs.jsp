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
		<title>赠送</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="../css/mui.min.css" rel="stylesheet" />
		<style>
			.mui-bar-nav {
				background: white;
				line-height: 44px;
				box-shadow: none;
				-webkit-box-shadow: none;
			}
			
			.mui-icon-arrowleft,
			.mui-title {
				color: #666666;
			}
			
			input[type='submit'] {
				background: rgba(0, 0, 0, 0);
				border: none;
				color: #666666;
				height: 100%;
				font-size: 14px
			}
			
			input[type='tel'] {
				line-height: 21px!important;
				margin: 0!important;
				padding: 0!important;
				height: 21px;
				border: none!important;
				background: rgba(0, 0, 0, 0)!important;
				font-size: 14px;
				text-align: right;
			}
			
			input[type='tel']::-webkit-input-placeholder {
				font-size: 14px;
				text-align: right;
				color: #999999;
			}
			
			.mui-table-view-cell {
				font-size: 15px;
				color: #666666;
				height: 64px!important;
			}
			
			.mui-table-view-cell1>a:not(.mui-btn) {
				position: relative;
				display: block;
				overflow: hidden;
				margin: -0px -15px!important;
				padding: inherit;
				white-space: nowrap;
				text-overflow: ellipsis;
				color: inherit;
			}
			
			.mui-media-body {
				line-height: 42px;
			}
			
			.mr20 {
				margin-right: 20px;
			}
			
			.mr10 {
				margin-right: 10px;
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
				background-color: rgba(0, 0, 0, 0)
			}
			
			.mui-table-view:before {
				position: absolute;
				right: 0;
				bottom: 0;
				left: 0;
				height: 1px;
				content: '';
				-webkit-transform: scaleY(.5);
				transform: scaleY(.5);
				background-color: rgba(0, 0, 0, 0)
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
			
			textarea {
				font-size: 14px;
				color: #FBBF5F;
				background: rgba(0, 0, 0, 0);
				border: none;
			}
		</style>
	</head>

	<body>

		<div class="mui-content">
			<form action="" method="post">

				<header class="mui-bar mui-bar-nav">
					<a class="mui-action-back mui-icon mui-icon-arrowleft mui-pull-left"></a>
					<h1 class="mui-title">赠送</h1>
					<input type="submit" class="mui-pull-right" value="确定">
				</header>
				<div style="margin-top: 59px;">

					<ul class="mui-table-view">
						<li class="mui-table-view-cell mui-table-view-cell1 ">
							<a class="">
								赠送金额 <span class="mui-pull-right"><input type="tel" name="" id="" value=""placeholder="输入你要转赠的金额" /></span>
							</a>
						</li>
						<li class="mui-table-view-cell mui-media">
							<a href="javascript:;" class="mui-navigate-right">
								<div class="mui-media-body mui-pull-right mr20">
									阿飞的小蝴蝶
								</div>
								<img class="mui-media-object mui-pull-right mr10" src="http://placehold.it/40x30" style="border-radius: 50%;">
								<div class="mui-media-body">
									转让对象
								</div>
							</a>
						</li>
					</ul>

				</div>

				<textarea name="" rows="" cols="" placeholder="">注意事项：</textarea>

			</form>
		</div>
		<script src="../js/mui.min.js"></script>
		<script type="text/javascript">
			mui.init()
		</script>
	</body>
</html>