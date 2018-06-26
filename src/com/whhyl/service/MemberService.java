package com.whhyl.service;

import net.sf.json.JSONObject;

/**
 * 会员业务接口
 * 
 * @author Administrator
 *
 */
public interface MemberService {

	/**
	 * 注册
	 * 
	 * @param param
	 * @return
	 */
	JSONObject register(JSONObject param);

	/**
	 * 完善资料
	 * 
	 * @param param
	 * @return
	 */
	JSONObject perfect(JSONObject param);

	/**
	 * 获取用户详细信息
	 * 
	 * @param param
	 * @return
	 */
	JSONObject getMemberInfo(JSONObject param);

	/**
	 * 我的活动
	 * 
	 * @param obj
	 * @return
	 */
	JSONObject findActiveByMember(JSONObject obj);

	/**
	 * 我的投票
	 */
	JSONObject myVote(JSONObject param);

	/**
	 * 我的作品
	 * 
	 * @param param
	 * @return JSONObject
	 */
	JSONObject myWorks(JSONObject param);

	/**
	 * 我的钱包
	 * 
	 * @param obj
	 * @return
	 */
	JSONObject myWallet(JSONObject obj);
	
	JSONObject selectMembers(JSONObject obj);
	
	/**
	 * 获取用户(赠送funcoin是选择用户)
	 * 
	 * @param model
	 * @return
	 */
	JSONObject selectGiveMembers(JSONObject param);
}
