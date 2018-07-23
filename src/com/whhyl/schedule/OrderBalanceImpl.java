package com.whhyl.schedule;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.whhyl.common.Constants;
import com.whhyl.dao.ActiveMapper;
import com.whhyl.dao.BettingMapper;
import com.whhyl.dao.MemberMapper;
import com.whhyl.dao.OrderMapper;
import com.whhyl.dao.WorksMapper;
import com.whhyl.entity.Active;
import com.whhyl.entity.Member;
import com.whhyl.entity.Order;
import com.whhyl.util.commentsUtil;
import com.whhyl.wechatApi.SendTemplateRequest;
import com.whhyl.wechatApi.WechatManager;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 投注结算业务 
 * @author dou
 *
 */

@Transactional
@Component
@Configuration
@EnableAsync 
@EnableScheduling
public class OrderBalanceImpl  implements OrderBalance {

	@Autowired
	private WorksMapper worksDao;
	
	@Autowired
	private BettingMapper betDao;
	
	@Autowired
	private OrderMapper orderDao;
	
	@Autowired
	private ActiveMapper activeDao;
	
	@Autowired
	private MemberMapper memberDao;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	/**
	 * 活动到了投票截止日期，观众投票的判定胜负
	 */
	@Scheduled(cron = "1/60 * * * * ?") // 秒 分 时 日 月 周 * 年
	@Override
	public void setVictory () {
			// 查询活动的获胜队伍数量
			List<Map<String, Object>> decisionList =  activeDao.getDecisoinActive();
			for (Map<String, Object> map : decisionList) {
				// 有需要判定胜负的活动，将这些活动对应的判定表数据查询出来
				Map<String, Object> paramMap = new HashMap<String, Object>();
				paramMap.put("active", map.get("id"));
				paramMap.put("win_count", map.get("win_count"));
				List<Map<String, Object>> decisionDataList =  activeDao.getDecisionData(paramMap);
				if (decisionDataList != null){
					// 有数据，排名次
					for (int i = 0; i < decisionDataList.size() ; i++) {
						// 设排名
						decisionDataList.get(i).put("ranke", i+1);
						
						// 持久化数据
						activeDao.updateDecision(decisionDataList.get(i));
						
					}
				}
			}
		
		
		
	}
	
	
	
	/**
	 * 定时结算(观众决定胜负的)业务
	 */
	@Scheduled(cron = "10/60 * * * * ?") // 秒 分 时 日 月 周 * 年
	@Override
	public void balance() {
			// 查询出已近到了投票截止时间且还未结束的活动
			List<Active> activeList = activeDao.getBalanceDataList();
			for (Active active : activeList) {
				// 裁判判定
				if ("0".equals(active.getRefereeModel().toString())) {
					active.setStatus("2");
				}
				
				// 观众决定胜负的活动
				if ("1".equals(active.getRefereeModel().toString())) {
					balanceData(active);
					active.setStatus("1");
				} 
				
				activeDao.updateByPrimaryKey(active);
			}
		
	}
	
	
	/**
	 * 结算业务逻辑
	 */
   @Override
   public void balanceData(Active active) {
	    
	    // 获利用户订单
	    Order order = new Order();
	    Map<String, Object> param = new HashMap<String, Object> ();
	    param.put("active_id", active.getId());
	    param.put("win_count", active.getWinCount());
	    
	    //查询当前获胜用户投注的数据
	    List<Map<String, Object>> betList = betDao.winMemberBetting(param);
	    
	    // 查询庄家
	    Member creator = memberDao.selectByPrimaryKey(Long.valueOf(String.valueOf(active.getCreator())));
	    
	    // 庄家订单
	    Order cretorOrder = new Order();
	    
	    // 胜利用户参数
	    JSONArray winnerParam = new JSONArray();
	    
	    // 按注分润
		if ("0".equals(active.getBalanceType())){
		    Integer betMoneyCount = worksDao.betMoneyCount(active.getId().intValue());
		    
		    //庄家获利
	    	Double T = betMoneyCount.doubleValue() *0.2;
	    	cretorOrder = new Order();
	    	cretorOrder.setNo(sdf.format(new Date()).replace("-", "") + commentsUtil.getRandomString());
	    	cretorOrder.setStatus("3");
	    	cretorOrder.setMember(10);
	    	cretorOrder.setFuncoin(T.toString());
			cretorOrder.setTomember(active.getCreator());
			cretorOrder.setProduct(Integer.valueOf(String.valueOf(active.getId())));
			cretorOrder.setAutoTime(new Date());
			cretorOrder.setProductType("E");
			cretorOrder.setRemark("庄家投注胜利赢钱");
			orderDao.insert(cretorOrder);
			
			winnerParam = new JSONArray();
		    for (Map<String, Object> bet : betList) {
		    	Double betMoney = Double.valueOf(String.valueOf(bet.get("bet_money")));
				Double memberWinMoney = (betMoney / betMoneyCount.doubleValue())*(betMoneyCount-T) + betMoney;
				//玩家获利
				order = new Order();
				order.setNo(sdf.format(new Date()).replace("-", "") + commentsUtil.getRandomString());
				order.setStatus("3");
				order.setMember(10);
				order.setFuncoin(memberWinMoney.toString());
				order.setTomember(Integer.valueOf(String.valueOf(bet.get("member"))));
				order.setProduct(Integer.parseInt(String.valueOf(active.getId())));
				order.setAutoTime(new Date());
				order.setProductType("E");
				order.setRemark("玩家投注胜利赢钱");
				orderDao.insert(order);
				// 查询当前用户余额
				Double balanceFuncoin = orderDao.queryBalance(Integer.valueOf(String.valueOf(bet.get("member"))));
				JSONObject winParam = new JSONObject();
				winParam.accumulate("openid", bet.get("wechat_id"))
				        .accumulate("funcoin", order.getFuncoin())
				        .accumulate("balance", balanceFuncoin)
				        ;
				winnerParam.add(winParam);
			}
       }
   
		// 按率分润
		if ("1".equals(active.getBalanceType())) {
			 // 活动发起人赔给获胜者的金额
			 Double cashMoney = 0.0;
			 // 玩家对当前活动的总投注金额
			 Double betMoneyCount = Double.valueOf(worksDao.betMoneyCount(active.getId().intValue()));
			 
			 winnerParam = new JSONArray();
			 // 玩家获利
			 for (Map<String, Object> map : betList) {
				Double memberWinMoney = (Double.valueOf(String.valueOf(map.get("bet_money"))))*Double.valueOf(String.valueOf(map.get("pay_rate")))/100;
				//玩家获利
				order = new Order();
				order.setNo(sdf.format(new Date()).replace("-", "") + commentsUtil.getRandomString());
				order.setStatus("3");
				order.setMember(10);
				order.setFuncoin(memberWinMoney.toString());
				order.setTomember(Integer.valueOf(String.valueOf(map.get("member"))));
				order.setProduct(Integer.parseInt(String.valueOf(active.getId())));
				order.setAutoTime(new Date());
				order.setProductType("E");
				order.setRemark("玩家投注胜利赢钱");
				orderDao.insert(order);
				cashMoney += memberWinMoney;
				
				// 查询当前用户余额
				Double balanceFuncoin = orderDao.queryBalance(Integer.valueOf(String.valueOf(map.get("member"))));
				JSONObject winParam = new JSONObject();
				winParam.accumulate("openid", map.get("wechat_id"))
				        .accumulate("funcoin", order.getFuncoin())
				        .accumulate("balance", balanceFuncoin)
				        ;
				winnerParam.add(winParam);
			}
			 
			// 活动发起人订单数据，获利或赔钱
			Double creatorMoney = betMoneyCount - cashMoney;
			cretorOrder = new Order();
			cretorOrder.setNo(sdf.format(new Date()).replace("-", "") + commentsUtil.getRandomString());
			cretorOrder.setStatus("3");
			cretorOrder.setMember(10);
			cretorOrder.setFuncoin(creatorMoney.toString());
			cretorOrder.setTomember(active.getCreator());
			cretorOrder.setProduct(Integer.valueOf(String.valueOf(active.getId())));
			cretorOrder.setAutoTime(new Date());
			cretorOrder.setProductType("E");
			if (creatorMoney >= 0) {
				cretorOrder.setRemark("庄家开庄赢钱");
			} else {
				cretorOrder.setRemark("庄家开庄赔钱");
			}
			orderDao.insert(cretorOrder);
		}
		
		// 数据持久化完成，无异常，再来发送微信模板消息
		// 准备发送结算通知
	    WechatManager wechatManager = new WechatManager(Constants.APP_ID, Constants.APP_SECRET);
	    String url = Constants.BALANCE_COMPLETE_URL;
	    String template_id = Constants.BALANCE_COMPLETE;
	    String openid = "";
	    JSONObject dataJson = new JSONObject();
	    // 庄家本次订单的交易金额，可正可负
		Double cf = Double.valueOf(cretorOrder.getFuncoin());
		
		// 查询庄家当前余额
		Double balanceFuncoin = orderDao.queryBalance(cretorOrder.getMember());
		
		// first提示语
		String first = "您在'" + active.getName() + "'活动中的结算结果如下: ";
		
		String remark = "";
		// 获利
		if (cf > 0) {
			remark = "恭喜您，本次赢得奖励！";
		} else {
			remark = "本次未获利，再接再厉！";
		}
	    openid = creator.getWechatId();
		dataJson.accumulate("first", new JSONObject().accumulate("value", first))
		        .accumulate("keyword1", new JSONObject().accumulate("value", commentsUtil.dateFormat(new Date(), "yyyy-MM-dd HH:mm")))
		        .accumulate("keyword2", new JSONObject().accumulate("value", cretorOrder.getFuncoin() + "FC"))
		        .accumulate("keyword3", new JSONObject().accumulate("value", balanceFuncoin + "FC"))
		        .accumulate("remark", new JSONObject().accumulate("value", remark))
		        ;
		
		// 给庄家发送结算完成通知
		SendTemplateRequest sendTemplateRequest = new SendTemplateRequest(openid, template_id, url, dataJson);
		wechatManager.sendTemplateMessage(sendTemplateRequest);
		
		
		// 给获胜用户发结算通知
		for (Object object : winnerParam) {
			JSONObject winner = JSONObject.fromObject(object);
			openid = winner.getString("openid");
			dataJson = new JSONObject();
			remark = "恭喜您，赢得奖励！";
			dataJson.accumulate("first", new JSONObject().accumulate("value", first))
			        .accumulate("keyword1", new JSONObject().accumulate("value", commentsUtil.dateFormat(new Date(), "yyyy-MM-dd HH:mm")))
			        .accumulate("keyword2", new JSONObject().accumulate("value", winner.getString("funcoin")) + "FC")
			        .accumulate("keyword3", new JSONObject().accumulate("value", winner.getString("balance")) + "FC")
			        .accumulate("remark", new JSONObject().accumulate("value", remark))
			        ;
			sendTemplateRequest = new SendTemplateRequest(openid, template_id, url, dataJson); 
			wechatManager.sendTemplateMessage(sendTemplateRequest);
		}
		
	
	
   }
	
	
	
	
}
