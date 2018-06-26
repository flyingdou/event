package com.whhyl.entity;

import java.util.Date;

/**
 * 订单
 * @author Administrator
 *
 */
public class Order {
	/**
	 * 主键
	 */
    private Integer id;

    /**
	 * 商品类型(A充值,B兑换,C赠送,D投注,E投注结算)
	 */
    private String productType;
    
    /**
     * 商品ID
     */
    private Integer product;
    
    /**
	 * 金额(充值时用户花费的人民币)
	 */
    private Double money;

    /**
	 * 订单金额
	 */
    private String funcoin;

    /**
	 * 付款方
	 */
    private Integer member;

    /**
	 * 收款方
	 */
    private Integer tomember;

    /**
	 * 订单状态(0未付款订单，1有效订单)
	 */
    private String status;

    /**
	 * 订单时间
	 */
    private Date autoTime;
    
    /**
     * 备注
     */
    private String remark;
    
    /**
     * 订单号
     */
    private String no;
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType == null ? null : productType.trim();
    }
    
    public Integer getProduct() {
        return product;
    }

    public void setProduct(Integer product) {
        this.product = product;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public String getFuncoin() {
        return funcoin;
    }

    public void setFuncoin(String funcoin) {
        this.funcoin = funcoin == null ? null : funcoin.trim();
    }

    public Integer getMember() {
        return member;
    }

    public void setMember(Integer member) {
        this.member = member;
    }

    public Integer getTomember() {
        return tomember;
    }

    public void setTomember(Integer tomember) {
        this.tomember = tomember;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Date getAutoTime() {
        return autoTime;
    }

    public void setAutoTime(Date autoTime) {
        this.autoTime = autoTime;
    }

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark == null ? null : remark.trim();
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no == null ? null : no.trim();
	}
    
}