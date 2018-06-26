package com.whhyl.entity;

import java.util.Date;

/**
 * 商品
 * @author Administrator
 *
 */
public class Product {
	/**
	 * 
	 */
    private Integer id;

    /**
	 * 
	 */
    private String name;

    /**
	 * 
	 */
    private String image;

    /**
	 * 主键
	 */
    private Integer count;

    /**
	 * 单价
	 */
    private Long funcoin;

    /**
	 * 商品发布者
	 */
    private Integer member;

    /**
	 * 商品状态(1可以兑换的商品，2已下架的商品，不可兑换)
	 */
    private String status;

    /**
	 * 上架时间
	 */
    private Date autoTime;

    private String backup1;

    private String backup2;

    private String backup3;

    private String backup4;

    private String backup5;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Long getFuncoin() {
        return funcoin;
    }

    public void setFuncoin(Long funcoin) {
        this.funcoin = funcoin;
    }

    public Integer getMember() {
        return member;
    }

    public void setMember(Integer member) {
        this.member = member;
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

    public String getBackup1() {
        return backup1;
    }

    public void setBackup1(String backup1) {
        this.backup1 = backup1 == null ? null : backup1.trim();
    }

    public String getBackup2() {
        return backup2;
    }

    public void setBackup2(String backup2) {
        this.backup2 = backup2 == null ? null : backup2.trim();
    }

    public String getBackup3() {
        return backup3;
    }

    public void setBackup3(String backup3) {
        this.backup3 = backup3 == null ? null : backup3.trim();
    }

    public String getBackup4() {
        return backup4;
    }

    public void setBackup4(String backup4) {
        this.backup4 = backup4 == null ? null : backup4.trim();
    }

    public String getBackup5() {
        return backup5;
    }

    public void setBackup5(String backup5) {
        this.backup5 = backup5 == null ? null : backup5.trim();
    }
}