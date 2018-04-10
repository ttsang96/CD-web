package com.yuen.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;


@Entity
@Table(name ="user_system")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;
    
    
    @Column(name = "id_user", nullable = false)
    @Id
    
    private String id;
    
    
    @Column(name ="first_name_user",nullable = false)
    private String fname;
    
    
    @Column(name= "last_name_user", nullable= false)
    private String lname;
    
    @Column (name ="gender", nullable= false)
    private int gender;
    
    @Column(name ="access_kind", nullable = false)
    private String access_kind;
    
    
    
    @Column(name ="email_user", nullable= false)
    private String email_user;
    
    
    @Column (name ="password_user", nullable = false)
    private String password_user;
    
    @Column (name="image_user")
    private String image_user;
    
    @Column (name ="status_user", nullable = false)
    private int status_user;
    
    
    @Column (name="balance_account_user", nullable=false)
    private int balance_account_user;
    
    
    @Column(name ="Date_create", nullable= false)
    private String Date_create;


	public User(String id, String fname, String lname, int gender, String access_kind, String email_user,
			String password_user, String image_user, int status_user, int balance_account_user, String date_create) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.gender = gender;
		this.access_kind = access_kind;
		this.email_user = email_user;
		this.password_user = password_user;
		this.image_user = image_user;
		this.status_user = status_user;
		this.balance_account_user = balance_account_user;
		Date_create = date_create;
	}


	public User() {
	
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getFname() {
		return fname;
	}


	public void setFname(String fname) {
		this.fname = fname;
	}


	public String getLname() {
		return lname;
	}


	public void setLname(String lname) {
		this.lname = lname;
	}


	public int getGender() {
		return gender;
	}


	public void setGender(int gender) {
		this.gender = gender;
	}


	public String getAccess_kind() {
		return access_kind;
	}


	public void setAccess_kind(String access_kind) {
		this.access_kind = access_kind;
	}


	public String getEmail_user() {
		return email_user;
	}


	public void setEmail_user(String email_user) {
		this.email_user = email_user;
	}


	public String getPassword_user() {
		return password_user;
	}


	public void setPassword_user(String password_user) {
		this.password_user = password_user;
	}


	public String getImage_user() {
		return image_user;
	}


	public void setImage_user(String image_user) {
		this.image_user = image_user;
	}


	public int getStatus_user() {
		return status_user;
	}


	public void setStatus_user(int status_user) {
		this.status_user = status_user;
	}


	public int getBalance_account_user() {
		return balance_account_user;
	}


	public void setBalance_account_user(int balance_account_user) {
		this.balance_account_user = balance_account_user;
	}


	public String getDate_create() {
		return Date_create;
	}


	public void setDate_create(String date_create) {
		Date_create = date_create;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
    
    
    
}
