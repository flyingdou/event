package com.whhyl.service;

import net.sf.json.JSONObject;

/**
 * 活动业务层
 * @author dou
 */
public interface ActiveService {

	/**
	 * 发起活动
	 * @param obj
	 * @return
	 */
	JSONObject launch (JSONObject obj);
	
	/**
	 * 活动列表
	 * @param obj
	 * @return
	 */
	JSONObject list ();
	
	/**
	 * 活动详情
	 * @param obj
	 * @return
	 */
	JSONObject detail (JSONObject obj);
	
	/**
	 * 搜索活动
	 */
	JSONObject searchActive(JSONObject param);
	
	/**
	 * 发送模板消息
	 */
    JSONObject sendTemplate (String active_id);
}
