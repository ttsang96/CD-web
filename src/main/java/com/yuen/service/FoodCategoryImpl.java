package com.yuen.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuen.domain.FoodCategory;
import com.yuen.repository.FoodCategoryRepository;
@Service
public class FoodCategoryImpl implements FoodCategoryService{
	 @Autowired
	 private  FoodCategoryRepository    foodCategoryRepository ;
	@Override
	public Iterable<FoodCategory> findAll() {
		// TODO Auto-generated method stub
		return foodCategoryRepository.findAll();
	}

}
