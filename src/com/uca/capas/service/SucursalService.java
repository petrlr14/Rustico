package com.uca.capas.service;

import java.util.List;

import com.uca.capas.domain.Sucursal;

public interface SucursalService {

	public List<Sucursal> getAllSucursales();

	public Sucursal getSucursalById(Long id);

	public Sucursal save(Sucursal suc);

	public void delete(Long id);

}
