package com.comparecarros.service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;

import com.comparecarros.domain.Veiculo;
import com.comparecarros.service.restclient.FipeService;

import org.eclipse.microprofile.rest.client.inject.RestClient;
import org.jboss.logging.Logger;

@ApplicationScoped
public class VeiculoService {

    @Inject
    @RestClient
    FipeService fipeService;

    private static final Logger LOGGER = Logger.getLogger("API IMPORT");

    public Map<String, Veiculo> comparaListaDeVeiculos(List<Veiculo> listaVeiculos) {
        Map<String, Veiculo> maiorMenor = new HashMap<>();
        listaVeiculos = listaVeiculos.stream().sorted(Comparator.comparing(x -> x.getValorDouble()))
                .collect(Collectors.toList());
        maiorMenor.put("menorValor", listaVeiculos.get(0));
        maiorMenor.put("maiorValor", listaVeiculos.get(listaVeiculos.size() - 1));
        return maiorMenor;
    }

    public Map<Integer, Map<String, Veiculo>> comparaListaDeVeiculosPorAno(List<Veiculo> listaVeiculos) {
        Map<Integer, Map<String, Veiculo>> maiorMenorPorAno = new HashMap<>();
        Map<Integer, List<Veiculo>> mapPorAno = listaVeiculos.stream()
                .sorted(Comparator.comparing(x -> x.getValorDouble()))
                .collect(Collectors.groupingBy(x -> x.AnoModelo, Collectors.toList()));
        for (Entry<Integer, List<Veiculo>> entry : mapPorAno.entrySet()) {
            Map<String, Veiculo> maiorMenor = new HashMap<>();
            maiorMenor.put("menorValor", entry.getValue().get(0));
            maiorMenor.put("maiorValor", entry.getValue().get(entry.getValue().size() - 1));
            maiorMenorPorAno.put(entry.getKey(), maiorMenor);
        }
        return maiorMenorPorAno;
    }

    public void atualizarDadosAPI() {
        for (int i = 1; i <= 3; i++) {
            String veiculo = "";
            if (i == 1)
                veiculo = Veiculo.CARRO;
            else if (i == 2)
                veiculo = Veiculo.MOTO;
            else if (i == 3)
                veiculo = Veiculo.CAMINHAO;
            List<Veiculo> listaMarcas = fipeService.getMarcas(veiculo);
            for (Veiculo x : listaMarcas) {
                List<Veiculo> listaModelos = fipeService.getModelos(veiculo, x.codigo).getModelos();
                for (Veiculo y : listaModelos) {
                    List<Veiculo> listaAnos = fipeService.getAnos(veiculo, x.codigo, y.codigo);
                    List<Veiculo> listaParaPersistir = new ArrayList<>();
                    for (Veiculo z : listaAnos) {
                        System.out.println("--");
                        System.out.println(x.codigo);
                        System.out.println(y.codigo);
                        System.out.println(z.codigo);
                        Veiculo entity = fipeService.getValor(veiculo, x.codigo, y.codigo, z.codigo);
                        if (Veiculo.findByTipoMarcaModeloAno(i, x.nome, y.nome,
                                Integer.parseInt(z.nome.substring(0, 4))) == null) {
                            listaParaPersistir.add(entity);
                            System.out.println(listaParaPersistir.size());
                        }
                    }
                    System.out.println(listaParaPersistir.size());
                    persiste(listaParaPersistir);
                }
            }
        }
    }

    @Transactional
    public void persiste(List<Veiculo> listaParaPersistir) {
        System.out.println(listaParaPersistir.size());
        for (Veiculo entity : listaParaPersistir) {
            System.out.println(entity.CodigoFipe);
            entity.persist();
        }
        System.out.println(listaParaPersistir.size());
        LOGGER.info("Foram persistidos " + listaParaPersistir.size() + " veículos no banco de dados.");
    }
}
