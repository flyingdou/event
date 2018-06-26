package com.whhyl.dao;

import java.util.List;
import java.util.Map;

import com.whhyl.entity.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    Order selectById(Integer id);

    List<Order> selectAll();

    int updateByPrimaryKey(Order record);
    
    /**
     * 查询用户余额
     * @param member
     * @return
     */
    public Double queryBalance(Integer member);
    
    /**
     * 根据订单号查询订单信息
     */
    public Order findOrderByNo(String no);
    
    /**
     * 我的钱包，查询出当前用户的收入明细
     */
    public List<Map<String, Object>> incomeOrder(Integer member);
    
    /**
     * 我的钱包，查询出当前用户的支出明细
     */
    public List<Map<String, Object>> outOrder(Integer member);
}