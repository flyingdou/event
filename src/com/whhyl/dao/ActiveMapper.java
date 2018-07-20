package com.whhyl.dao;

import java.util.List;
/**
 * active数据访问层
 * @author dou
 *
 */
import java.util.Map;

import com.whhyl.entity.Active;

public interface ActiveMapper {
	int deleteByPrimaryKey(Long id);

	int insert(Active record);

	Active selectByPrimaryKey(Long id);

	List<Active> selectAll();

	int updateByPrimaryKey(Active record);

	List<Map<String, Object>> selectOrderBy(Map<String, Object> map);

	Map<String, Object> detail(int id);

	List<Map<String, Object>> activeExpert(int id);

	/**
	 * 进行中的活动列表
	 * 
	 * @return
	 */
	List<Map<String, Object>> goingOnActives();

	/**
	 * 已结束的活动列表
	 * 
	 * @return
	 */
	List<Map<String, Object>> overActives();

	List<Map<String, Object>> searchActive(Map<String, Object> map);
	
	
	/**
	 * 查询观众判定胜负且投票截止日期到期后的活动数据
	 */
	List<Map<String, Object>> getDecisoinActive();
	
	
	/**
	 * 查询需要判定的数据
	 */
	List<Map<String, Object>> getDecisionData(Map<String, Object> map);
	
	
	/**
	 * 修改判定的数据
	 */
	void updateDecision(Map<String, Object> map);
	
	/**
	 * 查询出需要结算的活动数据
	 */
	List<Active> getBalanceDataList();
	
	
	/**
	 * 查询需要被更新的活动
	 */
	List<Map<String, Object>> getActiveTobeUpdate ();
	
	/**
	 * 查询当前活动的专家信息
	 */
	List<Map<String, Object>> getExpertByActive (Long active_id);
	
}