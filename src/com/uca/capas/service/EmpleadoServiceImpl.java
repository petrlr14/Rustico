package com.uca.capas.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uca.capas.domain.Empleado;
import com.uca.capas.repository.EmpleadoRepository;

@Service
public class EmpleadoServiceImpl implements EmpleadoService {

	@Autowired
	EmpleadoRepository empleadoRepository;

	@Override
	public Empleado findById(Long code) {
		return empleadoRepository.findOne(code);
	}

	@Override
	public Empleado save(Empleado empleado) {
		return empleadoRepository.saveAndFlush(empleado);
	}

	@Override
	public void delete(Long code) {
		empleadoRepository.delete(empleadoRepository.findOne(code));
	}

}
