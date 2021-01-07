package com.kh.ddoda.diary.domain;

public class Search {
	//검색용 클래스
	private String searchCondition;
	private String searchValue;
	private String existFile;
	private Integer num;
	
	public Search() {}
	
	
	
	public Search(String searchCondition, String searchValue, String existFile) {
		super();
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
		this.existFile = existFile;
	}



	public Integer getNum() {
		return num;
	}



	public void setNum(Integer num) {
		this.num = num;
	}



	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public String getExistFile() {
		return existFile;
	}
	public void setExistFile(String existFile) {
		this.existFile = existFile;
	}
	@Override
	public String toString() {
		return "Search [searchCondition=" + searchCondition + ", searchValue=" + searchValue + ", existFile="
				+ existFile + "]";
	}
	
	
}
