package com.whhyl.wechatApi;
/*
 * 作者: dou
 * 时间: 2018-07-20 14:00:13
 * desc: 发送模板消息
 * */

import net.sf.json.JSONObject;

public class SendTemplateRequest {
	
	/**
	 * 访问微信服务器链接
	 */
	private String requestUrl;
	
	/**
	 * openid
	 */
	private String openid;

	/**
	 * template_id 模板id
	 */
	private String template_id;
	
	/**
	 * url 用户点击模板消息详情时跳转的链接
	 */
	private String url;
	
	/**
	 * dataJson 模板消息数据
	 */
	private JSONObject dataJson;

	
	/**
	 * 有参构造
	 * @param openid
	 * @param template_id
	 * @param url
	 * @param dataJson
	 */
	public SendTemplateRequest(String openid, String template_id, String url, JSONObject dataJson) {
		super();
		this.openid = openid;
		this.template_id = template_id;
		this.url = url;
		this.dataJson = dataJson;
		this.requestUrl = "https://api.weixin.qq.com/cgi-bin/message/template/send?";
	}

	/**
	 * setter && getter
	 * @return
	 */
	public String getRequestUrl() {
		return requestUrl;
	}

	public void setRequestUrl(String requestUrl) {
		this.requestUrl = requestUrl;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public String getTemplate_id() {
		return template_id;
	}

	public void setTemplate_id(String template_id) {
		this.template_id = template_id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public JSONObject getDataJson() {
		return dataJson;
	}

	public void setDataJson(JSONObject dataJson) {
		this.dataJson = dataJson;
	}
	
	
}
