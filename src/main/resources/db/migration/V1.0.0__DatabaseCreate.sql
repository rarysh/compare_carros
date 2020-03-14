CREATE TABLE public.veiculo (
    codigo_fipe character varying(30) NOT NULL,
    marca character varying(30),
    modelo character varying(60),
    valor character varying(15),
    combustivel character varying(30),
    mes_referencia character varying(30),
    sigla_combustivel character(1),
    tipo integer NOT NULL,
    favorito boolean DEFAULT false,
    ano_modelo integer
);

ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (codigo_fipe);
    
CREATE INDEX veiculo_marca_hidx ON public.veiculo USING btree (marca);
CREATE INDEX veiculo_modelo_hidx ON public.veiculo USING btree (modelo);
CREATE INDEX veiculo_ano_modelo_hidx ON public.veiculo USING btree (ano_modelo);
CREATE INDEX veiculo_favorito_hidx ON public.veiculo USING btree (favorito);
CREATE INDEX veiculo_tipo_hidx ON public.veiculo USING btree (tipo);
