package com.lsy.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lsy.board.model.User;
import com.lsy.board.repository.UserRepository;

import lombok.extern.java.Log;

@Service
@Log
public class UserServiceImpl implements UserService{

	@Autowired
	private UserRepository userRepository;
	
	@Override
	public void register(User user) {
		// TODO Auto-generated method stub
		userRepository.save(user);
	}

	@Override
	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		return userRepository.findByUsername(username);
	}
	
	@Override
	public boolean existsByUsername(String username) {
		// TODO Auto-generated method stub
		return userRepository.existsByUsername(username);
	}
	


}
