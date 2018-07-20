package com.whhyl.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.whhyl.common.Constants;
import com.whhyl.dao.ActiveMapper;
import com.whhyl.dao.MemberMapper;
import com.whhyl.entity.Active;
import com.whhyl.service.ActiveService;
import com.whhyl.service.ExpertService;
import com.whhyl.util.JsonUtils;
import com.whhyl.util.StringUtils;
import com.whhyl.util.commentsUtil;
import com.whhyl.wechatApi.SendTemplateRequest;
import com.whhyl.wechatApi.WechatManager;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 活动业务处理逻辑
 * 
 * @author dou
 *
 */

@Transactional
@Service
public class ActiveServiceImpl implements ActiveService {

	@Autowired
	private ActiveMapper activeDao;

	@Autowired
	private MemberMapper memberDao;
	
	@Autowired
	private ExpertService expertService;

	/**
	 * 发起活动
	 */
	@Override
	public JSONObject launch(JSONObject obj) {
		Active active = new Active();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		JSONObject ret = new JSONObject();
		try {
			// 活动名称
			if (obj.containsKey("name") && StringUtils.isNotEmpty(obj.getString("name"))) {
				active.setName(obj.getString("name"));
			}
			
			// 报名参赛截止时间
			if (obj.containsKey("registrationDeadline")
					&& StringUtils.isNotEmpty(obj.getString("registrationDeadline"))) {
				active.setRegistrationDeadline(sdf.parse(obj.getString("registrationDeadline")));
			}
			
			// 投票截止时间
			if (obj.containsKey("voteDeadline") && StringUtils.isNotEmpty(obj.getString("voteDeadline"))) {
				active.setVoteDeadline(sdf.parse(obj.getString("voteDeadline")));
			}
			
			// 成绩判定方式
			if (obj.containsKey("decisionType") && StringUtils.isNotEmpty(obj.getString("decisionType"))) {
				active.setRefereeModel(obj.getInt("decisionType"));
				if (obj.getInt("decisionType") == 0) {
					// 裁判判定成绩
					active.setReferee(obj.getInt("referee"));
				}
			}
			
			// 胜利名额
			if (obj.containsKey("winCount") && StringUtils.isNotEmpty(obj.getString("winCount"))) {
				active.setWinCount(obj.getInt("winCount"));
			}
			
			// 活动结算方式
			if (obj.containsKey("balanceType") && StringUtils.isNotEmpty(obj.getString("balanceType"))) {
				active.setBalanceType(obj.getString("balanceType"));
			}
			
			// 投票奖励funcoin
			if (obj.containsKey("voteParise") && StringUtils.isNotEmpty(obj.getString("voteParise"))) {
				active.setVoteParise(obj.getInt("voteParise"));
			}
			
			// 最小投注funcoin
			if (obj.containsKey("betMin") && StringUtils.isNotEmpty(obj.getString("betMin"))) {
				active.setBetMin(obj.getInt("betMin"));
			}
			
			// 活动规则、备注
			if (obj.containsKey("remark") && StringUtils.isNotEmpty(obj.getString("remark"))) {
				active.setRemark(obj.getString("remark"));
			}
			
			// 活动海报
			if (obj.containsKey("poster") && StringUtils.isNotEmpty(obj.getString("poster"))) {
				String douPoster = obj.getString("poster");
				douPoster = douPoster.substring(0,(douPoster.length()));
				active.setPoster(douPoster);
			}
			
			// 活动发起者
			if (obj.containsKey("creator") && StringUtils.isNotEmpty(obj.getString("creator"))) {
				active.setCreator(obj.getInt("creator"));
			}

			// 发起活动时间
			active.setCreateDate(new Date());
			
			// 活动状态(发起活动时为进行中状态)
			active.setStatus("0");

			// 调用dao层，发起活动数据写到数据库中
			int i = activeDao.insert(active);
			if (i < 0) {
				// 发起活动失败
				ret.accumulate("success", false).accumulate("msg", "发起活动失败");
			} else {
				// 发起活动成功
				ret.accumulate("success", true).accumulate("msg", "OK").accumulate("id", active.getId());
				
				// 发起活动成功，添加专家数据
			   JSONArray expertIds =  (JSONArray) obj.get("expertIds");
				for (Object expertId : expertIds) {
					expertService.expertAddByLaunch(active.getId(), Integer.valueOf(expertId.toString()));
				}
				
				//  查询当前活动的专家信息
				List<Map<String, Object>> expertList = activeDao.getExpertByActive(active.getId());
				
				// 给专家发送微信模板通知
				WechatManager wechatManager = new WechatManager(Constants.APP_ID, Constants.APP_SECRET);
				String template_id = Constants.ACTIVE_AUDIT_RESULT;
				String url = "http://funcoin.cardcol.com/active/activeDetail.html";
				
				// 循环发送微信模板通知
				for (Map<String, Object> map : expertList) {
					String openid = String.valueOf(map.get("wechat_id"));
					JSONObject dataJson = new JSONObject();
					dataJson.accumulate("first", new JSONObject().accumulate("value", "你已被选择为 '"+ active.getName() +"'的专家，请关注该活动。"))
					        .accumulate("keyword1", new JSONObject().accumulate("value", active.getName()))
					        .accumulate("keyword2", new JSONObject().accumulate("value", "审核通过"))
					        .accumulate("remark", new JSONObject().accumulate("value", "祝你生活愉快！"))
					        ;
					SendTemplateRequest sendTemplateRequest = new SendTemplateRequest(openid, template_id, url, dataJson);
					wechatManager.sendTemplateMessage(sendTemplateRequest);
				}
				
				
				
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;

	}

	/**
	 * 活动列表
	 */
	@Override
	public JSONObject list() {
		JSONObject ret = new JSONObject();
		try {
			// 进行中的活动
			List<Map<String, Object>> goingList = activeDao.goingOnActives();
			for (Map<String, Object> map : goingList) {
				Integer activeId = Integer.valueOf(String.valueOf(map.get("id")));
				Map<String, Object> mapx = memberDao.getCountByActive(activeId);
				map.put("voteCount", mapx.get("voteCount"));
				map.put("betCount", mapx.get("betCount"));
			}

			// 已结束的活动
			List<Map<String, Object>> overList = activeDao.overActives();
			for (Map<String, Object> map : overList) {
				Integer activeId = Integer.valueOf(String.valueOf(map.get("id")));
				Map<String, Object> mapx = memberDao.getCountByActive(activeId);
				map.put("voteCount", mapx.get("voteCount"));
				map.put("betCount", mapx.get("betCount"));
			}

			ret.accumulate("success", true).accumulate("msg", "OK")
					.accumulate("goingList", JsonUtils.ListMapToJsonDateFormat(goingList, "yyyy-MM-dd"))
					.accumulate("overList", JsonUtils.ListMapToJsonDateFormat(overList, "yyyy-MM-dd"));
		} catch (Exception e) {
			ret.accumulate("success", false).accumulate("msg", e);
			e.printStackTrace();
		}

		return ret;
	}

	/**
	 * 活动详情
	 */
	@Override
	public JSONObject detail(JSONObject obj) {
		JSONObject ret = new JSONObject();
		try {
			List<Map<String, Object>> listDou = new LinkedList<Map<String, Object>>();
			if (obj.containsKey("id") && StringUtils.isNotEmpty(obj.getString("id"))) {
				String currentMember = obj.getString("currentMember");
				int id = obj.getInt("id");
				// 调用dao层接口 查询基本信息
				Map<String, Object> map = activeDao.detail(id);
				
				// 处理remark
				String remarks = map.get("remark").toString();
				String[] dou_remarks = remarks.split("。");
				String dou = "";
				for (String dou_remark : dou_remarks) {
					if (dou_remark.equals(dou_remarks[0])){
						dou_remark = "<span>" + dou_remark + "。</span></br>" ;
					} else {
						dou_remark = "<span class='dou-remark'>" + dou_remark + "。</span></br>";
					}
					dou = dou + "" + dou_remark;
				}
				map.put("remark", dou.toString());
				
				// 当前用户相对于本活动的角色判定
				map.put("role", "audience");
				if (map.get("referee") != null && currentMember.equals(map.get("referee").toString())) {
					map.put("role", "referee");
				}
				if (map.get("creator") != null && currentMember.equals(map.get("creator").toString())) {
					map.put("role", "creator");
				}

				// 调用dao层接口 查询专家的信息
				List<Map<String, Object>> activeExpertList = activeDao.activeExpert(id);

				for (Map<String, Object> map2 : activeExpertList) {
					if (currentMember.equals(map2.get("expertId"))) {
						map.put("role", "expert");
					}
					listDou.add(map2);
				}

				if (StringUtils.isNotEmpty(String.valueOf(map.get("refereeName")))) {
					HashMap<String, Object> map3 = new HashMap<String, Object>();
					map3.put("id", map.get("refereeId"));
					map3.put("name", map.get("refereeName"));
					map3.put("role", "裁判");
					map3.put("image", map.get("refereeImage"));
					listDou.add(0, map3);
				}
				JSONObject detail = JsonUtils.MapToJsonDateFormat(map, "yyyy-MM-dd HH:mm");
				JSONArray activeExperts = JsonUtils.ListMapToJsonDateFormat(listDou, "yyyy-MM-dd");
				ret.accumulate("success", true).accumulate("msg", "OK").accumulate("detail", detail)
						.accumulate("activeExperts", activeExperts);
			}
		} catch (Exception e) {
			ret.accumulate("success", false).accumulate("msg", e.toString());
		}
		return ret;
	}

	@Override
	public JSONObject searchActive(JSONObject param) {
		JSONObject result = new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("now", commentsUtil.format(new Date(), "yyyy-MM-dd"));
		map.put("workId", param.get("workId"));
		if (param.containsKey("activeName")) {
			map.put("activeName", "%" + param.getString("activeName") + "%");
		}
		result.accumulate("success", true).accumulate("activeList", activeDao.searchActive(map));
		return result;
	}

}
