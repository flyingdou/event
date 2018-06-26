package com.whhyl.entity;

import java.util.Date;

/**
 * 活动
 * @author Administrator
 *
 */
public class Active {
	/**
	 * 主键
	 */
    private Long id;

    /**
     * 活动名称
     */
    private String name;

    /**
     * 报名截止时间
     */
    private Date registrationDeadline;

    /**
     * 投票截止时间
     */
    private Date voteDeadline;

    /**
     * 裁判模式  0裁判决定胜负; 1观众投票决定胜负
     */
    private Integer refereeModel;

   /**
    * 裁判
    */
    private Integer referee;

    /**
     * 胜利者数量
     */
    private Integer winCount;

    /**
     * 投票奖励
     */
    private Integer voteParise;

    /**
     * 最小投注数量
     */
    private Integer betMin;

    /**
     * 活动规则
     */
    private String remark;

    /**
     * 活动海报(图片)
     */
    private String poster;

    /**
     * 活动发起者
     */
    private Integer creator;

    /**
     * 活动发起时间
     */
    private Date createDate;

    /**
     * 活动结算方式   0按注分润; 1按率分润
     */
    private String balanceType;

    /**
     * 活动状态   0进行中; 1已结算; 2等裁判判定
     */
    private String status;

    private String backup3;

    private String backup4;

    private String backup5;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Date getRegistrationDeadline() {
        return registrationDeadline;
    }

    public void setRegistrationDeadline(Date registrationDeadline) {
        this.registrationDeadline = registrationDeadline;
    }

    public Date getVoteDeadline() {
        return voteDeadline;
    }

    public void setVoteDeadline(Date voteDeadline) {
        this.voteDeadline = voteDeadline;
    }

    public Integer getRefereeModel() {
        return refereeModel;
    }

    public void setRefereeModel(Integer refereeModel) {
        this.refereeModel = refereeModel;
    }

    public Integer getReferee() {
        return referee;
    }

    public void setReferee(Integer referee) {
        this.referee = referee;
    }

    public Integer getWinCount() {
        return winCount;
    }

    public void setWinCount(Integer winCount) {
        this.winCount = winCount;
    }

    public Integer getVoteParise() {
        return voteParise;
    }

    public void setVoteParise(Integer voteParise) {
        this.voteParise = voteParise;
    }

    public Integer getBetMin() {
        return betMin;
    }

    public void setBetMin(Integer betMin) {
        this.betMin = betMin;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster == null ? null : poster.trim();
    }

    public Integer getCreator() {
        return creator;
    }

    public void setCreator(Integer creator) {
        this.creator = creator;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getBalanceType() {
        return balanceType;
    }

    public void setBalanceType(String balanceType) {
        this.balanceType = balanceType == null ? null : balanceType.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
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