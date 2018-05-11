package com.liutianjun.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ApplicationQuery {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    protected Integer pageNo = 1;

    protected Integer startRow;

    protected Integer pageSize = 10;

    protected String fields;

    public ApplicationQuery() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo=pageNo;
        this.startRow = (pageNo-1)*this.pageSize;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setStartRow(Integer startRow) {
        this.startRow=startRow;
    }

    public Integer getStartRow() {
        return startRow;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize=pageSize;
        this.startRow = (pageNo-1)*this.pageSize;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setFields(String fields) {
        this.fields=fields;
    }

    public String getFields() {
        return fields;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andAppNameIsNull() {
            addCriterion("app_name is null");
            return (Criteria) this;
        }

        public Criteria andAppNameIsNotNull() {
            addCriterion("app_name is not null");
            return (Criteria) this;
        }

        public Criteria andAppNameEqualTo(String value) {
            addCriterion("app_name =", value, "appName");
            return (Criteria) this;
        }

        public Criteria andAppNameNotEqualTo(String value) {
            addCriterion("app_name <>", value, "appName");
            return (Criteria) this;
        }

        public Criteria andAppNameGreaterThan(String value) {
            addCriterion("app_name >", value, "appName");
            return (Criteria) this;
        }

        public Criteria andAppNameGreaterThanOrEqualTo(String value) {
            addCriterion("app_name >=", value, "appName");
            return (Criteria) this;
        }

        public Criteria andAppNameLessThan(String value) {
            addCriterion("app_name <", value, "appName");
            return (Criteria) this;
        }

        public Criteria andAppNameLessThanOrEqualTo(String value) {
            addCriterion("app_name <=", value, "appName");
            return (Criteria) this;
        }

        public Criteria andAppNameLike(String value) {
            addCriterion("app_name like", value, "appName");
            return (Criteria) this;
        }

        public Criteria andAppNameNotLike(String value) {
            addCriterion("app_name not like", value, "appName");
            return (Criteria) this;
        }

        public Criteria andAppNameIn(List<String> values) {
            addCriterion("app_name in", values, "appName");
            return (Criteria) this;
        }

        public Criteria andAppNameNotIn(List<String> values) {
            addCriterion("app_name not in", values, "appName");
            return (Criteria) this;
        }

        public Criteria andAppNameBetween(String value1, String value2) {
            addCriterion("app_name between", value1, value2, "appName");
            return (Criteria) this;
        }

        public Criteria andAppNameNotBetween(String value1, String value2) {
            addCriterion("app_name not between", value1, value2, "appName");
            return (Criteria) this;
        }

        public Criteria andCreatorIsNull() {
            addCriterion("creator is null");
            return (Criteria) this;
        }

        public Criteria andCreatorIsNotNull() {
            addCriterion("creator is not null");
            return (Criteria) this;
        }

        public Criteria andCreatorEqualTo(String value) {
            addCriterion("creator =", value, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorNotEqualTo(String value) {
            addCriterion("creator <>", value, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorGreaterThan(String value) {
            addCriterion("creator >", value, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorGreaterThanOrEqualTo(String value) {
            addCriterion("creator >=", value, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorLessThan(String value) {
            addCriterion("creator <", value, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorLessThanOrEqualTo(String value) {
            addCriterion("creator <=", value, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorLike(String value) {
            addCriterion("creator like", value, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorNotLike(String value) {
            addCriterion("creator not like", value, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorIn(List<String> values) {
            addCriterion("creator in", values, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorNotIn(List<String> values) {
            addCriterion("creator not in", values, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorBetween(String value1, String value2) {
            addCriterion("creator between", value1, value2, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorNotBetween(String value1, String value2) {
            addCriterion("creator not between", value1, value2, "creator");
            return (Criteria) this;
        }

        public Criteria andAppTypeIsNull() {
            addCriterion("app_type is null");
            return (Criteria) this;
        }

        public Criteria andAppTypeIsNotNull() {
            addCriterion("app_type is not null");
            return (Criteria) this;
        }

        public Criteria andAppTypeEqualTo(String value) {
            addCriterion("app_type =", value, "appType");
            return (Criteria) this;
        }

        public Criteria andAppTypeNotEqualTo(String value) {
            addCriterion("app_type <>", value, "appType");
            return (Criteria) this;
        }

        public Criteria andAppTypeGreaterThan(String value) {
            addCriterion("app_type >", value, "appType");
            return (Criteria) this;
        }

        public Criteria andAppTypeGreaterThanOrEqualTo(String value) {
            addCriterion("app_type >=", value, "appType");
            return (Criteria) this;
        }

        public Criteria andAppTypeLessThan(String value) {
            addCriterion("app_type <", value, "appType");
            return (Criteria) this;
        }

        public Criteria andAppTypeLessThanOrEqualTo(String value) {
            addCriterion("app_type <=", value, "appType");
            return (Criteria) this;
        }

        public Criteria andAppTypeLike(String value) {
            addCriterion("app_type like", value, "appType");
            return (Criteria) this;
        }

        public Criteria andAppTypeNotLike(String value) {
            addCriterion("app_type not like", value, "appType");
            return (Criteria) this;
        }

        public Criteria andAppTypeIn(List<String> values) {
            addCriterion("app_type in", values, "appType");
            return (Criteria) this;
        }

        public Criteria andAppTypeNotIn(List<String> values) {
            addCriterion("app_type not in", values, "appType");
            return (Criteria) this;
        }

        public Criteria andAppTypeBetween(String value1, String value2) {
            addCriterion("app_type between", value1, value2, "appType");
            return (Criteria) this;
        }

        public Criteria andAppTypeNotBetween(String value1, String value2) {
            addCriterion("app_type not between", value1, value2, "appType");
            return (Criteria) this;
        }

        public Criteria andIsAsyncIsNull() {
            addCriterion("is_async is null");
            return (Criteria) this;
        }

        public Criteria andIsAsyncIsNotNull() {
            addCriterion("is_async is not null");
            return (Criteria) this;
        }

        public Criteria andIsAsyncEqualTo(Integer value) {
            addCriterion("is_async =", value, "isAsync");
            return (Criteria) this;
        }

        public Criteria andIsAsyncNotEqualTo(Integer value) {
            addCriterion("is_async <>", value, "isAsync");
            return (Criteria) this;
        }

        public Criteria andIsAsyncGreaterThan(Integer value) {
            addCriterion("is_async >", value, "isAsync");
            return (Criteria) this;
        }

        public Criteria andIsAsyncGreaterThanOrEqualTo(Integer value) {
            addCriterion("is_async >=", value, "isAsync");
            return (Criteria) this;
        }

        public Criteria andIsAsyncLessThan(Integer value) {
            addCriterion("is_async <", value, "isAsync");
            return (Criteria) this;
        }

        public Criteria andIsAsyncLessThanOrEqualTo(Integer value) {
            addCriterion("is_async <=", value, "isAsync");
            return (Criteria) this;
        }

        public Criteria andIsAsyncIn(List<Integer> values) {
            addCriterion("is_async in", values, "isAsync");
            return (Criteria) this;
        }

        public Criteria andIsAsyncNotIn(List<Integer> values) {
            addCriterion("is_async not in", values, "isAsync");
            return (Criteria) this;
        }

        public Criteria andIsAsyncBetween(Integer value1, Integer value2) {
            addCriterion("is_async between", value1, value2, "isAsync");
            return (Criteria) this;
        }

        public Criteria andIsAsyncNotBetween(Integer value1, Integer value2) {
            addCriterion("is_async not between", value1, value2, "isAsync");
            return (Criteria) this;
        }

        public Criteria andKeywordsIsNull() {
            addCriterion("keywords is null");
            return (Criteria) this;
        }

        public Criteria andKeywordsIsNotNull() {
            addCriterion("keywords is not null");
            return (Criteria) this;
        }

        public Criteria andKeywordsEqualTo(String value) {
            addCriterion("keywords =", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsNotEqualTo(String value) {
            addCriterion("keywords <>", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsGreaterThan(String value) {
            addCriterion("keywords >", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsGreaterThanOrEqualTo(String value) {
            addCriterion("keywords >=", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsLessThan(String value) {
            addCriterion("keywords <", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsLessThanOrEqualTo(String value) {
            addCriterion("keywords <=", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsLike(String value) {
            addCriterion("keywords like", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsNotLike(String value) {
            addCriterion("keywords not like", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsIn(List<String> values) {
            addCriterion("keywords in", values, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsNotIn(List<String> values) {
            addCriterion("keywords not in", values, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsBetween(String value1, String value2) {
            addCriterion("keywords between", value1, value2, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsNotBetween(String value1, String value2) {
            addCriterion("keywords not between", value1, value2, "keywords");
            return (Criteria) this;
        }

        public Criteria andVersionsIsNull() {
            addCriterion("versions is null");
            return (Criteria) this;
        }

        public Criteria andVersionsIsNotNull() {
            addCriterion("versions is not null");
            return (Criteria) this;
        }

        public Criteria andVersionsEqualTo(String value) {
            addCriterion("versions =", value, "versions");
            return (Criteria) this;
        }

        public Criteria andVersionsNotEqualTo(String value) {
            addCriterion("versions <>", value, "versions");
            return (Criteria) this;
        }

        public Criteria andVersionsGreaterThan(String value) {
            addCriterion("versions >", value, "versions");
            return (Criteria) this;
        }

        public Criteria andVersionsGreaterThanOrEqualTo(String value) {
            addCriterion("versions >=", value, "versions");
            return (Criteria) this;
        }

        public Criteria andVersionsLessThan(String value) {
            addCriterion("versions <", value, "versions");
            return (Criteria) this;
        }

        public Criteria andVersionsLessThanOrEqualTo(String value) {
            addCriterion("versions <=", value, "versions");
            return (Criteria) this;
        }

        public Criteria andVersionsLike(String value) {
            addCriterion("versions like", value, "versions");
            return (Criteria) this;
        }

        public Criteria andVersionsNotLike(String value) {
            addCriterion("versions not like", value, "versions");
            return (Criteria) this;
        }

        public Criteria andVersionsIn(List<String> values) {
            addCriterion("versions in", values, "versions");
            return (Criteria) this;
        }

        public Criteria andVersionsNotIn(List<String> values) {
            addCriterion("versions not in", values, "versions");
            return (Criteria) this;
        }

        public Criteria andVersionsBetween(String value1, String value2) {
            addCriterion("versions between", value1, value2, "versions");
            return (Criteria) this;
        }

        public Criteria andVersionsNotBetween(String value1, String value2) {
            addCriterion("versions not between", value1, value2, "versions");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("create_time is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("create_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("create_time =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("create_time <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("create_time >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("create_time >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("create_time <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("create_time <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("create_time in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("create_time not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("create_time between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("create_time not between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(String value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(String value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(String value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(String value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(String value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(String value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLike(String value) {
            addCriterion("status like", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotLike(String value) {
            addCriterion("status not like", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<String> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<String> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(String value1, String value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(String value1, String value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andParaAIsNull() {
            addCriterion("para_a is null");
            return (Criteria) this;
        }

        public Criteria andParaAIsNotNull() {
            addCriterion("para_a is not null");
            return (Criteria) this;
        }

        public Criteria andParaAEqualTo(String value) {
            addCriterion("para_a =", value, "paraA");
            return (Criteria) this;
        }

        public Criteria andParaANotEqualTo(String value) {
            addCriterion("para_a <>", value, "paraA");
            return (Criteria) this;
        }

        public Criteria andParaAGreaterThan(String value) {
            addCriterion("para_a >", value, "paraA");
            return (Criteria) this;
        }

        public Criteria andParaAGreaterThanOrEqualTo(String value) {
            addCriterion("para_a >=", value, "paraA");
            return (Criteria) this;
        }

        public Criteria andParaALessThan(String value) {
            addCriterion("para_a <", value, "paraA");
            return (Criteria) this;
        }

        public Criteria andParaALessThanOrEqualTo(String value) {
            addCriterion("para_a <=", value, "paraA");
            return (Criteria) this;
        }

        public Criteria andParaALike(String value) {
            addCriterion("para_a like", value, "paraA");
            return (Criteria) this;
        }

        public Criteria andParaANotLike(String value) {
            addCriterion("para_a not like", value, "paraA");
            return (Criteria) this;
        }

        public Criteria andParaAIn(List<String> values) {
            addCriterion("para_a in", values, "paraA");
            return (Criteria) this;
        }

        public Criteria andParaANotIn(List<String> values) {
            addCriterion("para_a not in", values, "paraA");
            return (Criteria) this;
        }

        public Criteria andParaABetween(String value1, String value2) {
            addCriterion("para_a between", value1, value2, "paraA");
            return (Criteria) this;
        }

        public Criteria andParaANotBetween(String value1, String value2) {
            addCriterion("para_a not between", value1, value2, "paraA");
            return (Criteria) this;
        }

        public Criteria andParaBIsNull() {
            addCriterion("para_b is null");
            return (Criteria) this;
        }

        public Criteria andParaBIsNotNull() {
            addCriterion("para_b is not null");
            return (Criteria) this;
        }

        public Criteria andParaBEqualTo(String value) {
            addCriterion("para_b =", value, "paraB");
            return (Criteria) this;
        }

        public Criteria andParaBNotEqualTo(String value) {
            addCriterion("para_b <>", value, "paraB");
            return (Criteria) this;
        }

        public Criteria andParaBGreaterThan(String value) {
            addCriterion("para_b >", value, "paraB");
            return (Criteria) this;
        }

        public Criteria andParaBGreaterThanOrEqualTo(String value) {
            addCriterion("para_b >=", value, "paraB");
            return (Criteria) this;
        }

        public Criteria andParaBLessThan(String value) {
            addCriterion("para_b <", value, "paraB");
            return (Criteria) this;
        }

        public Criteria andParaBLessThanOrEqualTo(String value) {
            addCriterion("para_b <=", value, "paraB");
            return (Criteria) this;
        }

        public Criteria andParaBLike(String value) {
            addCriterion("para_b like", value, "paraB");
            return (Criteria) this;
        }

        public Criteria andParaBNotLike(String value) {
            addCriterion("para_b not like", value, "paraB");
            return (Criteria) this;
        }

        public Criteria andParaBIn(List<String> values) {
            addCriterion("para_b in", values, "paraB");
            return (Criteria) this;
        }

        public Criteria andParaBNotIn(List<String> values) {
            addCriterion("para_b not in", values, "paraB");
            return (Criteria) this;
        }

        public Criteria andParaBBetween(String value1, String value2) {
            addCriterion("para_b between", value1, value2, "paraB");
            return (Criteria) this;
        }

        public Criteria andParaBNotBetween(String value1, String value2) {
            addCriterion("para_b not between", value1, value2, "paraB");
            return (Criteria) this;
        }

        public Criteria andAppOverviewIsNull() {
            addCriterion("app_overview is null");
            return (Criteria) this;
        }

        public Criteria andAppOverviewIsNotNull() {
            addCriterion("app_overview is not null");
            return (Criteria) this;
        }

        public Criteria andAppOverviewEqualTo(String value) {
            addCriterion("app_overview =", value, "appOverview");
            return (Criteria) this;
        }

        public Criteria andAppOverviewNotEqualTo(String value) {
            addCriterion("app_overview <>", value, "appOverview");
            return (Criteria) this;
        }

        public Criteria andAppOverviewGreaterThan(String value) {
            addCriterion("app_overview >", value, "appOverview");
            return (Criteria) this;
        }

        public Criteria andAppOverviewGreaterThanOrEqualTo(String value) {
            addCriterion("app_overview >=", value, "appOverview");
            return (Criteria) this;
        }

        public Criteria andAppOverviewLessThan(String value) {
            addCriterion("app_overview <", value, "appOverview");
            return (Criteria) this;
        }

        public Criteria andAppOverviewLessThanOrEqualTo(String value) {
            addCriterion("app_overview <=", value, "appOverview");
            return (Criteria) this;
        }

        public Criteria andAppOverviewLike(String value) {
            addCriterion("app_overview like", value, "appOverview");
            return (Criteria) this;
        }

        public Criteria andAppOverviewNotLike(String value) {
            addCriterion("app_overview not like", value, "appOverview");
            return (Criteria) this;
        }

        public Criteria andAppOverviewIn(List<String> values) {
            addCriterion("app_overview in", values, "appOverview");
            return (Criteria) this;
        }

        public Criteria andAppOverviewNotIn(List<String> values) {
            addCriterion("app_overview not in", values, "appOverview");
            return (Criteria) this;
        }

        public Criteria andAppOverviewBetween(String value1, String value2) {
            addCriterion("app_overview between", value1, value2, "appOverview");
            return (Criteria) this;
        }

        public Criteria andAppOverviewNotBetween(String value1, String value2) {
            addCriterion("app_overview not between", value1, value2, "appOverview");
            return (Criteria) this;
        }

        public Criteria andDataFormatIsNull() {
            addCriterion("data_format is null");
            return (Criteria) this;
        }

        public Criteria andDataFormatIsNotNull() {
            addCriterion("data_format is not null");
            return (Criteria) this;
        }

        public Criteria andDataFormatEqualTo(String value) {
            addCriterion("data_format =", value, "dataFormat");
            return (Criteria) this;
        }

        public Criteria andDataFormatNotEqualTo(String value) {
            addCriterion("data_format <>", value, "dataFormat");
            return (Criteria) this;
        }

        public Criteria andDataFormatGreaterThan(String value) {
            addCriterion("data_format >", value, "dataFormat");
            return (Criteria) this;
        }

        public Criteria andDataFormatGreaterThanOrEqualTo(String value) {
            addCriterion("data_format >=", value, "dataFormat");
            return (Criteria) this;
        }

        public Criteria andDataFormatLessThan(String value) {
            addCriterion("data_format <", value, "dataFormat");
            return (Criteria) this;
        }

        public Criteria andDataFormatLessThanOrEqualTo(String value) {
            addCriterion("data_format <=", value, "dataFormat");
            return (Criteria) this;
        }

        public Criteria andDataFormatLike(String value) {
            addCriterion("data_format like", value, "dataFormat");
            return (Criteria) this;
        }

        public Criteria andDataFormatNotLike(String value) {
            addCriterion("data_format not like", value, "dataFormat");
            return (Criteria) this;
        }

        public Criteria andDataFormatIn(List<String> values) {
            addCriterion("data_format in", values, "dataFormat");
            return (Criteria) this;
        }

        public Criteria andDataFormatNotIn(List<String> values) {
            addCriterion("data_format not in", values, "dataFormat");
            return (Criteria) this;
        }

        public Criteria andDataFormatBetween(String value1, String value2) {
            addCriterion("data_format between", value1, value2, "dataFormat");
            return (Criteria) this;
        }

        public Criteria andDataFormatNotBetween(String value1, String value2) {
            addCriterion("data_format not between", value1, value2, "dataFormat");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}