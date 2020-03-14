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
        listaVeiculos = listaVeiculos.stream().sorted(Comparator.comparing(x -> x.getValorDouble())).collect(Collectors.toList());
        maiorMenor.put("menorValor", listaVeiculos.get(0));
        maiorMenor.put("maiorValor", listaVeiculos.get(listaVeiculos.size() - 1));
        return maiorMenor;
    }

    public Map<Integer, Map<String, Veiculo>> comparaListaDeVeiculosPorAno(List<Veiculo> listaVeiculos) {
        Map<Integer, Map<String, Veiculo>> maiorMenorPorAno = new HashMap<>();
        Map<Integer, List<Veiculo>> mapPorAno = listaVeiculos.stream().sorted(Comparator.comparing(x -> x.getValorDouble()))
                .collect(Collectors.groupingBy(x -> x.AnoModelo, Collectors.toList()));
        for (Entry<Integer, List<Veiculo>> entry : mapPorAno.entrySet()) {
            Map<String, Veiculo> maiorMenor = new HashMap<>();
            maiorMenor.put("menorValor", entry.getValue().get(0));
            maiorMenor.put("maiorValor", entry.getValue().get(entry.getValue().size() - 1));
            maiorMenorPorAno.put(entry.getKey(), maiorMenor);
        }
        return maiorMenorPorAno;
    }

    @Transactional
    public void onStartSalvaApiDados() {
        List<Veiculo> listaParaPersistir = new ArrayList<>();
        for (int i = 1; i <= 3; i++) {
            String veiculo = "";
            if (i == 1)
                veiculo = Veiculo.CARRO;
            else if (i == 2)
                veiculo = Veiculo.MOTO;
            else if (i == 3)
                veiculo = Veiculo.CAMINHAO;
                List<Veiculo> listaMarcas = fipeService.getMarcas(veiculo);
            // for (Veiculo x : listaMarcas) {
                List<Veiculo> listaModelos = fipeService.getModelos(veiculo, listaMarcas.get(0).codigo).getModelos();
                // for (Veiculo y : listaModelos) {
                    List<Veiculo> listaAnos = fipeService.getAnos(veiculo, listaMarcas.get(0).codigo, listaModelos.get(0).codigo);
                    // for (Veiculo z : listaAnos) {
                        Veiculo entity = fipeService.getValor(veiculo, listaMarcas.get(0).codigo, listaModelos.get(0).codigo, listaAnos.get(0).codigo);
                        if (Veiculo.findByCodigoFipe(entity.CodigoFipe) == null) {
                            listaParaPersistir.add(entity);
                            System.out.println("add");
                        }
                    // }
                // }
            // }
        }
        System.out.println("here");
        for (Veiculo entity : listaParaPersistir){
            entity.persist();
        }
        LOGGER.info("Foram persistidos " + listaParaPersistir.size() + " veículos no banco de dados.");
    }
}
