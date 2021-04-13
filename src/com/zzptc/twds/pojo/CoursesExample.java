package com.zzptc.twds.pojo;

import java.util.ArrayList;
import java.util.List;

public class CoursesExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CoursesExample() {
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

        public Criteria andCoIdIsNull() {
            addCriterion("co_id is null");
            return (Criteria) this;
        }

        public Criteria andCoIdIsNotNull() {
            addCriterion("co_id is not null");
            return (Criteria) this;
        }

        public Criteria andCoIdEqualTo(Integer value) {
            addCriterion("co_id =", value, "coId");
            return (Criteria) this;
        }

        public Criteria andCoIdNotEqualTo(Integer value) {
            addCriterion("co_id <>", value, "coId");
            return (Criteria) this;
        }

        public Criteria andCoIdGreaterThan(Integer value) {
            addCriterion("co_id >", value, "coId");
            return (Criteria) this;
        }

        public Criteria andCoIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("co_id >=", value, "coId");
            return (Criteria) this;
        }

        public Criteria andCoIdLessThan(Integer value) {
            addCriterion("co_id <", value, "coId");
            return (Criteria) this;
        }

        public Criteria andCoIdLessThanOrEqualTo(Integer value) {
            addCriterion("co_id <=", value, "coId");
            return (Criteria) this;
        }

        public Criteria andCoIdIn(List<Integer> values) {
            addCriterion("co_id in", values, "coId");
            return (Criteria) this;
        }

        public Criteria andCoIdNotIn(List<Integer> values) {
            addCriterion("co_id not in", values, "coId");
            return (Criteria) this;
        }

        public Criteria andCoIdBetween(Integer value1, Integer value2) {
            addCriterion("co_id between", value1, value2, "coId");
            return (Criteria) this;
        }

        public Criteria andCoIdNotBetween(Integer value1, Integer value2) {
            addCriterion("co_id not between", value1, value2, "coId");
            return (Criteria) this;
        }

        public Criteria andCIdIsNull() {
            addCriterion("c_id is null");
            return (Criteria) this;
        }

        public Criteria andCIdIsNotNull() {
            addCriterion("c_id is not null");
            return (Criteria) this;
        }

        public Criteria andCIdEqualTo(Integer value) {
            addCriterion("c_id =", value, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdNotEqualTo(Integer value) {
            addCriterion("c_id <>", value, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdGreaterThan(Integer value) {
            addCriterion("c_id >", value, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("c_id >=", value, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdLessThan(Integer value) {
            addCriterion("c_id <", value, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdLessThanOrEqualTo(Integer value) {
            addCriterion("c_id <=", value, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdIn(List<Integer> values) {
            addCriterion("c_id in", values, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdNotIn(List<Integer> values) {
            addCriterion("c_id not in", values, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdBetween(Integer value1, Integer value2) {
            addCriterion("c_id between", value1, value2, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdNotBetween(Integer value1, Integer value2) {
            addCriterion("c_id not between", value1, value2, "cId");
            return (Criteria) this;
        }

        public Criteria andFidIsNull() {
            addCriterion("fId is null");
            return (Criteria) this;
        }

        public Criteria andFidIsNotNull() {
            addCriterion("fId is not null");
            return (Criteria) this;
        }

        public Criteria andFidEqualTo(Integer value) {
            addCriterion("fId =", value, "fid");
            return (Criteria) this;
        }

        public Criteria andFidNotEqualTo(Integer value) {
            addCriterion("fId <>", value, "fid");
            return (Criteria) this;
        }

        public Criteria andFidGreaterThan(Integer value) {
            addCriterion("fId >", value, "fid");
            return (Criteria) this;
        }

        public Criteria andFidGreaterThanOrEqualTo(Integer value) {
            addCriterion("fId >=", value, "fid");
            return (Criteria) this;
        }

        public Criteria andFidLessThan(Integer value) {
            addCriterion("fId <", value, "fid");
            return (Criteria) this;
        }

        public Criteria andFidLessThanOrEqualTo(Integer value) {
            addCriterion("fId <=", value, "fid");
            return (Criteria) this;
        }

        public Criteria andFidIn(List<Integer> values) {
            addCriterion("fId in", values, "fid");
            return (Criteria) this;
        }

        public Criteria andFidNotIn(List<Integer> values) {
            addCriterion("fId not in", values, "fid");
            return (Criteria) this;
        }

        public Criteria andFidBetween(Integer value1, Integer value2) {
            addCriterion("fId between", value1, value2, "fid");
            return (Criteria) this;
        }

        public Criteria andFidNotBetween(Integer value1, Integer value2) {
            addCriterion("fId not between", value1, value2, "fid");
            return (Criteria) this;
        }

        public Criteria andCoNameIsNull() {
            addCriterion("co_name is null");
            return (Criteria) this;
        }

        public Criteria andCoNameIsNotNull() {
            addCriterion("co_name is not null");
            return (Criteria) this;
        }

        public Criteria andCoNameEqualTo(String value) {
            addCriterion("co_name =", value, "coName");
            return (Criteria) this;
        }

        public Criteria andCoNameNotEqualTo(String value) {
            addCriterion("co_name <>", value, "coName");
            return (Criteria) this;
        }

        public Criteria andCoNameGreaterThan(String value) {
            addCriterion("co_name >", value, "coName");
            return (Criteria) this;
        }

        public Criteria andCoNameGreaterThanOrEqualTo(String value) {
            addCriterion("co_name >=", value, "coName");
            return (Criteria) this;
        }

        public Criteria andCoNameLessThan(String value) {
            addCriterion("co_name <", value, "coName");
            return (Criteria) this;
        }

        public Criteria andCoNameLessThanOrEqualTo(String value) {
            addCriterion("co_name <=", value, "coName");
            return (Criteria) this;
        }

        public Criteria andCoNameLike(String value) {
            addCriterion("co_name like", value, "coName");
            return (Criteria) this;
        }

        public Criteria andCoNameNotLike(String value) {
            addCriterion("co_name not like", value, "coName");
            return (Criteria) this;
        }

        public Criteria andCoNameIn(List<String> values) {
            addCriterion("co_name in", values, "coName");
            return (Criteria) this;
        }

        public Criteria andCoNameNotIn(List<String> values) {
            addCriterion("co_name not in", values, "coName");
            return (Criteria) this;
        }

        public Criteria andCoNameBetween(String value1, String value2) {
            addCriterion("co_name between", value1, value2, "coName");
            return (Criteria) this;
        }

        public Criteria andCoNameNotBetween(String value1, String value2) {
            addCriterion("co_name not between", value1, value2, "coName");
            return (Criteria) this;
        }

        public Criteria andCoWeekIsNull() {
            addCriterion("co_week is null");
            return (Criteria) this;
        }

        public Criteria andCoWeekIsNotNull() {
            addCriterion("co_week is not null");
            return (Criteria) this;
        }

        public Criteria andCoWeekEqualTo(Double value) {
            addCriterion("co_week =", value, "coWeek");
            return (Criteria) this;
        }

        public Criteria andCoWeekNotEqualTo(Double value) {
            addCriterion("co_week <>", value, "coWeek");
            return (Criteria) this;
        }

        public Criteria andCoWeekGreaterThan(Double value) {
            addCriterion("co_week >", value, "coWeek");
            return (Criteria) this;
        }

        public Criteria andCoWeekGreaterThanOrEqualTo(Double value) {
            addCriterion("co_week >=", value, "coWeek");
            return (Criteria) this;
        }

        public Criteria andCoWeekLessThan(Double value) {
            addCriterion("co_week <", value, "coWeek");
            return (Criteria) this;
        }

        public Criteria andCoWeekLessThanOrEqualTo(Double value) {
            addCriterion("co_week <=", value, "coWeek");
            return (Criteria) this;
        }

        public Criteria andCoWeekIn(List<Double> values) {
            addCriterion("co_week in", values, "coWeek");
            return (Criteria) this;
        }

        public Criteria andCoWeekNotIn(List<Double> values) {
            addCriterion("co_week not in", values, "coWeek");
            return (Criteria) this;
        }

        public Criteria andCoWeekBetween(Double value1, Double value2) {
            addCriterion("co_week between", value1, value2, "coWeek");
            return (Criteria) this;
        }

        public Criteria andCoWeekNotBetween(Double value1, Double value2) {
            addCriterion("co_week not between", value1, value2, "coWeek");
            return (Criteria) this;
        }

        public Criteria andCoWenumIsNull() {
            addCriterion("co_weNum is null");
            return (Criteria) this;
        }

        public Criteria andCoWenumIsNotNull() {
            addCriterion("co_weNum is not null");
            return (Criteria) this;
        }

        public Criteria andCoWenumEqualTo(Integer value) {
            addCriterion("co_weNum =", value, "coWenum");
            return (Criteria) this;
        }

        public Criteria andCoWenumNotEqualTo(Integer value) {
            addCriterion("co_weNum <>", value, "coWenum");
            return (Criteria) this;
        }

        public Criteria andCoWenumGreaterThan(Integer value) {
            addCriterion("co_weNum >", value, "coWenum");
            return (Criteria) this;
        }

        public Criteria andCoWenumGreaterThanOrEqualTo(Integer value) {
            addCriterion("co_weNum >=", value, "coWenum");
            return (Criteria) this;
        }

        public Criteria andCoWenumLessThan(Integer value) {
            addCriterion("co_weNum <", value, "coWenum");
            return (Criteria) this;
        }

        public Criteria andCoWenumLessThanOrEqualTo(Integer value) {
            addCriterion("co_weNum <=", value, "coWenum");
            return (Criteria) this;
        }

        public Criteria andCoWenumIn(List<Integer> values) {
            addCriterion("co_weNum in", values, "coWenum");
            return (Criteria) this;
        }

        public Criteria andCoWenumNotIn(List<Integer> values) {
            addCriterion("co_weNum not in", values, "coWenum");
            return (Criteria) this;
        }

        public Criteria andCoWenumBetween(Integer value1, Integer value2) {
            addCriterion("co_weNum between", value1, value2, "coWenum");
            return (Criteria) this;
        }

        public Criteria andCoWenumNotBetween(Integer value1, Integer value2) {
            addCriterion("co_weNum not between", value1, value2, "coWenum");
            return (Criteria) this;
        }

        public Criteria andCoTotalIsNull() {
            addCriterion("co_total is null");
            return (Criteria) this;
        }

        public Criteria andCoTotalIsNotNull() {
            addCriterion("co_total is not null");
            return (Criteria) this;
        }

        public Criteria andCoTotalEqualTo(Double value) {
            addCriterion("co_total =", value, "coTotal");
            return (Criteria) this;
        }

        public Criteria andCoTotalNotEqualTo(Double value) {
            addCriterion("co_total <>", value, "coTotal");
            return (Criteria) this;
        }

        public Criteria andCoTotalGreaterThan(Double value) {
            addCriterion("co_total >", value, "coTotal");
            return (Criteria) this;
        }

        public Criteria andCoTotalGreaterThanOrEqualTo(Double value) {
            addCriterion("co_total >=", value, "coTotal");
            return (Criteria) this;
        }

        public Criteria andCoTotalLessThan(Double value) {
            addCriterion("co_total <", value, "coTotal");
            return (Criteria) this;
        }

        public Criteria andCoTotalLessThanOrEqualTo(Double value) {
            addCriterion("co_total <=", value, "coTotal");
            return (Criteria) this;
        }

        public Criteria andCoTotalIn(List<Double> values) {
            addCriterion("co_total in", values, "coTotal");
            return (Criteria) this;
        }

        public Criteria andCoTotalNotIn(List<Double> values) {
            addCriterion("co_total not in", values, "coTotal");
            return (Criteria) this;
        }

        public Criteria andCoTotalBetween(Double value1, Double value2) {
            addCriterion("co_total between", value1, value2, "coTotal");
            return (Criteria) this;
        }

        public Criteria andCoTotalNotBetween(Double value1, Double value2) {
            addCriterion("co_total not between", value1, value2, "coTotal");
            return (Criteria) this;
        }

        public Criteria andCoTermIsNull() {
            addCriterion("co_term is null");
            return (Criteria) this;
        }

        public Criteria andCoTermIsNotNull() {
            addCriterion("co_term is not null");
            return (Criteria) this;
        }

        public Criteria andCoTermEqualTo(String value) {
            addCriterion("co_term =", value, "coTerm");
            return (Criteria) this;
        }

        public Criteria andCoTermNotEqualTo(String value) {
            addCriterion("co_term <>", value, "coTerm");
            return (Criteria) this;
        }

        public Criteria andCoTermGreaterThan(String value) {
            addCriterion("co_term >", value, "coTerm");
            return (Criteria) this;
        }

        public Criteria andCoTermGreaterThanOrEqualTo(String value) {
            addCriterion("co_term >=", value, "coTerm");
            return (Criteria) this;
        }

        public Criteria andCoTermLessThan(String value) {
            addCriterion("co_term <", value, "coTerm");
            return (Criteria) this;
        }

        public Criteria andCoTermLessThanOrEqualTo(String value) {
            addCriterion("co_term <=", value, "coTerm");
            return (Criteria) this;
        }

        public Criteria andCoTermLike(String value) {
            addCriterion("co_term like", value, "coTerm");
            return (Criteria) this;
        }

        public Criteria andCoTermNotLike(String value) {
            addCriterion("co_term not like", value, "coTerm");
            return (Criteria) this;
        }

        public Criteria andCoTermIn(List<String> values) {
            addCriterion("co_term in", values, "coTerm");
            return (Criteria) this;
        }

        public Criteria andCoTermNotIn(List<String> values) {
            addCriterion("co_term not in", values, "coTerm");
            return (Criteria) this;
        }

        public Criteria andCoTermBetween(String value1, String value2) {
            addCriterion("co_term between", value1, value2, "coTerm");
            return (Criteria) this;
        }

        public Criteria andCoTermNotBetween(String value1, String value2) {
            addCriterion("co_term not between", value1, value2, "coTerm");
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