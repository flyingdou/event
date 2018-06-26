package com.whhyl.service;

import net.sf.json.JSONObject;

/**
 * @author hw
 * @version 创建时间：2018年4月17日 下午2:33:48
 * @ClassName 类名称
 * @Description 类描述
 */
public interface BalanceService {

	/**
	 * 结算业务(裁判模式)
	 */
	JSONObject balanceByReferee(JSONObject param);

}
