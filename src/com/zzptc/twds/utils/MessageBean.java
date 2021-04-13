package com.zzptc.twds.utils;

public class MessageBean {
	private boolean success;
	private String msg;
	private Object other;
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getOther() {
		return other;
	}
	public void setOther(Object other) {
		this.other = other;
	}
	public MessageBean(boolean success, String msg) {
		super();
		this.success = success;
		this.msg = msg;
	}
	public MessageBean(boolean success, String msg, Object other) {
		super();
		this.success = success;
		this.msg = msg;
		this.other = other;
	}
	public MessageBean(Object other) {
		super();
		this.other = other;
	}
	
	
	
	
	

}
