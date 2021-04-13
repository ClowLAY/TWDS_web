package com.zzptc.twds.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class ClassesExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ClassesExample() {
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

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andClIdIsNull() {
            addCriterion("cl_id is null");
            return (Criteria) this;
        }

        public Criteria andClIdIsNotNull() {
            addCriterion("cl_id is not null");
            return (Criteria) this;
        }

        public Criteria andClIdEqualTo(Integer value) {
            addCriterion("cl_id =", value, "clId");
            return (Criteria) this;
        }

        public Criteria andClIdNotEqualTo(Integer value) {
            addCriterion("cl_id <>", value, "clId");
            return (Criteria) this;
        }

        public Criteria andClIdGreaterThan(Integer value) {
            addCriterion("cl_id >", value, "clId");
            return (Criteria) this;
        }

        public Criteria andClIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("cl_id >=", value, "clId");
            return (Criteria) this;
        }

        public Criteria andClIdLessThan(Integer value) {
            addCriterion("cl_id <", value, "clId");
            return (Criteria) this;
        }

        public Criteria andClIdLessThanOrEqualTo(Integer value) {
            addCriterion("cl_id <=", value, "clId");
            return (Criteria) this;
        }

        public Criteria andClIdIn(List<Integer> values) {
            addCriterion("cl_id in", values, "clId");
            return (Criteria) this;
        }

        public Criteria andClIdNotIn(List<Integer> values) {
            addCriterion("cl_id not in", values, "clId");
            return (Criteria) this;
        }

        public Criteria andClIdBetween(Integer value1, Integer value2) {
            addCriterion("cl_id between", value1, value2, "clId");
            return (Criteria) this;
        }

        public Criteria andClIdNotBetween(Integer value1, Integer value2) {
            addCriterion("cl_id not between", value1, value2, "clId");
            return (Criteria) this;
        }

        public Criteria andMidIsNull() {
            addCriterion("mId is null");
            return (Criteria) this;
        }

        public Criteria andMidIsNotNull() {
            addCriterion("mId is not null");
            return (Criteria) this;
        }

        public Criteria andMidEqualTo(Integer value) {
            addCriterion("mId =", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidNotEqualTo(Integer value) {
            addCriterion("mId <>", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidGreaterThan(Integer value) {
            addCriterion("mId >", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidGreaterThanOrEqualTo(Integer value) {
            addCriterion("mId >=", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidLessThan(Integer value) {
            addCriterion("mId <", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidLessThanOrEqualTo(Integer value) {
            addCriterion("mId <=", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidIn(List<Integer> values) {
            addCriterion("mId in", values, "mid");
            return (Criteria) this;
        }

        public Criteria andMidNotIn(List<Integer> values) {
            addCriterion("mId not in", values, "mid");
            return (Criteria) this;
        }

        public Criteria andMidBetween(Integer value1, Integer value2) {
            addCriterion("mId between", value1, value2, "mid");
            return (Criteria) this;
        }

        public Criteria andMidNotBetween(Integer value1, Integer value2) {
            addCriterion("mId not between", value1, value2, "mid");
            return (Criteria) this;
        }

        public Criteria andClNameIsNull() {
            addCriterion("cl_name is null");
            return (Criteria) this;
        }

        public Criteria andClNameIsNotNull() {
            addCriterion("cl_name is not null");
            return (Criteria) this;
        }

        public Criteria andClNameEqualTo(String value) {
            addCriterion("cl_name =", value, "clName");
            return (Criteria) this;
        }

        public Criteria andClNameNotEqualTo(String value) {
            addCriterion("cl_name <>", value, "clName");
            return (Criteria) this;
        }

        public Criteria andClNameGreaterThan(String value) {
            addCriterion("cl_name >", value, "clName");
            return (Criteria) this;
        }

        public Criteria andClNameGreaterThanOrEqualTo(String value) {
            addCriterion("cl_name >=", value, "clName");
            return (Criteria) this;
        }

        public Criteria andClNameLessThan(String value) {
            addCriterion("cl_name <", value, "clName");
            return (Criteria) this;
        }

        public Criteria andClNameLessThanOrEqualTo(String value) {
            addCriterion("cl_name <=", value, "clName");
            return (Criteria) this;
        }

        public Criteria andClNameLike(String value) {
            addCriterion("cl_name like", value, "clName");
            return (Criteria) this;
        }

        public Criteria andClNameNotLike(String value) {
            addCriterion("cl_name not like", value, "clName");
            return (Criteria) this;
        }

        public Criteria andClNameIn(List<String> values) {
            addCriterion("cl_name in", values, "clName");
            return (Criteria) this;
        }

        public Criteria andClNameNotIn(List<String> values) {
            addCriterion("cl_name not in", values, "clName");
            return (Criteria) this;
        }

        public Criteria andClNameBetween(String value1, String value2) {
            addCriterion("cl_name between", value1, value2, "clName");
            return (Criteria) this;
        }

        public Criteria andClNameNotBetween(String value1, String value2) {
            addCriterion("cl_name not between", value1, value2, "clName");
            return (Criteria) this;
        }

        public Criteria andClYearIsNull() {
            addCriterion("cl_year is null");
            return (Criteria) this;
        }

        public Criteria andClYearIsNotNull() {
            addCriterion("cl_year is not null");
            return (Criteria) this;
        }

        public Criteria andClYearEqualTo(Date value) {
            addCriterionForJDBCDate("cl_year =", value, "clYear");
            return (Criteria) this;
        }

        public Criteria andClYearNotEqualTo(Date value) {
            addCriterionForJDBCDate("cl_year <>", value, "clYear");
            return (Criteria) this;
        }

        public Criteria andClYearGreaterThan(Date value) {
            addCriterionForJDBCDate("cl_year >", value, "clYear");
            return (Criteria) this;
        }

        public Criteria andClYearGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("cl_year >=", value, "clYear");
            return (Criteria) this;
        }

        public Criteria andClYearLessThan(Date value) {
            addCriterionForJDBCDate("cl_year <", value, "clYear");
            return (Criteria) this;
        }

        public Criteria andClYearLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("cl_year <=", value, "clYear");
            return (Criteria) this;
        }

        public Criteria andClYearIn(List<Date> values) {
            addCriterionForJDBCDate("cl_year in", values, "clYear");
            return (Criteria) this;
        }

        public Criteria andClYearNotIn(List<Date> values) {
            addCriterionForJDBCDate("cl_year not in", values, "clYear");
            return (Criteria) this;
        }

        public Criteria andClYearBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("cl_year between", value1, value2, "clYear");
            return (Criteria) this;
        }

        public Criteria andClYearNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("cl_year not between", value1, value2, "clYear");
            return (Criteria) this;
        }

        public Criteria andClNumIsNull() {
            addCriterion("cl_num is null");
            return (Criteria) this;
        }

        public Criteria andClNumIsNotNull() {
            addCriterion("cl_num is not null");
            return (Criteria) this;
        }

        public Criteria andClNumEqualTo(Integer value) {
            addCriterion("cl_num =", value, "clNum");
            return (Criteria) this;
        }

        public Criteria andClNumNotEqualTo(Integer value) {
            addCriterion("cl_num <>", value, "clNum");
            return (Criteria) this;
        }

        public Criteria andClNumGreaterThan(Integer value) {
            addCriterion("cl_num >", value, "clNum");
            return (Criteria) this;
        }

        public Criteria andClNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("cl_num >=", value, "clNum");
            return (Criteria) this;
        }

        public Criteria andClNumLessThan(Integer value) {
            addCriterion("cl_num <", value, "clNum");
            return (Criteria) this;
        }

        public Criteria andClNumLessThanOrEqualTo(Integer value) {
            addCriterion("cl_num <=", value, "clNum");
            return (Criteria) this;
        }

        public Criteria andClNumIn(List<Integer> values) {
            addCriterion("cl_num in", values, "clNum");
            return (Criteria) this;
        }

        public Criteria andClNumNotIn(List<Integer> values) {
            addCriterion("cl_num not in", values, "clNum");
            return (Criteria) this;
        }

        public Criteria andClNumBetween(Integer value1, Integer value2) {
            addCriterion("cl_num between", value1, value2, "clNum");
            return (Criteria) this;
        }

        public Criteria andClNumNotBetween(Integer value1, Integer value2) {
            addCriterion("cl_num not between", value1, value2, "clNum");
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