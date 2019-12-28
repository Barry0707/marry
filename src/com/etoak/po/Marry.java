package com.etoak.po;

public class Marry {
    private Integer mid;
    private String mname;
    private String marea;
    private String mtype;
    private Integer mmoney;
    private String mstyle;
    private String mphone;
    private String mwishtime;
    private String msettime;
    private String mstatus;

    public Marry() {
    }

    public Marry(Integer mid, String mname, String marea, String mtype, Integer mmoney, String mstyle, String mphone, String mwishtime, String msettime, String mstatus) {
        this.mid = mid;
        this.mname = mname;
        this.marea = marea;
        this.mtype = mtype;
        this.mmoney = mmoney;
        this.mstyle = mstyle;
        this.mphone = mphone;
        this.mwishtime = mwishtime;
        this.msettime = msettime;
        this.mstatus = mstatus;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getMarea() {
        return marea;
    }

    public void setMarea(String marea) {
        this.marea = marea;
    }

    public String getMtype() {
        return mtype;
    }

    public void setMtype(String mtype) {
        this.mtype = mtype;
    }

    public Integer getMmoney() {
        return mmoney;
    }

    public void setMmoney(Integer mmoney) {
        this.mmoney = mmoney;
    }

    public String getMstyle() {
        return mstyle;
    }

    public void setMstyle(String mstyle) {
        this.mstyle = mstyle;
    }

    public String getMphone() {
        return mphone;
    }

    public void setMphone(String mphone) {
        this.mphone = mphone;
    }

    public String getMwishtime() {
        return mwishtime;
    }

    public void setMwishtime(String mwishtime) {
        this.mwishtime = mwishtime;
    }

    public String getMsettime() {
        return msettime;
    }

    public void setMsettime(String msettime) {
        this.msettime = msettime;
    }

    public String getMstatus() {
        return mstatus;
    }

    public void setMstatus(String mstatus) {
        this.mstatus = mstatus;
    }

    @Override
    public String toString() {
        return "Marry{" +
                "mid=" + mid +
                ", mname='" + mname + '\'' +
                ", marea='" + marea + '\'' +
                ", mtype='" + mtype + '\'' +
                ", mmoney=" + mmoney +
                ", mstyle='" + mstyle + '\'' +
                ", mphone='" + mphone + '\'' +
                ", mwishtime='" + mwishtime + '\'' +
                ", msettime='" + msettime + '\'' +
                ", mstatus='" + mstatus + '\'' +
                '}';
    }
}
