package com.whhyl.common;

/**
 * @author hw
 * @version 创建时间：2018年3月6日 下午6:42:16
 * @ClassName Constants
 * @Description event项目的常量类
 */
public class Constants {
	
	/**
	 * 成功
	 */
	public final static String SUCCESS = "SUCCESS";
	
	/**
	 * 失败
	 */
	public final static String FAIL = "FAIL";
	
	/**
	 * 投票
	 */
	public final static String VOTE = "VOTE";
	
	/**
	 * 投注
	 */
	public final static String BETTING = "BETTING";
	
	/**
	 *  网页授权获取code  
	 */
	public final static String GETPAGECODE = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=URL&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect"; 

	/**
	 *  网页授权接口  
	 */
	public final static String GETPAGEACCESSTOKENURL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";  
	  
	/**
	 *  网页授权得到用户基本信息接口  
	 */
	public final static String GETPAGEUSERSURL = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN"; 
	
	/**
	 *  阿里云短信服务签名
	 */
	public final static String FUNCOIN_SIGN = "方孔";
	
	/**
	 *  阿里云短信服务accessKey
	 */
	public final static String ACCESS_KEY = "LTAIEBpPW8aDSjKX";
	
	/**
	 *  阿里云短信服务accessSecret
	 */
	public final static String ACCESS_SECRET = "x9wTapvynUDLiyHg3zdWuVjGs3JFxj";
	
	/**
	 *  商品兑换短信模板
	 */
	public final static String PRODUCT_EXCHANGE = "SMS_128645123";
	
	/**
	 * 结算完成
	 */
	public final static String BALANCE_COMPLETE = "MNfb3lvefdG4F6r74R1WXp4F0Igin6Q7qXZ4JT8BSiE";
	
	/**
	 * 活动审核结果
	 */
	public final static String ACTIVE_AUDIT_RESULT = "Vg734b4T0r9ygyQLGCS-UU2aR0DMOadISTahzv9Y01M";
	
	/**
	 * 作品发布完成通知
	 */
	public final static String WORK_RELEASE_COMPLETE = "rZAZO3JpAjFum2N5bL8TKx7tQ3dHUKPHoahRs3TJqN4";
	
}
