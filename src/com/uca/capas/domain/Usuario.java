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
@Table(schema = "public", name = "usuario")
public @Data class Usuario {

	@Id
	@GeneratedValue(generator = "usuario_c_usuario_seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "usuario_c_usuario_seq", sequenceName = "public.usuario_c_usuario_seq", allocationSize = 1)
	@Column(name = "c_usuario")
	private Long cUsuario;
	@Column(name = "u_usuario")
	private String uUsuario;
	@Column(name = "u_clave")
	private String uClave;

}
