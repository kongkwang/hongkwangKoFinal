package com.kh.ddoda.calendar.domain;

public class DailyCalendarData {

	private String title;
	private String start;
	private String color;
	private String textColor;
	private String imageurl;
	
	public DailyCalendarData(String title, String start, String color, String textColor, String imageurl) {
		this.title = title;
		this.start = start;
		this.color = color;
		this.textColor = textColor;
		this.imageurl = imageurl;
		
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getTextColor() {
		return textColor;
	}

	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}

	public String getImageurl() {
		return imageurl;
	}

	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}

	@Override
	public String toString() {
		return "{'title':'"+ title +"', 'start':'" + start + "', 'color':'" + color + "', 'textColor':'"+ textColor+"', 'imageurl':'" + imageurl + "' }";
	}
	
	
	
}
