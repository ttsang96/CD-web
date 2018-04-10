package com.yuen.domain;

import java.io.InputStream;
import java.sql.Date;
import java.sql.SQLException;

import javax.persistence.Column;
import javax.persistence.Id;


public class Food {
	@Id
	@Column(name = "id_food", nullable = false)
	private String id_food;
	
	@Column(name = "name_food", nullable = false)
	private String name_food ;
	
	@Column(name = "id_food_category", nullable = false)
	private String id_category;
	
	@Column(name = "owner_fomular_food", nullable = false)
	private String id_owmner;
	
	@Column(name = "id_food", nullable = false)
	private String description_food;
	
	@Column(name = "price_food", nullable = false)
	private int price_food;
	
	@Column(name = "sum_view", nullable = false)
	private int sum_view;
	
	@Column(name = "sum_like", nullable = false)
	private int sum_like;
	
	@Column(name = "sum_comment", nullable = false)
	private int sum_comment;
	
	@Column(name = "sum_vote", nullable = false)
	private int sum_vote;
	
	@Column(name = "vote_point", nullable = false)
	private double vote_point;
	
	@Column(name = "image_food", nullable = false)
	private InputStream food_image;
	
	@Column(name = "id_food", nullable = false)
	private String date_add;
	

	public Food(String id_food, String name_food, String id_category, String id_owmner, String description_food,
			int price_food, int sum_view, int sum_like, int sum_comment, int sum_vote, double vote_point,
			InputStream food_image, String date_add) {
		super();
		this.id_food = id_food;
		this.name_food = name_food;
		this.id_category = id_category;
		this.id_owmner = id_owmner;
		this.description_food = description_food;
		this.price_food = price_food;
		this.sum_view = sum_view;
		this.sum_like = sum_like;
		this.sum_comment = sum_comment;
		this.vote_point = vote_point;
		this.food_image = food_image;
		this.date_add = date_add;
		this.sum_vote = sum_vote;
	}

	public int getSum_vote() {
		return sum_vote;
	}

	public void setSum_vote(int sum_vote) {
		this.sum_vote = sum_vote;
	}

	public String getDate_add() {
		return date_add;
	}

	public void setDate_add(String date_add) {
		this.date_add = date_add;
	}

	public String getId_food() {
		return id_food;
	}

	public void setId_food(String id_food) {
		this.id_food = id_food;
	}

	public String getName_food() {
		return name_food;
	}

	public void setName_food(String name_food) {
		this.name_food = name_food;
	}

	public String getId_category() {
		return id_category;
	}

	public void setId_category(String id_category) {
		this.id_category = id_category;
	}

	public String getId_owmner() {
		return id_owmner;
	}

	public void setId_owmner(String id_owmner) {
		this.id_owmner = id_owmner;
	}

	public String getDescription_food() {
		return description_food;
	}

	public void setDescription_food(String description_food) {
		this.description_food = description_food;
	}

	public int getPrice_food() {
		return price_food;
	}

	public void setPrice_food(int price_food) {
		this.price_food = price_food;
	}

	public int getSum_view() {
		return sum_view;
	}

	public void setSum_view(int sum_view) {
		this.sum_view = sum_view;
	}

	public int getSum_like() {
		return sum_like;
	}

	public void setSum_like(int sum_like) {
		this.sum_like = sum_like;
	}

	public int getSum_comment() {
		return sum_comment;
	}

	public void setSum_comment(int sum_comment) {
		this.sum_comment = sum_comment;
	}

	public double getVote_point() {
		return vote_point;
	}

	public void setVote_point(double vote_point) {
		this.vote_point = vote_point;
	}

	public InputStream getFood_image() {
		return food_image;
	}

	public void setFood_image(InputStream food_image) {
		this.food_image = food_image;
	}

	

	
}
