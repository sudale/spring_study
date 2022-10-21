package com.pgm.demojap01.repository;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.test.context.TestPropertySource;

import com.pgm.demojap01.constant.Role;
import com.pgm.demojap01.domain.Member;

@SpringBootTest
@TestPropertySource(locations="classpath:application.properties")
public class MemberTest {
	
	@Autowired
	MemberRepository01 memberRepository;
	
	@Test
	public void createMemberTest() {
		Member member=new Member();
		member.setName("이상용2");
		member.setEmail("aaa@bbb.com");
		member.setPassword("1234");
		member.setAddress("부산시 부산진구");
		member.setRole(Role.ADMIN);
		memberRepository.save(member);
		
	}
	
	@Test
	public void createMemberListTest() {
		for(int i=11;i<20;i++) {
			Member member=new Member();
			member.setName("이상용"+i);
			member.setEmail("kkk"+i+"@bbb.com");
			member.setPassword("1234");
			member.setAddress("부산시 해운대구"+i);
			member.setRole(Role.USER);
			memberRepository.save(member);
		}
	}
	
	@Test
	public void getMemberList() {
		List<Member> members=memberRepository.findAll();
		for(int i=0; i<members.size();i++) {
			System.out.println(members.get(i));
		}
	}
	
@Test
	public void getMember1() {
		Member member1=memberRepository.findById(10L).get();
		System.out.println(member1);
	}
	
	@Test
	public void updateMemberTest() {
		Member member=new Member();
		member.setId(10L);
		member.setName("이상용수정");
		member.setEmail("1");
		member.setPassword("1234");
		member.setAddress("부산시 남구");
		member.setRole(Role.ADMIN);
		memberRepository.save(member);
		
	}
	
	@Test
	public void delete() {
//		Member member=new Member();
//		member.setId(7L);
//		memberRepository.delete(member);
		memberRepository.deleteById(9L); 
	}
	
	@Test
	public void name_email() {
		List<Member> members=memberRepository.findByName("이상용9");
		for(Member member:members) {
			System.out.println(member.getName());
		}
		
		List<Member> members2=memberRepository.findByEmail("kkk9@bbb.com");
		for(Member member:members2) {
			System.out.println(member.getName());
		}
	}
	
//	@Test
//	public void inName() {
//		String[] names= {"홍길동1","김수동7"};
//		List<Member> members=memberRepository.findByNameIn(names);
//		for(Member member:members) {
//			System.out.println(member);
//		}
//	}
	@Test
	public void orderby() {
		//List<Member> members=memberRepository.findAllByOrderByIdDesc();
		List<Member> members=memberRepository.findAll(Sort.by(Sort.Direction.ASC,"id"));
//		List<Member> members=memberRepository.findAll(Sort.by(Sort.Direction.DESC,"id"));
		for(Member member:members) {
			System.out.println(member);
		}
	}
	
	@Test
	public void pageTest() {
		Pageable pageable=PageRequest.of(0, 5);
		Page<Member> memberPage=memberRepository.findAll(pageable);
		List<Member> members=memberPage.getContent();
		
		for(Member member:members) {
			System.out.println(member);
		}
	}
}
