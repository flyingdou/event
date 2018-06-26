package com.whhyl.service;

import javax.servlet.http.HttpServletRequest;

import com.whhyl.entity.Member;

import net.sf.json.JSONObject;

public interface LoginService {

	/**
	 * 登录业务
	 * @param obj
	 * @return
	 */
	Member login(JSONObject obj);
	
	
	/**
	 * 通过id登录
	 * @param id
	 * @return
	 */
	Member simpleLogin(String id);
	
	/**
	 * 通过微信公众号登录
	 * @param obj
	 * @return
	 */
	JSONObject wechatLogin(JSONObject obj, HttpServletRequest request);
}
