package com.pgm.demojap01.service;

import java.util.List;

import com.pgm.demojap01.domain.JpaMember;

public interface MemberService {
	public List<JpaMember> list();

	public void insert(JpaMember member);

	public Object read(Long id);

	public void update(JpaMember member);

	public void delete(Long id);

	

}
