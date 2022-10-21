package com.finalprj.ILuvJeju.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.finalprj.ILuvJeju.domain.Member;

import java.util.Optional;

/*
 * 로그인,로그아웃 관련 Repository
 *
 * @Author 백정연
 * @Date 2021/08/03
 */

@Repository
public interface LoginRepository extends JpaRepository<Member, String> {
    Optional<Member> findByIdAndPassword(String id, String password);
}
