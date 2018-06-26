package com.whhyl.dao;

import java.util.List;
import java.util.Map;

import com.whhyl.entity.Member;

/**
 * 会员数据访问接口
 * 
 * @author Administrator
 *
 */
public interface MemberMapper {
	/**
	 * 根据id删除会员
	 * 
	 * @param id
	 * @return
	 */
	int deleteByPrimaryKey(Long id);

	/**
	 * 添加一个会员
	 * 
	 * @param record
	 * @return
	 */
	int insert(Member record);

	/**
	 * 根据id查询会员
	 * 
	 * @param id
	 * @return
	 */
	Member selectByPrimaryKey(Long id);

	/**
	 * 查询所有会员
	 * 
	 * @return
	 */
	List<Member> selectAll();

	/**
	 * 根据id修改会员
	 * 
	 * @param record
	 * @return
	 */
	int updateByPrimaryKey(Member record);

	/**
	 * 根据会员id查询参加活动的次数
	 */
	int getParticipateActiveCountByMemberId(String memberId);

	/**
	 * 根据会员id查询投票次数
	 */
	int getVoteCountByMemberId(String memberId);

	/**
	 * 检查手机号是否已存在
	 * 
	 * @param mobilphone
	 * @return
	 */
	int checkMobilePhone(String mobilephone);

	/**
	 * 检查当前用户是否为某活动的发起人
	 */
	int checkActiveCreator(Map<String, Object> map);

	/**
	 * 检查当前用户是否为某活动的裁判
	 */
	int checkActiveReferee(Map<String, Object> map);

	/**
	 * 检查当前用户是否为某活动的专家
	 */
	int checkActiveExpert(Map<String, Object> map);

	/**
	 * 查询我的活动(我发起的，我参与的)
	 * 
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> findActiveByMember(Map<String, Object> map);

	/**
	 * 查询我的活动中投票，投注人数
	 * 
	 * @param activeId
	 * @return
	 */
	Map<String, Object> getCountByActive(Integer activeId);

	/**
	 * 我的投票(已结束)
	 */
	List<Map<String, Object>> myVoted(Map<String, Object> map);

	/**
	 * 我的投票(进行中)
	 */
	List<Map<String, Object>> myVoting(Map<String, Object> map);

	/**
	 * 根据用户id查询作品列表
	 */
	List<Map<String, Object>> listWorksByMemberId(String memberId);
	
	
	List<Map<String, Object>> selectMembers(Map<String, Object> map);
	
	
	/**
	 * 根据微信openid查询用户表中是否已经存在
	 */
	Member checkByOpenId (Map<String, Object> map);
	
}