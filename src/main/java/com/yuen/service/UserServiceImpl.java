package com.yuen.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuen.domain.User;
import com.yuen.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	 @Autowired
	 private UserRepository userrepository;
	 
	@Override
	public Iterable<User> findAll() {
		// TODO Auto-generated method stub
		return userrepository.findAll();
	}

	@Override
	public Optional<User> findOne(int id) {
		// TODO Auto-generated method stub
		return userrepository.findById(id);
	}

	@Override
	public void save(User user) {
		// TODO Auto-generated method stub
		userrepository.save(user);
	}

}
