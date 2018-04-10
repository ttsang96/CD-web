package com.yuen.service;

import com.yuen.domain.Food;
import com.yuen.domain.User;

public interface FoodService {
	Iterable<Food> findAll();
}
