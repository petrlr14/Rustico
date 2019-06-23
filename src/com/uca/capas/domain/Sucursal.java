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
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Entity
@Table(schema = "public", name = "sucursal")
@Setter
@Getter
public class Sucursal {
	@Id
	@GeneratedValue(generator = "sucursal_c_sucursal_seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "sucursal_c_sucursal_seq", sequenceName = "public.sucursal_c_sucursal_seq", allocationSize = 1)
	@Column(name = "c_sucursal")
	private Long sucursalC;
	@Column(name = "s_nombre")
	@NotBlank
	private String nombreS;
	@Column(name = "s_ubicacion")
	@NotBlank
	private String ubicacionS;
	@Column(name = "s_abre")
	@NotBlank
	private String abreS;
	@Column(name = "s_cierra")
	@NotBlank
	private String cierraS;
	@Column(name = "s_nmesas")
	@Min(0)
	private Integer numMesasS;
	@Column(name = "s_nomgerente")
	@NotBlank
	private String nomGerenteS;
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "sucursalE")
	private List<Empleado> empleados;

	public String getHorario() {
		return new StringBuilder().append(this.getAbreS()).append(" - ").append(this.getCierraS()).toString();
	}

}
