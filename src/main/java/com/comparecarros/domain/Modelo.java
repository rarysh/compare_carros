package com.comparecarros.domain;

import java.util.List;

public class Modelo {

	private List<Veiculo> modelos;
	private List<Veiculo> anos;

	public Modelo() {

	}

	public List<Veiculo> getModelos() {
		return this.modelos;
	}

	public List<Veiculo> getAnos() {
		return this.anos;
	}

	public void setModelos(List<Veiculo> modelos) {
		this.modelos = modelos;
	}

	public void setAnos(List<Veiculo> anos) {
		this.anos = anos;
	}
}