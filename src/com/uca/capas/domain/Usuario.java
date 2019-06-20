package com.uca.capas.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Entity
@Table(schema = "public", name = "user_account")
public @Data class Usuario {

	@Id
	@GeneratedValue(generator = "user_account_user_id_seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "user_account_user_id_seq", sequenceName = "public.user_account_user_id_seq", allocationSize = 1)
	@Column(name = "user_id")
	private Long userId;

}
