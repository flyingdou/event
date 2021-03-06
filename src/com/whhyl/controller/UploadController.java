package com.whhyl.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.whhyl.util.commentsUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import sun.misc.BASE64Encoder;

/**
 * 上传文件
 * 
 * @author Administrator
 *
 */
@Controller
public class UploadController {

	/**
	 * 腾讯云点播服务SECRETID
	 */
	private final String SECRETID = "AKIDFwY5QaLbS5b9WKvc1EF6Sr4BAQc5fLnA";
	/**
	 * 腾讯云点播服务SECRETKEY
	 */
	private final String SECRETKEY = "vlP0oZtV4m5GGBzzvnhljVjv1KXfbWM1";
	/**
	 * 加密类型
	 */
	private final String HMAC_ALGORITHM = "HmacSHA1";
	/**
	 * 编码格式
	 */
	private final String CONTENT_CHARSET = "UTF-8";
	
	/**
	 * 上传单个文件
	 * 
	 * @param request
	 * @param response
	 * @param myfile
	 */
	@RequestMapping("/uploadFile")
	@ResponseBody
	public JSONObject uploadFile(@RequestParam MultipartFile myfile, HttpServletRequest request) {
		JSONObject result = new JSONObject();
		try {
			// 这里的路径(可以自定义)是tomcat安装路径/webapps/项目名/picture/
			String filePath = "D:/java/picture";
			// 获取图片上传的文件路径
			File picFile = new File(filePath);
			// 判断文件是否存在,如果不存在就创建
			if (!picFile.isDirectory()) {
				picFile.mkdir();
			}
			// 需要返回的文件名
			String originalFilename = null;
			// 生成新的文件名
			originalFilename = commentsUtil.getNewFileName(myfile.getOriginalFilename());
			// 这里不必处理IO流关闭的问题,因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉
			// 此处也可以使用Spring提供的MultipartFile.transferTo(File dest)方法实现文件的上传
			FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(filePath, originalFilename));
			// 图片压缩
			commentsUtil.compress(filePath + "/" +originalFilename);
			result.accumulate("success", true).accumulate("picture", originalFilename);
		} catch (Exception e) {
			e.printStackTrace();
			result.accumulate("success", false).accumulate("msg", e.getMessage());
		}
		return result;
	}

	/**
	 * 多文件上传
	 * 
	 * @param request
	 * @param response
	 * @param myfiles
	 * @return
	 */
	@RequestMapping("/uploadFiles")
	@ResponseBody
	public JSONObject uploadFiles(@RequestParam MultipartFile[] myfiles, HttpServletRequest request) {
		JSONObject result = new JSONObject();
		try {
			// 这里的路径(可以自定义)是tomcat安装路径/webapps/项目名/picture/
			String filePath = "D:/java/picture";
			// 获取图片上传的文件路径
			File picFile = new File(filePath);
			// 判断文件是否存在,如果不存在就创建
			if (!picFile.isDirectory()) {
				picFile.mkdir();
			}
			// 存储多个图片路径
			List<String> picPaths = new ArrayList<String>();
			// 需要返回的文件名
			String originalFilename = null;
			for (MultipartFile myfile : myfiles) {
				// 生成新的文件名
				originalFilename = commentsUtil.getNewFileName(myfile.getOriginalFilename());
				// 这里不必处理IO流关闭的问题,因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉
				// 此处也可以使用Spring提供的MultipartFile.transferTo(File dest)方法实现文件的上传
				FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(filePath, originalFilename));
				picPaths.add(originalFilename); // 添加当前上传的图片路径
			}
			result.accumulate("success", true).accumulate("picList", JSONArray.fromObject(picPaths));
		} catch (Exception e) {
			e.printStackTrace();
			result.accumulate("success", false).accumulate("msg", e.getMessage());
		}
		return result;
	}
	
	/**
	 * 获取腾讯云点播服务上传签名
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getUploadSignature")
	@ResponseBody
	public String getUploadSignature() throws Exception {
		// 最终签名
		String strSign = "";
		// 签名参数
		String contextStr = "";
		// 当前时间戳
		long currentTime = System.currentTimeMillis() / 1000;
		// 随机字符串(随机32位数字)
		int random = Integer.valueOf(commentsUtil.getRandom(32));
		// 有效时长(固定)
		final int signValidDuration = 7776000;
		// 签名失效时间
		long endTime = (currentTime + signValidDuration);

		// 拼接参数(进行签名)
		contextStr += "secretId=" + java.net.URLEncoder.encode(SECRETID, "utf8");
		contextStr += "&currentTimeStamp=" + currentTime;
		contextStr += "&expireTime=" + endTime;
		contextStr += "&random=" + random;
		try {
			Mac mac = Mac.getInstance(HMAC_ALGORITHM);
			SecretKeySpec secretKey = new SecretKeySpec(this.SECRETKEY.getBytes(CONTENT_CHARSET), mac.getAlgorithm());
			mac.init(secretKey);
			byte[] hash = mac.doFinal(contextStr.getBytes(CONTENT_CHARSET));
			byte[] sigBuf = byteMerger(hash, contextStr.getBytes("utf8"));
			strSign = new String(new BASE64Encoder().encode(sigBuf).getBytes());
			strSign = strSign.replace(" ", "").replace("\n", "").replace("\r", "");
		} catch (Exception e) {
			throw e;
		}
		return strSign;
	}

	/**
	 * 加密
	 * 
	 * @param byte1
	 * @param byte2
	 * @return
	 */
	public static byte[] byteMerger(byte[] byte1, byte[] byte2) {
		byte[] byte3 = new byte[byte1.length + byte2.length];
		System.arraycopy(byte1, 0, byte3, 0, byte1.length);
		System.arraycopy(byte2, 0, byte3, byte1.length, byte2.length);
		return byte3;
	}
}
