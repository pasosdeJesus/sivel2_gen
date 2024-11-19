-- Volcado de tablas basicas

-- Antes deshabilitamos integridad en unos casos
ALTER TABLE ONLY public.sivel2_gen_categoria
  DROP CONSTRAINT IF EXISTS categoria_contadaen_fkey; 
ALTER TABLE ONLY public.sivel2_gen_presponsable
  DROP CONSTRAINT IF EXISTS presponsable_papa_fkey;
ALTER TABLE ONLY public.sivel2_gen_presponsable
  DROP CONSTRAINT IF EXISTS presponsable_papa_id_fkey;
ALTER TABLE ONLY public.sivel2_gen_presponsable
  DROP CONSTRAINT IF EXISTS presuntos_responsables_id_papa_fkey;

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_pconsolidado; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (1, 'MUERTOS', 'DH', 'VIDA', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (10, 'HERIDOS', 'DIH', 'INTEGRIDAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (11, 'AMENAZAS', 'DIH', 'INTEGRIDAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (12, 'VIOLENCIA SEXUAL', 'DIH', 'INTEGRIDAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (13, 'TORTURA', 'VP', 'INTEGRIDAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (14, 'HERIDOS', 'VP', 'INTEGRIDAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (15, 'ATENTADOS', 'VP', 'INTEGRIDAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (16, 'AMENAZAS', 'VP', 'INTEGRIDAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (17, 'DESAPARICIÓN', 'DH', 'LIBERTAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (18, 'DETENCION ARBITRARIA', 'DH', 'LIBERTAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (19, 'DEPORTACIÓN', 'DH', 'LIBERTAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (2, 'MUERTOS', 'DIH', 'VIDA', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (20, 'RECLUTAMIENTO DE MENORES', 'DIH', 'LIBERTAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (21, 'TOMA DE REHENES', 'DIH', 'LIBERTAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (22, 'ESCUDO', 'DIH', 'LIBERTAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (23, 'RAPTO', 'VP', 'LIBERTAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (24, 'SECUESTRO', 'VP', 'LIBERTAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (25, 'COLECTIVO CONFINADO', 'DIH', 'INTEGRIDAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (3, 'MUERTOS', 'VP', 'VIDA', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (4, 'TORTURA', 'DH', 'INTEGRIDAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (5, 'HERIDOS', 'DH', 'INTEGRIDAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (6, 'ATENTADOS', 'DH', 'INTEGRIDAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (7, 'AMENAZAS', 'DH', 'INTEGRIDAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (8, 'VIOLENCIA SEXUAL', 'DH', 'INTEGRIDAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (9, 'TORTURA', 'DIH', 'INTEGRIDAD', 0, '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);


--
-- PostgreSQL database dump complete
--

SELECT pg_catalog.setval('public.sivel2_gen_pconsolidado_id_seq', 100, true);
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_tviolencia; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_tviolencia (id, nombre, nomcorto, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES ('A', 'VIOLACIONES A LOS DERECHOS HUMANOS', 'DH', '2000-07-24', NULL, '2000-07-24 00:00:00', '2000-07-24 00:00:00', NULL);
INSERT INTO public.sivel2_gen_tviolencia (id, nombre, nomcorto, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES ('B', 'VIOLENCIA POLÍTICO SOCIAL', 'VPS', '2000-07-24', NULL, '2000-07-24 00:00:00', '2000-07-24 00:00:00', NULL);
INSERT INTO public.sivel2_gen_tviolencia (id, nombre, nomcorto, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES ('C', 'ACCIONES BÉLICAS', 'BELICAS', '2000-07-24', NULL, '2000-07-24 00:00:00', '2000-07-24 00:00:00', NULL);
INSERT INTO public.sivel2_gen_tviolencia (id, nombre, nomcorto, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES ('D', 'INFRACCIONES AL DIH', 'DIH', '2000-07-24', NULL, '2000-07-24 00:00:00', '2000-07-24 00:00:00', NULL);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_supracategoria; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_supracategoria (codigo, nombre, fechacreacion, fechadeshabilitacion, tviolencia_id, created_at, updated_at, observaciones, id) VALUES (1, 'BÉLICAS', '2000-07-26', NULL, 'C', NULL, NULL, NULL, 3);
INSERT INTO public.sivel2_gen_supracategoria (codigo, nombre, fechacreacion, fechadeshabilitacion, tviolencia_id, created_at, updated_at, observaciones, id) VALUES (1, 'PERSECUCIÓN POLÍTICA', '2000-07-26', NULL, 'A', NULL, NULL, NULL, 1);
INSERT INTO public.sivel2_gen_supracategoria (codigo, nombre, fechacreacion, fechadeshabilitacion, tviolencia_id, created_at, updated_at, observaciones, id) VALUES (1, 'PERSECUCIÓN POLÍTICA', '2000-07-26', NULL, 'B', NULL, NULL, NULL, 2);
INSERT INTO public.sivel2_gen_supracategoria (codigo, nombre, fechacreacion, fechadeshabilitacion, tviolencia_id, created_at, updated_at, observaciones, id) VALUES (1, 'PERSONAS', '2000-07-26', NULL, 'D', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_supracategoria (codigo, nombre, fechacreacion, fechadeshabilitacion, tviolencia_id, created_at, updated_at, observaciones, id) VALUES (2, 'ABUSO DE AUTORIDAD', '2000-07-26', NULL, 'A', NULL, NULL, NULL, 5);
INSERT INTO public.sivel2_gen_supracategoria (codigo, nombre, fechacreacion, fechadeshabilitacion, tviolencia_id, created_at, updated_at, observaciones, id) VALUES (2, 'INTOLERANCIA SOCIAL', '2000-07-26', NULL, 'B', NULL, NULL, NULL, 6);
INSERT INTO public.sivel2_gen_supracategoria (codigo, nombre, fechacreacion, fechadeshabilitacion, tviolencia_id, created_at, updated_at, observaciones, id) VALUES (2, 'OBJETIVOS, MÉTODOS Y MÉDIOS ILÍCITOS', '2000-07-26', NULL, 'D', NULL, NULL, NULL, 7);
INSERT INTO public.sivel2_gen_supracategoria (codigo, nombre, fechacreacion, fechadeshabilitacion, tviolencia_id, created_at, updated_at, observaciones, id) VALUES (3, 'INTOLERANCIA SOCIAL', '2000-07-26', NULL, 'A', NULL, NULL, NULL, 8);
INSERT INTO public.sivel2_gen_supracategoria (codigo, nombre, fechacreacion, fechadeshabilitacion, tviolencia_id, created_at, updated_at, observaciones, id) VALUES (3, 'MÉTODOS', '2000-07-26', '2017-05-03', 'D', NULL, NULL, NULL, 9);


--
-- PostgreSQL database dump complete
--

SELECT pg_catalog.setval('public.sivel2_gen_supracategoria_id_seq', 100, true);
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_intervalo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_intervalo (id, nombre, rango, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (1, 'MADRUGADA', '00:00 A 05:59', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_intervalo (id, nombre, rango, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (2, 'MAÑANA', '06:00 A 12:59', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_intervalo (id, nombre, rango, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (3, 'TARDE', '13:00 A 18:59', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_intervalo (id, nombre, rango, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (4, 'NOCHE', '19:00 A 24:59', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_intervalo (id, nombre, rango, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (5, 'SIN INFORMACIÓN', 'SIN INFORMACIÓN', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);


--
-- PostgreSQL database dump complete
--

SELECT pg_catalog.setval('public.sivel2_gen_intervalo_id_seq', 100, true);
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_filiacion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (1, 'LIBERAL', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (10, 'SIN INFORMACIÓN', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (11, 'UNIÓN PATRÍOTICA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (12, 'COMUNISTA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (13, 'POLO DEMOCRÁTICO', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (14, 'FRENTE SOCIAL Y POLÍTICO', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (15, 'MOVIMIENTO POLÍTICO Y SOCIAL MARCHA PATRIÓTICA', '2014-02-14', NULL, '2014-02-14 00:00:00', '2014-02-14 00:00:00', NULL);
INSERT INTO public.sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (2, 'CONSERVADOR', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (3, 'ALIANZAS TRADICIONALES', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (4, 'IZQUIERDA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (5, 'ALIANZAS IZQUIERDA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (6, 'DERECHA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (7, 'DESMOVILIZADOS', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (8, 'CIVICO POLITICO ELECTORAL', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (9, 'OTRO', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);


--
-- PostgreSQL database dump complete
--

SELECT pg_catalog.setval('public.sivel2_gen_filiacion_id_seq', 100, true);
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_organizacion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (1, 'CAMPESINA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (10, 'HUMANITARIA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (11, 'DERECHOS HUMANOS', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (12, 'GREMIAL', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (13, 'JUVENIL', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (14, 'AMBIENTALISTA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (15, 'OTRA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (16, 'SIN INFORMACIÓN', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (17, 'VÍCTIMAS', '2013-07-05', NULL, '2013-07-05 00:00:00', '2013-07-05 00:00:00', NULL);
INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (18, 'LGTB', '2020-07-05', NULL, '2020-07-05 00:00:00', '2020-07-05 00:00:00', NULL);
INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (19, 'DESPLAZADOS', '2020-10-04', NULL, '2020-10-04 00:00:00', '2020-10-04 00:00:00', '');
INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (2, 'INDIGENA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (20, 'PAZ', '2020-10-04', NULL, '2020-10-04 00:00:00', '2020-10-04 00:00:00', '');
INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (21, 'COMUNAL', '2020-10-04', NULL, '2020-10-04 00:00:00', '2020-10-04 00:00:00', '');
INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (3, 'SINDICAL', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (4, 'CIVICA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (5, 'ESTUDIANTIL', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (6, 'PROFESIONAL', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (7, 'NEGRITUDES', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (8, 'FEMENINA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (9, 'RELIGIOSA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);


--
-- PostgreSQL database dump complete
--

SELECT pg_catalog.setval('public.sivel2_gen_organizacion_id_seq', 100, true);
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_sectorsocial; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (1, 'CAMPESINO', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (10, 'HACENDADO', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (11, 'MARGINADO', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (12, 'TRABAJADOR (A) SEXUAL', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (13, 'DESEMPLEADO (A)', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (14, 'OTRO', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (15, 'SIN INFORMACIÓN', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (16, 'TRANSPORTADOR', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (2, 'INDIGENA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (3, 'OBRERO', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (4, 'COMERCIANTE', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (5, 'EMPLEADO', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (6, 'TRABAJADOR INDEPENDIENTE', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (7, 'PROFESIONAL', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (8, 'EMPRESARIO', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (9, 'INDUSTRIAL', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);


--
-- PostgreSQL database dump complete
--

SELECT pg_catalog.setval('public.sivel2_gen_sectorsocial_id_seq', 100, true);
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_vinculoestado; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (1, 'CONGRESO', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (10, 'FISCALIA GRAL DE LA NAC.', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (11, 'CONSEJO NACIONAL ELECTOR.', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (12, 'REGIS. NAL DEL EST. CIVIL', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (13, 'PROCURADURIA GENERAL', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (14, 'CONTRALORIA GENERAL DE R.', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (15, 'DEFENSORIA DEL PUEBLO', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (16, 'ASAMBLEA DEPARTAMENTAL', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (17, 'GOBERNACION', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (18, 'SECRETARIAS (DTO.)', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (19, 'EMPRESAS PUBLICAS DTALES.', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (2, 'PRESIDENCIA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (20, 'TRIBUNALES DTALES.', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (21, 'REGISTRADURIA DTAL.', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (22, 'CONTRALORIA DTAL.', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (23, 'PROCURADURIA DTAL.', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (24, 'DEFENSORIA DTAL.', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (25, 'CONCEJO MUNICIPAL', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (26, 'ALCALDIA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (27, 'SECRETARIAS MPALES.', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (28, 'EMPRESAS PUBLICAS MPALES.', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (29, 'JUZGADOS (MPALES.)', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (3, 'MINISTERIOS', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (30, 'PROCURADURIA DELEGADA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (31, 'DEFENSORIA (MPAL.)', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (32, 'PERSONERIA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (33, 'CONTRALORIA (MPAL.)', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (34, 'JUNTAS ADMINIST. LOCALES', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (35, 'ALCALDIA MENOR', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (36, 'SECRETARIAS LOCALES', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (37, 'CASAS DE JUSTICIA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (38, 'SIN INFORMACIÓN', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (39, 'TRIBUNALES', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (4, 'DEPTOS. ADMINISTRATIVOS', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (40, 'VICEPRESIDENCIA', '2013-07-05', NULL, '2013-07-05 00:00:00', '2013-07-05 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (42, 'FUERZAS MILITARES', '2015-03-17', NULL, '2015-03-17 00:00:00', NULL, NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (43, 'POLICIA', '2015-03-17', NULL, '2015-03-17 00:00:00', NULL, NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (44, 'EDIL', '2017-01-01', NULL, '2017-01-01 00:00:00', '2017-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (45, 'JUSTICIA ESPECIAL PARA LA PAZ (JEP)', '2023-01-01', NULL, '2023-01-01 00:00:00', '2023-01-01 00:00:00', 'Víctima trabajaba en la JEP');
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (5, 'EMP. IND. Y COM. DEL EST.', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (6, 'SUPERINTENDENCIAS', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (7, 'CONS. SUP. DE LA JUDICAT.', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (8, 'CORT. SUPREMA DE JUSTICIA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (9, 'CORTE CONSTITUCIONAL', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);


--
-- PostgreSQL database dump complete
--

SELECT pg_catalog.setval('public.sivel2_gen_vinculoestado_id_seq', 100, true);
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_contextovictima; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_contextovictima (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'FALSO POSITIVO', NULL, '2020-03-26', NULL, '2020-03-26 00:00:00', '2020-03-26 00:00:00');


--
-- Name: sivel2_gen_contextovictima_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sivel2_gen_contextovictima_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

SELECT pg_catalog.setval('public.sivel2_gen_contextovictima_id_seq', 100, true);
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_actividadoficio; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (0, 'SIN INFORMACIÓN', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'AGRICULTOR/A', '', '2013-05-16', NULL, '2013-05-16 00:00:00', '2017-05-29 16:47:34.922925');
INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'MINERO', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'COCINERO/A', NULL, '2014-07-28', NULL, '2014-07-28 15:17:02.95474', '2014-07-28 15:17:39.312986');
INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'LIDER COMUNITARIO', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'PANADERO/A', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'TRABAJADOR INFORMAL', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'TRABAJADOR/GESTOR COMUNITARIO', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'PESCADOR', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'TRABAJADOR DOMÉSTICO', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'PIANGÜERO', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (18, 'OTRO', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (19, 'CORTE Y COSTURA', NULL, '2014-03-10', NULL, '2014-03-10 00:00:00', '2014-03-10 00:00:00');
INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'ALBAÑIL', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'PELUQUERÍA Y MANICURISTA', NULL, '2014-03-10', NULL, '2014-03-10 00:00:00', '2014-03-10 00:00:00');
INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'AMA DE CASA', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'CAMPESINO/A', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'COMERCIANTE', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'DESEMPLEADO/A', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'ELECTRICISTA', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'INDEPENDIENTE', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_actividadoficio (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'OFICIOS VARIOS', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');


--
-- Name: sivel2_gen_actividadoficio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sivel2_gen_actividadoficio_id_seq', 102, true);


--
-- PostgreSQL database dump complete
--

SELECT pg_catalog.setval('public.sivel2_gen_actividadoficio_id_seq', 100, true);
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_antecedente; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_antecedente (id, fechacreacion, fechadeshabilitacion, nombre, created_at, updated_at, observaciones) VALUES (1, '2001-01-29', NULL, 'AMENAZA', '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_antecedente (id, fechacreacion, fechadeshabilitacion, nombre, created_at, updated_at, observaciones) VALUES (10, '2001-01-29', NULL, 'SEGUIMIENTO', '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_antecedente (id, fechacreacion, fechadeshabilitacion, nombre, created_at, updated_at, observaciones) VALUES (11, '2001-01-29', NULL, 'SEÑALAMIENTO', '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_antecedente (id, fechacreacion, fechadeshabilitacion, nombre, created_at, updated_at, observaciones) VALUES (12, '2001-01-29', NULL, 'TORTURA', '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_antecedente (id, fechacreacion, fechadeshabilitacion, nombre, created_at, updated_at, observaciones) VALUES (13, '2001-01-29', NULL, 'OTRO', '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_antecedente (id, fechacreacion, fechadeshabilitacion, nombre, created_at, updated_at, observaciones) VALUES (14, '2001-01-29', NULL, 'SIN INFORMACIÓN', '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_antecedente (id, fechacreacion, fechadeshabilitacion, nombre, created_at, updated_at, observaciones) VALUES (15, '2006-08-18', NULL, 'PILLAJE', '2006-08-18 00:00:00', '2006-08-18 00:00:00', NULL);
INSERT INTO public.sivel2_gen_antecedente (id, fechacreacion, fechadeshabilitacion, nombre, created_at, updated_at, observaciones) VALUES (16, '2006-08-18', NULL, 'MASACRE', '2006-08-18 00:00:00', '2006-08-18 00:00:00', NULL);
INSERT INTO public.sivel2_gen_antecedente (id, fechacreacion, fechadeshabilitacion, nombre, created_at, updated_at, observaciones) VALUES (2, '2001-01-29', NULL, 'ATENTADO', '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_antecedente (id, fechacreacion, fechadeshabilitacion, nombre, created_at, updated_at, observaciones) VALUES (3, '2001-01-29', NULL, 'DETENCION', '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_antecedente (id, fechacreacion, fechadeshabilitacion, nombre, created_at, updated_at, observaciones) VALUES (4, '2001-01-29', NULL, 'AMNISTIA - INDULTO', '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_antecedente (id, fechacreacion, fechadeshabilitacion, nombre, created_at, updated_at, observaciones) VALUES (5, '2001-01-29', NULL, 'EXILIO', '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_antecedente (id, fechacreacion, fechadeshabilitacion, nombre, created_at, updated_at, observaciones) VALUES (6, '2001-01-29', NULL, 'ALLANAMIENTO', '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_antecedente (id, fechacreacion, fechadeshabilitacion, nombre, created_at, updated_at, observaciones) VALUES (7, '2001-01-29', NULL, 'DESAPARICION', '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_antecedente (id, fechacreacion, fechadeshabilitacion, nombre, created_at, updated_at, observaciones) VALUES (8, '2001-01-29', NULL, 'SECUESTRO', '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_antecedente (id, fechacreacion, fechadeshabilitacion, nombre, created_at, updated_at, observaciones) VALUES (9, '2001-01-29', NULL, 'DESPLAZAMIENTO', '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);


--
-- PostgreSQL database dump complete
--

SELECT pg_catalog.setval('public.sivel2_gen_antecedente_id_seq', 100, true);
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_categoria; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (10, '2001-07-26', NULL, 1, NULL, 'I', 'EJECUCIÓN EXTRAJUDICIAL', NULL, NULL, NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (101, '2001-05-23', NULL, NULL, NULL, 'I', 'DEPORTACIÓN', '2001-05-23 00:00:00', '2001-05-23 00:00:00', NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (102, '2001-07-11', NULL, NULL, NULL, 'C', 'DESPLAZAMIENTO FORZADO', '2001-07-11 00:00:00', '2001-07-11 00:00:00', NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (104, '2008-10-17', NULL, 25, NULL, 'C', 'CONFINAMIENTO COLECTIVO', NULL, NULL, NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (11, '2001-07-26', NULL, 17, NULL, 'I', 'DESAPARICIÓN FORZADA', NULL, NULL, NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (115, '2024-03-05', NULL, NULL, NULL, 'C', 'COLECTIVO DETENIDO', '2024-03-05 00:00:00', '2024-02-05 00:00:00', NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (12, '2001-07-26', NULL, 4, NULL, 'I', 'TORTURA', NULL, NULL, NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (125, '2024-03-05', NULL, NULL, NULL, 'C', 'COLECTIVO DETENIDO', '2024-03-05 00:00:00', '2024-02-05 00:00:00', NULL, 5);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (13, '2000-08-09', NULL, 5, NULL, 'I', 'LESIÓN FÍSICA', NULL, NULL, NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (135, '2024-03-05', NULL, NULL, NULL, 'C', 'COLECTIVO DETENIDO', '2024-03-05 00:00:00', '2024-02-05 00:00:00', NULL, 8);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (14, '2001-08-09', NULL, 18, NULL, 'I', 'DETENCIÓN ARBITRARIA', NULL, NULL, NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (141, '2017-05-04', NULL, NULL, NULL, 'I', 'JUDICIALIZACIÓN ARBITRARIA', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (15, '2000-08-09', NULL, 7, NULL, 'I', 'AMENAZA', NULL, NULL, NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (16, '2000-08-09', NULL, 6, NULL, 'I', 'ATENTADO', NULL, NULL, NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (17, '2017-05-04', NULL, NULL, NULL, 'C', 'COLECTIVO LESIONADO', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (18, '2000-08-09', NULL, NULL, NULL, 'C', 'COLECTIVO AMENAZADO', '2000-08-09 00:00:00', '2000-08-09 00:00:00', NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (19, '2000-08-09', NULL, 8, NULL, 'I', 'VIOLENCIA SEXUAL', NULL, NULL, NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (191, '2008-10-20', NULL, 8, 19, 'I', 'VIOLACIÓN', NULL, NULL, NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (192, '2008-10-20', NULL, 8, 19, 'I', 'EMBARAZO FORZADO', NULL, NULL, NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (193, '2008-10-20', NULL, 8, 19, 'I', 'PROSTITUCIÓN FORZADA', NULL, NULL, NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (194, '2008-10-20', NULL, 8, 19, 'I', 'ESTERILIZACIÓN FORZADA', NULL, NULL, NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (195, '2008-10-20', NULL, 8, 19, 'I', 'ESCLAVITUD SEXUAL', NULL, NULL, NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (196, '2008-10-20', NULL, NULL, 19, 'I', 'ABUSO SEXUAL', '2008-10-20 00:00:00', '2008-10-20 00:00:00', NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (197, '2010-04-17', NULL, 12, 19, 'I', 'ABORTO FORZADO', NULL, NULL, NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (20, '2001-07-26', NULL, 1, NULL, 'I', 'EJECUCIÓN EXTRAJUDICIAL', NULL, NULL, NULL, 5);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (21, '2001-08-09', NULL, 17, NULL, 'I', 'DESAPARICIÓN FORZADA', NULL, NULL, NULL, 5);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (22, '2000-08-09', NULL, 4, NULL, 'I', 'TORTURA', NULL, NULL, NULL, 5);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (23, '2000-08-09', NULL, 5, NULL, 'I', 'LESIÓN FÍSICA', NULL, NULL, NULL, 5);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (231, '2017-05-04', NULL, NULL, NULL, 'C', 'COLECTIVO LESIONADO', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 5);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (24, '2001-08-09', NULL, 18, NULL, 'I', 'DETENCIÓN ARBITRARIA', NULL, NULL, NULL, 5);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (241, '2017-05-04', NULL, NULL, NULL, 'I', 'JUDICIALIZACIÓN ARBITRARIA', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 5);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (25, '2000-08-09', NULL, 7, NULL, 'I', 'AMENAZA', NULL, NULL, NULL, 5);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (26, '2000-08-09', NULL, 6, NULL, 'I', 'ATENTADO', NULL, NULL, NULL, 5);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (27, '2017-05-04', NULL, NULL, NULL, 'C', 'DESPLAZAMIENTO FORZADO', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 5);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (28, '2000-08-09', NULL, NULL, NULL, 'C', 'COLECTIVO AMENAZADO', '2000-08-09 00:00:00', '2000-08-09 00:00:00', NULL, 5);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (29, '2000-08-09', NULL, 8, NULL, 'I', 'VIOLENCIA SEXUAL', NULL, NULL, NULL, 5);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (291, '2008-10-20', NULL, 8, 29, 'I', 'VIOLACIÓN', NULL, NULL, NULL, 5);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (292, '2008-10-20', NULL, 8, 29, 'I', 'EMBARAZO FORZADO', NULL, NULL, NULL, 5);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (293, '2008-10-20', NULL, 8, 29, 'I', 'PROSTITUCIÓN FORZADA', NULL, NULL, NULL, 5);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (294, '2008-10-20', NULL, 8, 29, 'I', 'ESTERILIZACIÓN FORZADA', NULL, NULL, NULL, 5);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (295, '2008-10-20', NULL, 8, 29, 'I', 'ESCLAVITUD SEXUAL', NULL, NULL, NULL, 5);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (296, '2008-10-20', NULL, NULL, 29, 'I', 'ABUSO SEXUAL', '2008-10-20 00:00:00', '2008-10-20 00:00:00', NULL, 5);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (297, '2010-04-17', NULL, NULL, 29, 'I', 'ABORTO FORZADO', '2010-04-17 00:00:00', '2010-04-17 00:00:00', NULL, 5);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (30, '2001-08-09', NULL, 1, NULL, 'I', 'EJECUCIÓN EXTRAJUDICIAL', NULL, NULL, NULL, 8);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (301, '2001-05-23', NULL, 18, NULL, 'I', 'DETENCIÓN ARBITRARIA', NULL, NULL, NULL, 8);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (302, '2001-05-23', NULL, 17, NULL, 'I', 'DESAPARICIÓN FORZADA', NULL, NULL, NULL, 8);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (33, '2000-08-09', NULL, 5, NULL, 'I', 'LESIÓN FÍSICA', NULL, NULL, NULL, 8);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (331, '2017-05-04', NULL, NULL, NULL, 'C', 'COLECTIVO LESIONADO', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 8);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (34, '2017-05-04', NULL, NULL, NULL, 'C', 'DESPLAZAMIENTO FORZADO', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 8);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (341, '2017-05-04', NULL, NULL, NULL, 'I', 'JUDICIALIZACIÓN ARBITRARIA', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 8);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (35, '2000-08-09', NULL, 7, NULL, 'I', 'AMENAZA', NULL, NULL, NULL, 8);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (36, '2000-08-09', NULL, 4, NULL, 'I', 'TORTURA', NULL, NULL, NULL, 8);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (37, '2000-08-09', NULL, 6, NULL, 'I', 'ATENTADO', NULL, NULL, NULL, 8);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (38, '2000-08-09', NULL, NULL, NULL, 'C', 'COLECTIVO AMENAZADO', '2000-08-09 00:00:00', '2000-08-09 00:00:00', NULL, 8);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (39, '2000-08-09', NULL, 8, NULL, 'I', 'VIOLENCIA SEXUAL', NULL, NULL, NULL, 8);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (391, '2008-10-20', NULL, 8, 39, 'I', 'VIOLACIÓN', NULL, NULL, NULL, 8);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (392, '2008-10-20', NULL, 8, 39, 'I', 'EMBARAZO FORZADO', NULL, NULL, NULL, 8);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (393, '2008-10-20', NULL, 8, 39, 'I', 'PROSTITUCIÓN FORZADA', NULL, NULL, NULL, 8);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (394, '2008-10-20', NULL, 8, 39, 'I', 'ESTERILIZACIÓN FORZADA', NULL, NULL, NULL, 8);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (395, '2008-10-20', NULL, 8, 39, 'I', 'ESCLAVITUD SEXUAL', NULL, NULL, NULL, 8);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (396, '2008-10-20', NULL, 8, 39, 'I', 'ABUSO SEXUAL', NULL, NULL, NULL, 8);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (397, '2010-04-17', NULL, 8, 39, 'I', 'ABORTO FORZADO', NULL, NULL, NULL, 8);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (40, '2000-08-09', NULL, 3, NULL, 'I', 'ASESINATO', NULL, NULL, NULL, 2);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (401, '2001-05-23', NULL, NULL, NULL, 'C', 'COLECTIVO DESPLAZADO', '2001-05-23 00:00:00', '2001-05-23 00:00:00', NULL, 2);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (402, '2017-05-04', NULL, NULL, NULL, 'C', 'COLECTIVO LESIONADO', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 2);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (403, '2024-03-05', NULL, NULL, NULL, 'C', 'CONFINAMIENTO COMO REPRESALIA O CASTIGO COLECTIVO', '2024-03-05 00:00:00', '2024-02-05 00:00:00', NULL, 2);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (41, '2000-08-09', NULL, 23, NULL, 'I', 'SECUESTRO', NULL, NULL, NULL, 2);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (420, '2010-04-17', NULL, NULL, NULL, 'I', 'VIOLENCIA SEXUAL', '2010-04-17 00:00:00', '2010-04-17 00:00:00', NULL, 2);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (421, '2010-04-17', NULL, NULL, 420, 'I', 'VIOLACIÓN', '2010-04-17 00:00:00', '2010-04-17 00:00:00', NULL, 2);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (422, '2010-04-17', NULL, NULL, 420, 'I', 'EMBARAZO FORZADO', '2010-04-17 00:00:00', '2010-04-17 00:00:00', NULL, 2);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (423, '2010-04-17', NULL, NULL, 420, 'I', 'PROSTITUCIÓN FORZADA', '2010-04-17 00:00:00', '2010-04-17 00:00:00', NULL, 2);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (424, '2010-04-17', NULL, NULL, 420, 'I', 'ESTERILIZACIÓN FORZADA', '2010-04-17 00:00:00', '2010-04-17 00:00:00', NULL, 2);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (425, '2010-04-17', NULL, NULL, 420, 'I', 'ESCLAVITUD SEXUAL', '2010-04-17 00:00:00', '2010-04-17 00:00:00', NULL, 2);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (426, '2010-04-17', NULL, NULL, 420, 'I', 'ABUSO SEXUAL', '2010-04-17 00:00:00', '2010-04-17 00:00:00', NULL, 2);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (427, '2010-04-17', NULL, NULL, 420, 'I', 'ABORTO FORZADO', '2010-04-17 00:00:00', '2010-04-17 00:00:00', NULL, 2);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (43, '2000-07-26', NULL, 14, NULL, 'I', 'LESIÓN FÍSICA', NULL, NULL, NULL, 2);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (45, '2000-08-09', NULL, 16, NULL, 'I', 'AMENAZA', NULL, NULL, NULL, 2);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (46, '2000-08-09', NULL, 15, NULL, 'I', 'ATENTADO', NULL, NULL, NULL, 2);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (47, '2000-08-09', NULL, 13, NULL, 'I', 'TORTURA', NULL, NULL, NULL, 2);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (48, '2001-08-09', NULL, 22, NULL, 'I', 'RAPTO', NULL, NULL, NULL, 2);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (49, '2000-08-09', NULL, NULL, NULL, 'C', 'COLECTIVO AMENAZADO', '2000-08-09 00:00:00', '2000-08-09 00:00:00', NULL, 2);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (50, '2000-08-09', NULL, 3, NULL, 'I', 'ASESINATO', NULL, NULL, NULL, 6);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (501, '2001-05-23', NULL, NULL, NULL, 'C', 'COLECTIVO DESPLAZADO', '2001-05-23 00:00:00', '2001-05-23 00:00:00', NULL, 6);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (502, '2017-05-04', NULL, NULL, NULL, 'C', 'COLECTIVO LESIONADO', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 6);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (503, '2024-03-05', NULL, NULL, NULL, 'C', 'CONFINAMIENTO COMO REPRESALIA O CASTIGO COLECTIVO', '2024-03-05 00:00:00', '2024-02-05 00:00:00', NULL, 6);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (520, '2011-07-07', NULL, 12, NULL, 'I', 'VIOLENCIA SEXUAL', NULL, NULL, NULL, 6);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (521, '2011-07-07', NULL, 12, 520, 'I', 'VIOLACIÓN', NULL, NULL, NULL, 6);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (522, '2011-07-07', NULL, 12, 520, 'I', 'EMBARAZO FORZADO', NULL, NULL, NULL, 6);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (523, '2011-07-07', NULL, 12, 520, 'I', 'PROSTITUCIÓN FORZADA', NULL, NULL, NULL, 6);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (524, '2011-07-07', NULL, 12, 520, 'I', 'ESTERILIZACIÓN FORZADA', NULL, NULL, NULL, 6);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (525, '2011-07-07', NULL, 12, 520, 'I', 'ESCLAVITUD SEXUAL', NULL, NULL, NULL, 6);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (526, '2011-07-07', NULL, 12, 520, 'I', 'ABUSO SEXUAL', NULL, NULL, NULL, 6);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (527, '2011-07-07', NULL, 12, 520, 'I', 'ABORTO FORZADO', NULL, NULL, NULL, 6);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (53, '2000-08-09', NULL, 14, NULL, 'I', 'LESIÓN FÍSICA', NULL, NULL, NULL, 6);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (55, '2000-08-09', NULL, 16, NULL, 'I', 'AMENAZA', NULL, NULL, NULL, 6);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (56, '2000-08-09', NULL, 13, NULL, 'I', 'TORTURA', NULL, NULL, NULL, 6);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (57, '2000-08-09', NULL, 15, NULL, 'I', 'ATENTADO', NULL, NULL, NULL, 6);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (58, '2001-08-09', NULL, 22, NULL, 'I', 'RAPTO', NULL, NULL, NULL, 6);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (59, '2000-08-09', NULL, NULL, NULL, 'C', 'COLECTIVO AMENAZADO', '2000-08-09 00:00:00', '2000-08-09 00:00:00', NULL, 6);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (62, '2000-07-26', NULL, NULL, NULL, 'O', 'COMBATE', '2000-07-26 00:00:00', '2000-07-26 00:00:00', NULL, 3);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (63, '2000-08-09', NULL, NULL, NULL, 'O', 'EMBOSCADA', '2000-08-09 00:00:00', '2000-08-09 00:00:00', NULL, 3);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (64, '2001-08-09', NULL, NULL, NULL, 'O', 'CAMPO MINADO', '2001-08-09 00:00:00', '2001-08-09 00:00:00', NULL, 3);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (65, '2001-08-09', NULL, NULL, NULL, 'O', 'AMETRALLAMIENTO Y/O BOMBARDEO', '2001-08-09 00:00:00', '2001-08-09 00:00:00', NULL, 3);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (66, '2001-08-09', NULL, NULL, NULL, 'O', 'BLOQUEO DE VÍAS', '2001-08-09 00:00:00', '2001-08-09 00:00:00', NULL, 3);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (67, '2000-08-09', NULL, NULL, NULL, 'O', 'ATAQUE A OBJETIVO MILITAR', '2000-08-09 00:00:00', '2000-08-09 00:00:00', NULL, 3);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (68, '2001-08-09', NULL, NULL, NULL, 'O', 'INCURSIÓN', '2001-08-09 00:00:00', '2001-08-09 00:00:00', NULL, 3);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (69, '2000-08-09', NULL, NULL, NULL, 'O', 'SABOTAJE', '2000-08-09 00:00:00', '2000-08-09 00:00:00', NULL, 3);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (701, '2000-08-09', NULL, 2, NULL, 'I', 'HOMICIDIO INTENCIONAL DE PERSONA PROTEGIDA ', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (702, '2000-08-09', NULL, 10, NULL, 'I', 'LESIÓN A PERSONA PROTEGIDA', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (703, '2000-08-09', NULL, 2, NULL, 'I', 'CIVIL MUERTO EN ACCIÓN BÉLICA', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (704, '2000-08-09', NULL, 10, NULL, 'I', 'LESIÓN A CIVILES EN ACCIÓN BÉLICA', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (705, '2017-05-04', NULL, NULL, NULL, 'C', 'COLECTIVO LESIONADO POR INFRACCIONES AL DIHC', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (706, '2000-08-09', NULL, NULL, NULL, 'C', 'COLECTIVO AMENAZADO', '2000-08-09 00:00:00', '2000-08-09 00:00:00', NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (707, '2001-07-11', NULL, NULL, NULL, 'O', 'MISIÓN MÉDICA O SANITARIA', '2001-07-11 00:00:00', '2001-07-11 00:00:00', NULL, 7);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (708, '2001-07-11', NULL, NULL, NULL, 'O', 'MISIÓN RELIGIOSA', '2001-07-11 00:00:00', '2001-07-11 00:00:00', NULL, 7);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (709, '2001-07-11', NULL, NULL, NULL, 'O', 'MISIÓN HUMANITARIA', '2001-07-11 00:00:00', '2001-07-11 00:00:00', NULL, 7);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (710, '2017-05-04', NULL, NULL, NULL, 'O', 'MISIONES DE PAZ', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 7);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (711, '2017-05-04', NULL, NULL, NULL, 'O', 'MISIÓN INFORMATIVA', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 7);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (712, '2017-05-04', NULL, NULL, NULL, 'O', 'ZONAS HUMANITARIAS', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 7);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (713, '2017-05-04', NULL, NULL, NULL, 'O', 'CONVERSACIONES DE PAZ', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 7);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (714, '2017-05-04', NULL, NULL, NULL, 'I', 'ESCLAVITUD Y TRABAJOS FORZADOS', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (715, '2017-05-04', NULL, NULL, NULL, 'I', 'JUDICIALIZACIÓN ARBITRARIA COMO INSTRUMENTO DE GUERRA', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (716, '2017-05-04', NULL, NULL, NULL, 'I', 'NEGACIÓN DE DERECHOS A PRISIONERO DE GUERRA', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (717, '2017-05-04', NULL, NULL, NULL, 'I', 'NEGACIÓN DE ATENCIÓN A PERSONA VULNERABLE', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (718, '2017-05-04', NULL, NULL, NULL, 'I', 'PROFANACIÓN Y OCULTAMIENTO DE CADÁVERES', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (72, '2000-08-09', NULL, 9, NULL, 'I', 'TORTURA', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (73, '2000-08-09', NULL, 11, NULL, 'I', 'AMENAZA', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (74, '2001-08-09', NULL, 21, NULL, 'I', 'TOMA DE REHENES', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (75, '2000-08-09', NULL, 20, NULL, 'I', 'RECLUTAMIENTO DE MENORES', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (76, '2017-05-04', NULL, NULL, NULL, 'I', 'DESAPARICIÓN FORZADA', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (77, '2000-08-09', NULL, 12, NULL, 'I', 'VIOLENCIA SEXUAL', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (771, '2008-10-20', NULL, 12, 77, 'I', 'VIOLACIÓN', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (772, '2008-10-20', NULL, 12, 77, 'I', 'EMBARAZO FORZADO', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (773, '2008-10-20', NULL, 12, 77, 'I', 'PROSTITUCIÓN FORZADA', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (774, '2008-10-20', NULL, 12, 77, 'I', 'ESTERILIZACIÓN FORZADA', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (775, '2008-10-20', NULL, 12, 77, 'I', 'ESCLAVITUD SEXUAL', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (776, '2008-10-20', NULL, 12, 77, 'I', 'ABUSO SEXUAL', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (777, '2010-04-17', NULL, 12, 77, 'I', 'ABORTO FORZADO', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (78, '2000-08-09', NULL, 19, NULL, 'I', 'ESCUDO INDIVIDUAL', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (79, '2002-07-23', '2002-07-23', NULL, NULL, 'I', 'DESAPARICIÓN', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (80, '2000-08-09', NULL, NULL, NULL, 'O', 'BIENES CIVILES', '2000-08-09 00:00:00', '2000-08-09 00:00:00', NULL, 7);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (801, '2001-07-26', NULL, NULL, NULL, 'O', 'ATAQUE A OBRAS E INST. QUE CONT. FUERZAS PELIGR.', '2001-07-26 00:00:00', '2001-07-26 00:00:00', NULL, 7);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (84, '2001-08-09', NULL, NULL, NULL, 'O', 'MEDIO AMBIENTE', '2001-08-09 00:00:00', '2001-08-09 00:00:00', NULL, 7);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (85, '2001-08-09', NULL, NULL, NULL, 'O', 'BIENES CULTURALES Y RELIGIOSOS', '2001-08-09 00:00:00', '2001-08-09 00:00:00', NULL, 7);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (86, '2001-08-09', NULL, NULL, NULL, 'O', 'HAMBRE COMO MÉTODO DE GUERRA', '2001-08-09 00:00:00', '2001-08-09 00:00:00', NULL, 7);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (87, '2001-08-09', NULL, 2, NULL, 'I', 'MUERTO POR ATAQUE A BIENES CIVILES', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (88, '2001-08-09', NULL, 10, NULL, 'I', 'LESIÓN POR ATAQUE A BIENES CIVILES', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (89, '2001-08-09', NULL, NULL, NULL, 'O', 'ESTRUCTURA VIAL', '2001-08-09 00:00:00', '2001-08-09 00:00:00', NULL, 7);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (90, '2000-08-09', NULL, NULL, NULL, 'O', 'ATAQUE INDISCRIMINADO', '2000-08-09 00:00:00', '2000-08-09 00:00:00', NULL, 7);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (902, '2001-07-11', NULL, NULL, NULL, 'O', 'DESPLAZAMIENTO FORZADO', '2001-07-11 00:00:00', '2001-07-11 00:00:00', NULL, 7);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (903, '2001-07-11', NULL, NULL, NULL, 'C', 'DESPLAZAMIENTO FORZADO', '2001-07-11 00:00:00', '2001-07-11 00:00:00', NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (904, '2001-07-11', NULL, NULL, NULL, 'C', 'COLECTIVO ESCUDO', '2001-07-11 00:00:00', '2001-07-11 00:00:00', NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (905, '2017-05-04', NULL, NULL, NULL, 'O', 'GUERRA SIN CUARTEL', '2017-05-04 00:00:00', '2017-05-04 00:00:00', NULL, 7);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (906, '2008-10-21', NULL, NULL, NULL, 'C', 'CONFINAMIENTO COLECTIVO', '2008-10-21 00:00:00', '2008-10-21 00:00:00', NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (91, '2000-08-09', NULL, NULL, NULL, 'O', 'PERFIDIA', '2000-08-09 00:00:00', '2000-08-09 00:00:00', NULL, 7);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (910, '2006-07-12', '2017-05-03', NULL, NULL, 'I', 'ENFRENTAMIENTO - INTERNO', NULL, NULL, NULL, 3);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (916, '2018-02-24', NULL, NULL, NULL, 'C', 'NEGACIÓN DE DERECHOS A PRISIONEROS DE GUERRA', '2018-02-24 00:00:00', '2018-02-24 00:00:00', NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (917, '2018-02-24', NULL, NULL, NULL, 'C', 'NEGACIÓN DE ATENCIÓN A PERSONAS VULNERABLES', '2018-02-24 00:00:00', '2018-02-24 00:00:00', NULL, 1);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (92, '2001-08-09', NULL, NULL, NULL, 'O', 'ARMAS ABSOLUTAMENTE PROHIBIDAS', '2001-08-09 00:00:00', '2001-08-09 00:00:00', NULL, 7);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (93, '2001-08-09', NULL, NULL, NULL, 'O', 'EMPLEO ILÍCITO DE ARMAS DE USO RESTRINGIDO', '2001-08-09 00:00:00', '2001-08-09 00:00:00', NULL, 7);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (95, '2000-08-09', NULL, NULL, NULL, 'O', 'PILLAJE', '2000-08-09 00:00:00', '2000-08-09 00:00:00', NULL, 7);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (97, '2001-08-09', NULL, 2, NULL, 'I', 'MUERTO POR OBJETIVOS, MÉTODOS Y MEDIOS ILÍCITOS', NULL, NULL, NULL, 4);
INSERT INTO public.sivel2_gen_categoria (id, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, nombre, created_at, updated_at, observaciones, supracategoria_id) VALUES (98, '2001-08-09', NULL, 10, NULL, 'I', 'LESIÓN POR OBJETIVOS, MÉTODOS Y MEDIOS ILÍCITOS', NULL, NULL, NULL, 4);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_contexto; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (1, 'MILITARIZACIÓN', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (10, 'PARO AGRARIO', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (11, 'MARCHA CAMPESINA', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (12, 'TOMA DE TIERRAS', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (13, 'ENCLAVES ECONÓMICOS', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (14, 'CULTIVOS DE USO ILÍCITO', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (15, 'CONFLICTOS LABORALES', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (16, 'CONFLICTOS ESTUDIANTILES', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (17, 'PROBL. ÉTNICA (NEG.E IN.)', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (18, 'PROBLEMÁTICA FRONTERIZA', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (19, 'PROBLEMÁTICA AMBIENTAL', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (2, 'PARAMILITARIZACIÓN', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (20, 'PROBLEMÁTICA CARCELARIA', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (21, 'DESALOJOS', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (22, 'PROCESOS DE PAZ O DIÁLOGO', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (23, 'PROCESOS ELECTORALES', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (24, 'CAMPAÑAS DE INTOLERANCIA', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (25, 'PERSECUSIÓN A ORGANIZACION', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (26, 'OTROS', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (27, 'ZONAS DE REHAB. Y CONSOL', '2003-03-12', NULL, '2003-03-12 00:00:00', '2003-03-12 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (28, 'CONFLICTO ARMADO', '2004-02-18', NULL, '2004-02-18 00:00:00', '2004-02-18 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (29, 'FALSO POSITIVO', '2010-01-29', NULL, '2010-01-29 00:00:00', '2010-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (3, 'PRESENCIA GUERRILLERA', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (30, 'INTOLERANCIA SOCIAL', '2011-04-26', NULL, '2011-04-26 00:00:00', '2011-04-26 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (31, 'SEGURIDAD INFORMÁTICA', '2011-04-28', NULL, '2011-04-28 00:00:00', '2011-04-28 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (4, 'PRESENCIA DE MILICIAS', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (5, 'ACCIONES BÉLICAS', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (6, 'PARO CÍVICO', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (7, 'MANIFESTACIONES', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (8, 'PROTESTA', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);
INSERT INTO public.sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (9, 'OCUPACIONES', '2001-01-29', NULL, '2001-01-29 00:00:00', '2001-01-29 00:00:00', NULL);


--
-- PostgreSQL database dump complete
--

SELECT pg_catalog.setval('public.sivel2_gen_contexto_id_seq', 100, true);
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_escolaridad; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_escolaridad (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (0, 'SIN INFORMACIÓN', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_escolaridad (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'PREESCOLAR', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_escolaridad (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'TÉCNICO INCOMPLETO', NULL, '2015-10-06', NULL, '2015-10-06 00:00:00', '2015-10-06 00:00:00');
INSERT INTO public.sivel2_gen_escolaridad (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'PROFESIONAL INCOMPLETO', NULL, '2015-10-06', NULL, '2015-10-06 00:00:00', '2015-10-06 00:00:00');
INSERT INTO public.sivel2_gen_escolaridad (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'PRIMARIA', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_escolaridad (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'SECUNDARIA', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_escolaridad (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'TÉCNICO', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_escolaridad (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'PROFESIONAL', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_escolaridad (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'NINGUNO', NULL, '2015-10-06', NULL, '2015-10-06 00:00:00', '2015-10-06 00:00:00');
INSERT INTO public.sivel2_gen_escolaridad (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'ANALFABETA', NULL, '2015-10-06', NULL, '2015-10-06 00:00:00', '2015-10-06 00:00:00');
INSERT INTO public.sivel2_gen_escolaridad (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'PRIMARIA INCOMPLETA', NULL, '2015-10-06', NULL, '2015-10-06 00:00:00', '2015-10-06 00:00:00');
INSERT INTO public.sivel2_gen_escolaridad (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'SECUNDARIA INCOMPLETA', NULL, '2015-10-06', NULL, '2015-10-06 00:00:00', '2015-10-06 00:00:00');


--
-- Name: sivel2_gen_escolaridad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sivel2_gen_escolaridad_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

SELECT pg_catalog.setval('public.sivel2_gen_escolaridad_id_seq', 100, true);
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_estadocivil; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_estadocivil (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (0, 'SIN INFORMACIÓN', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_estadocivil (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'CASADO/A', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_estadocivil (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'DIVORCIADO/A', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_estadocivil (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'SOLTERO/A', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_estadocivil (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'UNIÓN LIBRE', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_estadocivil (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'VIUDO/A', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_estadocivil (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'SEPARADO/A', NULL, '2013-06-16', NULL, '2013-06-16 00:00:00', '2013-06-16 00:00:00');


--
-- Name: sivel2_gen_estadocivil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sivel2_gen_estadocivil_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

SELECT pg_catalog.setval('public.sivel2_gen_estadocivil_id_seq', 100, true);
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_frontera; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_frontera (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (1, 'Ecuador', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_frontera (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (2, 'Brasil', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_frontera (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (4, 'Venezuela', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_frontera (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (5, 'Panamá', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_frontera (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (6, 'Perú', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);


--
-- PostgreSQL database dump complete
--

SELECT pg_catalog.setval('public.sivel2_gen_frontera_id_seq', 100, true);
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_iglesia; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (1, 'SIN INFORMACIÓN', '', '2011-04-26', NULL, '2011-04-26 00:00:00', '2011-04-26 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (10, 'IGLESIA CRISTIANA NO IDENTIFICADA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (15, 'AIEC - ASOCIACIÓN DE IGLESIAS EVANGÉLICAS DEL CARIBE', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (19, 'IGLESIA INTERAMERICANA DE COLOMBIA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (21, 'IGLESIA ALIANZA CRISTIANA MISIONERA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (22, 'IGLESIA MENONITA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (23, 'IGLESIA HERMANDAD EN CRISTO', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (24, 'IGLESIA CUADRANGULAR PENIEL', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (25, 'IGLESIA CUADRANGULAR', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (27, 'IGLESIA MOVIMIENTO MISIONERO MUNDIAL', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (29, 'IGLESIA PALABRA DE VIDA (AIEC)', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (30, 'COMUNIDAD CRISTIANA DE FE', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (31, 'IUMEC - IGLESIA UNIÓN MISIONERA EVANGÉLICA DE COLOMBIA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (32, 'IGLESIA BETHESDA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (33, 'IGLESIA CRISTO VIENE PRONTO', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (34, 'IGLESIA CRISTO REINA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (35, 'IGLESIA PENTECOSTAL UNIDA DE COLOMBIA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (36, 'IGLESIA CRISTIANA UNIÓN', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (37, 'CENTRO DE FE Y ESPERANZA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (38, 'IGLESIA TIBERIA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (39, 'IGLESIA LUZ Y VIDA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (40, 'IGLESIA AMOR Y VIDA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (41, 'IGLESIA CRISTO EL REY', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (42, 'IGLESIA CASA DE ALABANZA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (43, 'IGLESIA DE DIOS', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (44, 'IGLESIA CRUZADA CRISTIANA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (45, 'IGLESIA PRESBITERIANA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (46, 'IGLESIA REMANSO DE PAZ', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (47, 'IGLESIA CATÓLICA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (48, 'IGLESIA PENTECOSTAL', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (49, 'IGLESIA ASAMBLEAS DE DIOS', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (50, 'IGLESIA MONTE HOREB', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (51, 'IGLESIA DIOS ES AMOR', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (52, 'IGLESIA ATENAS', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (53, 'IGLESIA BAUTISTA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (54, 'IGLESIA PANAMERICANA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (55, 'IGLESIA HERMANOS MENONITAS', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (56, 'IGLESIA APOSTÓLICA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (57, 'IGLESIA PALABRA DE VIDA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (58, 'IGLESIA CRISTO CENTRO', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (59, 'IGLESIA LIBRE', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (60, 'MISIÓN INTERAMERICANA DE COLOMBIA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (61, 'IGLESIA EVANGÉLICA LAS PALOMAS', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (62, 'MISIÓN CORNERSTONE', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (63, 'IGLESIA EVANGÉLICA TEMPLO DE BELÉN ', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (64, 'IGLESIA EL VERBO', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (65, 'IGLESIA APOSENTO ALTO', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (66, 'CASA DE ORACIÓN DE RIOACHA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (67, 'IGLESIA LUTERANA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (68, 'IGLESIA EVANGELIO VIVO', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (69, 'IGLESIAS PUERTAS AL CIELO', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (70, 'IGLESIA LUZ Y VERDAD', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (71, 'IGLESIA ADVENTISTA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (72, 'IGLESIA CASA DE DIOS', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (73, 'INTEGRACIÓN CRISTIANA DE FE Y ORACIÓN (ICFO)', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (74, 'IGLESIA CENTRO CRISTIANO SILOÉ', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (75, 'IGLESIA MISIONERA MUNDIAL', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (76, 'IGLESIA NUEVA VIDA ', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (77, 'IGLESIA PÉRGAMO', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (78, 'IGLESIA LOS EFESIOS', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (79, 'IGLESIA CRISTO MI ÚNICA ESPERANZA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (80, 'IGLESIA SARDI', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (81, 'IGLESIA ALIANZA COLOMBIANA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (82, 'IGLESIA PUERTAS ABIERTAS', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (83, 'IGLESIA CRISTO TE LLAMA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (84, 'IGLESIA CONFRATERNIDAD', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (85, 'IGLESIA UNIÓN MISIONERA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (86, 'CENTRO DE AMOR Y FE', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (87, 'IGLESIA CARISMÁTICA VISIÓN A LAS NACIONES ', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);
INSERT INTO public.sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (88, 'IGLESIA AGUA DE VIDA', '', '2011-05-06', NULL, '2011-05-06 00:00:00', '2011-05-06 00:00:00', NULL);


--
-- PostgreSQL database dump complete
--

SELECT pg_catalog.setval('public.sivel2_gen_iglesia_id_seq', 100, true);
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_maternidad; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_maternidad (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (0, 'NO APLICA', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_maternidad (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'GESTANTE', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');
INSERT INTO public.sivel2_gen_maternidad (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'LACTANTE', NULL, '2013-05-16', NULL, '2013-05-16 00:00:00', '2013-05-16 00:00:00');


--
-- Name: sivel2_gen_maternidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sivel2_gen_maternidad_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

SELECT pg_catalog.setval('public.sivel2_gen_maternidad_id_seq', 100, true);
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_presponsable; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (1, '2001-01-30', NULL, 39, 'Estado Colombiano', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (10, '2001-01-30', NULL, 7, 'DIJIN', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (11, '2001-01-30', NULL, 2, 'INPEC', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (12, '2001-01-30', NULL, 2, 'DAS', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (13, '2001-01-30', NULL, 38, 'CTI', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (14, '2001-01-30', NULL, 39, 'Paramilitares', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (15, '2001-01-30', NULL, 14, 'AUC', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (16, '2001-01-30', NULL, 14, 'ACCU', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (17, '2001-01-30', NULL, 14, 'Autodefensas de Puerto Boyaca', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (18, '2001-01-30', NULL, 14, 'Autodefensas de Ramon Isaza', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (19, '2001-01-30', NULL, 14, 'Autodefensas de los Llanos Orientales', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (2, '2001-01-30', NULL, 1, 'Fuerza Pública', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (20, '2001-01-30', NULL, 14, 'Autodefensas de Santander y Sur del Cesar', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (21, '2001-01-30', NULL, 14, 'Autodefensas de Casanare', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (22, '2001-01-30', NULL, 14, 'Autodefensas de Cundinamarca', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (23, '2001-01-30', NULL, 14, 'Autodefensas Campesinas del Magdalena Medio, ACMM', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (25, '2001-01-30', NULL, 40, 'Guerrilla', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (26, '2001-01-30', NULL, 25, 'Milicias', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (27, '2001-01-30', NULL, 25, 'FARC-EP', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (28, '2001-01-30', NULL, 25, 'ELN', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (29, '2001-01-30', NULL, 25, 'Movimiento Jaime Bateman Cayon', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (3, '2001-01-30', NULL, 2, 'Fuerzas Militares', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (30, '2001-01-30', NULL, 25, 'ERP', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (31, '2001-01-30', NULL, 25, 'EPL', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (32, '2001-01-30', NULL, 25, 'ERG', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (35, '2001-01-30', NULL, NULL, 'Sin Información', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (38, '2004-07-14', NULL, 1, 'Fiscalía', '2004-07-14 00:00:00', '2004-07-14 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (39, '2009-09-20', NULL, NULL, 'Polo Estatal', '2009-09-20 00:00:00', '2009-09-20 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (4, '2001-01-30', NULL, 2, 'Ejército', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (40, '2009-09-20', NULL, NULL, 'Polo Insurgente', '2009-09-20 00:00:00', '2009-09-20 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (41, '2024-10-04', NULL, 39, 'Empresas', '2024-10-04 00:00:00', '2024-10-04 00:00:00', '');
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (42, '2024-10-04', NULL, 39, 'PSEI', '2024-10-04 00:00:00', '2024-10-04 00:00:00', 'Plataforma Socioestatal de Exterminio Inpune');
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (5, '2001-01-30', NULL, 2, 'Armada', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (6, '2001-01-30', NULL, 2, 'Fuerza Aerea', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (7, '2001-01-30', NULL, 2, 'Policía', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (8, '2001-01-30', NULL, 3, 'GAULA', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);
INSERT INTO public.sivel2_gen_presponsable (id, fechacreacion, fechadeshabilitacion, papa_id, nombre, created_at, updated_at, observaciones) VALUES (9, '2001-01-30', NULL, 7, 'SIJIN', '2001-01-30 00:00:00', '2001-01-30 00:00:00', NULL);


--
-- PostgreSQL database dump complete
--

SELECT pg_catalog.setval('public.sivel2_gen_presponsable_id_seq', 100, true);
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_profesion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (1, 'ABOGADO/A', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (10, 'RELIGIOSO/A', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (101, 'AGRICULTOR/A', '2014-02-03', NULL, '2014-02-03 00:00:00', '2014-02-03 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (11, 'INVESTIGADOR/A SOCIAL', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (12, 'TÉCNICO/A - TECNÓLOGO/A', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (13, 'ANTROPÓLOGO/A', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (14, 'ARTISTA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (15, 'ECONOMISTA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (16, 'CONTADOR PÚBLICO/A', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (17, 'ODONTÓLOGO/A', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (18, 'SOCIÓLOGO/A', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (19, 'TRABAJADOR/A SOCIAL', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (2, 'EDUCADOR/A', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (20, 'ADMINISTRADOR PUBLICO/A', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (21, 'OTRO', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (22, 'SIN INFORMACIÓN', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (3, 'MÉDICO/A', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (4, 'ENFERMERO/A (A)', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (5, 'PERIODISTA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (6, 'ESTUDIANTE', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (7, 'DEFENSOR/A DE DDHH', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (8, 'INGENIERO/A', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (9, 'SACERDOTE', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);


--
-- PostgreSQL database dump complete
--

SELECT pg_catalog.setval('public.sivel2_gen_profesion_id_seq', 100, true);
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_rangoedad; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_rangoedad (id, nombre, limiteinferior, limitesuperior, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (1, 'De 0 a 15 Años', 0, 15, '2001-03-23', NULL, '2001-03-23 00:00:00', '2001-03-23 00:00:00', NULL);
INSERT INTO public.sivel2_gen_rangoedad (id, nombre, limiteinferior, limitesuperior, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (2, 'De 16 a 25 Años', 16, 25, '2001-03-23', NULL, '2001-03-23 00:00:00', '2001-03-23 00:00:00', NULL);
INSERT INTO public.sivel2_gen_rangoedad (id, nombre, limiteinferior, limitesuperior, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (3, 'De 26 a 45 Años', 26, 45, '2001-03-23', NULL, '2001-03-23 00:00:00', '2001-03-23 00:00:00', NULL);
INSERT INTO public.sivel2_gen_rangoedad (id, nombre, limiteinferior, limitesuperior, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (4, 'De 46 a 60', 46, 60, '2001-03-23', NULL, '2001-03-23 00:00:00', '2001-03-23 00:00:00', NULL);
INSERT INTO public.sivel2_gen_rangoedad (id, nombre, limiteinferior, limitesuperior, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (5, 'De 61 en Adelante', 61, 130, '2001-03-23', NULL, '2001-03-23 00:00:00', '2001-03-23 00:00:00', NULL);
INSERT INTO public.sivel2_gen_rangoedad (id, nombre, limiteinferior, limitesuperior, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (6, 'SIN INFORMACIÓN', -1, -1, '2001-03-23', NULL, '2001-03-23 00:00:00', '2001-03-23 00:00:00', NULL);


--
-- PostgreSQL database dump complete
--

SELECT pg_catalog.setval('public.sivel2_gen_rangoedad_id_seq', 100, true);
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_region; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_region (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (10, 'EJE CAFETERO Y TOLIMA GRANDE', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_region (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (11, 'EXTERIOR', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_region (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (5, 'COSTA ATLANTICA', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_region (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (6, 'ANTIOQUIA CHOCO SANT', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_region (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (7, 'LLANOS', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_region (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (8, 'CENTRO', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
INSERT INTO public.sivel2_gen_region (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (9, 'SUR OCCIDENTE', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);


--
-- PostgreSQL database dump complete
--

SELECT pg_catalog.setval('public.sivel2_gen_region_id_seq', 100, true);
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: sivel2_gen_resagresion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sivel2_gen_resagresion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'MUERTO', NULL, '2001-01-01', NULL, '2016-07-19 00:00:00', '2016-07-19 00:00:00');
INSERT INTO public.sivel2_gen_resagresion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'HERIDO', NULL, '2001-01-01', NULL, '2016-07-19 00:00:00', '2016-07-19 00:00:00');
INSERT INTO public.sivel2_gen_resagresion (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'PRIVADO DE LA LIBERTAD', NULL, '2001-01-01', NULL, '2016-07-19 00:00:00', '2016-07-19 00:00:00');


--
-- Name: sivel2_gen_resagresion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sivel2_gen_resagresion_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

-- Volvemos a habilitar integridad

ALTER TABLE ONLY public.sivel2_gen_categoria
  ADD CONSTRAINT categoria_contadaen_fkey FOREIGN KEY (contadaen) 
  REFERENCES public.sivel2_gen_categoria(id); 
ALTER TABLE ONLY public.sivel2_gen_presponsable
  ADD CONSTRAINT presponsable_papa_id_fkey FOREIGN KEY (papa_id) 
  REFERENCES public.sivel2_gen_presponsable(id);
