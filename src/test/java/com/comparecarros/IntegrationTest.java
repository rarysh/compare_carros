
package com.comparecarros;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

import java.util.List;

import javax.inject.Inject;

import com.comparecarros.domain.Veiculo;
import com.comparecarros.service.restclient.FipeService;

import org.eclipse.microprofile.rest.client.inject.RestClient;
import org.junit.jupiter.api.Test;

import io.quarkus.test.junit.QuarkusTest;

@QuarkusTest
public class IntegrationTest {

        @Inject
        @RestClient
        FipeService fipeService;

        @Test
        public void testGetMarcas() {
                String veiculo = "carros";
                List<Veiculo> actual = fipeService.getMarcas(veiculo);
                boolean expected = false;
                assertEquals(expected, actual.isEmpty());
        }

        @Test
        public void testGetModelos() {
                String veiculo = "carros";
                String marca = "1";
                List<Veiculo> actual = fipeService.getModelos(veiculo, marca).getModelos();
                boolean expected = false;
                assertEquals(expected, actual.isEmpty());
        }

        @Test
        public void testGetAnos() {
                String veiculo = "carros";
                String marca = "1";
                String modelo = "1";
                List<Veiculo> actual = fipeService.getAnos(veiculo, marca, modelo);
                boolean expected = false;
                assertEquals(expected, actual.isEmpty());
        }

        @Test
        public void testGetValor() {
                String veiculo = "carros";
                String marca = "1";
                String modelo = "1";
                String ano = "1992-1";
                Veiculo actual = fipeService.getValor(veiculo, marca, modelo, ano);
                Veiculo expected = null;
                assertNotEquals(expected, actual);
        }

}
