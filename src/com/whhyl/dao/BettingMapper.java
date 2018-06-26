package com.whhyl.dao;

import com.whhyl.entity.Betting;
import java.util.List;
import java.util.Map;

/**
 * 投注数据访问接口
 * 
 * @author Administrator
 *
 */
public interface BettingMapper {
	/**
	 * 根据id删除投注数据
	 * 
	 * @param id
	 * @return
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * 添加一条投注数据
	 * 
	 * @param record
	 * @return
	 */
	int insert(Betting record);

	/**
	 * 根据id查询投注
	 * 
	 * @param id
	 * @return
	 */
	Betting selectByPrimaryKey(Integer id);

	/**
	 * 查询所有投注
	 * 
	 * @return
	 */
	List<Betting> selectAll();

	/**
	 * 根据id修改投注
	 * 
	 * @param record
	 * @return
	 */
	int updateByPrimaryKey(Betting record);

	/**
	 * 查询活动id查询该活动下的投注最小金额
	 */
	int getMinBetMoneyByActiveId(String activeId);
	
	
	/**
	 * 查询投注表中的获胜用户的投注记录
	 */
	List<Betting> winMemberBetting (Map<String, Object> map);
	
	
	/**
	 * 查询胜利用户的投注数据，包含赔率
	 */
	List<Map<String, Object>> winBetting(Map<String, Object> map);
}