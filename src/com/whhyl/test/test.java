package com.whhyl.test;

import java.net.URLEncoder;

import com.qq.connect.utils.json.JSONObject;
import com.whhyl.common.Constants;

/**
 * 测试类
 * 
 * @author dou
 *
 */
public class test {

	public static void main(String[] args) throws Exception {
//		String APPID = "wxbc83d7dbb3a30e14";
//		String APPSERCRET = "049c7653e2b44a72bbbee5c8e065b8be";
//		String GET_ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="
//				+ APPID + "&secret=" + APPSERCRET;
//		JSONObject json = HttpRequestUtils.httpGet(GET_ACCESS_TOKEN_URL);
//		String access_token = json.getString("access_token");
//		System.out.println(access_token);
		
	    String encodeStr = Constants.ACTIVE_AUDIT_RESULT_URL + "?json=" + URLEncoder.encode(new JSONObject().accumulate("id", 72).toString(), "UTF-8");
	    System.err.println(encodeStr);
	}

}
