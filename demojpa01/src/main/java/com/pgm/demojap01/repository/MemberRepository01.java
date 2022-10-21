package com.pgm.demojap01.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pgm.demojap01.domain.Member;

public interface MemberRepository01 extends JpaRepository<Member, Long>{
	//select * from member where name=${name}
	public List<Member> findByName(String name);
	//select * from member where email=${name}
	public List<Member> findByEmail(String email);
	
	//select * from member where name=${name} and email=${name}
	public List<Member> findByNameAndEmail(String name, String email);
	
	//select * from member where name=${name} Or email=${name}
	public List<Member> findByNameOrEmail(String name, String email);
	//select * from member where name like '%홍길동%'
	public List<Member> findByNameLike(String name);
	//select * from member where name in('홍길동1', '홍길동5')
	public List<Member> findByNameIn(String...names);
	//select * from member order by id desc;
	//public List<Member> findNameOrderByNameDesc(String name);
	public List<Member> findAllByOrderByIdDesc();
	
}
