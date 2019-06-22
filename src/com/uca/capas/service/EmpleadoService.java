package com.uca.capas.service;

import com.uca.capas.domain.Empleado;

public interface EmpleadoService {

	public Empleado findById(Long code);

	public Empleado save(Empleado empleado);

	public void delete(Long code);

}
