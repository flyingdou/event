package com.whhyl.service;
/**
* @author hw
* @version 创建时间：2018年3月20日 下午3:56:41
* @ClassName WechatService
* @Description 处理微信相关业务
*/
public interface WechatService {
	
	/**
	 * 微信公众号支付回调处理业务
	 */
	String weixinNotify(); 
}
