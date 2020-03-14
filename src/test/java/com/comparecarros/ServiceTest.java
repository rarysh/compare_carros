
package com.comparecarros;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import com.comparecarros.domain.Veiculo;
import com.comparecarros.service.VeiculoService;

import org.junit.jupiter.api.Test;

import io.quarkus.test.junit.QuarkusTest;

@QuarkusTest
public class ServiceTest {

        @Inject
        VeiculoService veiculoService;

        @Test
        public void testComparaListaDeVeiculos() {
                List<Veiculo> listaVeiculos = new ArrayList<>();
                listaVeiculos.add(new Veiculo("1", "1", "1", 2001, 1, "R$ 100,00", "1", "1", "1"));
                listaVeiculos.add(new Veiculo("2", "1", "1", 2001, 1, "R$ 560,00", "1", "1", "1"));
                listaVeiculos.add(new Veiculo("3", "1", "1", 2001, 1, "R$ 870,00", "1", "1", "1"));
                listaVeiculos.add(new Veiculo("4", "1", "1", 2001, 1, "R$ 98,00", "1", "1", "1"));
                Map<String, Veiculo> actual = veiculoService.comparaListaDeVeiculos(listaVeiculos);
                Map<String, Veiculo> expected = new HashMap<>();
                expected.put("menorValor", new Veiculo("4", "1", "1", 2001, 1, "R$ 98,00", "1", "1", "1"));
                expected.put("maiorValor", new Veiculo("3", "1", "1", 2001, 1, "R$ 870,00", "1", "1", "1"));

                assertEquals(expected.get("menorValor").CodigoFipe, actual.get("menorValor").CodigoFipe);
                assertEquals(expected.get("menorValor").Valor, actual.get("menorValor").Valor);
                assertEquals(expected.get("maiorValor").CodigoFipe, actual.get("maiorValor").CodigoFipe);
                assertEquals(expected.get("maiorValor").Valor, actual.get("maiorValor").Valor);
        }
        @Test
        public void testComparaListaDeVeiculosPorAno() {
                List<Veiculo> listaVeiculos = new ArrayList<>();
                listaVeiculos.add(new Veiculo("1", "1", "1", 2001, 1, "R$ 100,00", "1", "1", "1"));
                listaVeiculos.add(new Veiculo("2", "1", "1", 2002, 1, "R$ 560,00", "1", "1", "1"));
                listaVeiculos.add(new Veiculo("3", "1", "1", 2002, 1, "R$ 870,00", "1", "1", "1"));
                listaVeiculos.add(new Veiculo("4", "1", "1", 2001, 1, "R$ 98,00", "1", "1", "1"));
                Map<Integer, Map<String, Veiculo>> actual = veiculoService.comparaListaDeVeiculosPorAno(listaVeiculos);
                Map<Integer, Map<String, Veiculo>> expected = new HashMap<>();
                Map<String, Veiculo> expectedMap = new HashMap<>();
                expectedMap.put("menorValor", new Veiculo("4", "1", "1", 2001, 1, "R$ 98,00", "1", "1", "1"));
                expectedMap.put("maiorValor", new Veiculo("1", "1", "1", 2001, 1, "R$ 100,00", "1", "1", "1"));
                expected.put(2001, expectedMap);
                expectedMap = new HashMap<>();
                expectedMap.put("menorValor", new Veiculo("2", "1", "1", 2002, 1, "R$ 560,00", "1", "1", "1"));
                expectedMap.put("maiorValor", new Veiculo("3", "1", "1", 2002, 1, "R$ 870,00", "1", "1", "1"));
                expected.put(2002, expectedMap);

                assertEquals(expected.get(2001).get("menorValor").CodigoFipe, actual.get(2001).get("menorValor").CodigoFipe);
                assertEquals(expected.get(2001).get("menorValor").Valor, actual.get(2001).get("menorValor").Valor);
                assertEquals(expected.get(2001).get("maiorValor").CodigoFipe, actual.get(2001).get("maiorValor").CodigoFipe);
                assertEquals(expected.get(2001).get("maiorValor").Valor, actual.get(2001).get("maiorValor").Valor);
                assertEquals(expected.get(2002).get("menorValor").CodigoFipe, actual.get(2002).get("menorValor").CodigoFipe);
                assertEquals(expected.get(2002).get("menorValor").Valor, actual.get(2002).get("menorValor").Valor);
                assertEquals(expected.get(2002).get("maiorValor").CodigoFipe, actual.get(2002).get("maiorValor").CodigoFipe);
                assertEquals(expected.get(2002).get("maiorValor").Valor, actual.get(2002).get("maiorValor").Valor);
        }

}
