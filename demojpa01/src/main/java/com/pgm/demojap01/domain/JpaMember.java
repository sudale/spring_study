package com.pgm.demojap01.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="tbl_member2")
public class JpaMember { //jpa_member
	@Id  //pk 설정
	@GeneratedValue(strategy = GenerationType.IDENTITY) //pk 자동생성 전략
	private Long id;
	private String name;
	private String password;
	private String email;
	private String memo;
	@Column(name="address",length=100)
	private String addr;

}
