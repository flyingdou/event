package com.whhyl.schedule;

import com.whhyl.entity.Active;

/**
 * 
 * @author 定时任务接口
 *
 */
public interface OrderBalance {
	
	
	public void setVictory ();
	
	public void balance();
	
	public void balanceData(Active active);
	
	
}
