package com.uca.capas.service;

import java.util.List;

import com.uca.capas.domain.Usuario;

public interface UsuarioService {

	public Usuario findUsuarioLogin(String usuario, String password);

	public List<Usuario> findAll();

}
