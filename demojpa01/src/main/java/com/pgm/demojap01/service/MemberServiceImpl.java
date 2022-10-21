package com.pgm.demojap01.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pgm.demojap01.domain.JpaMember;
import com.pgm.demojap01.repository.MemberRepository;

import lombok.extern.java.Log;

@Log
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberRepository memberRepository;
	
	public List<JpaMember> list(){
		return memberRepository.findAll();
	}

	@Override
	public void insert(JpaMember member) {
		// TODO Auto-generated method stub
		memberRepository.save(member);
	}

	@Override
	public JpaMember read(Long id) {
		// TODO Auto-generated method stub
		return memberRepository.findById(id).get();
	}

	@Transactional
	@Override
	public void update(JpaMember member) {
		// TODO Auto-generated method stub
		log.info("service member:"+member);
		JpaMember m=memberRepository.findById(member.getId()).get();
		m.setEmail(member.getAddr());
		m.setMemo(member.getMemo());
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		memberRepository.deleteById(id);
	}

}
