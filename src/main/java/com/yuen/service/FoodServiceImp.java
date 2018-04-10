package com.yuen.service;

import com.yuen.domain.Food;
import com.yuen.domain.User;
import com.yuen.repository.FoodRespository;

public class FoodServiceImp implements FoodService {
private  FoodRespository foodRespository;
	@Override
	public Iterable<Food> findAll() {
		// TODO Auto-generated method stub
		return foodRespository.findAll();
	}

}
