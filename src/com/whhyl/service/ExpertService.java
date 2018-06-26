package com.whhyl.service;

/**
 * 
 * @author dou
 * 专家预测业务接口
 *
 */
public interface ExpertService {

	/**
	 * 发起预测
	 */
	public void expertAddByLaunch(Long activeId, Integer expertId); 
	
	
}
