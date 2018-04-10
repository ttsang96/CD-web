package com.yuen.service;

import java.util.Optional;


import com.yuen.domain.User;

public interface UserService {
	 Iterable<User> findAll();
	 Optional<User> findOne(int id);
	 void save(User user);
}
