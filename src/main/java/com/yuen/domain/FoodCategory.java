package com.yuen.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="food_category")
public class FoodCategory  implements Serializable{

	private static final long serialVersionUID = 1L;
    
	@Column(name ="id_food_category", nullable= false)
	private String id_food_category;
	
	@Column(name="food_category" , nullable= false)
	private String food_category;
	
	@Column(name= "category_description", nullable= false )
	private String category_description;

	public FoodCategory(String id_food_category, String food_category, String category_description) {
		super();
		this.id_food_category = id_food_category;
		this.food_category = food_category;
		this.category_description = category_description;
	}

	public FoodCategory() {
		
	}

	public String getId_food_category() {
		return id_food_category;
	}

	public void setId_food_category(String id_food_category) {
		this.id_food_category = id_food_category;
	}

	public String getFood_category() {
		return food_category;
	}

	public void setFood_category(String food_category) {
		this.food_category = food_category;
	}

	public String getCategory_description() {
		return category_description;
	}

	public void setCategory_description(String category_description) {
		this.category_description = category_description;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
