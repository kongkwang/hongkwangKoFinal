package com.kh.ddoda.calendar.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ddoda.calendar.domain.Calorie;
import com.kh.ddoda.calendar.domain.DailyCalendar;
import com.kh.ddoda.calendar.domain.FoodCheckList;
import com.kh.ddoda.calendar.domain.FoodSelectedList;
import com.kh.ddoda.calendar.domain.MyDiet;
import com.kh.ddoda.calendar.domain.SumCalorie;
import com.kh.ddoda.calendar.domain.MemberInfo;
import com.kh.ddoda.calendar.domain.MyCalorie;
import com.kh.ddoda.calendar.store.CalendarStore;



@Service
public class CalendarServiceImpl implements CalendarService{
	@Autowired
	private CalendarStore cStore;
	
	@Override
	public int registerFoods(Calorie calorie) {
		return cStore.insertFoods(calorie);
	}
	
	@Override
	public int registerFoods(MyCalorie myCalorie) {
		return cStore.insertFoods(myCalorie);
	}

	@Override
	public int registerMemberInfo(MemberInfo memberInfo) {
		return cStore.insertMemberInfo(memberInfo);
	}

	@Override
	public int registerMyDiet(MyDiet myDiet) {
		return cStore.insertMyDiet(myDiet);
	}

	@Override
	public Calorie selectFood(int calorieNo) {
		return cStore.selectFood(calorieNo);
	}

	@Override
	public MyDiet selectDietInfo(MyDiet myDiet) {
		return cStore.selectDietInfo(myDiet);
	}

	@Override
	public MemberInfo selectMemberInfo(String userId) {
		return cStore.selectMemberInfo(userId);
	}

	@Override
	public int modifyMemberInfo(MemberInfo memberInfo) {
		return cStore.updateMemberInfo(memberInfo);
	}

	@Override
	public ArrayList<FoodSelectedList> selectCalorie(FoodCheckList foodCheckList) {
		return cStore.selectCalorie(foodCheckList);
	}

	@Override
	public ArrayList<FoodSelectedList> selectMyCalorie(FoodCheckList foodCheckList) {
		return cStore.selectMyCalorie(foodCheckList);
	}

	@Override
	public int registerMyDiet(Calorie calorie) {
		return cStore.insertMyDiet(calorie);
	}

	@Override
	public int registerFoodCheckList(FoodCheckList foodCheckList) {
		return cStore.insertFoodCheckList(foodCheckList);
	}

	@Override
	public int emptyFoodCheckList(FoodCheckList foodCheckList) {
		return cStore.emptyFoodCheckList(foodCheckList);
	}

	@Override
	public ArrayList<FoodCheckList> selectCheckFoodList(FoodCheckList foodCheckList) {
		return cStore.selectCheckFoodList(foodCheckList);
	}

	@Override
	public ArrayList<SumCalorie> selectListSum(String userId, Date dateStr) {
		return cStore.selectListSum(userId, dateStr);
	}

	@Override
	public int deleteMyDiet(MyDiet myDiet) {
		return cStore.deleteMyDiet(myDiet);
	}

	@Override
	public ArrayList<DailyCalendar> calenderDaily(HashMap<String, Object> tempMap) {
		return cStore.calenderDaily(tempMap);
	}

	
	
}
