package com.kh.ddoda.calendar.domain;

public class ResultObject {

	public ResultObject(String result, String message) {
		this.result = result;
		this.message = message;
	}
	private String result;
	private String message;
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
