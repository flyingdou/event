package com.whhyl.service;

import net.sf.json.JSONObject;

/**
 * 作品相关业务接口
 * 
 * @author Administrator
 *
 */
public interface WorksService {

	/**
	 * 查询作品列表
	 */
	JSONObject listWorks(JSONObject param);

	/**
	 * 作品详情
	 */
	JSONObject worksDetail(JSONObject param);

	/**
	 * 发布作品
	 */
	JSONObject releaseWorks(JSONObject param);
	
	/**
	 * 修改作品图片描述
	 */
	JSONObject updateWorkImageRemark(JSONObject param);

	/**
	 * 设定赔率
	 */
	JSONObject setTheOdds(JSONObject param);

	/**
	 * 预测胜率
	 */
	JSONObject forecast(JSONObject param);

	/**
	 * 判定胜负
	 */
	JSONObject judge(JSONObject param);

	/**
	 * 投票或者投注
	 */
	JSONObject voteOrBetting(JSONObject param);

	/**
	 * 从我的作品中提交作品
	 */
	JSONObject releaseWorksFromMyWorks(JSONObject param);
	
	/**
	 * 查询活动投注获胜用户列表
	 */
	JSONObject listWinnerByActiveId(JSONObject param);
	
	/**
	 * 查询作品名次列表通过活动ID(按名次正序排列)
	 */
	JSONObject listWorkRankByActiveId(JSONObject param);
}
