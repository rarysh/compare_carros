package com.comparecarros;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import io.quarkus.test.junit.QuarkusTest;
import io.restassured.path.json.JsonPath;

@QuarkusTest
public class ResourceTest {

        @Test
        public void testLivenessHealthCHeck() {
                given().when().get("/health/live").then().statusCode(200).body("status", is("UP"));
        }

        @Test
        public void testReadinessHealthCHeck() {
                given().when().get("/health/ready").then().statusCode(200).body("status", is("UP"));
        }

        @Test
        public void testGetMarcas() {
                int tipoVeiculo = 1;
                given().pathParams("tipoVeiculo", tipoVeiculo).when().get("/veiculo/{tipoVeiculo}").then()
                                .statusCode(200);

                given().pathParams("tipoVeiculo", 4).when().get("/veiculo/{tipoVeiculo}").then().statusCode(500);
        }

        @Test
        public void testGetModelo() {
                int tipoVeiculo = 1;
                String marca = "Acura";
                given().pathParams("tipoVeiculo", tipoVeiculo, "marca", marca).when()
                                .get("/veiculo/{tipoVeiculo}/{marca}/").then().statusCode(200);

                given().pathParams("tipoVeiculo", 4, "marca", marca).when().get("/veiculo/{tipoVeiculo}/{marca}").then()
                                .statusCode(500);
        }

        @Test
        public void testGetAno() {
                int tipoVeiculo = 1;
                String marca = "Acura";
                String modelo = "Integra GS 1.8";
                given().queryParam("modelo", modelo).pathParams("tipoVeiculo", tipoVeiculo, "marca", marca).when()
                                .get("/veiculo/{tipoVeiculo}/{marca}/modelo").then().statusCode(200);

                given().queryParam("modelo", modelo).pathParams("tipoVeiculo", 4, "marca", marca).when()
                                .get("/veiculo/{tipoVeiculo}/{marca}/modelo").then().statusCode(500);
        }

        @Test
        public void testGetValor() {
                int tipoVeiculo = 1;
                String marca = "Acura";
                String modelo = "Integra GS 1.8";
                int ano = 1992;
                given().queryParam("modelo", modelo).pathParams("tipoVeiculo", tipoVeiculo, "marca", marca, "ano", ano)
                                .when().get("/veiculo/{tipoVeiculo}/{marca}/{ano}").then().statusCode(200);

                given().queryParam("modelo", modelo).pathParams("tipoVeiculo", 0, "marca", marca, "ano", ano).when()
                                .get("/veiculo/{tipoVeiculo}/{marca}/{ano}").then().statusCode(500);
        }

        @Test
        public void testListaVeiculoFavorito() {
                given().when().get("/veiculo/favorito").then().statusCode(200);
        }

        @Test
        public void testFavoritosAndCrude() {
                String codigoFipe = "TESTE";
                String marca = "TESTGOOGLE";
                String modelo = "ACER/2";
                int anoModelo = 1500;
                int tipo = 3;
                String valor = "62";
                String combustivel = "AGUA";
                String mesReferencia = "MAIO";
                String siglaCombustivel = "H";

                JsonPath responsePost = given().queryParam("modelo", modelo)
                                .pathParams("codigoFipe", codigoFipe, "marca", marca, "anoModelo", anoModelo, "tipo",
                                                tipo, "valor", valor, "combustivel", combustivel, "mesReferencia",
                                                mesReferencia, "siglaCombustivel", siglaCombustivel)
                                .when()
                                .post("/veiculo/{codigoFipe}/{marca}/{anoModelo}/{tipo}/{valor}/{combustivel}/{mesReferencia}/{siglaCombustivel}")
                                .then().statusCode(201).extract().body().jsonPath();

                long id = responsePost.getLong("id");

                assertEquals(responsePost.getLong("id"), id);
                assertEquals(responsePost.getString("CodigoFipe"), codigoFipe);
                assertEquals(responsePost.getString("Marca"), marca);
                assertEquals(responsePost.getString("Modelo"), modelo);
                assertEquals(responsePost.getString("Combustivel"), combustivel);
                assertEquals(responsePost.getString("Valor"), valor);
                assertEquals(responsePost.getString("MesReferencia"), mesReferencia);
                assertEquals(responsePost.getString("SiglaCombustivel"), siglaCombustivel);
                assertEquals(responsePost.getInt("TipoVeiculo"), tipo);
                assertEquals(responsePost.getInt("AnoModelo"), anoModelo);
                assertEquals(responsePost.getBoolean("favorito"), false);

                JsonPath responseGet = given().pathParams("id", id).when()
                                .get("/veiculo/codigoFipe/{id}").then().statusCode(200).extract().body()
                                .jsonPath();

                assertEquals(responseGet.getLong("id"), id);
                assertEquals(responseGet.getString("CodigoFipe"), codigoFipe);
                assertEquals(responseGet.getString("Marca"), marca);
                assertEquals(responseGet.getString("Modelo"), modelo);
                assertEquals(responseGet.getString("Combustivel"), combustivel);
                assertEquals(responseGet.getString("Valor"), valor);
                assertEquals(responseGet.getString("MesReferencia"), mesReferencia);
                assertEquals(responseGet.getString("SiglaCombustivel"), siglaCombustivel);
                assertEquals(responseGet.getInt("TipoVeiculo"), tipo);
                assertEquals(responseGet.getInt("AnoModelo"), anoModelo);
                assertEquals(responseGet.getBoolean("favorito"), false);

                JsonPath responseUpdate = given().pathParams("id", id).when()
                                .put("/veiculo/favorito/favoritar/{id}").then().statusCode(200).extract().body()
                                .jsonPath();

                assertEquals(responseUpdate.getLong("id"), id);
                assertEquals(responseUpdate.getString("CodigoFipe"), codigoFipe);
                assertEquals(responseUpdate.getString("Marca"), marca);
                assertEquals(responseUpdate.getString("Modelo"), modelo);
                assertEquals(responseUpdate.getString("Combustivel"), combustivel);
                assertEquals(responseUpdate.getString("Valor"), valor);
                assertEquals(responseUpdate.getString("MesReferencia"), mesReferencia);
                assertEquals(responseUpdate.getString("SiglaCombustivel"), siglaCombustivel);
                assertEquals(responseUpdate.getInt("TipoVeiculo"), tipo);
                assertEquals(responseUpdate.getInt("AnoModelo"), anoModelo);
                assertEquals(responseUpdate.getBoolean("favorito"), true);

                JsonPath responseDelete = given().pathParams("id", id).when()
                                .put("/veiculo/favorito/desfavoritar/{id}").then().statusCode(200).extract()
                                .body().jsonPath();

                assertEquals(responseDelete.getLong("id"), id);
                assertEquals(responseDelete.getString("CodigoFipe"), codigoFipe);
                assertEquals(responseDelete.getString("Marca"), marca);
                assertEquals(responseDelete.getString("Modelo"), modelo);
                assertEquals(responseDelete.getString("Combustivel"), combustivel);
                assertEquals(responseDelete.getString("Valor"), valor);
                assertEquals(responseDelete.getString("MesReferencia"), mesReferencia);
                assertEquals(responseDelete.getString("SiglaCombustivel"), siglaCombustivel);
                assertEquals(responseDelete.getInt("TipoVeiculo"), tipo);
                assertEquals(responseDelete.getInt("AnoModelo"), anoModelo);
                assertEquals(responseDelete.getBoolean("favorito"), false);

                given().pathParams("id", id).when().delete("/veiculo/{id}").then()
                                .statusCode(204);
        }

}
