package com.whhyl.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.whhyl.common.Constants;
import com.whhyl.dao.ActiveMapper;
import com.whhyl.dao.BettingMapper;
import com.whhyl.dao.EvaluateMapper;
import com.whhyl.dao.MemberMapper;
import com.whhyl.dao.VoteMapper;
import com.whhyl.dao.WorksMapper;
import com.whhyl.entity.Active;
import com.whhyl.entity.Betting;
import com.whhyl.entity.Evaluate;
import com.whhyl.entity.Vote;
import com.whhyl.entity.Works;
import com.whhyl.service.BalanceService;
import com.whhyl.service.OrderService;
import com.whhyl.service.WorksService;
import com.whhyl.util.JsonUtils;
import com.whhyl.util.StringUtils;
import com.whhyl.util.commentsUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Transactional
@Service
public class WorksServiceImpl implements WorksService {

	@Autowired
	private WorksMapper worksMapper;
	@Autowired
	private VoteMapper voteMapper;
	@Autowired
	private BettingMapper bettingMapper;
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ActiveMapper activeMapper;
	@Autowired
	private EvaluateMapper evaluateMapper;
	@Autowired
	private BalanceService balanceService;

	@Override
	public JSONObject listWorks(JSONObject param) {
		JSONObject result = new JSONObject();
		// 空检查
		if (param.containsKey("activeId") && StringUtils.isNotEmpty(param.getString("activeId"))) {
			// 查询活动信息
			Active active = activeMapper.selectByPrimaryKey(param.getLong("activeId"));
			// 根据活动Id查询作品列表
			List<Map<String, Object>> worksList = worksMapper.listWroksByActiveId(param.getString("activeId"));
			Map<String, Object> activeInfo = activeMapper.detail(param.getInt("activeId"));
			result.accumulate("success", true)
					.accumulate("worksList", JsonUtils.ListMapToJsonDateFormat(worksList, "yyyy-MM-dd"))
					.accumulate("status", active.getStatus()).accumulate("activeInfo", activeInfo);
		} else {
			result.accumulate("success", false);
		}
		return result;
	}

	@Override
	public JSONObject worksDetail(JSONObject param) {
		JSONObject result = new JSONObject();
		// 空检查
		if (param.containsKey("id") && StringUtils.isNotEmpty(param.getString("id"))) {
			// 创建参数集合
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("workId", param.getString("id"));
			map.put("activeId", param.getString("activeId"));
			map.put("memberId", param.getString("memberId"));
			// 根据作品Id查询作品全部信息
			Map<String, Object> workDetail = worksMapper.getWorkDetailById(map);
			// 查询当前用户在本活动中属于什么角色:0.观众,1.裁判,2.专家,3.发起者
			String role = "0";
			if (memberMapper.checkActiveCreator(map) > 0) {
				role = "3";
			} else if (memberMapper.checkActiveExpert(map) > 0) {
				role = "2";
			} else if (memberMapper.checkActiveReferee(map) > 0) {
				role = "1";
			}
			Active active = activeMapper.selectByPrimaryKey(param.getLong("activeId"));
			// 查询作品所属图片
			List<Map<String, Object>> imgs = worksMapper.getImagesByWorkId(param.getString("id"));
			result.accumulate("success", true)
					.accumulate("works", JsonUtils.MapToJsonDateFormat(workDetail, "yyyy-MM-dd"))
					.accumulate("imgs", imgs).accumulate("role", role).accumulate("activeStatus", active.getStatus());
		} else {
			result.accumulate("success", false);
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public JSONObject releaseWorks(JSONObject param) {
		JSONObject result = new JSONObject();
		Works works = new Works();
		works.setAuthor(param.getInt("author"));
		works.setPartakeDate(new Date());
		// 空值检查
		if (!param.containsKey("activeId") && StringUtils.isEmpty(param.getString("activeId"))) {
			result.accumulate("success", false).accumulate("msg", "请指定活动");
			return result;
		}
		if (param.containsKey("name") && StringUtils.isNotEmpty(param.getString("name"))) {
			works.setName(param.getString("name"));
		} else {
			result.accumulate("success", false).accumulate("msg", "请输入名称");
			return result;
		}
		if (param.containsKey("video") && StringUtils.isNotEmpty(param.getString("video"))) {
			works.setVideo(param.getString("video"));
		}
		if (param.containsKey("remark") && StringUtils.isNotEmpty(param.getString("remark"))) {
			works.setRemark(param.getString("remark"));
		}
		// 添加一个作品
		worksMapper.insert(works);
		// 添加作品相关图片
		List<String> imgs = JSONArray.toList(param.getJSONArray("imgs"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("workId", works.getId());
		map.put("imgs", imgs);
		worksMapper.addImageToWork(map);
		// 添加活动关联作品
		map.put("activeId", param.getString("activeId"));
		worksMapper.insertActiveWork(map);
		result.accumulate("success", true).accumulate("msg", "发布成功").accumulate("id", works.getId());
		return result;
	}

	@Override
	public JSONObject updateWorkImageRemark(JSONObject param) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("image", param.getString("image"));
		map.put("imageRemark", param.getString("imageRemark"));
		worksMapper.updateWorkImageRemark(map);
		JSONObject result = new JSONObject();
		result.accumulate("success", true);
		return result;
	}

	@Override
	public JSONObject setTheOdds(JSONObject param) {
		JSONObject result = new JSONObject();
		if (param.getInt("type") == 0) {
			// 检查当前作品是否已经设置过赔率
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("activeId", param.get("activeId"));
			map.put("workId", param.get("id"));
			String payRate = worksMapper.getWorksWinRateByActiveIdAndWorkId(map);
			result.accumulate("success", true).accumulate("payRate",
					payRate == null || "".equals(payRate) ? 0 : payRate);
		} else if (param.getInt("type") == 1) {
			// 查询当前作品的胜率
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("activeId", param.get("activeId"));
			map.put("workId", param.get("id"));
			String winRate = worksMapper.getWinRateByActiveIdAndWorkId(map);
			result.accumulate("success", true).accumulate("winRate",
					winRate == null || "".equals(winRate) ? "" : winRate);
		} else if (param.getInt("type") == 2) {
			// 修改当前作品的赔率
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("activeId", param.get("activeId"));
			map.put("workId", param.get("id"));
			map.put("payRate", param.get("payRate"));
			int resultNum = worksMapper.updateWorkPayRate(map);
			if (resultNum > 0) {
				result.accumulate("success", true);
			} else {
				result.accumulate("success", false);
			}
		}
		return result;
	}

	@Override
	public JSONObject forecast(JSONObject param) {
		JSONObject result = new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("winRate", param.get("winRate"));
		map.put("activeId", param.get("activeId"));
		map.put("workId", param.get("id"));
		// 修改作品胜率
		int resultNum = worksMapper.updateWorkWinRate(map);
		if (resultNum < 1) {
			result.accumulate("success", false);
			return result;
		}
		// 生成一条评论
		Evaluate evaluate = new Evaluate();
		evaluate.setActiveId(param.getInt("activeId"));
		evaluate.setContent(param.getString("evaluate"));
		evaluate.setMember(param.getInt("memberId"));
		evaluate.setAutoTime(new Date());
		evaluate.setRole(1);
		// 将评论添加到数据库
		resultNum = evaluateMapper.insert(evaluate);
		if (resultNum > 0) {
			result.accumulate("success", true);
		} else {
			result.accumulate("success", false);
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public JSONObject judge(JSONObject param) {
		JSONObject result = new JSONObject();
		// 检查是否为当前活动裁判
		if (memberMapper.checkActiveReferee(param) < 1) {
			result.accumulate("success", false).accumulate("message", "需要当前活动的裁判来判定");
			return result;
		}
		JSONArray worksList = param.getJSONArray("worksList");
		for (int i = 0; i < worksList.size(); i++) {
			JSONObject work = (JSONObject) worksList.get(i);
			worksMapper.determine(work);
		}
		// 排名判定结束调用结算
		balanceService.balanceByReferee(param);
		result.accumulate("success", true);
		return result;
	}

	@Override
	public JSONObject voteOrBetting(JSONObject param) {
		JSONObject result = new JSONObject();
		if (!param.containsKey("activeId") && StringUtils.isEmpty(param.getString("activeId"))
				&& !param.containsKey("contestant") && StringUtils.isEmpty(param.getString("contestant"))
				&& !param.containsKey("type")) {
			result.accumulate("success", false);
			return result;
		}
		// 投票或者投注
		if (Constants.VOTE.equals(param.getString("type"))) {
			Vote voteBean = new Vote();
			// 填充属性
			voteBean.setActiveId(param.getInt("activeId"));
			voteBean.setContestant(param.getInt("contestant"));
			voteBean.setMember(param.getInt("member"));
			voteBean.setAutoTime(new Date());

			// 检查当前活动中的当前作品有没有被投票过
			Map<String, Object> voteMap = new HashMap<String, Object>();
			voteMap.put("active", param.getInt("activeId"));
			voteMap.put("contestant", param.getInt("contestant"));
			Map<String, Object> hasMap = worksMapper.checkHasVoted(voteMap);
			if (hasMap != null) {
				// 已有投票记录
				voteBean.setToken(hasMap.get("token").toString());
			} else {
				// 暂无投票记录
				voteBean.setToken(commentsUtil.getRandomByDate(6));
			}

			// 执行添加操作
			int resultNum = 0;
			// 检查用户是否已经对该活动投过票
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("active", param.get("activeId"));
			paramMap.put("contestant", param.get("contestant"));
			paramMap.put("memberId", param.getInt("member"));
			if (worksMapper.checkVoteByWork(paramMap) < 1) {
				resultNum = voteMapper.insert(voteBean);
			} else {
				result.accumulate("success", false).accumulate("msg", "您已经投过票了,请不要重复投票哦!");
				return result;
			}
			if (resultNum > 0) {
				Active active = activeMapper.selectByPrimaryKey(param.getLong("activeId"));
				Works work = worksMapper.selectByPrimaryKey(param.getInt("contestant"));
				if (active.getVoteParise() > 0) {
					// 生成赠送订单
					JSONObject orderParam = new JSONObject();
					orderParam.accumulate("orderType", "1").accumulate("productType", "C").accumulate("product", 0)
							.accumulate("member", active.getCreator()).accumulate("toMember", param.get("member"))
							.accumulate("funcoin", active.getVoteParise()).accumulate("remark", "投票奖励");
					orderService.create(orderParam);
				}
				result.accumulate("success", true).accumulate("id", work.getId()).accumulate("funcoin",
						active.getVoteParise());
			} else {
				result.accumulate("success", false);
			}
		} else if (Constants.BETTING.equals(param.getString("type"))) {
			Betting bettingBean = new Betting();
			// 空值检查
			if (!param.containsKey("betMoney") || StringUtils.isEmpty(param.getString("betMoney"))) {
				result.accumulate("success", false).accumulate("msg", "请输入投注金额");
				return result;
			}
			// 检查投注金额是否大于当前活动的最小投注金额
			int minBetMoney = bettingMapper.getMinBetMoneyByActiveId(param.getString("activeId"));
			if (param.getInt("betMoney") < minBetMoney) {
				result.accumulate("success", false).accumulate("msg", "投注金额不能小于活动最小投注金额(" + minBetMoney + "FC)");
				return result;
			}
			if (param.getInt("betMoney") > orderService.checkBalance(param.getInt("member"))) {
				result.accumulate("success", false).accumulate("msg", "投注金额不能大于余额");
				return result;
			}
			// 填充属性
			bettingBean.setActiveId(param.getInt("activeId"));
			bettingBean.setContestant(param.getInt("contestant"));
			bettingBean.setBetMoney(param.getInt("betMoney"));
			bettingBean.setMember(param.getInt("member"));
			bettingBean.setAutoTime(new Date());
			// 执行添加操作
			int resultNum = bettingMapper.insert(bettingBean);
			if (resultNum < 1) {
				result.accumulate("success", false);
				return result;
			}
			// 生成投注订单
			JSONObject orderParam = new JSONObject();
			orderParam.accumulate("orderType", "1").accumulate("productType", "D")
					.accumulate("product", bettingBean.getId()).accumulate("member", param.get("member"))
					.accumulate("toMember", "10").accumulate("funcoin", param.getInt("betMoney"))
					.accumulate("remark", "投注");
			result = orderService.create(orderParam);
		} else {
			result.accumulate("success", false);
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public JSONObject releaseWorksFromMyWorks(JSONObject param) {
		JSONObject result = new JSONObject();
		List<Object> activeIdList = JSONArray.toList(param.getJSONArray("activeList"));
		List<Map<String, Object>> paramList = new ArrayList<Map<String, Object>>();
		for (Object object : activeIdList) {
			Map<String, Object> map = new HashMap<String, Object>();
			String activeId = String.valueOf(object);
			map.put("activeId", activeId);
			map.put("workId", param.get("workId"));
			paramList.add(map);
		}
		int resultNum = worksMapper.addActiveAndWork(paramList);
		if (resultNum > 0) {
			result.accumulate("success", true);
		} else {
			result.accumulate("success", false);
		}
		return result;
	}

	@Override
	public JSONObject listWinnerByActiveId(JSONObject param) {
		JSONObject result = new JSONObject();
		List<Map<String, Object>> list = worksMapper.listWinnerByActiveId(param.getString("activeId"));
		result.accumulate("success", true).accumulate("memberList", list);
		return result;
	}

	@Override
	public JSONObject listWorkRankByActiveId(JSONObject param) {
		JSONObject result = new JSONObject();
		List<Map<String, Object>> list = worksMapper.listWorkRankByActiveId(param.getString("activeId"));
		Map<String, Object> activeInfo = activeMapper.detail(param.getInt("activeId"));
		result.accumulate("success", true).accumulate("workList",
				JsonUtils.ListMapToJsonDateFormat(list, "yyyy-MM-dd")).accumulate("activeInfo", activeInfo);
		return result;
	}

	@Override
	public JSONObject getWinnerCount(JSONObject param) {
		Active active = activeMapper.selectByPrimaryKey(param.getLong("activeId"));
		return new JSONObject().accumulate("winCount", active.getWinCount());
	}
}
