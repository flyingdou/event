package com.whhyl.wechatApi;

import com.whhyl.util.HttpRequestUtils;

import net.sf.json.JSONObject;

/*
 * 作者: dou
 * 时间: 2018-07-20 13:49:48
 * desc: 与微信交互管理控制器
 * */
public class WechatManager {

	/**
	 * app_id
	 */
	private String APP_ID;
	
	/**
	 * app_secret
	 */
	private String APP_SECRET;
	
	
	
	/**
	 * 获取accessToken
	 * @return
	 */
	public String getAccessToken () {
		String GET_ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="
    			+ this.getAPP_ID() + "&secret=" + this.getAPP_SECRET();
    	JSONObject json = JSONObject.fromObject(HttpRequestUtils.httpGet(GET_ACCESS_TOKEN_URL));
    	String access_token = json.getString("access_token");
		return access_token;
	}

	
	/**
	 * 发送模板消息
	 * @param sendTemplateRequest
	 * @return
	 */
	public JSONObject sendTemplateMessage (SendTemplateRequest sendTemplateRequest) {
		// 获取accessToken
		String access_token = this.getAccessToken();
		String requestUrl = sendTemplateRequest.getRequestUrl() + "access_token=" + access_token;
		
		// 请求数据包
		JSONObject param = new JSONObject();
		param.accumulate("touser", sendTemplateRequest.getOpenid())
		     .accumulate("template_id", sendTemplateRequest.getTemplate_id())     
		     .accumulate("url", sendTemplateRequest.getUrl())
		     .accumulate("data", sendTemplateRequest.getDataJson())
		     ;
		JSONObject result = HttpRequestUtils.httpPost(requestUrl, param);
		return result;
	}
	
	

	/**
	 * 有参构造
	 * @param aPP_ID
	 * @param aPP_SECRET
	 */
	public WechatManager(String aPP_ID, String aPP_SECRET) {
		super();
		APP_ID = aPP_ID;
		APP_SECRET = aPP_SECRET;
	}

	
	/**
	 * setter && getter
	 * @return
	 */
	public String getAPP_ID() {
		return APP_ID;
	}

	public void setAPP_ID(String aPP_ID) {
		APP_ID = aPP_ID;
	}

	public String getAPP_SECRET() {
		return APP_SECRET;
	}

	public void setAPP_SECRET(String aPP_SECRET) {
		APP_SECRET = aPP_SECRET;
	}
	
	
	
	



	
	
	
	
}
