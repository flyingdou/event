<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":"+ request.getServerPort() + path + "/";
%>
		<!doctype html>
		<html>

		<head>
			<title>提交作品</title>
			<base href="<%=basePath%>">
			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
			<meta name="apple-mobile-web-app-capable" content="yes">
			<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
			<link rel="stylesheet" href="event/css/mui.min.css" />
			<style type="text/css">
				html,
				body {
					width: 100%;
					height: 100%;
					margin: 0;
					padding: 0;
				}

				body {
					background-color: #fff;
				}

				.wraper {
					height: 100%;
					background-color: #fff;
					overflow: scroll;
				}

				/*头部*/

				.box-header {
					overflow: hidden;
					height: 40px;
					line-height: 40px;
					border-bottom: 1px solid #bbb;
				}

				.box-header-left {
					width: 45%;
					height: 100%;
					float: left;
					margin-left: 10px;
					font-size: 13px;
				}

				.box-header-right {
					width: 45%;
					height: 100%;
					float: right;
					margin-right: 10px;
				}

				.box-header-right>input {
					background-color: transparent;
					border: 0;
					text-align: right;
					font-size: 13px;
				}

				/*图片上传*/

				.box-middle-imgsBox {
					padding-bottom: 10px;
					border-bottom: 1px solid #bbb;
				}

				.box-middle-imgsBoxTitle {
					margin: 10px;
					font-size: 14px;
				}

				.box-middle-imgs {
					overflow: scroll;
				}

				.box-middle-addImg {
					width: 100px;
					height: 100px;
					overflow: hidden;
					margin-left: 10px;
					float: left;
				}

				.box-middle-addImg>div {
					width: 50%;
					height: 50%;
					float: left;
					border: 1px solid #bbb;
				}

				.box-middle-img {
					position: relative;
					float: left;
					width: 133px;
					height: 100px;
					margin-left: 10px;
					overflow: hidden;
				}

				.box-middle-img-del {
					position: absolute;
					top: 0;
					right: 0;
					width: 30px;
					height: 30px;
				}

				.box-middle-img-content {
					width: 100%;
				}

				.box-middle-img>input {
					width: 100%;
					height: 20px;
					margin: 0;
					padding: 0;
					background-color: transparent;
					border: 0;
					text-align: center;
					font-size: 12px;
					color: #999;
				}

				/*视频上传*/

				.box-middle-voideBox {
					padding-bottom: 10px;
					border-bottom: 1px solid #bbb;
				}

				.box-middle-videoBoxTitle {
					margin: 10px;
					font-size: 14px;
				}

				.box-middle-videoBoxBody {
					margin: 0 10px;
					height: 40px;
					line-height: 40px;
					text-align: center;
				}

				.addVideo {
					color: #999;
				}

				.selectVideo {
					left: 0;
					right: 0;
				}

				.play-video {
					height: 300px;
					margin: 0 10px;
					padding-bottom: 10px;
				}

				/*作品简介*/

				.box-middle-remarkBox {
					height: 300px;
					padding-bottom: 10px;
				}

				.box-middle-remarkBoxTitle {
					margin: 10px;
					font-size: 14px;
				}

				.box-middle-remarkBoxBody {
					margin: 0 10px;
					height: 40px;
					line-height: 40px;
					text-align: left;
				}

				.box-middle-remarkContent {
					padding: 0 10px;
					height: 200px;
					overflow: scroll;
					font-size: 13px;
					color: #999;
					border: 0;
				}

				/*尾部*/

				.box-footer {
					position: fixed;
					bottom: 0;
					left: 0;
					width: 100%;
					height: 44px;
					line-height: 44px;
					text-align: center;
					background-color: #fff;
					overflow: hidden;
				}

				.box-footer-goBack {
					width: 20%;
					height: 100%;
					float: left;
					border: 1px solid #bbb;
				}

				.box-footer-releaseButton {
					width: 100%;
					height: 100%;
					float: left;
					background-color: #ffa726;
					color: #fff;
				}

				.icon-loading {
					position: absolute;
					top: 9.5px;
					left: auto;
					margin-left: -26px;
					width: 21px;
					height: 21px;
				}

				/*进度条*/

				.progress {
					position: fixed;
					top: 0;
					left: 0;
					width: 100%;
					height: 100%;
					background-color: rgba(0, 0, 0, .3);
					text-align: center;
				}

				#progressBar {
					margin-top: 70%;
					width: 80%;
				}
			</style>
		</head>

		<body>
			<div class="wraper" id="work">
				<div class="box-header">
					<div class="box-header-left">
						作品名称
					</div>
					<div class="box-header-right">
						<input type="text" placeholder="输入名称" v-model="model.workName" />
					</div>
				</div>
				<div class="box-middle">
					<div class="box-middle-imgsBox">
						<div class="box-middle-imgsBoxTitle">上传作品图片</div>
						<div class="box-middle-imgs">
							<div style="width:1330px;overflow: hidden;" id="photos">
								<a href="javascript:void(0)" class="box-middle-img" v-for="(item,i) in showImgList">
									<img class="box-middle-img-del" src="event/img/fc-cut.png" @click="deleteImg(i)" />
									<img :id="'img'+i" :src="item" class="box-middle-img-content" />
								</a>
								<div class="box-middle-addImg" onclick="selectPicture()">
									<div></div>
									<div style="border-left:0;"></div>
									<div style="border-top: 0;"></div>
									<div style="border-top: 0;border-left:0;"></div>
									<input type="file" hidden="hidden" id="uploadPicture" name="myfiles" onchange="uploadPicture()" />
								</div>
							</div>
						</div>
					</div>
					<div class="box-middle-voideBox">
						<div class="box-middle-videoBoxTitle">上传作品视频</div>
						<div class="box-middle-videoBoxBody" v-if="video == ''">
							<a href="javascript:addVideo()" class="addVideo">
								<span class="mui-icon mui-icon-videocam"></span>
							</a>
							<input type="file" hidden="hidden" id="uploadVideo" onchange="uploadVideo(this)" />
						</div>
						<div class="play-video" v-if="video != ''">
							<video :src="video" width="100%" height="100%" controls preload></video>
						</div>
					</div>
					<div class="box-middle-remarkBox">
						<div class="box-middle-remarkBoxTitle">作品简介</div>
						<div class="box-middle-remarkBoxBody">
							<textarea placeholder="请输入作品简介" class="box-middle-remarkContent" v-model="model.remark"></textarea>
						</div>
					</div>
				</div>
				<div class="box-footer">
					<div class="box-footer-releaseButton" onclick="submitWork()">
						<span>提交参赛作品</span>
					</div>
				</div>
				<div class="progress" hidden="hidden">
					<progress id="progressBar" :value="value" max="100"></progress>
				</div>
			</div>
			<script src="event/js/jquery.min.js"></script>
			<script src="event/js/mui.min.js"></script>
			<script src="event/js/vue.min.js"></script>
			<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
			<script src="//imgcache.qq.com/open/qcloud/js/vod/sdk/ugcUploader.js"></script>
			<script type="text/javascript">
				var vue = new Vue({
					el: "#work",
					data: {
						model: {},
						showImgList: [],
						imgs: [],
						video: '',
						value: 0
					},
					created: function () {
						// 监控手机软键盘弹起
						var oHeight = $(document).height();
						$(window).resize(function () {
							if ($(document).height() < oHeight) {
								$(".box-footer").css("z-index", "-1");
							} else {
								$(".box-footer").css("z-index", "1");
							}
						});

						// 生成签名准备调用微信jsapi
						$.post("wechat/sign.html", {
							url: location.href.split('#')[0]
						}, function (sign) {
							sign = JSON.parse(sign);
							wx.config({
								debug: false,
								appId: sign.appid,
								timestamp: sign.timestamp,
								nonceStr: sign.nonceStr,
								signature: sign.signature,
								jsApiList: [
									"chooseImage",
									"uploadImage",
									"downloadImage"
								]
							});
						});
					},
					methods: {
						// 删除图片
						deleteImg: function (i) {
							if (!confirm("是否确认删除?")) {
								return;
							}
							var remove = imgsList => {
								var arr = [];
								imgsList.forEach((item, index) => {
									if(i != index) {
										arr.push(item);
									}
								});
								return arr;
							}

							vue.showImgList = remove(vue.showImgList);
							vue.imgs = remove(vue.imgs);

							if (vue.showImgList.length < 9 && vue.imgs.length < 9) {
								$(".box-middle-addImg").show();
							}
						}
					}
				});

				// 图片选择和上传
				function selectPicture() {
					// 调用微信的选择相册和上传接口
					wx.chooseImage({
						count: 9, // 默认9
						sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
						sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
						success: function (res) {
							// 显示上传遮罩
							$(".progress").show();
							// 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
							var localIds = res.localIds;
							var percentage = (1 / localIds.length) * 100
							var index = 0;

							function upload() {
								if (index <= localIds.length) {
									wx.uploadImage({
										localId: localIds[index], // 需要上传的图片的本地ID，由chooseImage接口获得
										isShowProgressTips: 0, // 默认为1，显示进度提示
										success: function (res) {
											var serverId = res.serverId; // 返回图片的服务器端ID
											// 加载进度条上传进度
											if (index == localIds.length - 1) {
												vue.value = 100;
												$(".progress").hide();
												vue.value = 0;
											} else {
												vue.value += percentage;
											}
											// 图片上传达到上限,去掉上传按钮
											if (vue.showImgList.length >= 9 || vue.imgs.length >= 9) {
												$(".box-middle-addImg").hide();
											}
											if (vue.showImgList.length < 9 && vue.imgs.length < 9) {
												// 保存上传成功的图片名称
												vue.imgs.push(serverId);
												vue.showImgList.push(localIds[index]);
												// 处理作品图片显示
												setTimeout(function () {
													var defaultHeight = 133;
													var imgHeight = $(imgId).height();
													if (imgHeight > defaultHeight) {
														var deviation = 0 - ((imgHeight - defaultHeight) * 0.5);
														$(imgId).css({
															"margin-top": deviation + "px"
														});
													}
												}, 200);
											}
											index++;
											upload();
										}
									});
								}
							};
							upload();
						}
					});
				}

				// 选择视频
				function addVideo() {
					var uploadVideo = document.querySelector("#uploadVideo");
					$(uploadVideo).attr({
						"accept": "video/*"
					});
					$(uploadVideo).removeAttr("capture");
					uploadVideo.click();
				}

				// 生成腾讯云服务签名
				var getSignature = function (callback) {
					//获取客户端上传签名的 URL
					$.ajax({
						url: 'getUploadSignature.html',
						type: 'POST',
						dataType: 'text',
						success: function (result) {
							//result 是派发签名服务器的回包
							//假设回包为 { "code": 0, "signature": "xxxx"  }
							//将签名传入 callback，SDK 则能获取这个上传签名，用于后续的上传视频步骤。
							callback(result);
						}
					});
				};

				// 视频上传
				function uploadVideo(file) {
					// 显示上传遮罩
					$(".progress").show();
					// 加载进度
					setTimeout(function () {
						if (vue.value < 90) {
							vue.value += 10;
							setTimeout(arguments.callee, 1000);
						}
					}, 1000);
					// 开始上传
					var videoFile = file.files[0];
					qcVideo.ugcUploader.start({
						videoFile: videoFile, //视频，类型为 File
						getSignature: getSignature, //前文中所述的获取上传签名的函数
						error: function (result) { //上传失败时的回调函数
							//...
							alert('上传失败的原因：' + result.msg);
						},
						finish: function (result) {
							//上传成功时的回调函数
							//alert('上传结果的fileId：' + result.fileId);
							//alert('上传结果的视频名称：' + result.videoName);
							//alert('上传结果的视频地址：' + result.videoUrl);
							vue.model.video = result.videoUrl;
							vue.video = result.videoUrl;
							// 加载满进度, 并隐藏上传遮罩
							vue.value = 100;
							$(".progress").hide();
							vue.value = 0;
						}
					});
				}

				// 提交参赛作品 
				function submitWork() {
					// 请求服务端的参数 
					var param = {
						activeId: sessionStorage.getItem("activeId"),
						name: vue.model.workName,
						imgs: vue.imgs,
						video: vue.model.video,
						remark: vue.model.remark
					}

					//检查参数
					if (param.name == undefined) {
						alert("请填写作品名称!");
						return;
					}
					if (param.remark == undefined) {
						param.remark = "";
					}

					//请求服务端
					$.ajax({
						url: "works/releaseWorks.html",
						type: "post",
						data: {
							json: encodeURI(JSON.stringify(param))
						},
						dataType: "json",
						success: function (res) {
							if (res.success) {
								alert("发布成功!");
								location.href = "event/works.jsp";
							} else {
								alert("网络异常,请稍后再试");
							}
						},
						error: function (e) {
							//alert(JSON.strinify(e));
						}
					});
				}
			</script>
		</body>

		</html>