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
	
}
