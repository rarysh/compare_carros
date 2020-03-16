package com.comparecarros.domain;

import java.util.List;

import javax.json.bind.annotation.JsonbTransient;
import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;
import javax.persistence.Transient;

import io.quarkus.hibernate.orm.panache.PanacheEntity;

@Entity
@Cacheable
@Table(name = "veiculo", indexes = { @Index(columnList = "marca", name = "veiculo_marca_hidx"),
		@Index(columnList = "modelo", name = "veiculo_modelo_hidx"),
		@Index(columnList = "tipo", name = "veiculo_tipo_hidx"),
		@Index(columnList = "ano_modelo", name = "veiculo_ano_modelo_hidx"),
		@Index(columnList = "favorito", name = "veiculo_favorito_hidx") })
public class Veiculo extends PanacheEntity {

	@Column(name = "codigo_fipe")
	public String CodigoFipe;
	@Column(name = "marca")
	public String Marca;
	@Column(name = "modelo")
	public String Modelo;
	@Column(name = "ano_modelo")
	public int AnoModelo;
	@Column(name = "tipo")
	public int TipoVeiculo;
	@Column(name = "valor")
	public String Valor;
	@Column(name = "combustivel")
	public String Combustivel;
	@Column(name = "mes_referencia")
	public String MesReferencia;
	@Column(name = "sigla_combustivel")
	public String SiglaCombustivel;
	public boolean favorito;

	@Transient
	public String codigo;
	@Transient
	public String nome;

	public static final String CARRO = "carros";
	public static final String MOTO = "motos";
	public static final String CAMINHAO = "caminhoes";

	public Veiculo() {

	}

	public Veiculo(String codigoFipe, String marca, String modelo, int anoModelo, int tipo, String valor,
			String combustivel, String mesReferencia, String siglaCombustivel) {
		this.CodigoFipe = codigoFipe;
		this.Marca = marca;
		this.Modelo = modelo;
		this.AnoModelo = anoModelo;
		this.TipoVeiculo = tipo;
		this.Valor = valor;
		this.Combustivel = combustivel;
		this.MesReferencia = mesReferencia;
		this.SiglaCombustivel = siglaCombustivel;
	}

	@JsonbTransient
	public double getValorDouble() {
		return Double.parseDouble(this.Valor.substring(3, this.Valor.length()).replace(".", "").replace(",", "."));
	}

	public static List<Veiculo> listAnos(int tipoVeiculo, String marca, String modelo) {
		return list("TipoVeiculo = ?1 and Marca = ?2 and Modelo = ?3", tipoVeiculo, marca, modelo);
	}

	public static Veiculo findValor(int tipoVeiculo, String marca, String modelo, int ano) {
		return find("TipoVeiculo = ?1 and Marca = ?2 and Modelo = ?3 and AnoModelo = ?4", tipoVeiculo, marca, modelo,
				ano).firstResult();
	}

	public static List<Veiculo> listAllFavoritos() {
		return list("favorito", true);
	}

	public static List<Veiculo> listModelos(int tipoVeiculo, String marca) {
		return list("TipoVeiculo = ?1 and Marca = ?2", tipoVeiculo, marca);
	}

	public static List<Veiculo> listMarcas(int tipoVeiculo) {
		return list("TipoVeiculo", tipoVeiculo);
	}

	public static Veiculo findByTipoMarcaModeloAno(int tipoVeiculo, String marca, String modelo, int anoModelo) {
		return find("Tipo = ?1 and Marca = ?2 and Modelo = ?3 and AnoModelo = ?4", tipoVeiculo, marca, modelo,
				anoModelo).firstResult();
	}
}