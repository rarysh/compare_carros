package com.comparecarros.service.restclient;

import java.util.List;

import javax.enterprise.context.ApplicationScoped;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import com.comparecarros.domain.Modelo;
import com.comparecarros.domain.Veiculo;

import org.eclipse.microprofile.rest.client.inject.RegisterRestClient;

@Path("/")
@RegisterRestClient(configKey = "fipe_service")
@ApplicationScoped
@Produces("application/json")
public interface FipeService {

	@GET
	@Path("/{veiculo}/marcas")
	List<Veiculo> getMarcas(@PathParam("veiculo") String veiculo);

	@GET
	@Path("/{veiculo}/marcas/{marca}/modelos")
	Modelo getModelos(@PathParam("veiculo") String veiculo, @PathParam("marca") String marca);

	@GET
	@Path("/{veiculo}/marcas/{marca}/modelos/{modelo}/anos")
	List<Veiculo> getAnos(@PathParam("veiculo") String veiculo, @PathParam("marca") String marca,
			@PathParam("modelo") String modelo);

	@GET
	@Path("/{veiculo}/marcas/{marca}/modelos/{modelo}/anos/{ano}")
	Veiculo getValor(@PathParam("veiculo") String veiculo, @PathParam("marca") String marca,
			@PathParam("modelo") String modelo, @PathParam("ano") String ano);

}
