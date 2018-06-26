package com.whhyl.controller;

import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whhyl.service.sendMessageService;

import net.sf.json.JSONObject;

/**
 * 短信controller
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/message")
public class SendMessageController {
	
	
	@Autowired
	sendMessageService sendMessage;
	
	

	/**
	 * 发送短信验证码
	 * @return
	 */
	@RequestMapping("/sendMessage")
	@ResponseBody
	public JSONObject sendMessage(HttpServletRequest request, String json) {
		JSONObject ret = new JSONObject();
		try {
			// 处理前台传过来的参数
			JSONObject obj = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			ret = sendMessage.getMobileCode(request, obj);
		} catch (Exception e) {
			e.printStackTrace();
			ret.accumulate("success", false)
			   .accumulate("message", e)
			   ;
		}
		return ret;
	}
	
	
	
}
