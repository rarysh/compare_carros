--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- Name: veiculo; Type: TABLE; Schema: public; Owner: postgres
--

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
    ano_modelo integer,
    id bigint NOT NULL
);


ALTER TABLE public.veiculo OWNER TO postgres;

--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1.0.0	DatabaseCreate	BASELINE	DatabaseCreate	\N	null	2020-03-14 13:14:13.29765	0	t
2	2.0.0	RemoveCodigoFipeAsPK	SQL	V2.0.0__RemoveCodigoFipeAsPK.sql	2109715545	postgres	2020-03-16 18:28:42.285305	23	t
\.


--
-- Data for Name: veiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veiculo (codigo_fipe, marca, modelo, valor, combustivel, mes_referencia, sigla_combustivel, tipo, favorito, ano_modelo, id) FROM stdin;
038003-2	Acura	Integra GS 1.8	R$ 11.272,00	Gasolina	março de 2020 	G	1	f	1992	790
038003-2	Acura	Integra GS 1.8	R$ 10.260,00	Gasolina	março de 2020 	G	1	f	1991	791
038002-4	Acura	Legend 3.2/3.5	R$ 25.299,00	Gasolina	março de 2020 	G	1	f	1998	792
038002-4	Acura	Legend 3.2/3.5	R$ 22.284,00	Gasolina	março de 2020 	G	1	f	1997	793
038002-4	Acura	Legend 3.2/3.5	R$ 21.129,00	Gasolina	março de 2020 	G	1	f	1996	794
038002-4	Acura	Legend 3.2/3.5	R$ 18.959,00	Gasolina	março de 2020 	G	1	f	1995	795
038002-4	Acura	Legend 3.2/3.5	R$ 17.020,00	Gasolina	março de 2020 	G	1	f	1994	796
038002-4	Acura	Legend 3.2/3.5	R$ 14.800,00	Gasolina	março de 2020 	G	1	f	1993	797
038002-4	Acura	Legend 3.2/3.5	R$ 13.745,00	Gasolina	março de 2020 	G	1	f	1992	798
038002-4	Acura	Legend 3.2/3.5	R$ 13.329,00	Gasolina	março de 2020 	G	1	f	1991	799
038001-6	Acura	NSX 3.0	R$ 41.155,00	Gasolina	março de 2020 	G	1	f	1995	800
038001-6	Acura	NSX 3.0	R$ 39.668,00	Gasolina	março de 2020 	G	1	f	1994	801
038001-6	Acura	NSX 3.0	R$ 38.338,00	Gasolina	março de 2020 	G	1	f	1993	802
038001-6	Acura	NSX 3.0	R$ 36.587,00	Gasolina	março de 2020 	G	1	f	1992	803
038001-6	Acura	NSX 3.0	R$ 34.137,00	Gasolina	março de 2020 	G	1	f	1991	804
060001-6	Agrale	MARRUÁ 2.8 12V 132cv TDI Diesel	R$ 46.817,00	Diesel	março de 2020 	D	1	f	2007	805
060001-6	Agrale	MARRUÁ 2.8 12V 132cv TDI Diesel	R$ 43.622,00	Diesel	março de 2020 	D	1	f	2006	806
060001-6	Agrale	MARRUÁ 2.8 12V 132cv TDI Diesel	R$ 39.350,00	Diesel	março de 2020 	D	1	f	2005	807
060001-6	Agrale	MARRUÁ 2.8 12V 132cv TDI Diesel	R$ 36.217,00	Diesel	março de 2020 	D	1	f	2004	808
060003-2	Agrale	MARRUÁ AM 100 2.8  CS TDI Diesel	R$ 104.417,00	Diesel	março de 2020 	D	1	f	2015	809
060003-2	Agrale	MARRUÁ AM 100 2.8  CS TDI Diesel	R$ 100.408,00	Diesel	março de 2020 	D	1	f	2014	810
060003-2	Agrale	MARRUÁ AM 100 2.8  CS TDI Diesel	R$ 94.621,00	Diesel	março de 2020 	D	1	f	2013	811
060003-2	Agrale	MARRUÁ AM 100 2.8  CS TDI Diesel	R$ 88.676,00	Diesel	março de 2020 	D	1	f	2012	812
060003-2	Agrale	MARRUÁ AM 100 2.8  CS TDI Diesel	R$ 66.354,00	Diesel	março de 2020 	D	1	f	2011	813
060003-2	Agrale	MARRUÁ AM 100 2.8  CS TDI Diesel	R$ 51.357,00	Diesel	março de 2020 	D	1	f	2010	814
060003-2	Agrale	MARRUÁ AM 100 2.8  CS TDI Diesel	R$ 45.040,00	Diesel	março de 2020 	D	1	f	2009	815
060003-2	Agrale	MARRUÁ AM 100 2.8  CS TDI Diesel	R$ 43.218,00	Diesel	março de 2020 	D	1	f	2008	816
060004-0	Agrale	MARRUÁ AM 100 2.8 CD TDI Diesel	R$ 108.347,00	Diesel	março de 2020 	D	1	f	2015	817
060004-0	Agrale	MARRUÁ AM 100 2.8 CD TDI Diesel	R$ 103.722,00	Diesel	março de 2020 	D	1	f	2014	818
060004-0	Agrale	MARRUÁ AM 100 2.8 CD TDI Diesel	R$ 96.636,00	Diesel	março de 2020 	D	1	f	2013	819
060004-0	Agrale	MARRUÁ AM 100 2.8 CD TDI Diesel	R$ 92.076,00	Diesel	março de 2020 	D	1	f	2012	820
060004-0	Agrale	MARRUÁ AM 100 2.8 CD TDI Diesel	R$ 81.909,00	Diesel	março de 2020 	D	1	f	2011	821
060004-0	Agrale	MARRUÁ AM 100 2.8 CD TDI Diesel	R$ 55.631,00	Diesel	março de 2020 	D	1	f	2010	822
060004-0	Agrale	MARRUÁ AM 100 2.8 CD TDI Diesel	R$ 51.545,00	Diesel	março de 2020 	D	1	f	2009	823
060004-0	Agrale	MARRUÁ AM 100 2.8 CD TDI Diesel	R$ 49.700,00	Diesel	março de 2020 	D	1	f	2008	824
060004-0	Agrale	MARRUÁ AM 100 2.8 CD TDI Diesel	R$ 48.110,00	Diesel	março de 2020 	D	1	f	2007	825
060005-9	Agrale	MARRUÁ AM 150 2.8  CS TDI Diesel	R$ 107.113,00	Diesel	março de 2020 	D	1	f	2015	826
060005-9	Agrale	MARRUÁ AM 150 2.8  CS TDI Diesel	R$ 102.525,00	Diesel	março de 2020 	D	1	f	2014	827
060005-9	Agrale	MARRUÁ AM 150 2.8  CS TDI Diesel	R$ 97.287,00	Diesel	março de 2020 	D	1	f	2013	828
060005-9	Agrale	MARRUÁ AM 150 2.8  CS TDI Diesel	R$ 89.911,00	Diesel	março de 2020 	D	1	f	2012	829
060005-9	Agrale	MARRUÁ AM 150 2.8  CS TDI Diesel	R$ 74.835,00	Diesel	março de 2020 	D	1	f	2011	830
060005-9	Agrale	MARRUÁ AM 150 2.8  CS TDI Diesel	R$ 53.934,00	Diesel	março de 2020 	D	1	f	2010	831
060005-9	Agrale	MARRUÁ AM 150 2.8  CS TDI Diesel	R$ 49.865,00	Diesel	março de 2020 	D	1	f	2009	832
060005-9	Agrale	MARRUÁ AM 150 2.8  CS TDI Diesel	R$ 47.453,00	Diesel	março de 2020 	D	1	f	2008	833
060006-7	Agrale	MARRUÁ AM 150 2.8 CD TDI Diesel	R$ 125.488,00	Diesel	março de 2020 	D	1	f	2015	834
060006-7	Agrale	MARRUÁ AM 150 2.8 CD TDI Diesel	R$ 111.467,00	Diesel	março de 2020 	D	1	f	2014	835
060006-7	Agrale	MARRUÁ AM 150 2.8 CD TDI Diesel	R$ 106.414,00	Diesel	março de 2020 	D	1	f	2013	836
060006-7	Agrale	MARRUÁ AM 150 2.8 CD TDI Diesel	R$ 103.073,00	Diesel	março de 2020 	D	1	f	2012	837
060006-7	Agrale	MARRUÁ AM 150 2.8 CD TDI Diesel	R$ 81.448,00	Diesel	março de 2020 	D	1	f	2011	838
060006-7	Agrale	MARRUÁ AM 150 2.8 CD TDI Diesel	R$ 65.068,00	Diesel	março de 2020 	D	1	f	2010	839
060006-7	Agrale	MARRUÁ AM 150 2.8 CD TDI Diesel	R$ 56.876,00	Diesel	março de 2020 	D	1	f	2009	840
060006-7	Agrale	MARRUÁ AM 150 2.8 CD TDI Diesel	R$ 54.384,00	Diesel	março de 2020 	D	1	f	2008	841
006009-7	Alfa Romeo	145 Elegant 1.7/1.8 16V	R$ 12.841,00	Gasolina	março de 2020 	G	1	f	1999	842
006009-7	Alfa Romeo	145 Elegant 1.7/1.8 16V	R$ 12.415,00	Gasolina	março de 2020 	G	1	f	1998	843
006009-7	Alfa Romeo	145 Elegant 1.7/1.8 16V	R$ 9.020,00	Gasolina	março de 2020 	G	1	f	1997	844
006009-7	Alfa Romeo	145 Elegant 1.7/1.8 16V	R$ 8.164,00	Gasolina	março de 2020 	G	1	f	1996	845
006001-1	Alfa Romeo	145 Elegant 2.0 16V	R$ 12.868,00	Gasolina	março de 2020 	G	1	f	1998	846
006001-1	Alfa Romeo	145 Elegant 2.0 16V	R$ 10.874,00	Gasolina	março de 2020 	G	1	f	1997	847
006001-1	Alfa Romeo	145 Elegant 2.0 16V	R$ 9.922,00	Gasolina	março de 2020 	G	1	f	1996	848
006001-1	Alfa Romeo	145 Elegant 2.0 16V	R$ 8.165,00	Gasolina	março de 2020 	G	1	f	1995	849
006002-0	Alfa Romeo	145 Quadrifoglio 2.0	R$ 13.990,00	Gasolina	março de 2020 	G	1	f	1999	850
006002-0	Alfa Romeo	145 Quadrifoglio 2.0	R$ 13.359,00	Gasolina	março de 2020 	G	1	f	1998	851
006002-0	Alfa Romeo	145 Quadrifoglio 2.0	R$ 11.862,00	Gasolina	março de 2020 	G	1	f	1997	852
006002-0	Alfa Romeo	145 Quadrifoglio 2.0	R$ 11.091,00	Gasolina	março de 2020 	G	1	f	1996	853
006008-9	Alfa Romeo	145 QV	R$ 14.225,00	Gasolina	março de 2020 	G	1	f	1998	854
006008-9	Alfa Romeo	145 QV	R$ 11.915,00	Gasolina	março de 2020 	G	1	f	1997	855
006008-9	Alfa Romeo	145 QV	R$ 11.472,00	Gasolina	março de 2020 	G	1	f	1996	856
006017-8	Alfa Romeo	147 2.0 16V 148cv 4p Semi-Aut.	R$ 52.016,00	Gasolina	março de 2020 	G	1	f	2005	857
006017-8	Alfa Romeo	147 2.0 16V 148cv 4p Semi-Aut.	R$ 41.430,00	Gasolina	março de 2020 	G	1	f	2004	858
006017-8	Alfa Romeo	147 2.0 16V 148cv 4p Semi-Aut.	R$ 36.766,00	Gasolina	março de 2020 	G	1	f	2003	859
037001-0	AM Gen	Hummer Hard-Top 6.5 4x4 Diesel TB	R$ 216.496,00	Diesel	março de 2020 	D	1	f	2000	860
037001-0	AM Gen	Hummer Hard-Top 6.5 4x4 Diesel TB	R$ 189.732,00	Diesel	março de 2020 	D	1	f	1999	861
037001-0	AM Gen	Hummer Hard-Top 6.5 4x4 Diesel TB	R$ 177.066,00	Diesel	março de 2020 	D	1	f	1998	862
037002-9	AM Gen	Hummer Open-Top 6.5 4x4 Diesel TB	R$ 209.773,00	Diesel	março de 2020 	D	1	f	2000	863
037002-9	AM Gen	Hummer Open-Top 6.5 4x4 Diesel TB	R$ 177.288,00	Diesel	março de 2020 	D	1	f	1999	864
037002-9	AM Gen	Hummer Open-Top 6.5 4x4 Diesel TB	R$ 150.533,00	Diesel	março de 2020 	D	1	f	1998	865
037003-7	AM Gen	Hummer Wagon 6.5 4x4 Diesel TB	R$ 261.136,00	Diesel	março de 2020 	D	1	f	2000	866
037003-7	AM Gen	Hummer Wagon 6.5 4x4 Diesel TB	R$ 209.174,00	Diesel	março de 2020 	D	1	f	1999	867
037003-7	AM Gen	Hummer Wagon 6.5 4x4 Diesel TB	R$ 186.646,00	Diesel	março de 2020 	D	1	f	1998	868
007018-1	Asia Motors	AM-825 Luxo 4.0 Diesel	R$ 22.582,00	Diesel	março de 2020 	D	1	f	1998	869
007018-1	Asia Motors	AM-825 Luxo 4.0 Diesel	R$ 19.289,00	Diesel	março de 2020 	D	1	f	1997	870
007018-1	Asia Motors	AM-825 Luxo 4.0 Diesel	R$ 18.682,00	Diesel	março de 2020 	D	1	f	1996	871
007018-1	Asia Motors	AM-825 Luxo 4.0 Diesel	R$ 18.038,00	Diesel	março de 2020 	D	1	f	1995	872
007018-1	Asia Motors	AM-825 Luxo 4.0 Diesel	R$ 16.857,00	Diesel	março de 2020 	D	1	f	1994	873
007019-0	Asia Motors	AM-825 Super Luxo 4.0 Diesel	R$ 27.355,00	Diesel	março de 2020 	D	1	f	1998	874
007019-0	Asia Motors	AM-825 Super Luxo 4.0 Diesel	R$ 22.585,00	Diesel	março de 2020 	D	1	f	1997	875
007019-0	Asia Motors	AM-825 Super Luxo 4.0 Diesel	R$ 21.385,00	Diesel	março de 2020 	D	1	f	1996	876
007019-0	Asia Motors	AM-825 Super Luxo 4.0 Diesel	R$ 19.793,00	Diesel	março de 2020 	D	1	f	1995	877
007019-0	Asia Motors	AM-825 Super Luxo 4.0 Diesel	R$ 19.088,00	Diesel	março de 2020 	D	1	f	1994	878
007001-7	Asia Motors	Hi-Topic SLX/SDX/DLX Full Diesel	R$ 15.371,00	Diesel	março de 2020 	D	1	f	1998	879
007001-7	Asia Motors	Hi-Topic SLX/SDX/DLX Full Diesel	R$ 13.686,00	Diesel	março de 2020 	D	1	f	1997	880
007001-7	Asia Motors	Hi-Topic SLX/SDX/DLX Full Diesel	R$ 13.093,00	Diesel	março de 2020 	D	1	f	1996	881
007001-7	Asia Motors	Hi-Topic SLX/SDX/DLX Full Diesel	R$ 11.993,00	Diesel	março de 2020 	D	1	f	1995	882
007001-7	Asia Motors	Hi-Topic SLX/SDX/DLX Full Diesel	R$ 11.298,00	Diesel	março de 2020 	D	1	f	1994	883
007001-7	Asia Motors	Hi-Topic SLX/SDX/DLX Full Diesel	R$ 9.629,00	Diesel	março de 2020 	D	1	f	1993	884
007002-5	Asia Motors	Hi-Topic STD Diesel	R$ 13.433,00	Diesel	março de 2020 	D	1	f	1998	885
007002-5	Asia Motors	Hi-Topic STD Diesel	R$ 12.947,00	Diesel	março de 2020 	D	1	f	1997	886
007002-5	Asia Motors	Hi-Topic STD Diesel	R$ 11.999,00	Diesel	março de 2020 	D	1	f	1996	887
007002-5	Asia Motors	Hi-Topic STD Diesel	R$ 11.475,00	Diesel	março de 2020 	D	1	f	1995	888
007002-5	Asia Motors	Hi-Topic STD Diesel	R$ 10.734,00	Diesel	março de 2020 	D	1	f	1994	889
007002-5	Asia Motors	Hi-Topic STD Diesel	R$ 9.464,00	Diesel	março de 2020 	D	1	f	1993	890
007017-3	Asia Motors	Hi-Topic Van 2.7 Diesel (furgão)	R$ 12.335,00	Diesel	março de 2020 	D	1	f	1997	891
007017-3	Asia Motors	Hi-Topic Van 2.7 Diesel (furgão)	R$ 11.881,00	Diesel	março de 2020 	D	1	f	1996	892
007017-3	Asia Motors	Hi-Topic Van 2.7 Diesel (furgão)	R$ 11.085,00	Diesel	março de 2020 	D	1	f	1995	893
007017-3	Asia Motors	Hi-Topic Van 2.7 Diesel (furgão)	R$ 9.084,00	Diesel	março de 2020 	D	1	f	1994	894
840015-6	ADLY	ATV 100	R$ 3.858,00	Gasolina	março de 2020 	G	2	f	2002	895
840015-6	ADLY	ATV 100	R$ 3.673,00	Gasolina	março de 2020 	G	2	f	2001	896
840015-6	ADLY	ATV 100	R$ 3.312,00	Gasolina	março de 2020 	G	2	f	2000	897
840014-8	ADLY	ATV 50	R$ 2.711,00	Gasolina	março de 2020 	G	2	f	2001	898
840014-8	ADLY	ATV 50	R$ 2.602,00	Gasolina	março de 2020 	G	2	f	2000	899
840007-5	ADLY	JAGUAR JT 100	R$ 1.865,00	Gasolina	março de 2020 	G	2	f	1999	900
840007-5	ADLY	JAGUAR JT 100	R$ 1.762,00	Gasolina	março de 2020 	G	2	f	1998	901
840007-5	ADLY	JAGUAR JT 100	R$ 1.630,00	Gasolina	março de 2020 	G	2	f	1997	902
840007-5	ADLY	JAGUAR JT 100	R$ 1.489,00	Gasolina	março de 2020 	G	2	f	1996	903
840008-3	ADLY	JAGUAR JT 50	R$ 1.974,00	Gasolina	março de 2020 	G	2	f	2001	904
840008-3	ADLY	JAGUAR JT 50	R$ 1.658,00	Gasolina	março de 2020 	G	2	f	2000	905
840008-3	ADLY	JAGUAR JT 50	R$ 1.599,00	Gasolina	março de 2020 	G	2	f	1999	906
840008-3	ADLY	JAGUAR JT 50	R$ 1.450,00	Gasolina	março de 2020 	G	2	f	1998	907
840008-3	ADLY	JAGUAR JT 50	R$ 1.350,00	Gasolina	março de 2020 	G	2	f	1997	908
840008-3	ADLY	JAGUAR JT 50	R$ 1.190,00	Gasolina	março de 2020 	G	2	f	1996	909
840016-4	ADLY	RT 50	R$ 1.837,00	Gasolina	março de 2020 	G	2	f	2001	910
801002-1	AGRALE	CITY 50	R$ 1.707,00	Gasolina	março de 2020 	G	2	f	2001	911
801002-1	AGRALE	CITY 50	R$ 1.637,00	Gasolina	março de 2020 	G	2	f	2000	912
801002-1	AGRALE	CITY 50	R$ 1.428,00	Gasolina	março de 2020 	G	2	f	1999	913
801002-1	AGRALE	CITY 50	R$ 1.328,00	Gasolina	março de 2020 	G	2	f	1998	914
801002-1	AGRALE	CITY 50	R$ 1.269,00	Gasolina	março de 2020 	G	2	f	1997	915
801003-0	AGRALE	CITY 90	R$ 2.011,00	Gasolina	março de 2020 	G	2	f	1999	916
801003-0	AGRALE	CITY 90	R$ 1.804,00	Gasolina	março de 2020 	G	2	f	1998	917
801003-0	AGRALE	CITY 90	R$ 1.614,00	Gasolina	março de 2020 	G	2	f	1997	918
801004-8	AGRALE	DAKAR 30.0 190cc	R$ 1.896,00	Gasolina	março de 2020 	G	2	f	1994	919
801004-8	AGRALE	DAKAR 30.0 190cc	R$ 1.729,00	Gasolina	março de 2020 	G	2	f	1993	920
801004-8	AGRALE	DAKAR 30.0 190cc	R$ 1.435,00	Gasolina	março de 2020 	G	2	f	1992	921
801004-8	AGRALE	DAKAR 30.0 190cc	R$ 1.261,00	Gasolina	março de 2020 	G	2	f	1991	922
801004-8	AGRALE	DAKAR 30.0 190cc	R$ 1.219,00	Gasolina	março de 2020 	G	2	f	1990	923
801005-6	AGRALE	DAKAR 50	R$ 2.118,00	Gasolina	março de 2020 	G	2	f	2000	924
801005-6	AGRALE	DAKAR 50	R$ 1.880,00	Gasolina	março de 2020 	G	2	f	1999	925
801005-6	AGRALE	DAKAR 50	R$ 1.606,00	Gasolina	março de 2020 	G	2	f	1998	926
801005-6	AGRALE	DAKAR 50	R$ 1.528,00	Gasolina	março de 2020 	G	2	f	1997	927
801007-2	AGRALE	ELEFANT 16.5 125cc	R$ 902,00	Gasolina	março de 2020 	G	2	f	1990	928
855004-2	AMAZONAS	AME-110 MIX	R$ 2.062,00	Gasolina	março de 2020 	G	2	f	2009	929
855004-2	AMAZONAS	AME-110 MIX	R$ 1.820,00	Gasolina	março de 2020 	G	2	f	2008	930
855004-2	AMAZONAS	AME-110 MIX	R$ 1.761,00	Gasolina	março de 2020 	G	2	f	2007	931
855004-2	AMAZONAS	AME-110 MIX	R$ 1.576,00	Gasolina	março de 2020 	G	2	f	2006	932
855002-6	AMAZONAS	AME-150 TC/ SC	R$ 3.206,00	Gasolina	março de 2020 	G	2	f	2009	933
855002-6	AMAZONAS	AME-150 TC/ SC	R$ 2.749,00	Gasolina	março de 2020 	G	2	f	2008	934
855002-6	AMAZONAS	AME-150 TC/ SC	R$ 2.505,00	Gasolina	março de 2020 	G	2	f	2007	935
855002-6	AMAZONAS	AME-150 TC/ SC	R$ 2.402,00	Gasolina	março de 2020 	G	2	f	2006	936
855001-8	AMAZONAS	AME-250 C1	R$ 7.541,00	Gasolina	março de 2020 	G	2	f	2009	937
855001-8	AMAZONAS	AME-250 C1	R$ 5.973,00	Gasolina	março de 2020 	G	2	f	2008	938
855001-8	AMAZONAS	AME-250 C1	R$ 5.791,00	Gasolina	março de 2020 	G	2	f	2007	939
855001-8	AMAZONAS	AME-250 C1	R$ 5.424,00	Gasolina	março de 2020 	G	2	f	2006	940
855003-4	AMAZONAS	AME-LX 125/26	R$ 2.072,00	Gasolina	março de 2020 	G	2	f	2009	941
855003-4	AMAZONAS	AME-LX 125/26	R$ 1.849,00	Gasolina	março de 2020 	G	2	f	2008	942
855003-4	AMAZONAS	AME-LX 125/26	R$ 1.769,00	Gasolina	março de 2020 	G	2	f	2007	943
855003-4	AMAZONAS	AME-LX 125/26	R$ 1.588,00	Gasolina	março de 2020 	G	2	f	2006	944
802001-9	APRILIA	AREA-51 50cc	R$ 3.264,00	Gasolina	março de 2020 	G	2	f	2000	945
802001-9	APRILIA	AREA-51 50cc	R$ 3.052,00	Gasolina	março de 2020 	G	2	f	1999	946
802001-9	APRILIA	AREA-51 50cc	R$ 2.619,00	Gasolina	março de 2020 	G	2	f	1998	947
802002-7	APRILIA	CLASSIC 50cc	R$ 2.916,00	Gasolina	março de 2020 	G	2	f	2000	948
802002-7	APRILIA	CLASSIC 50cc	R$ 2.761,00	Gasolina	março de 2020 	G	2	f	1999	949
802002-7	APRILIA	CLASSIC 50cc	R$ 2.529,00	Gasolina	março de 2020 	G	2	f	1998	950
802003-5	APRILIA	LEONARDO 150cc	R$ 5.290,00	Gasolina	março de 2020 	G	2	f	2000	951
802003-5	APRILIA	LEONARDO 150cc	R$ 4.605,00	Gasolina	março de 2020 	G	2	f	1999	952
802003-5	APRILIA	LEONARDO 150cc	R$ 4.351,00	Gasolina	março de 2020 	G	2	f	1998	953
802004-3	APRILIA	MOTO 650cc	R$ 14.256,00	Gasolina	março de 2020 	G	2	f	2000	954
802004-3	APRILIA	MOTO 650cc	R$ 12.714,00	Gasolina	março de 2020 	G	2	f	1999	955
802004-3	APRILIA	MOTO 650cc	R$ 12.218,00	Gasolina	março de 2020 	G	2	f	1998	956
802005-1	APRILIA	PEGASO 650cc	R$ 11.021,00	Gasolina	março de 2020 	G	2	f	2002	957
802005-1	APRILIA	PEGASO 650cc	R$ 8.887,00	Gasolina	março de 2020 	G	2	f	2001	958
802005-1	APRILIA	PEGASO 650cc	R$ 8.154,00	Gasolina	março de 2020 	G	2	f	2000	959
802005-1	APRILIA	PEGASO 650cc	R$ 7.878,00	Gasolina	março de 2020 	G	2	f	1999	960
802005-1	APRILIA	PEGASO 650cc	R$ 7.600,00	Gasolina	março de 2020 	G	2	f	1998	961
829002-4	ATALA	CALIFFONE 50cc	R$ 1.443,00	Gasolina	março de 2020 	G	2	f	2003	962
829002-4	ATALA	CALIFFONE 50cc	R$ 1.220,00	Gasolina	março de 2020 	G	2	f	2002	963
829002-4	ATALA	CALIFFONE 50cc	R$ 964,00	Gasolina	março de 2020 	G	2	f	2001	964
829002-4	ATALA	CALIFFONE 50cc	R$ 886,00	Gasolina	março de 2020 	G	2	f	2000	965
829001-6	ATALA	MASTER 50cc	R$ 1.812,00	Gasolina	março de 2020 	G	2	f	2003	966
829001-6	ATALA	MASTER 50cc	R$ 1.461,00	Gasolina	março de 2020 	G	2	f	2002	967
829001-6	ATALA	MASTER 50cc	R$ 1.239,00	Gasolina	março de 2020 	G	2	f	2001	968
829001-6	ATALA	MASTER 50cc	R$ 1.201,00	Gasolina	março de 2020 	G	2	f	2000	969
829003-2	ATALA	SKEGIA 50cc	R$ 2.279,00	Gasolina	março de 2020 	G	2	f	2003	970
829003-2	ATALA	SKEGIA 50cc	R$ 1.878,00	Gasolina	março de 2020 	G	2	f	2002	971
829003-2	ATALA	SKEGIA 50cc	R$ 1.779,00	Gasolina	março de 2020 	G	2	f	2001	972
829003-2	ATALA	SKEGIA 50cc	R$ 1.724,00	Gasolina	março de 2020 	G	2	f	2000	973
501034-9	AGRALE	10000 / 10000 S  2p (diesel) (E5)	R$ 183.566,00	Diesel	março de 2020 	D	3	f	32000	974
501034-9	AGRALE	10000 / 10000 S  2p (diesel) (E5)	R$ 153.428,00	Diesel	março de 2020 	D	3	f	2020	975
501034-9	AGRALE	10000 / 10000 S  2p (diesel) (E5)	R$ 144.536,00	Diesel	março de 2020 	D	3	f	2019	976
501034-9	AGRALE	10000 / 10000 S  2p (diesel) (E5)	R$ 125.356,00	Diesel	março de 2020 	D	3	f	2018	977
501034-9	AGRALE	10000 / 10000 S  2p (diesel) (E5)	R$ 106.099,00	Diesel	março de 2020 	D	3	f	2017	978
501034-9	AGRALE	10000 / 10000 S  2p (diesel) (E5)	R$ 95.995,00	Diesel	março de 2020 	D	3	f	2016	979
501034-9	AGRALE	10000 / 10000 S  2p (diesel) (E5)	R$ 92.895,00	Diesel	março de 2020 	D	3	f	2015	980
501034-9	AGRALE	10000 / 10000 S  2p (diesel) (E5)	R$ 90.145,00	Diesel	março de 2020 	D	3	f	2014	981
501034-9	AGRALE	10000 / 10000 S  2p (diesel) (E5)	R$ 86.454,00	Diesel	março de 2020 	D	3	f	2013	982
501034-9	AGRALE	10000 / 10000 S  2p (diesel) (E5)	R$ 77.128,00	Diesel	março de 2020 	D	3	f	2012	983
501039-0	AGRALE	10000 LX 2p (diesel) (E5)	R$ 110.712,00	Diesel	março de 2020 	D	3	f	2017	984
501039-0	AGRALE	10000 LX 2p (diesel) (E5)	R$ 103.133,00	Diesel	março de 2020 	D	3	f	2016	985
501027-6	AGRALE	13000 Turbo 2p (diesel)	R$ 80.371,00	Diesel	março de 2020 	D	3	f	2012	986
501027-6	AGRALE	13000 Turbo 2p (diesel)	R$ 73.784,00	Diesel	março de 2020 	D	3	f	2011	987
501027-6	AGRALE	13000 Turbo 2p (diesel)	R$ 66.249,00	Diesel	março de 2020 	D	3	f	2010	988
501027-6	AGRALE	13000 Turbo 2p (diesel)	R$ 60.876,00	Diesel	março de 2020 	D	3	f	2009	989
501027-6	AGRALE	13000 Turbo 2p (diesel)	R$ 58.255,00	Diesel	março de 2020 	D	3	f	2008	990
501027-6	AGRALE	13000 Turbo 2p (diesel)	R$ 54.651,00	Diesel	março de 2020 	D	3	f	2007	991
501028-4	AGRALE	13000 Turbo 3-Eixos 2p (diesel)	R$ 93.336,00	Diesel	março de 2020 	D	3	f	2012	992
501028-4	AGRALE	13000 Turbo 3-Eixos 2p (diesel)	R$ 90.498,00	Diesel	março de 2020 	D	3	f	2011	993
501028-4	AGRALE	13000 Turbo 3-Eixos 2p (diesel)	R$ 87.802,00	Diesel	março de 2020 	D	3	f	2010	994
501028-4	AGRALE	13000 Turbo 3-Eixos 2p (diesel)	R$ 84.788,00	Diesel	março de 2020 	D	3	f	2009	995
501028-4	AGRALE	13000 Turbo 3-Eixos 2p (diesel)	R$ 71.563,00	Diesel	março de 2020 	D	3	f	2008	996
501030-6	AGRALE	14000 / 14000 S 2p (diesel) (E5)	R$ 235.140,00	Diesel	março de 2020 	D	3	f	32000	997
501030-6	AGRALE	14000 / 14000 S 2p (diesel) (E5)	R$ 196.147,00	Diesel	março de 2020 	D	3	f	2020	998
501030-6	AGRALE	14000 / 14000 S 2p (diesel) (E5)	R$ 185.208,00	Diesel	março de 2020 	D	3	f	2019	999
501030-6	AGRALE	14000 / 14000 S 2p (diesel) (E5)	R$ 158.377,00	Diesel	março de 2020 	D	3	f	2018	1000
501030-6	AGRALE	14000 / 14000 S 2p (diesel) (E5)	R$ 132.595,00	Diesel	março de 2020 	D	3	f	2017	1001
501030-6	AGRALE	14000 / 14000 S 2p (diesel) (E5)	R$ 116.152,00	Diesel	março de 2020 	D	3	f	2016	1002
501030-6	AGRALE	14000 / 14000 S 2p (diesel) (E5)	R$ 104.192,00	Diesel	março de 2020 	D	3	f	2015	1003
501030-6	AGRALE	14000 / 14000 S 2p (diesel) (E5)	R$ 100.973,00	Diesel	março de 2020 	D	3	f	2014	1004
501030-6	AGRALE	14000 / 14000 S 2p (diesel) (E5)	R$ 95.782,00	Diesel	março de 2020 	D	3	f	2013	1005
501030-6	AGRALE	14000 / 14000 S 2p (diesel) (E5)	R$ 92.873,00	Diesel	março de 2020 	D	3	f	2012	1006
531002-4	BEPOBUS	NÀSCERE FRETAMENTO (diesel)(E5)	R$ 355.150,00	Diesel	março de 2020 	D	3	f	32000	1007
531002-4	BEPOBUS	NÀSCERE FRETAMENTO (diesel)(E5)	R$ 265.432,00	Diesel	março de 2020 	D	3	f	2019	1008
531002-4	BEPOBUS	NÀSCERE FRETAMENTO (diesel)(E5)	R$ 234.389,00	Diesel	março de 2020 	D	3	f	2018	1009
531003-2	BEPOBUS	NÀSCERE RODOVIÁRIO (diesel)(E5)	R$ 385.150,00	Diesel	março de 2020 	D	3	f	32000	1010
531003-2	BEPOBUS	NÀSCERE RODOVIÁRIO (diesel)(E5)	R$ 294.041,00	Diesel	março de 2020 	D	3	f	2019	1011
531003-2	BEPOBUS	NÀSCERE RODOVIÁRIO (diesel)(E5)	R$ 250.622,00	Diesel	março de 2020 	D	3	f	2018	1012
531001-6	BEPOBUS	NÀSCERE URBANO (diesel)(E5)	R$ 322.560,00	Diesel	março de 2020 	D	3	f	32000	1013
531001-6	BEPOBUS	NÀSCERE URBANO (diesel)(E5)	R$ 247.190,00	Diesel	março de 2020 	D	3	f	2019	1014
531001-6	BEPOBUS	NÀSCERE URBANO (diesel)(E5)	R$ 215.140,00	Diesel	março de 2020 	D	3	f	2018	1015
502001-8	CHEVROLET	11000 2p (diesel)	R$ 20.685,00	Diesel	março de 2020 	D	3	f	1989	1016
502001-8	CHEVROLET	11000 2p (diesel)	R$ 18.667,00	Diesel	março de 2020 	D	3	f	1988	1017
502001-8	CHEVROLET	11000 2p (diesel)	R$ 16.855,00	Diesel	março de 2020 	D	3	f	1987	1018
502001-8	CHEVROLET	11000 2p (diesel)	R$ 16.221,00	Diesel	março de 2020 	D	3	f	1986	1019
502001-8	CHEVROLET	11000 2p (diesel)	R$ 14.410,00	Diesel	março de 2020 	D	3	f	1985	1020
502001-8	CHEVROLET	11000 2p (diesel)	R$ 12.402,00	Diesel	março de 2020 	D	3	f	1984	1021
502001-8	CHEVROLET	11000 2p (diesel)	R$ 11.521,00	Diesel	março de 2020 	D	3	f	1983	1022
502001-8	CHEVROLET	11000 2p (diesel)	R$ 10.494,00	Diesel	março de 2020 	D	3	f	1982	1023
502001-8	CHEVROLET	11000 2p (diesel)	R$ 9.052,00	Diesel	março de 2020 	D	3	f	1981	1024
502002-6	CHEVROLET	11000 3-Eixos 2p (diesel)	R$ 22.443,00	Diesel	março de 2020 	D	3	f	1989	1025
502002-6	CHEVROLET	11000 3-Eixos 2p (diesel)	R$ 20.153,00	Diesel	março de 2020 	D	3	f	1988	1026
502002-6	CHEVROLET	11000 3-Eixos 2p (diesel)	R$ 19.088,00	Diesel	março de 2020 	D	3	f	1987	1027
502002-6	CHEVROLET	11000 3-Eixos 2p (diesel)	R$ 17.451,00	Diesel	março de 2020 	D	3	f	1986	1028
502002-6	CHEVROLET	11000 3-Eixos 2p (diesel)	R$ 16.301,00	Diesel	março de 2020 	D	3	f	1985	1029
502002-6	CHEVROLET	11000 3-Eixos 2p (diesel)	R$ 14.731,00	Diesel	março de 2020 	D	3	f	1984	1030
502002-6	CHEVROLET	11000 3-Eixos 2p (diesel)	R$ 13.686,00	Diesel	março de 2020 	D	3	f	1983	1031
502002-6	CHEVROLET	11000 3-Eixos 2p (diesel)	R$ 13.197,00	Diesel	março de 2020 	D	3	f	1982	1032
502002-6	CHEVROLET	11000 3-Eixos 2p (diesel)	R$ 12.534,00	Diesel	março de 2020 	D	3	f	1981	1033
502003-4	CHEVROLET	12000 2p (diesel)	R$ 30.337,00	Diesel	março de 2020 	D	3	f	1996	1034
502003-4	CHEVROLET	12000 2p (diesel)	R$ 27.998,00	Diesel	março de 2020 	D	3	f	1995	1035
502003-4	CHEVROLET	12000 2p (diesel)	R$ 27.122,00	Diesel	março de 2020 	D	3	f	1994	1036
502003-4	CHEVROLET	12000 2p (diesel)	R$ 26.301,00	Diesel	março de 2020 	D	3	f	1993	1037
502003-4	CHEVROLET	12000 2p (diesel)	R$ 25.512,00	Diesel	março de 2020 	D	3	f	1992	1038
502003-4	CHEVROLET	12000 2p (diesel)	R$ 24.411,00	Diesel	março de 2020 	D	3	f	1991	1039
502003-4	CHEVROLET	12000 2p (diesel)	R$ 23.564,00	Diesel	março de 2020 	D	3	f	1990	1040
502003-4	CHEVROLET	12000 2p (diesel)	R$ 22.032,00	Diesel	março de 2020 	D	3	f	1989	1041
502003-4	CHEVROLET	12000 2p (diesel)	R$ 20.585,00	Diesel	março de 2020 	D	3	f	1988	1042
502003-4	CHEVROLET	12000 2p (diesel)	R$ 18.254,00	Diesel	março de 2020 	D	3	f	1987	1043
502003-4	CHEVROLET	12000 2p (diesel)	R$ 17.653,00	Diesel	março de 2020 	D	3	f	1986	1044
502003-4	CHEVROLET	12000 2p (diesel)	R$ 15.185,00	Diesel	março de 2020 	D	3	f	1985	1045
502003-4	CHEVROLET	12000 2p (diesel)	R$ 13.424,00	Diesel	março de 2020 	D	3	f	1984	1046
502003-4	CHEVROLET	12000 2p (diesel)	R$ 12.085,00	Diesel	março de 2020 	D	3	f	1983	1047
502003-4	CHEVROLET	12000 2p (diesel)	R$ 11.545,00	Diesel	março de 2020 	D	3	f	1982	1048
502003-4	CHEVROLET	12000 2p (diesel)	R$ 11.062,00	Diesel	março de 2020 	D	3	f	1981	1049
502004-2	CHEVROLET	12000 3-Eixos 2p (diesel)	R$ 35.111,00	Diesel	março de 2020 	D	3	f	1996	1050
502004-2	CHEVROLET	12000 3-Eixos 2p (diesel)	R$ 32.252,00	Diesel	março de 2020 	D	3	f	1995	1051
502004-2	CHEVROLET	12000 3-Eixos 2p (diesel)	R$ 30.813,00	Diesel	março de 2020 	D	3	f	1994	1052
502004-2	CHEVROLET	12000 3-Eixos 2p (diesel)	R$ 29.254,00	Diesel	março de 2020 	D	3	f	1993	1053
502004-2	CHEVROLET	12000 3-Eixos 2p (diesel)	R$ 27.529,00	Diesel	março de 2020 	D	3	f	1992	1054
502004-2	CHEVROLET	12000 3-Eixos 2p (diesel)	R$ 25.847,00	Diesel	março de 2020 	D	3	f	1991	1055
502004-2	CHEVROLET	12000 3-Eixos 2p (diesel)	R$ 25.077,00	Diesel	março de 2020 	D	3	f	1990	1056
502004-2	CHEVROLET	12000 3-Eixos 2p (diesel)	R$ 24.333,00	Diesel	março de 2020 	D	3	f	1989	1057
502004-2	CHEVROLET	12000 3-Eixos 2p (diesel)	R$ 22.399,00	Diesel	março de 2020 	D	3	f	1988	1058
502004-2	CHEVROLET	12000 3-Eixos 2p (diesel)	R$ 21.211,00	Diesel	março de 2020 	D	3	f	1987	1059
502004-2	CHEVROLET	12000 3-Eixos 2p (diesel)	R$ 18.634,00	Diesel	março de 2020 	D	3	f	1986	1060
502004-2	CHEVROLET	12000 3-Eixos 2p (diesel)	R$ 17.274,00	Diesel	março de 2020 	D	3	f	1985	1061
502004-2	CHEVROLET	12000 3-Eixos 2p (diesel)	R$ 16.536,00	Diesel	março de 2020 	D	3	f	1984	1062
502004-2	CHEVROLET	12000 3-Eixos 2p (diesel)	R$ 15.626,00	Diesel	março de 2020 	D	3	f	1983	1063
502004-2	CHEVROLET	12000 3-Eixos 2p (diesel)	R$ 14.126,00	Diesel	março de 2020 	D	3	f	1982	1064
502004-2	CHEVROLET	12000 3-Eixos 2p (diesel)	R$ 13.413,00	Diesel	março de 2020 	D	3	f	1981	1065
502005-0	CHEVROLET	13000 2p (diesel)	R$ 22.584,00	Diesel	março de 2020 	D	3	f	1989	1066
502005-0	CHEVROLET	13000 2p (diesel)	R$ 21.590,00	Diesel	março de 2020 	D	3	f	1988	1067
502005-0	CHEVROLET	13000 2p (diesel)	R$ 18.771,00	Diesel	março de 2020 	D	3	f	1987	1068
502005-0	CHEVROLET	13000 2p (diesel)	R$ 17.993,00	Diesel	março de 2020 	D	3	f	1986	1069
502005-0	CHEVROLET	13000 2p (diesel)	R$ 16.478,00	Diesel	março de 2020 	D	3	f	1985	1070
502005-0	CHEVROLET	13000 2p (diesel)	R$ 15.055,00	Diesel	março de 2020 	D	3	f	1984	1071
502005-0	CHEVROLET	13000 2p (diesel)	R$ 13.765,00	Diesel	março de 2020 	D	3	f	1983	1072
502005-0	CHEVROLET	13000 2p (diesel)	R$ 13.104,00	Diesel	março de 2020 	D	3	f	1982	1073
502005-0	CHEVROLET	13000 2p (diesel)	R$ 12.115,00	Diesel	março de 2020 	D	3	f	1981	1074
519004-5	CICCOBUS	Alleanza Gran Escolar 2p (diesel)	R$ 81.413,00	Diesel	março de 2020 	D	3	f	2008	1075
519004-5	CICCOBUS	Alleanza Gran Escolar 2p (diesel)	R$ 75.433,00	Diesel	março de 2020 	D	3	f	2007	1076
519004-5	CICCOBUS	Alleanza Gran Escolar 2p (diesel)	R$ 63.435,00	Diesel	março de 2020 	D	3	f	2006	1077
519006-1	CICCOBUS	Alleanza Gran Exe./Turismo 2p (diesel)	R$ 125.777,00	Diesel	março de 2020 	D	3	f	2008	1078
519006-1	CICCOBUS	Alleanza Gran Exe./Turismo 2p (diesel)	R$ 112.714,00	Diesel	março de 2020 	D	3	f	2007	1079
519006-1	CICCOBUS	Alleanza Gran Exe./Turismo 2p (diesel)	R$ 96.129,00	Diesel	março de 2020 	D	3	f	2006	1080
519005-3	CICCOBUS	Alleanza Gran Urbano/SPTRANS 2p (die.)	R$ 96.100,00	Diesel	março de 2020 	D	3	f	2008	1081
519005-3	CICCOBUS	Alleanza Gran Urbano/SPTRANS 2p (die.)	R$ 89.300,00	Diesel	março de 2020 	D	3	f	2007	1082
519005-3	CICCOBUS	Alleanza Gran Urbano/SPTRANS 2p (die.)	R$ 82.707,00	Diesel	março de 2020 	D	3	f	2006	1083
519001-0	CICCOBUS	Alleanza Mini Escolar 2p (diesel)	R$ 60.200,00	Diesel	março de 2020 	D	3	f	2008	1084
519001-0	CICCOBUS	Alleanza Mini Escolar 2p (diesel)	R$ 57.883,00	Diesel	março de 2020 	D	3	f	2007	1085
519001-0	CICCOBUS	Alleanza Mini Escolar 2p (diesel)	R$ 54.549,00	Diesel	março de 2020 	D	3	f	2006	1086
519003-7	CICCOBUS	Alleanza Mini Exe./Turismo 2p (diesel)	R$ 78.097,00	Diesel	março de 2020 	D	3	f	2008	1087
519003-7	CICCOBUS	Alleanza Mini Exe./Turismo 2p (diesel)	R$ 74.495,00	Diesel	março de 2020 	D	3	f	2007	1088
519003-7	CICCOBUS	Alleanza Mini Exe./Turismo 2p (diesel)	R$ 62.928,00	Diesel	março de 2020 	D	3	f	2006	1089
530008-8	DAF	CF 85 FT 360 4x2 (diesel)(E5)	R$ 381.916,00	Diesel	março de 2020 	D	3	f	32000	1090
530008-8	DAF	CF 85 FT 360 4x2 (diesel)(E5)	R$ 318.856,00	Diesel	março de 2020 	D	3	f	2020	1091
530008-8	DAF	CF 85 FT 360 4x2 (diesel)(E5)	R$ 291.422,00	Diesel	março de 2020 	D	3	f	2019	1092
530008-8	DAF	CF 85 FT 360 4x2 (diesel)(E5)	R$ 246.136,00	Diesel	março de 2020 	D	3	f	2018	1093
530008-8	DAF	CF 85 FT 360 4x2 (diesel)(E5)	R$ 208.297,00	Diesel	março de 2020 	D	3	f	2017	1094
530008-8	DAF	CF 85 FT 360 4x2 (diesel)(E5)	R$ 188.957,00	Diesel	março de 2020 	D	3	f	2016	1095
530005-3	DAF	CF 85 FT 410 4x2 (diesel)(E5)	R$ 385.509,00	Diesel	março de 2020 	D	3	f	32000	1096
530005-3	DAF	CF 85 FT 410 4x2 (diesel)(E5)	R$ 322.521,00	Diesel	março de 2020 	D	3	f	2020	1097
530005-3	DAF	CF 85 FT 410 4x2 (diesel)(E5)	R$ 291.487,00	Diesel	março de 2020 	D	3	f	2019	1098
530005-3	DAF	CF 85 FT 410 4x2 (diesel)(E5)	R$ 246.275,00	Diesel	março de 2020 	D	3	f	2018	1099
530005-3	DAF	CF 85 FT 410 4x2 (diesel)(E5)	R$ 209.223,00	Diesel	março de 2020 	D	3	f	2017	1100
530005-3	DAF	CF 85 FT 410 4x2 (diesel)(E5)	R$ 189.538,00	Diesel	março de 2020 	D	3	f	2016	1101
530007-0	DAF	CF 85 FTS 360 6x2 (diesel)(E5)	R$ 404.033,00	Diesel	março de 2020 	D	3	f	32000	1102
530007-0	DAF	CF 85 FTS 360 6x2 (diesel)(E5)	R$ 339.523,00	Diesel	março de 2020 	D	3	f	2020	1103
530007-0	DAF	CF 85 FTS 360 6x2 (diesel)(E5)	R$ 306.028,00	Diesel	março de 2020 	D	3	f	2019	1104
530007-0	DAF	CF 85 FTS 360 6x2 (diesel)(E5)	R$ 256.479,00	Diesel	março de 2020 	D	3	f	2018	1105
530007-0	DAF	CF 85 FTS 360 6x2 (diesel)(E5)	R$ 214.624,00	Diesel	março de 2020 	D	3	f	2017	1106
530007-0	DAF	CF 85 FTS 360 6x2 (diesel)(E5)	R$ 197.134,00	Diesel	março de 2020 	D	3	f	2016	1107
530006-1	DAF	CF 85 FTS 410 6x2 (diesel)(E5)	R$ 406.700,00	Diesel	março de 2020 	D	3	f	32000	1108
530006-1	DAF	CF 85 FTS 410 6x2 (diesel)(E5)	R$ 344.829,00	Diesel	março de 2020 	D	3	f	2020	1109
530006-1	DAF	CF 85 FTS 410 6x2 (diesel)(E5)	R$ 315.421,00	Diesel	março de 2020 	D	3	f	2019	1110
530006-1	DAF	CF 85 FTS 410 6x2 (diesel)(E5)	R$ 264.786,00	Diesel	março de 2020 	D	3	f	2018	1111
530006-1	DAF	CF 85 FTS 410 6x2 (diesel)(E5)	R$ 225.389,00	Diesel	março de 2020 	D	3	f	2017	1112
530006-1	DAF	CF 85 FTS 410 6x2 (diesel)(E5)	R$ 205.251,00	Diesel	março de 2020 	D	3	f	2016	1113
530010-0	DAF	CF 85 FTT 460 6x4 (diesel)(E5)	R$ 481.223,00	Diesel	março de 2020 	D	3	f	32000	1114
530010-0	DAF	CF 85 FTT 460 6x4 (diesel)(E5)	R$ 400.932,00	Diesel	março de 2020 	D	3	f	2020	1115
530010-0	DAF	CF 85 FTT 460 6x4 (diesel)(E5)	R$ 363.103,00	Diesel	março de 2020 	D	3	f	2019	1116
530010-0	DAF	CF 85 FTT 460 6x4 (diesel)(E5)	R$ 313.574,00	Diesel	março de 2020 	D	3	f	2018	1117
530010-0	DAF	CF 85 FTT 460 6x4 (diesel)(E5)	R$ 265.855,00	Diesel	março de 2020 	D	3	f	2017	1118
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1118, true);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: veiculo_ano_modelo_hidx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veiculo_ano_modelo_hidx ON public.veiculo USING btree (ano_modelo);


--
-- Name: veiculo_favorito_hidx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veiculo_favorito_hidx ON public.veiculo USING btree (favorito);


--
-- Name: veiculo_marca_hidx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veiculo_marca_hidx ON public.veiculo USING btree (marca);


--
-- Name: veiculo_modelo_hidx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veiculo_modelo_hidx ON public.veiculo USING btree (modelo);


--
-- Name: veiculo_tipo_hidx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veiculo_tipo_hidx ON public.veiculo USING btree (tipo);


--
-- PostgreSQL database dump complete
--

