package com.uca.capas.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Entity
@Table(schema = "public", name = "sucursal")
public @Data class Sucursal {
	@Id
	@GeneratedValue(generator = "sucursal_c_sucursal_seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "sucursal_c_sucursal_seq", sequenceName = "public.sucursal_c_sucursal_seq", allocationSize = 1)
	@Column(name = "c_sucursal")
	private Long sucursalC;
	@Column(name = "s_nombre")
	private String nombreS;
	@Column(name = "s_ubicacion")
	private String ubicacionS;
	@Column(name = "s_horario")
	private String horarioS;
	@Column(name = "s_nmesas")
	private Integer nMesasS;
	@Column(name = "s_nomgerente")
	private String nomGerenteS;
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "sucursalE")
	private List<Empleado> empleados;

}
