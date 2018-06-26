package com.whhyl.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.whhyl.dao.MemberMapper;
import com.whhyl.dao.OrderMapper;
import com.whhyl.entity.Member;
import com.whhyl.service.MemberService;
import com.whhyl.util.JsonUtils;
import com.whhyl.util.StringUtils;
import com.whhyl.util.commentsUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Transactional
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private OrderMapper orderMapper;

	@Override
	public JSONObject register(JSONObject param) {
		JSONObject result = new JSONObject();
		Member member = new Member();
		// 空检查
		if (param.containsKey("mobilephone") && StringUtils.isNotEmpty(param.getString("mobilephone"))) {
			member.setMobilephone(param.getString("mobilephone"));
		}
		if (param.containsKey("password") && StringUtils.isNotEmpty(param.getString("password"))) {
			member.setPassword(param.getString("password"));
		}
		if (param.containsKey("longitude") && param.containsKey("latitude")
				&& StringUtils.isNotEmpty(param.getString("longitude"))
				&& StringUtils.isNotEmpty(param.getString("latitude"))) {
			member.setLongitude(param.getString("longitude"));
			member.setLatitude(param.getString("latitude"));
		}
		member.setNick(commentsUtil.getRandomString());
		member.setRegisterDate(new Date());
		// 如果手机号和密码不为空则调用添加用户接口
		if (StringUtils.isNotEmpty(member.getMobilephone()) && StringUtils.isNotEmpty(member.getPassword())) {
			int resultNum = 0;
			// 检查手机号是否已经存在
			if (memberMapper.checkMobilePhone(member.getMobilephone()) == 0) {
				resultNum = memberMapper.insert(member);
			} else {
				result.accumulate("success", false).accumulate("msg", "该手机号已经注册");
				return result;
			}
			// 判断接口返回状态返回成功或失败
			if (resultNum > 0) {
				result.accumulate("success", true).accumulate("msg", "注册成功");
			} else {
				result.accumulate("success", false);
			}
		}
		return result;
	}

	@SuppressWarnings("deprecation")
	@Override
	public JSONObject perfect(JSONObject param) {
		JSONObject result = new JSONObject();
		Member member = memberMapper.selectByPrimaryKey(Long.valueOf(param.getString("id")));
		// 空值检查
		if (param.containsKey("nick") && StringUtils.isNotEmpty(param.getString("nick"))) {
			member.setNick(param.getString("nick"));
		}
		if (param.containsKey("sex") && StringUtils.isNotEmpty(param.getString("sex"))) {
			member.setSex(param.getString("sex"));
		}
		if (param.containsKey("province") && StringUtils.isNotEmpty(param.getString("province"))) {
			member.setProvince(param.getString("province"));
		}
		if (param.containsKey("city") && StringUtils.isNotEmpty(param.getString("city"))) {
			member.setCity(param.getString("city"));
		}
		if (param.containsKey("county") && StringUtils.isNotEmpty(param.getString("county"))) {
			member.setCounty(param.getString("county"));
		}
		if (param.containsKey("image") && StringUtils.isNotEmpty(param.getString("image"))) {
			member.setImage(param.getString("image"));
		}
		if (param.containsKey("birthday") && StringUtils.isNotEmpty(param.getString("birthday"))) {
			member.setBirthday(new Date(param.getString("birthday").replace("-", "/")));
		}
		// 调用接口,根据接口返回状态返回成功或失败
		int resultNum = memberMapper.updateByPrimaryKey(member);
		if (resultNum > 0) {
			result.accumulate("success", true);
		} else {
			result.accumulate("success", false);
		}
		return result;
	}

	@Override
	public JSONObject getMemberInfo(JSONObject param) {
		JSONObject result = new JSONObject();
		Member member = memberMapper.selectByPrimaryKey(param.getLong("memberId"));
		// 获取用户参加的活动次数
		int activeCount = memberMapper.getParticipateActiveCountByMemberId(param.getString("memberId"));
		// 获取用户投票次数
		int votes = memberMapper.getVoteCountByMemberId(param.getString("memberId"));
		// 查询用户余额
		double balance = orderMapper.queryBalance(param.getInt("memberId"));
		// 转换成json并返回
		JSONObject memberJson = JsonUtils.BeanToJsonDateFormat(member, "yyyy-MM-dd");
		memberJson.accumulate("activeCount", activeCount).accumulate("votes", votes).accumulate("balance",
				Math.round(balance));
		result.accumulate("success", true).accumulate("memberInfo", memberJson);
		return result;
	}

	/**
	 * 我的活动
	 */
	@Override
	public JSONObject findActiveByMember(JSONObject obj) {
		JSONObject ret = new JSONObject();
		try {
			// 处理参数
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("member", obj.get("member"));

			// 我发起的活动
			map.put("type", "0");
			List<Map<String, Object>> launchList = memberMapper.findActiveByMember(map);
			for (Map<String, Object> map2 : launchList) {
				Integer activeId = Integer.valueOf(map2.get("id").toString());
				Map<String, Object> mapCount = memberMapper.getCountByActive(activeId);
				map2.put("voteCount", mapCount.get("voteCount"));
				map2.put("betCount", mapCount.get("betCount"));
			}
			JSONArray arr0 = JsonUtils.ListMapToJsonDateFormat(launchList, "yyyy-MM-dd");

			// 我参加的活动
			map.put("type", "1");
			List<Map<String, Object>> partakeList = memberMapper.findActiveByMember(map);
			for (Map<String, Object> map2 : partakeList) {
				Integer activeId = Integer.valueOf(map2.get("id").toString());
				Map<String, Object> mapCount = memberMapper.getCountByActive(activeId);
				map2.put("voteCount", mapCount.get("voteCount"));
				map2.put("betCount", mapCount.get("betCount"));
			}
			JSONArray arr1 = JsonUtils.ListMapToJsonDateFormat(partakeList, "yyyy-MM-dd");

			ret.accumulate("success", true).accumulate("msg", "OK").accumulate("launchList", arr0)
					.accumulate("partakeList", arr1)

			;
		} catch (Exception e) {
			ret.accumulate("success", false).accumulate("msg", "查询数据异常");
			e.printStackTrace();
		}

		return ret;
	}

	@Override
	public JSONObject myVote(JSONObject param) {
		JSONObject result = new JSONObject();
		String[] type = { "0", "1" };
		// 空值检查
		if (!param.containsKey("status") || StringUtils.isEmpty(param.getString("status"))) {
			result.accumulate("success", false).accumulate("msg", "status not find");
			return result;
		}
		// 添加查询参数
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("date", commentsUtil.format(new Date(), "yyyy-MM-dd"));
		map.put("memberId", param.get("memberId"));
		// 0.已结束,1.进行中
		List<Map<String, Object>> list = null;
		JSONArray array = new JSONArray();
		JSONArray childArray = null;
		if (type[0].equals(param.getString("status"))) {
			list = memberMapper.myVoted(map);
		} else if (type[1].equals(param.getString("status"))) {
			list = memberMapper.myVoting(map);
		}
		for (int i = 0; i < list.size(); i++) {
			JSONObject item = JsonUtils.MapToJsonDateFormat(list.get(i), "yyyy-MM-dd");
			if (i == 0) {
				childArray = new JSONArray();
				childArray.add(item);
				if (i == list.size() - 1) {
					array.add(childArray);
				}
			} else {
				if (String.valueOf(list.get(i).get("id")).equals(String.valueOf(list.get(i - 1).get("id")))) {
					childArray.add(item);
				} else {
					array.add(childArray);
					childArray = new JSONArray();
					childArray.add(item);
				}

				if (i == list.size() - 1) {
					array.add(childArray);
				}
			}
		}
		result.accumulate("success", true).accumulate("myVote", array);
		return result;
	}

	@Override
	public JSONObject myWorks(JSONObject param) {
		// 查询我的作品
		JSONObject result = new JSONObject();
		result.accumulate("success", true).accumulate("myWorks", JsonUtils.ListMapToJsonDateFormat(
				memberMapper.listWorksByMemberId(param.getString("memberId")), "yyyy年MM月dd日 HH:mm:ss"));
		return result;
	}

	/**
	 * 我的钱包业务逻辑
	 */
	@Override
	public JSONObject myWallet(JSONObject obj) {
		JSONObject ret = new JSONObject();
		try {
			// 收入
			List<Map<String, Object>> income = orderMapper.incomeOrder(Integer.valueOf(obj.getInt("member")));
			// 支出
			List<Map<String, Object>> out = orderMapper.outOrder(Integer.valueOf(obj.getInt("member")));
			// 账户余额
			Double balance = orderMapper.queryBalance(Integer.valueOf(obj.getInt("member")));

			ret.accumulate("success", true)
					.accumulate("income", JsonUtils.ListMapToJsonDateFormat(income, "yyyy-MM-dd"))
					.accumulate("out", JsonUtils.ListMapToJsonDateFormat(out, "yyyy-MM-dd"))
					.accumulate("balance", balance);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;

	}

	/**
	 * 查询所有用户
	 * 
	 * @return
	 */
	@Override
	public JSONObject selectMembers(JSONObject obj) {
		JSONObject ret = new JSONObject();
		try {
			String name = "";
			// 处理前台传来的参数
			if (obj.containsKey("name") && StringUtils.isNotEmpty(obj.getString("name"))) {
				name = "%" + obj.getString("name") + "%";
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("dou", name);
			map.put("member", Integer.valueOf(String.valueOf(obj.get("member"))));
			List<Map<String, Object>> memberMap = memberMapper.selectMembers(map);
			JSONArray memberList = JsonUtils.ListMapToJsonDateFormat(memberMap, "yyyy-MM-dd");
			ret.accumulate("success", true).accumulate("msg", "OK").accumulate("memberList", memberList);
		} catch (Exception e) {
			ret.accumulate("success", false).accumulate("msg", "查询用户数据异常");
			e.printStackTrace();
		}
		return ret;
	}

	/**
	 * 获取用户(赠送funcoin是选择用户)
	 * 
	 * @param model
	 * @return
	 */
	@Override
	public JSONObject selectGiveMembers(JSONObject obj) {
		JSONObject ret = new JSONObject();
		String name = "";
		// 处理前台传来的参数
		if (obj.containsKey("name") && StringUtils.isNotEmpty(obj.getString("name"))) {
			name = "%" + obj.getString("name") + "%";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dou", name);
		map.put("member", Integer.valueOf(String.valueOf(obj.get("member"))));
		List<Map<String, Object>> memberMap = memberMapper.selectMembers(map);
		for (Map<String, Object> map2 : memberMap) {
			String memberId = String.valueOf(map2.get("id"));
			// 查询用户参加活动的次数
			int activeCount = memberMapper.getParticipateActiveCountByMemberId(memberId);
			// 获取用户投票的活动胜负情况
			map.put("memberId", memberId);
			map.put("date", new Date());
			List<Map<String, Object>> myVoted = memberMapper.myVoted(map);
			// 计算用户参加的活动胜利和失败的次数
			int v = 0, f = 0;
			for (Map<String, Object> map3 : myVoted) {
				int value = Integer.parseInt(String.valueOf(map3.get("value") == null ? 0 : map3.get("value")));
				if (value == 1) {
					v++;
				} else {
					f++;
				}
			}
			// 计算胜率
			int probability = 0;
			if (f != 0) {
				probability = Integer.valueOf((v / f) * 100);
			}
			map2.put("activeCount", activeCount);
			map2.put("probability", probability);
		}
		JSONArray memberList = JsonUtils.ListMapToJsonDateFormat(memberMap, "yyyy-MM-dd");
		ret.accumulate("success", true).accumulate("msg", "OK").accumulate("memberList", memberList);
		return ret;
	}

}
