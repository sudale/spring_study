package com.lsy.board.service;

import com.lsy.board.model.User;

public interface UserService {
	
	public void register(User user);

	public User findByUsername(String username);
	public boolean existsByUsername(String username);

}
