package com.yuen.repository;

import org.hibernate.query.criteria.internal.CriteriaUpdateImpl;
import org.springframework.data.repository.CrudRepository;

import com.yuen.domain.Food;

public interface FoodRespository extends CrudRepository<Food, String> {

}
