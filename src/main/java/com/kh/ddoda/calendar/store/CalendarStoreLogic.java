package com.kh.ddoda.calendar.store;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ddoda.calendar.domain.Calendar;
import com.kh.ddoda.calendar.domain.Calorie;
import com.kh.ddoda.calendar.domain.DailyCalendar;
import com.kh.ddoda.calendar.domain.FoodCheckList;
import com.kh.ddoda.calendar.domain.FoodSelectedList;
import com.kh.ddoda.calendar.domain.MyDiet;
import com.kh.ddoda.calendar.domain.SumCalorie;
import com.kh.ddoda.calendar.domain.MemberInfo;
import com.kh.ddoda.calendar.domain.MyCalorie;


@Repository
public class CalendarStoreLogic implements CalendarStore {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private Calendar calendar;
	private Calorie calorie;
	private MyDiet dietInfo;
	private MemberInfo memberInfo;
	
	@Override
	public int insertFoods(Calorie calorie) {
		return sqlSession.insert("calendarMapper.insertCalorie", calorie);
	}
	@Override
	public int insertFoods(MyCalorie myCalorie) {
		return sqlSession.insert("calendarMapper.insertMyCalorie", myCalorie);
	}

	@Override
	public int insertMemberInfo(MemberInfo memberInfo) {
		return sqlSession.insert("calendarMapper.insertMemberInfo", memberInfo);
	}

	@Override
	public int insertMyDiet(MyDiet myDiet) {
		return sqlSession.insert("calendarMapper.insertMyDiet", myDiet);
	}

	@Override
	public Calorie selectFood(int calorieNo) {
		return sqlSession.selectOne("calendarMapper.selectFoodName", calorieNo);
	}

	@Override
	public MyDiet selectDietInfo(MyDiet myDiet) {
		return sqlSession.selectOne("calendarMapper.selectDietInfo", myDiet);
	}

	@Override
	public MemberInfo selectMemberInfo(String userId) {
		return sqlSession.selectOne("calendarMapper.selectOne", userId);
	}

	@Override
	public int updateMemberInfo(MemberInfo memberInfo) {
		return sqlSession.update("calendarMapper.updateMemberInfo", memberInfo);
	}


	@Override
	public ArrayList<FoodSelectedList> selectCalorie(FoodCheckList foodCheckList) {
		return (ArrayList)sqlSession.selectList("calendarMapper.selectCalorieList",foodCheckList);
	}
	@Override
	public ArrayList<FoodSelectedList> selectMyCalorie(FoodCheckList foodCheckList) {
		return (ArrayList)sqlSession.selectList("calendarMapper.selectMyCalorieList",foodCheckList);
	}
	@Override
	public int insertMyDiet(Calorie calorie) {
		return sqlSession.insert("calendarMapper.insertCalorieIntoMyDiet", calorie);
	}
	@Override
	public int insertFoodCheckList(FoodCheckList foodCheckList) {
		return sqlSession.insert("calendarMapper.insertFoodCheckList", foodCheckList);
	}
	@Override
	public int emptyFoodCheckList(FoodCheckList foodCheckList) {
		return sqlSession.delete("calendarMapper.emptyFoodCheckList", foodCheckList);
	}
	@Override
	public ArrayList<FoodCheckList> selectCheckFoodList(FoodCheckList foodCheckList) {
		return (ArrayList)sqlSession.selectList("calendarMapper.selectCheckFoodList",foodCheckList);
	}
	@Override
	public ArrayList<SumCalorie> selectListSum(String userId, Date dateStr) {
		HashMap<String,Object> tempMap = new HashMap<>();
		tempMap.put("userId", userId);
		tempMap.put("addDate", dateStr);
		return (ArrayList)sqlSession.selectList("calendarMapper.sumKcalByMeal", tempMap);
	}
	@Override
	public int deleteMyDiet(MyDiet myDiet) {
		return sqlSession.delete("calendarMapper.deleteMyDiet", myDiet);
	}
	@Override
	public ArrayList<DailyCalendar> calenderDaily(HashMap<String, Object> tempMap) {
		return (ArrayList)sqlSession.selectList("calendarMapper.calendarDailyList",tempMap);
	}


}
