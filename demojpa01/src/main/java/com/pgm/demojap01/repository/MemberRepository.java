package com.pgm.demojap01.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pgm.demojap01.domain.JpaMember;

public interface MemberRepository extends JpaRepository<JpaMember, Long>{

}
