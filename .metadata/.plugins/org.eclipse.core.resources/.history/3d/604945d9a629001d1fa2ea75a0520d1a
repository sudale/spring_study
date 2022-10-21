package com.finalprj.ILuvJeju.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalprj.ILuvJeju.domain.Member;
import com.finalprj.ILuvJeju.dto.MemberDTO;
import com.finalprj.ILuvJeju.repository.LoginRepository;
import com.finalprj.ILuvJeju.service.LoginService;
import com.finalprj.ILuvJeju.service.MemberService;

import java.io.IOException;
import java.util.Optional;

/*
 * 로그인 Service 구현 클래스
 *
 * @Author 백정연
 * @Date 2021/08/03
 */

@Service
public class LoginServiceImpl implements LoginService{

    @Autowired
    private LoginRepository repository;

    @Override
    public MemberDTO login(MemberDTO dto) {
        Optional<Member> result = repository.findByIdAndPassword(dto.getId(), dto.getPassword());
        return result.isPresent()? entityToDto(result.get()) : null;
    }

}
