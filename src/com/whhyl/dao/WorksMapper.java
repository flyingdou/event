package com.whhyl.dao;

import java.util.List;
import java.util.Map;

import com.whhyl.entity.Works;

/**
 * 作品数据访问接口
 * 
 * @author Administrator
 *
 */
public interface WorksMapper {

	/**
	 * 根据作品Id删除作品
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * 添加一个作品
	 */
	int insert(Works record);

	/**
	 * 为某个作品添加图片
	 */
	int addImageToWork(Map<String, Object> map);

	/**
	 * 根据作品Id查询作品
	 */
	Works selectByPrimaryKey(Integer id);

	/**
	 * 根据作品Id查询所属作品的图片
	 */
	List<Map<String, Object>> getImagesByWorkId(String workId);

	/**
	 * 修改作品图片描述
	 */
	int updateWorkImageRemark(Map<String, Object> map);

	/**
	 * 查询所有作品
	 */
	List<Works> selectAll();

	/**
	 * 根据作品Id修改作品
	 */
	int updateByPrimaryKey(Works record);

	/**
	 * 根据活动Id查询作品列表
	 */
	List<Map<String, Object>> listWroksByActiveId(String activeId);

	/**
	 * 根据作品id查询活动id
	 */
	int getActiveIdByWorksId(String worksId);

	/**
	 * 添加活动与作品的关联
	 */
	int insertActiveWork(Map<String, Object> map);

	/**
	 * 根据作品id查询作品的详细信息
	 */
	Map<String, Object> getWorkDetailById(Map<String, Object> map);

	/**
	 * 检查本作品在当前活动中是否被投票过
	 */
	Map<String, Object> checkHasVoted(Map<String, Object> map);

	/**
	 * 检查用户是否对当前作品投过票
	 */
	int checkVoteByWork(Map<String, Object> map);

	/**
	 * 根据活动id和作品id查询作品名次
	 */
	String getWorksRankeByActiveIdAndWorkId(Map<String, Object> map);

	/**
	 * 根据活动id查询作品名次
	 */
	List<String> listWorksRankeByActiveId(String activeId);

	/**
	 * 修改作品名次
	 */
	int updateWorkRanke(Map<String, Object> map);

	/**
	 * 修改作品胜率
	 */
	int updateWorkWinRate(Map<String, Object> map);

	/**
	 * 根据活动id和作品id查询作品胜率
	 */
	String getWinRateByActiveIdAndWorkId(Map<String, Object> map);

	/**
	 * 根据活动id和作品id查询作品赔率
	 */
	String getWorksWinRateByActiveIdAndWorkId(Map<String, Object> map);

	/**
	 * 修改作品赔率
	 */
	int updateWorkPayRate(Map<String, Object> map);

	/**
	 * 查询需要结算的多胜制活动
	 */
	List<Map<String, Object>> findActives();

	/**
	 * 查询多胜制获胜作品
	 */
	List<Works> winWorks(Map<String, Object> map);

	/**
	 * 查询当前活动的所有投注funcoin金额
	 */
	int betMoneyCount(int active_id);

	/**
	 * 添加作品和活动的映射
	 */
	int addActiveAndWork(List<Map<String, Object>> list);

	/**
	 * 根据活动Id查询本活动投注获胜的用户列表
	 */
	List<Map<String, Object>> listWinnerByActiveId(String activeId);

	/**
	 * 查询作品名次列表列表通过活动ID(按名次正序排列)
	 */
	List<Map<String, Object>> listWorkRankByActiveId(Map<String, Object> paramMap);
	
	/**
	 * 修改排名
	 * @param paramMap
	 * @return
	 */
	int determine(Map<String, Object> paramMap);
}