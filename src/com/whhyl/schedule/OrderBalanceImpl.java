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

import com.whhyl.dao.ActiveMapper;
import com.whhyl.dao.BettingMapper;
import com.whhyl.dao.OrderMapper;
import com.whhyl.dao.WorksMapper;
import com.whhyl.entity.Active;
import com.whhyl.entity.Order;
import com.whhyl.util.commentsUtil;
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
	    
	    Order order = new Order();
	    Map<String, Object> param = new HashMap<String, Object> ();
	    param.put("active_id", active.getId());
	    param.put("win_count", active.getWinCount());
	    
	    //查询当前获胜用户投注的数据
	    List<Map<String, Object>> betList = betDao.winMemberBetting(param);
	    
	    // 按注分润
		if ("0".equals(active.getBalanceType())){
		    Integer betMoneyCount = worksDao.betMoneyCount(active.getId().intValue());
		    
		    //庄家获利
	    	Double T = betMoneyCount.doubleValue() *0.2;
	    	order = new Order();
	    	order.setNo(sdf.format(new Date()).replace("-", "") + commentsUtil.getRandomString());
	    	order.setStatus("3");
			order.setMember(10);
			order.setFuncoin(T.toString());
			order.setTomember(active.getCreator());
			order.setProduct(Integer.valueOf(String.valueOf(active.getId())));
			order.setAutoTime(new Date());
			order.setProductType("E");
			order.setRemark("庄家投注胜利赢钱");
			orderDao.insert(order);
			
			
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
			}
       }
   
		// 按率分润
		if ("1".equals(active.getBalanceType())) {
			 // 活动发起人赔给获胜者的金额
			 Double cashMoney = 0.0;
			 // 玩家对当前活动的总投注金额
			 Double betMoneyCount = Double.valueOf(worksDao.betMoneyCount(active.getId().intValue()));
			 
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
			}
			 
			// 活动发起人订单数据，获利或赔钱
			Double creatorMoney = betMoneyCount - cashMoney;
			order = new Order();
	    	order.setNo(sdf.format(new Date()).replace("-", "") + commentsUtil.getRandomString());
	    	order.setStatus("3");
			order.setMember(10);
			order.setFuncoin(creatorMoney.toString());
			order.setTomember(active.getCreator());
			order.setProduct(Integer.valueOf(String.valueOf(active.getId())));
			order.setAutoTime(new Date());
			order.setProductType("E");
			if (creatorMoney >= 0) {
				order.setRemark("庄家开庄赢钱");
			} else {
				order.setRemark("庄家开庄赔钱");
			}
			orderDao.insert(order);
		}
		
		
	
	
   }
	
	
	
	
}
