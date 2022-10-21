package com.example.demo.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="membership_cards")
public class MemberShipCard {
	@Id
	@Column(name="card_number")
	private String cardNumber;
	private Date expiryDate;
	private boolean enabled;
	@OneToOne
	@JoinColumn(name="user_email")
	private MemberShipUser owner;

}
