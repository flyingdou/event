package com.whhyl.dao;

import java.util.Map;

import com.whhyl.entity.Member;

public interface LoginMapper {
    /**
     * 账号密码登录
     */
	Member login (Map<String, Object> map);
	
	
	/**
	 * 第三方登录
	 */
	Member checkThird (Map<String, Object> map);
	
	
	/**
	 * 通过id登录
	 */
	Member loginById(Integer id);
}
