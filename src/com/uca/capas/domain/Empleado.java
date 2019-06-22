package com.uca.capas.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Entity
@Getter
@Setter
@Table(schema = "public", name = "empleado")

public class Empleado {

	@Id
	@GeneratedValue(generator = "empleado_c_empleado_seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "empleado_c_empleado_seq", sequenceName = "public.empleado_c_empleado_seq", allocationSize = 1)
	@Column(name = "c_empleado")
	private Long empleadoC;
	@Column(name = "e_nombre")
	@NotBlank
	private String nombreE;
	@Column(name = "e_edad")
	@Min(18)
	private Integer edadE = 18;
	@Column(name = "e_genero")
	@NotBlank
	private String generoE;
	@Column(name = "e_estado")
	private Boolean estadoE = true;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "e_sucursal")
	private Sucursal sucursalE;

}
