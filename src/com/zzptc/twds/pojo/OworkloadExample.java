package com.zzptc.twds.pojo;

import java.util.ArrayList;
import java.util.List;

public class OworkloadExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public OworkloadExample() {
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

        public Criteria andOidIsNull() {
            addCriterion("oId is null");
            return (Criteria) this;
        }

        public Criteria andOidIsNotNull() {
            addCriterion("oId is not null");
            return (Criteria) this;
        }

        public Criteria andOidEqualTo(Integer value) {
            addCriterion("oId =", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidNotEqualTo(Integer value) {
            addCriterion("oId <>", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidGreaterThan(Integer value) {
            addCriterion("oId >", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidGreaterThanOrEqualTo(Integer value) {
            addCriterion("oId >=", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidLessThan(Integer value) {
            addCriterion("oId <", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidLessThanOrEqualTo(Integer value) {
            addCriterion("oId <=", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidIn(List<Integer> values) {
            addCriterion("oId in", values, "oid");
            return (Criteria) this;
        }

        public Criteria andOidNotIn(List<Integer> values) {
            addCriterion("oId not in", values, "oid");
            return (Criteria) this;
        }

        public Criteria andOidBetween(Integer value1, Integer value2) {
            addCriterion("oId between", value1, value2, "oid");
            return (Criteria) this;
        }

        public Criteria andOidNotBetween(Integer value1, Integer value2) {
            addCriterion("oId not between", value1, value2, "oid");
            return (Criteria) this;
        }

        public Criteria andOtypeIsNull() {
            addCriterion("oType is null");
            return (Criteria) this;
        }

        public Criteria andOtypeIsNotNull() {
            addCriterion("oType is not null");
            return (Criteria) this;
        }

        public Criteria andOtypeEqualTo(String value) {
            addCriterion("oType =", value, "otype");
            return (Criteria) this;
        }

        public Criteria andOtypeNotEqualTo(String value) {
            addCriterion("oType <>", value, "otype");
            return (Criteria) this;
        }

        public Criteria andOtypeGreaterThan(String value) {
            addCriterion("oType >", value, "otype");
            return (Criteria) this;
        }

        public Criteria andOtypeGreaterThanOrEqualTo(String value) {
            addCriterion("oType >=", value, "otype");
            return (Criteria) this;
        }

        public Criteria andOtypeLessThan(String value) {
            addCriterion("oType <", value, "otype");
            return (Criteria) this;
        }

        public Criteria andOtypeLessThanOrEqualTo(String value) {
            addCriterion("oType <=", value, "otype");
            return (Criteria) this;
        }

        public Criteria andOtypeLike(String value) {
            addCriterion("oType like", value, "otype");
            return (Criteria) this;
        }

        public Criteria andOtypeNotLike(String value) {
            addCriterion("oType not like", value, "otype");
            return (Criteria) this;
        }

        public Criteria andOtypeIn(List<String> values) {
            addCriterion("oType in", values, "otype");
            return (Criteria) this;
        }

        public Criteria andOtypeNotIn(List<String> values) {
            addCriterion("oType not in", values, "otype");
            return (Criteria) this;
        }

        public Criteria andOtypeBetween(String value1, String value2) {
            addCriterion("oType between", value1, value2, "otype");
            return (Criteria) this;
        }

        public Criteria andOtypeNotBetween(String value1, String value2) {
            addCriterion("oType not between", value1, value2, "otype");
            return (Criteria) this;
        }

        public Criteria andOvalueIsNull() {
            addCriterion("oValue is null");
            return (Criteria) this;
        }

        public Criteria andOvalueIsNotNull() {
            addCriterion("oValue is not null");
            return (Criteria) this;
        }

        public Criteria andOvalueEqualTo(Double value) {
            addCriterion("oValue =", value, "ovalue");
            return (Criteria) this;
        }

        public Criteria andOvalueNotEqualTo(Double value) {
            addCriterion("oValue <>", value, "ovalue");
            return (Criteria) this;
        }

        public Criteria andOvalueGreaterThan(Double value) {
            addCriterion("oValue >", value, "ovalue");
            return (Criteria) this;
        }

        public Criteria andOvalueGreaterThanOrEqualTo(Double value) {
            addCriterion("oValue >=", value, "ovalue");
            return (Criteria) this;
        }

        public Criteria andOvalueLessThan(Double value) {
            addCriterion("oValue <", value, "ovalue");
            return (Criteria) this;
        }

        public Criteria andOvalueLessThanOrEqualTo(Double value) {
            addCriterion("oValue <=", value, "ovalue");
            return (Criteria) this;
        }

        public Criteria andOvalueIn(List<Double> values) {
            addCriterion("oValue in", values, "ovalue");
            return (Criteria) this;
        }

        public Criteria andOvalueNotIn(List<Double> values) {
            addCriterion("oValue not in", values, "ovalue");
            return (Criteria) this;
        }

        public Criteria andOvalueBetween(Double value1, Double value2) {
            addCriterion("oValue between", value1, value2, "ovalue");
            return (Criteria) this;
        }

        public Criteria andOvalueNotBetween(Double value1, Double value2) {
            addCriterion("oValue not between", value1, value2, "ovalue");
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