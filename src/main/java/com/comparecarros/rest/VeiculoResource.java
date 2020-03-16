package com.comparecarros.rest;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.comparecarros.domain.Veiculo;
import com.comparecarros.service.VeiculoService;

import org.eclipse.microprofile.openapi.annotations.Operation;
import org.eclipse.microprofile.openapi.annotations.parameters.Parameter;
import org.jboss.resteasy.annotations.jaxrs.PathParam;

@Path("veiculo")
@Produces(MediaType.APPLICATION_JSON)
public class VeiculoResource {

    @Inject
    VeiculoService veiculoService;

    @GET
    @Path("atualizarDadosAPI")
    public void atualizarDadosAPI() {
        System.out.println("ni");
        veiculoService.atualizarDadosAPI();
    }

    public void invalidaTipoVeiculo(int tipoVeiculo) {
        if (tipoVeiculo < 1 || tipoVeiculo > 3)
            throw new IllegalArgumentException("Tipo inválido, insira um valor entre 1 e 3.");
    }

    @GET
    @Path("{tipoVeiculo}")
    @Operation(summary = "Lista veículos por tipo", description = "Lista veículos por tipo.")
    @Parameter(name = "tipoVeiculo", description = "tipoVeiculo do Veículo", required = true, example = "1")
    public List<Veiculo> getMarcas(@PathParam("tipoVeiculo") int tipoVeiculo) {
        invalidaTipoVeiculo(tipoVeiculo);
        return Veiculo.listMarcas(tipoVeiculo);
    }

    @GET
    @Path("{tipoVeiculo}/{marca}")
    @Operation(summary = "Lista veículos por tipo e marca", description = "Lista veículos por tipo e marca.")
    @Parameter(name = "tipoVeiculo", description = "tipoVeiculo do Veículo", required = true, example = "1")
    @Parameter(name = "marca", description = "marca do Veículo", required = true, example = "Acura")
    public List<Veiculo> getModelos(@PathParam("tipoVeiculo") int tipoVeiculo, @PathParam("marca") String marca) {
        invalidaTipoVeiculo(tipoVeiculo);
        return Veiculo.listModelos(tipoVeiculo, marca);
    }

    @GET
    @Path("{tipoVeiculo}/{marca}/modelo")
    @Operation(summary = "Lista veículos por tipo, marca e modelo", description = "Lista veículos por tipo, marca e modelo.")
    @Parameter(name = "tipoVeiculo", description = "tipoVeiculo do Veículo", required = true, example = "1")
    @Parameter(name = "marca", description = "marca do Veículo", required = true, example = "Acura")
    @Parameter(name = "modelo", description = "modelo do Veículo", required = true, example = "Integra GS 1.8")
    public List<Veiculo> getAno(@PathParam("tipoVeiculo") int tipoVeiculo, @PathParam("marca") String marca,
            @QueryParam("modelo") String modelo) {
        invalidaTipoVeiculo(tipoVeiculo);
        return Veiculo.listAnos(tipoVeiculo, marca, modelo);
    }

    @GET
    @Path("{tipoVeiculo}/{marca}/{ano}")
    @Operation(summary = "Busca veículo por tipo, marca, modelo e ano", description = "Busca veículo por tipo, marca, modelo e ano.")
    @Parameter(name = "tipoVeiculo", description = "tipoVeiculo do Veículo", required = true, example = "1")
    @Parameter(name = "marca", description = "marca do Veículo", required = true, example = "Acura")
    @Parameter(name = "modelo", description = "modelo do Veículo", required = true, example = "Integra GS 1.8")
    @Parameter(name = "ano", description = "ano do Veículo", required = true, example = "1992")
    public Veiculo getValor(@PathParam("tipoVeiculo") int tipoVeiculo, @PathParam("marca") String marca,
            @QueryParam("modelo") String modelo, @PathParam("ano") int ano) {
        invalidaTipoVeiculo(tipoVeiculo);
        return Veiculo.findValor(tipoVeiculo, marca, modelo, ano);
    }

    @GET
    @Path("codigoFipe/{codigoFipe}")
    @Operation(summary = "Busca veículo por codigoFipe", description = "Busca veículo por codigoFipe.")
    @Parameter(name = "codigoFipe", description = "primary key do Veiculo", required = true, example = "005340-6")
    public Veiculo getValor(@PathParam("codigoFipe") String codigoFipe) {
        return Veiculo.findByCodigoFipe(codigoFipe);
    }

    @GET
    @Path("favorito")
    @Operation(summary = "Lista veículos favoritos", description = "Lista veículos favoritos.")
    public List<Veiculo> listaVeiculoFavorito() {
        return Veiculo.listAllFavoritos();
    }

    @POST
    @Path("comparacao")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Compara uma lista de Veículos e retorna o mais barato e mais caro", description = "Compara uma lista de Veículos e retorna o mais barato e mais caro. Passar List<Veiculo> como parâmetro.")
    public Map<String, Veiculo> comparaListaDeVeiculos(List<Veiculo> listaVeiculos) {
        return veiculoService.comparaListaDeVeiculos(listaVeiculos);
    }

    @POST
    @Path("comparacaoPorAno")
    @Operation(summary = "Compara uma lista de Veículos e retorna o mais barato e mais caro por ano", description = "Compara uma lista de Veículos e retorna o mais barato e mais caro por ano. Passar List<Veiculo> como parâmetro.")
    public Map<Integer, Map<String, Veiculo>> comparaListaDeVeiculosPorAno(List<Veiculo> listaVeiculos) {
        System.out.println("here");
        return veiculoService.comparaListaDeVeiculosPorAno(listaVeiculos);
    }

    @POST
    @Transactional
    @Path("/{codigoFipe}/{marca}/{anoModelo}/{tipo}/{valor}/{combustivel}/{mesReferencia}/{siglaCombustivel}")
    @Operation(summary = "Cria novo veículo", description = "Cria novo veículo.")
    public Response salvaNovoVeiculo(@PathParam("codigoFipe") String codigoFipe, @PathParam("marca") String marca,
            @QueryParam("modelo") String modelo, @PathParam("anoModelo") int anoModelo, @PathParam("tipo") int tipo,
            @PathParam("valor") String valor, @PathParam("combustivel") String combustivel,
            @PathParam("mesReferencia") String mesReferencia, @PathParam("siglaCombustivel") String siglaCombustivel) {
        if (Veiculo.findByCodigoFipe(codigoFipe) != null) {
            throw new WebApplicationException("Veículo com codigoFipe " + codigoFipe + " já existe.", 409);
        }
        Veiculo entity = new Veiculo(codigoFipe, marca, modelo, anoModelo, tipo, valor, combustivel, mesReferencia,
                siglaCombustivel);
        entity.persist();
        return Response.ok(entity).status(201).build();
    }

    @PUT
    @Transactional
    @Path("/favorito/favoritar/{codigoFipe}")
    @Operation(summary = "Salva veículo como favorito", description = "Salva veículo como favorito.")
    @Parameter(name = "codigoFipe", description = "primary key do Veiculo", required = true, example = "005340-6")
    public Veiculo salvarVeiculoFavorito(@PathParam("codigoFipe") String codigoFipe) {
        Veiculo entity = Veiculo.findByCodigoFipe(codigoFipe);
        if (entity.favorito) {
            throw new WebApplicationException("Veículo já favoritado.", 409);
        }
        entity.favorito = true;
        return entity;
    }

    @PUT
    @Path("/favorito/desfavoritar/{codigoFipe}")
    @Transactional
    @Operation(summary = "Remove o veículo", description = "Desfavorita o veículo.")
    @Parameter(name = "codigoFipe", description = "primary key do Veiculo", required = true, example = "005340-6")
    public Veiculo desfavoritarVeiculo(@PathParam("codigoFipe") String codigoFipe) {
        Veiculo entity = Veiculo.findByCodigoFipe(codigoFipe);
        if (entity == null) {
            throw new WebApplicationException("Veículo com codigoFipe de " + codigoFipe + " não existe.", 404);
        }
        entity.favorito = false;
        return entity;
    }

    @DELETE
    @Path("{codigoFipe}")
    @Transactional
    @Operation(summary = "Remove o veículo", description = "Remove o veículo.")
    @Parameter(name = "codigoFipe", description = "primary key do Veiculo", required = true, example = "005340-6")
    public Response deletarVeiculo(@PathParam("codigoFipe") String codigoFipe) {
        Veiculo entity = Veiculo.findByCodigoFipe(codigoFipe);
        if (entity == null) {
            throw new WebApplicationException("Veículo com codigoFipe de " + codigoFipe + " não existe.", 404);
        }
        entity.delete();
        return Response.status(204).build();
    }
}
