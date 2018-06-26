package com.whhyl.entity;

import java.util.Date;

/**
 * 投注
 * @author Administrator
 *
 */
public class Betting {
	/**
	 * 主键
	 */
    private Integer id;

    /**
	 * 活动ID
	 */
    private Integer activeId;

    /**
	 * 参赛作品
	 */
    private Integer contestant;

    /**
	 * 投注者
	 */
    private Integer member;

    /**
	 * 投注数额
	 */
    private Integer betMoney;

    /**
	 * 投注时间
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

    public Integer getActiveId() {
        return activeId;
    }

    public void setActiveId(Integer activeId) {
        this.activeId = activeId;
    }

    public Integer getContestant() {
        return contestant;
    }

    public void setContestant(Integer contestant) {
        this.contestant = contestant;
    }

    public Integer getMember() {
        return member;
    }

    public void setMember(Integer member) {
        this.member = member;
    }

    public Integer getBetMoney() {
        return betMoney;
    }

    public void setBetMoney(Integer betMoney) {
        this.betMoney = betMoney;
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