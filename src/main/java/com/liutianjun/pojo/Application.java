package com.liutianjun.pojo;

import java.io.Serializable;

public class Application implements Serializable {
    /**
     * 应用编号
     */
    private Integer id;

    /**
     * 应用名称
     */
    private String appName;

    /**
     * 创建人
     */
    private String creator;

    /**
     * 应用类别
     */
    private String appType;

    /**
     * 关键字
     */
    private String keywords;

    /**
     * 版本
     */
    private String versions;

    /**
     * 创建时间
     */
    private String createTime;

    /**
     * 状态
     */
    private String status;

    /**
     * 参数1
     */
    private String paraA;

    /**
     * 参数2
     */
    private String paraB;

    /**
     * 应用概述
     */
    private String appOverview;

    /**
     * 数据格式
     */
    private String dataFormat;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAppName() {
        return appName;
    }

    public void setAppName(String appName) {
        this.appName = appName == null ? null : appName.trim();
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator == null ? null : creator.trim();
    }

    public String getAppType() {
        return appType;
    }

    public void setAppType(String appType) {
        this.appType = appType == null ? null : appType.trim();
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords == null ? null : keywords.trim();
    }

    public String getVersions() {
        return versions;
    }

    public void setVersions(String versions) {
        this.versions = versions == null ? null : versions.trim();
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime == null ? null : createTime.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getParaA() {
        return paraA;
    }

    public void setParaA(String paraA) {
        this.paraA = paraA == null ? null : paraA.trim();
    }

    public String getParaB() {
        return paraB;
    }

    public void setParaB(String paraB) {
        this.paraB = paraB == null ? null : paraB.trim();
    }

    public String getAppOverview() {
        return appOverview;
    }

    public void setAppOverview(String appOverview) {
        this.appOverview = appOverview == null ? null : appOverview.trim();
    }

    public String getDataFormat() {
        return dataFormat;
    }

    public void setDataFormat(String dataFormat) {
        this.dataFormat = dataFormat == null ? null : dataFormat.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", appName=").append(appName);
        sb.append(", creator=").append(creator);
        sb.append(", appType=").append(appType);
        sb.append(", keywords=").append(keywords);
        sb.append(", versions=").append(versions);
        sb.append(", createTime=").append(createTime);
        sb.append(", status=").append(status);
        sb.append(", paraA=").append(paraA);
        sb.append(", paraB=").append(paraB);
        sb.append(", appOverview=").append(appOverview);
        sb.append(", dataFormat=").append(dataFormat);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}