package com.whhyl.entity;

import java.util.Date;

/**
 * 回复
 * @author Administrator
 *
 */
public class Reply {
	/**
	 * 主键
	 */
    private Integer id;

    /**
	 * 回复的评论
	 */
    private Integer evaluate;

    /**
	 * 回复内容
	 */
    private String content;

    /**
	 * 回复者
	 */
    private Integer member;

    /**
	 * 被回复者
	 */
    private Integer replyTo;

    /**
	 * 父回复
	 */
    private Integer parent;

    /**
	 * 回复时间
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

    public Integer getEvaluate() {
        return evaluate;
    }

    public void setEvaluate(Integer evaluate) {
        this.evaluate = evaluate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getMember() {
        return member;
    }

    public void setMember(Integer member) {
        this.member = member;
    }

    public Integer getReplyTo() {
        return replyTo;
    }

    public void setReplyTo(Integer replyTo) {
        this.replyTo = replyTo;
    }

    public Integer getParent() {
        return parent;
    }

    public void setParent(Integer parent) {
        this.parent = parent;
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