package com.yuen.repository;

import org.springframework.data.repository.CrudRepository;

import com.yuen.domain.FoodCategory;

public interface FoodCategoryRepository extends CrudRepository<FoodCategory, String> {

}
