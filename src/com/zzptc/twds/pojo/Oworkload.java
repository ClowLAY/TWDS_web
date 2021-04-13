package com.zzptc.twds.pojo;

public class Oworkload {
    private Integer oid;

    private String otype;

    private Double ovalue;

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public String getOtype() {
        return otype;
    }

    public void setOtype(String otype) {
        this.otype = otype == null ? null : otype.trim();
    }

    public Double getOvalue() {
        return ovalue;
    }

    public void setOvalue(Double ovalue) {
        this.ovalue = ovalue;
    }
}