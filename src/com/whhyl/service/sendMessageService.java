package com.whhyl.service;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

/**
 * 短信业务逻辑层
 * @author Administrator
 *
 */
public interface sendMessageService {

	/**
	 * 发送短信
	 * @param obj
	 * @return
	 */
	public JSONObject getMobileCode(HttpServletRequest request, JSONObject obj);
	
	
}
