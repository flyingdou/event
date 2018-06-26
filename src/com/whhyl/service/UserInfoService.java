package com.whhyl.service;

import java.util.Map;

import com.whhyl.entity.UserInfo;

/**
 * 微信用户业务
 * @author dou
 *
 */
public interface UserInfoService {
	
	/**
	 * 获取维系用户信息
	 * @return
	 */
    UserInfo  getUserInfo(String accessToken, String openId);
    
    
    /**
     * 通过授权获取openid
     * @param code
     * @return
     */
    Map<String,Object> oauth2GetOpenid(String code);
    
    
    

}
