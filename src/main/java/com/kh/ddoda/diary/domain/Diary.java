package com.kh.ddoda.diary.domain;

import java.sql.Date;

public class Diary {
	private int diaryNo;
	private String userId;
	private String diaryTitle;
	private String diaryContents;
	private Date diaryDate;
	private String publicCode;
	private String originalFileName;
	private String renameFileName;
	
	public Diary() {}
	
	public Diary(String publicCode) {
		this.publicCode = publicCode;
	}

	public Diary(int diaryNo, String userId, String diaryTitle, String diaryContents, Date diaryDate, String publicCode,
			String originalFileName, String renameFileName) {
		super();
		this.diaryNo = diaryNo;
		this.userId = userId;
		this.diaryTitle = diaryTitle;
		this.diaryContents = diaryContents;
		this.diaryDate = diaryDate;
		this.publicCode = publicCode;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
	}



	public int getDiaryNo() {
		return diaryNo;
	}

	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDiaryTitle() {
		return diaryTitle;
	}

	public void setDiaryTitle(String diaryTitle) {
		this.diaryTitle = diaryTitle;
	}

	public String getDiaryContents() {
		return diaryContents;
	}

	public void setDiaryContents(String diaryContents) {
		this.diaryContents = diaryContents;
	}

	public Date getDiaryDate() {
		return diaryDate;
	}

	public void setDiaryDate(Date diaryDate) {
		this.diaryDate = diaryDate;
	}

	public String getPublicCode() {
		return publicCode;
	}

	public void setPublicCode(String publicCode) {
		this.publicCode = publicCode;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	@Override
	public String toString() {
		return "Diary [diaryNo=" + diaryNo + ", userId=" + userId + ", diaryTitle=" + diaryTitle + ", diaryContents="
				+ diaryContents + ", diaryDate=" + diaryDate + ", publicCode=" + publicCode + ", originalFileName="
				+ originalFileName + ", renameFileName=" + renameFileName + "]";
	}

	
}
