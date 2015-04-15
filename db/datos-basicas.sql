-- Volcado de tablas basicas



    ALTER TABLE ONLY sivel2_gen_categoria
      DROP CONSTRAINT categoria_contadaen_fkey; 
    ALTER TABLE ONLY sivel2_gen_presponsable
      DROP CONSTRAINT presponsable_papa_fkey;

      --
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_pconsolidado; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'MUERTOS', 'DH', 'VIDA', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'HERIDOS', 'DIH', 'INTEGRIDAD', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'AMENAZAS', 'DIH', 'INTEGRIDAD', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'VIOLENCIA SEXUAL', 'DIH', 'INTEGRIDAD', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'TORTURA', 'VP', 'INTEGRIDAD', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'HERIDOS', 'VP', 'INTEGRIDAD', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'ATENTADOS', 'VP', 'INTEGRIDAD', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'AMENAZAS', 'VP', 'INTEGRIDAD', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'DESAPARICIÓN', 'DH', 'LIBERTAD', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (18, 'DETENCION ARBITRARIA', 'DH', 'LIBERTAD', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (19, 'DEPORTACIÓN', 'DH', 'LIBERTAD', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'MUERTOS', 'DIH', 'VIDA', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'RECLUTAMIENTO DE MENORES', 'DIH', 'LIBERTAD', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (21, 'TOMA DE REHENES', 'DIH', 'LIBERTAD', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (22, 'ESCUDO', 'DIH', 'LIBERTAD', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (23, 'RAPTO', 'VP', 'LIBERTAD', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (24, 'SECUESTRO', 'VP', 'LIBERTAD', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (25, 'COLECTIVO CONFINADO', 'DIH', 'INTEGRIDAD', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'MUERTOS', 'VP', 'VIDA', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'TORTURA', 'DH', 'INTEGRIDAD', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'HERIDOS', 'DH', 'INTEGRIDAD', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'ATENTADOS', 'DH', 'INTEGRIDAD', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'AMENAZAS', 'DH', 'INTEGRIDAD', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'VIOLENCIA SEXUAL', 'DH', 'INTEGRIDAD', 0, '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'TORTURA', 'DIH', 'INTEGRIDAD', 0, '2001-01-01', NULL, NULL, NULL);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_tviolencia; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_tviolencia (id, nombre, nomcorto, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES ('A', 'VIOLACIONES A LOS DERECHOS HUMANOS', 'DH', '2000-07-24', NULL, NULL, NULL);
INSERT INTO sivel2_gen_tviolencia (id, nombre, nomcorto, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES ('B', 'VIOLENCIA POLÍTICO SOCIAL', 'VPS', '2000-07-24', NULL, NULL, NULL);
INSERT INTO sivel2_gen_tviolencia (id, nombre, nomcorto, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES ('C', 'ACCIONES BÉLICAS', 'BELICAS', '2000-07-24', NULL, NULL, NULL);
INSERT INTO sivel2_gen_tviolencia (id, nombre, nomcorto, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES ('D', 'INFRACCIONES AL DIH', 'DIH', '2000-07-24', NULL, NULL, NULL);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_supracategoria; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_supracategoria (id, nombre, fechacreacion, fechadeshabilitacion, id_tviolencia, created_at, updated_at) VALUES (1, 'BÉLICAS', '2000-07-26', NULL, 'C', NULL, NULL);
INSERT INTO sivel2_gen_supracategoria (id, nombre, fechacreacion, fechadeshabilitacion, id_tviolencia, created_at, updated_at) VALUES (1, 'PERSECUCIÓN POLÍTICA', '2000-07-26', NULL, 'A', NULL, NULL);
INSERT INTO sivel2_gen_supracategoria (id, nombre, fechacreacion, fechadeshabilitacion, id_tviolencia, created_at, updated_at) VALUES (1, 'PERSECUCIÓN POLÍTICA', '2000-07-26', NULL, 'B', NULL, NULL);
INSERT INTO sivel2_gen_supracategoria (id, nombre, fechacreacion, fechadeshabilitacion, id_tviolencia, created_at, updated_at) VALUES (1, 'PERSONAS', '2000-07-26', NULL, 'D', NULL, NULL);
INSERT INTO sivel2_gen_supracategoria (id, nombre, fechacreacion, fechadeshabilitacion, id_tviolencia, created_at, updated_at) VALUES (2, 'ABUSO DE AUTORIDAD', '2000-07-26', NULL, 'A', NULL, NULL);
INSERT INTO sivel2_gen_supracategoria (id, nombre, fechacreacion, fechadeshabilitacion, id_tviolencia, created_at, updated_at) VALUES (2, 'BIENES', '2000-07-26', NULL, 'D', NULL, NULL);
INSERT INTO sivel2_gen_supracategoria (id, nombre, fechacreacion, fechadeshabilitacion, id_tviolencia, created_at, updated_at) VALUES (2, 'INTOLERANCIA SOCIAL', '2000-07-26', NULL, 'B', NULL, NULL);
INSERT INTO sivel2_gen_supracategoria (id, nombre, fechacreacion, fechadeshabilitacion, id_tviolencia, created_at, updated_at) VALUES (3, 'INTOLERANCIA SOCIAL', '2000-07-26', NULL, 'A', NULL, NULL);
INSERT INTO sivel2_gen_supracategoria (id, nombre, fechacreacion, fechadeshabilitacion, id_tviolencia, created_at, updated_at) VALUES (3, 'MÉTODOS', '2000-07-26', NULL, 'D', NULL, NULL);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_intervalo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_intervalo (id, nombre, rango, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'MADRUGADA', '00:00 A 05:59', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_intervalo (id, nombre, rango, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'MAÑANA', '06:00 A 12:59', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_intervalo (id, nombre, rango, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'TARDE', '13:00 A 18:59', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_intervalo (id, nombre, rango, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'NOCHE', '19:00 A 24:59', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_intervalo (id, nombre, rango, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'SIN INFORMACIÓN', 'SIN INFORMACIÓN', '2001-01-01', NULL, NULL, NULL);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_filiacion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'LIBERAL', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'SIN INFORMACIÓN', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'UNIÓN PATRÍOTICA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'COMUNISTA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'POLO DEMOCRÁTICO', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'FRENTE SOCIAL Y POLÍTICO', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'MOVIMIENTO POLÍTICO Y SOCIAL MARCHA PATRIÓTICA', '2014-02-14', NULL, NULL, NULL);
INSERT INTO sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'CONSERVADOR', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ALIANZAS TRADICIONALES', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'IZQUIERDA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'ALIANZAS IZQUIERDA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'DERECHA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'DESMOVILIZADOS', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'CIVICO POLITICO ELECTORAL', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_filiacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'OTRO', '2001-01-01', NULL, NULL, NULL);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_organizacion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'CAMPESINA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'HUMANITARIA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'DERECHOS HUMANOS', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'GREMIAL', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'JUVENIL', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'AMBIENTALISTA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'OTRA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'SIN INFORMACIÓN', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'VÍCTIMAS', '2013-07-05', NULL, NULL, NULL);
INSERT INTO sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'INDIGENA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'SINDICAL', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'CIVICA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'ESTUDIANTIL', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'PROFESIONAL', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'NEGRITUDES', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'FEMENINA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'RELIGIOSA', '2001-01-01', NULL, NULL, NULL);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_sectorsocial; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'CAMPESINO', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'HACENDADO', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'MARGINADO', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'TRABAJADOR (A) SEXUAL', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'DESEMPLEADO (A)', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'OTRO', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'SIN INFORMACIÓN', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'TRANSPORTADOR', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'INDIGENA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'OBRERO', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'COMERCIANTE', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'EMPLEADO', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'TRABAJADOR INDEPENDIENTE', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'PROFESIONAL', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'EMPRESARIO', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_sectorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'INDUSTRIAL', '2001-01-01', NULL, NULL, NULL);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_vinculoestado; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'CONGRESO', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'FISCALIA GRAL DE LA NAC.', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'CONSEJO NACIONAL ELECTOR.', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'REGIS. NAL DEL EST. CIVIL', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'PROCURADURIA GENERAL', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'CONTRALORIA GENERAL DE R.', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'DEFENSORIA DEL PUEBLO', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'ASAMBLEA DEPARTAMENTAL', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'GOBERNACION', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (18, 'SECRETARIAS (DTO.)', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (19, 'EMPRESAS PUBLICAS DTALES.', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'PRESIDENCIA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'TRIBUNALES DTALES.', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (21, 'REGISTRADURIA DTAL.', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (22, 'CONTRALORIA DTAL.', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (23, 'PROCURADURIA DTAL.', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (24, 'DEFENSORIA DTAL.', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (25, 'CONCEJO MUNICIPAL', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (26, 'ALCALDIA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (27, 'SECRETARIAS MPALES.', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (28, 'EMPRESAS PUBLICAS MPALES.', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (29, 'JUZGADOS (MPALES.)', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'MINISTERIOS', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (30, 'PROCURADURIA DELEGADA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (31, 'DEFENSORIA (MPAL.)', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (32, 'PERSONERIA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (33, 'CONTRALORIA (MPAL.)', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (34, 'JUNTAS ADMINIST. LOCALES', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (35, 'ALCALDIA MENOR', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (36, 'SECRETARIAS LOCALES', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (37, 'CASAS DE JUSTICIA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (38, 'SIN INFORMACIÓN', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (39, 'TRIBUNALES', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'DEPTOS. ADMINISTRATIVOS', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (40, 'VICEPRESIDENCIA', '2013-07-05', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'EMP. IND. Y COM. DEL EST.', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'SUPERINTENDENCIAS', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'CONS. SUP. DE LA JUDICAT.', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'CORT. SUPREMA DE JUSTICIA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'CORTE CONSTITUCIONAL', '2001-01-01', NULL, NULL, NULL);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_actividadarea; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_actividadarea (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'PSICOSOCIAL', '', '2013-12-04', NULL, '2014-01-09 02:23:28.732636', '2014-03-07 18:43:00.812476');
INSERT INTO sivel2_gen_actividadarea (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'COMUNICACIONES', '', '2014-01-29', NULL, '2014-01-29 16:15:43.824216', '2014-03-07 18:43:45.251193');
INSERT INTO sivel2_gen_actividadarea (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (103, 'INTEGRACIÓN LOCAL', '', '2014-02-08', NULL, '2014-02-08 13:30:24.014081', '2014-03-07 18:43:56.884996');
INSERT INTO sivel2_gen_actividadarea (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (105, 'ACOMPAÑAMIENTO PASTORAL', '', '2014-02-08', NULL, '2014-05-15 21:54:52.38907', '2014-05-15 21:55:15.864721');
INSERT INTO sivel2_gen_actividadarea (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'JURÍDICA - LEGAL', '', '2013-12-04', NULL, '2014-01-09 02:23:28.745075', '2014-03-07 18:43:14.269965');
INSERT INTO sivel2_gen_actividadarea (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'ORGANIZACIÓN COMUNITARIA', '', '2013-12-04', NULL, '2014-01-09 02:23:28.747505', '2014-03-07 18:44:06.691283');
INSERT INTO sivel2_gen_actividadarea (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'EMPRENDIMIENTO', '', '2013-12-04', NULL, '2014-01-09 02:23:28.749798', '2014-03-07 18:43:27.89929');
INSERT INTO sivel2_gen_actividadarea (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'INCIDENCIA', '', '2013-12-04', NULL, '2014-01-09 02:23:28.75207', '2014-03-07 18:43:35.753539');


--
-- Name: sivel2_gen_actividadarea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sivel2_gen_actividadarea_id_seq', 105, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_actividadoficio; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (0, 'SIN INFORMACIÓN', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'AGRICULATOR/A', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'MINERO', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'COCINERO/A', '2014-07-28', NULL, '2014-07-28 15:17:02.95474', '2014-07-28 15:17:39.312986');
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'LIDER COMUNITARIO', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'PANADERO/A', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'TRABAJADOR INFORMAL', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'TRABAJADOR/GESTOR COMUNITARIO', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'PESCADOR', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'TRABAJADOR DOMÉSTICO', '2013-05-16', NULL, NULL, NULL); 
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'PIANGUERO', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (18, 'OTRO', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (19, 'CORTE Y COSTURA', '2014-03-10', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'ALBAÑIL', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'PELUQUERÍA Y MANICURISTA', '2014-03-10', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'AMA DE CASA', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'CAMPESINO/A', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'COMERCIANTE', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'DESEMPLEADO/A', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'ELECTRICISTA', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'INDEPENDIENTE', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'OFICIOS VARIOS', '2013-05-16', NULL, NULL, NULL);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_categoria; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (10, 'EJECUCIÓN EXTRAJUDICIAL', '2001-07-26', NULL, 1, 'A', 1, 701, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (101, 'DEPORTACIÓN', '2001-05-23', NULL, 1, 'A', NULL, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (102, 'COLECTIVO DESPLAZADO', '2001-07-11', NULL, 1, 'A', NULL, 903, 'C', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (104, 'CONFINAMIENTO COMO REPRESALIA O CASTIGO COLECTIVO', '2008-10-17', NULL, 1, 'A', 25, 906, 'C', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (11, 'DESAPARICIÓN', '2001-07-26', NULL, 1, 'A', 17, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (12, 'TORTURA', '2001-07-26', NULL, 1, 'A', 4, 72, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (13, 'HERIDO', '2000-08-09', NULL, 1, 'A', 5, 702, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (14, 'DETENCIÓN ARBITRARIA', '2001-08-09', NULL, 1, 'A', 18, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (15, 'AMENAZA', '2000-08-09', NULL, 1, 'A', 7, 73, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (16, 'ATENTADO', '2000-08-09', NULL, 1, 'A', 6, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (18, 'COLECTIVO AMENAZADO', '2000-08-09', NULL, 1, 'A', NULL, 706, 'C', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (19, 'VIOLENCIA SEXUAL', '2000-08-09', NULL, 1, 'A', 8, 77, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (191, 'V.S. - VIOLACIÓN', '2008-10-20', NULL, 1, 'A', 8, 771, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (192, 'V.S. - EMBARAZO FORZADO', '2008-10-20', NULL, 1, 'A', 8, 772, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (193, 'V.S. - PROSTITUCIÓN FORZADA', '2008-10-20', NULL, 1, 'A', 8, 773, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (194, 'V.S. - ESTERILIZACIÓN FORZADA', '2008-10-20', NULL, 1, 'A', 8, 774, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (195, 'V.S. - ESCLAVITUD SEXUAL', '2008-10-20', NULL, 1, 'A', 8, 775, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (196, 'V.S. - ABUSO SEXUAL', '2008-10-20', NULL, 1, 'A', NULL, 776, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (197, 'V.S. - ABORTO FORZADO', '2010-04-17', NULL, 1, 'A', 12, 777, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (20, 'EJECUCIÓN EXTRAJUDICIAL', '2001-07-26', NULL, 2, 'A', 1, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (21, 'DESAPARICIÓN', '2001-08-09', NULL, 2, 'A', 17, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (22, 'TORTURA', '2000-08-09', NULL, 2, 'A', 4, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (23, 'HERIDO', '2000-08-09', NULL, 2, 'A', 5, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (24, 'DETENCIÓN ARBITRARIA', '2001-08-09', NULL, 2, 'A', 18, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (25, 'AMENAZA', '2000-08-09', NULL, 2, 'A', 7, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (26, 'ATENTADO', '2000-08-09', NULL, 2, 'A', 6, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (28, 'COLECTIVO AMENAZADO', '2000-08-09', NULL, 2, 'A', NULL, NULL, 'C', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (29, 'VIOLENCIA SEXUAL', '2000-08-09', NULL, 2, 'A', 8, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (291, 'V.S. - VIOLACIÓN', '2008-10-20', NULL, 2, 'A', 8, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (292, 'V.S. - EMBARAZO FORZADO', '2008-10-20', NULL, 2, 'A', 8, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (293, 'V.S. - PROSTITUCIÓN FORZADA', '2008-10-20', NULL, 2, 'A', 8, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (294, 'V.S. - ESTERILIZACIÓN FORZADA', '2008-10-20', NULL, 2, 'A', 8, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (295, 'V.S. - ESCLAVITUD SEXUAL', '2008-10-20', NULL, 2, 'A', 8, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (296, 'V.S. - ABUSO SEXUAL', '2008-10-20', NULL, 2, 'A', NULL, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (297, 'V.S. - ABORTO FORZADO', '2010-04-17', NULL, 2, 'A', NULL, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (30, 'EJECUCIÓN EXTRAJUDICIAL', '2001-08-09', NULL, 3, 'A', 1, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (301, 'DETENCIÓN ARBITRARIA', '2001-05-23', NULL, 3, 'A', 18, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (302, 'DESAPARICIÓN', '2001-05-23', NULL, 3, 'A', 17, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (33, 'HERIDO', '2000-08-09', NULL, 3, 'A', 5, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (35, 'AMENAZA', '2000-08-09', NULL, 3, 'A', 7, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (36, 'TORTURA', '2000-08-09', NULL, 3, 'A', 4, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (37, 'ATENTADO', '2000-08-09', NULL, 3, 'A', 6, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (38, 'COLECTIVO AMENAZADO', '2000-08-09', NULL, 3, 'A', NULL, NULL, 'C', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (39, 'VIOLENCIA SEXUAL', '2000-08-09', NULL, 3, 'A', 8, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (391, 'V.S. - VIOLACIÓN', '2008-10-20', NULL, 3, 'A', 8, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (392, 'V.S. - EMBARAZO FORZADO', '2008-10-20', NULL, 3, 'A', 8, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (393, 'V.S. - PROSTITUCIÓN FORZADA', '2008-10-20', NULL, 3, 'A', 8, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (394, 'V.S. - ESTERILIZACIÓN FORZADA', '2008-10-20', NULL, 3, 'A', 8, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (395, 'V.S. - ESCLAVITUD SEXUAL', '2008-10-20', NULL, 3, 'A', 8, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (396, 'V.S. - ABUSO SEXUAL', '2008-10-20', NULL, 3, 'A', 8, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (397, 'V.S. - ABORTO FORZADO', '2010-04-17', NULL, 3, 'A', 8, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (40, 'ASESINATO', '2000-08-09', NULL, 1, 'B', 3, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (401, 'COLECTIVO DESPLAZADO', '2001-05-23', NULL, 1, 'B', NULL, NULL, 'C', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (41, 'SECUESTRO', '2000-08-09', NULL, 1, 'B', 23, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (420, 'VIOLENCIA SEXUAL', '2010-04-17', NULL, 1, 'B', NULL, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (421, 'VIOLACIÓN', '2010-04-17', NULL, 1, 'B', NULL, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (422, 'EMBARAZO FORZADO', '2010-04-17', NULL, 1, 'B', NULL, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (423, 'PROSTITUCIÓN FORZADA', '2010-04-17', NULL, 1, 'B', NULL, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (424, 'ESTERILIZACIÓN FORZADA', '2010-04-17', NULL, 1, 'B', NULL, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (425, 'ESCLAVITUD SEXUAL', '2010-04-17', NULL, 1, 'B', NULL, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (426, 'ABUSO SEXUAL', '2010-04-17', NULL, 1, 'B', NULL, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (427, 'ABORTO FORZADO', '2010-04-17', NULL, 1, 'B', NULL, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (43, 'HERIDO', '2000-07-26', NULL, 1, 'B', 14, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (45, 'AMENAZA', '2000-08-09', NULL, 1, 'B', 16, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (46, 'ATENTADO', '2000-08-09', NULL, 1, 'B', 15, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (47, 'TORTURA', '2000-08-09', NULL, 1, 'B', 13, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (48, 'RAPTO', '2001-08-09', NULL, 1, 'B', 22, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (49, 'COLECTIVO AMENAZADO', '2000-08-09', NULL, 1, 'B', NULL, NULL, 'C', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (50, 'ASESINATO', '2000-08-09', NULL, 2, 'B', 3, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (501, 'COLECTIVO DESPLAZADO', '2001-05-23', NULL, 2, 'B', NULL, NULL, 'C', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (520, 'VIOLENCIA SEXUAL', '2011-07-07', NULL, 2, 'B', 12, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (521, 'VIOLACIÓN', '2011-07-07', NULL, 2, 'B', 12, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (522, 'EMBARAZO FORZADO', '2011-07-07', NULL, 2, 'B', 12, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (523, 'PROSTITUCIÓN FORZADA', '2011-07-07', NULL, 2, 'B', 12, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (524, 'ESTERILIZACIÓN FORZADA', '2011-07-07', NULL, 2, 'B', 12, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (525, 'ESCLAVITUD SEXUAL', '2011-07-07', NULL, 2, 'B', 12, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (526, 'ABUSO SEXUAL', '2011-07-07', NULL, 2, 'B', 12, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (527, 'ABORTO FORZADO', '2011-07-07', NULL, 2, 'B', 12, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (53, 'HERIDO', '2000-08-09', NULL, 2, 'B', 14, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (55, 'AMENAZA', '2000-08-09', NULL, 2, 'B', 16, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (56, 'TORTURA', '2000-08-09', NULL, 2, 'B', 13, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (57, 'ATENTADO', '2000-08-09', NULL, 2, 'B', 15, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (58, 'DESAPARICIÓN', '2001-08-09', NULL, 2, 'B', 22, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (59, 'COLECTIVO AMENAZADO', '2000-08-09', NULL, 2, 'B', NULL, NULL, 'C', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (62, 'COMBATE', '2000-07-26', NULL, 1, 'C', NULL, NULL, 'O', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (63, 'EMBOSCADA', '2000-08-09', NULL, 1, 'C', NULL, NULL, 'O', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (64, 'CAMPO MINADO', '2001-08-09', NULL, 1, 'C', NULL, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (65, 'BOMBARDEOS / AMETRALLAMIENTO', '2001-08-09', NULL, 1, 'C', NULL, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (66, 'BLOQUEO DE VÍAS', '2001-08-09', NULL, 1, 'C', NULL, NULL, 'O', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (67, 'ATAQUE A OBJETIVOS MILITARES', '2000-08-09', NULL, 1, 'C', NULL, NULL, 'O', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (68, 'INCURSIÓN', '2001-08-09', NULL, 1, 'C', NULL, NULL, 'O', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (69, 'SABOTAJE', '2000-08-09', NULL, 1, 'C', NULL, NULL, 'O', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (701, 'HOMICIDIO INTENCIONAL PERSONA PROTEGIDA', '2000-08-09', NULL, 1, 'D', 2, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (702, 'HERIDO INTENCIONAL PERSONA PROTEGIDA', '2000-08-09', NULL, 1, 'D', 10, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (703, 'CIVIL MUERTO EN ACCIONES BÉLICAS', '2000-08-09', NULL, 1, 'D', 2, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (704, 'CIVIL HERIDO EN ACCIONES BÉLICAS', '2000-08-09', NULL, 1, 'D', 10, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (706, 'COLECTIVO AMENAZADO', '2000-08-09', NULL, 1, 'D', NULL, NULL, 'C', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (707, 'INFRACCIÓN CONTRA MISIÓN MEDICA', '2001-07-11', NULL, 3, 'D', NULL, NULL, 'O', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (708, 'INFRACCIÓN CONTRA MISIÓN RELIGIOSA', '2001-07-11', NULL, 3, 'D', NULL, NULL, 'O', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (709, 'INFRACCIÓN CONTRA MISIÓN HUMANITARIA', '2001-07-11', NULL, 3, 'D', NULL, NULL, 'O', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (72, 'TORTURA', '2000-08-09', NULL, 1, 'D', 9, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (73, 'AMENAZA', '2000-08-09', NULL, 1, 'D', 11, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (74, 'TOMA DE REHÉN', '2001-08-09', NULL, 1, 'D', 21, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (75, 'RECLUTAMIENTO DE MENORES', '2000-08-09', NULL, 1, 'D', 20, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (77, 'VIOLENCIA SEXUAL', '2000-08-09', NULL, 1, 'D', 12, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (771, 'VIOLACIÓN', '2008-10-20', NULL, 1, 'D', 12, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (772, 'EMBARAZO FORZADO', '2008-10-20', NULL, 1, 'D', 12, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (773, 'PROSTITUCIÓN FORZADA', '2008-10-20', NULL, 1, 'D', 12, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (774, 'ESTERILIZACIÓN FORZADA', '2008-10-20', NULL, 1, 'D', 12, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (775, 'ESCLAVITUD SEXUAL', '2008-10-20', NULL, 1, 'D', 12, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (776, 'ABUSO SEXUAL', '2008-10-20', NULL, 1, 'D', 12, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (777, 'ABORTO FORZADO', '2010-04-17', NULL, 1, 'D', 12, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (78, 'ESCUDO', '2000-08-09', NULL, 1, 'D', 19, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (79, 'DESAPARICIÓN', '2002-07-23', '2002-07-23', 1, 'D', NULL, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (80, 'BIENES CIVILES', '2000-08-09', NULL, 2, 'D', NULL, NULL, 'O', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (801, 'ATAQUE A OBRAS / INSTALACIONES QUE CONT. FUERZAS PELIGROSAS', '2001-07-26', NULL, 2, 'D', NULL, NULL, 'O', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (84, 'INFRACCIÓN CONTRA EL MEDIO AMBIENTE', '2001-08-09', NULL, 2, 'D', NULL, NULL, 'O', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (85, 'INFRACCIÓN CONTRA BIENES CULTURALES Y RELIGIOSOS', '2001-08-09', NULL, 2, 'D', NULL, NULL, 'O', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (86, 'BIENES INDISPENSABLES PARA LA SUPERV. DE LA POB.', '2001-08-09', NULL, 2, 'D', NULL, NULL, 'O', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (87, 'MUERTO EN ATAQUE A BIENES CIVILES', '2001-08-09', NULL, 1, 'D', 2, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (88, 'HERIDO EN ATAQUE A BIENES CIVILES', '2001-08-09', NULL, 1, 'D', 10, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (89, 'INFRACCIÓN CONTRA LA ESTRUCTURA VIAL', '2001-08-09', NULL, 2, 'D', NULL, NULL, 'O', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (90, 'AMETRALLAMIENTO Y/O BOMBARDEO INDISCRIMINADO', '2000-08-09', NULL, 3, 'D', NULL, NULL, 'O', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (902, 'DESPLAZAMIENTO FORZADO COLECTIVO', '2001-07-11', NULL, 3, 'D', NULL, NULL, 'O', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (903, 'COLECTIVO DESPLAZADO', '2001-07-11', NULL, 1, 'D', NULL, NULL, 'C', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (904, 'ESCUDO', '2001-07-11', NULL, 1, 'D', NULL, NULL, 'C', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (906, 'CONFINAMIENTO COMO REPRESALIA O CASTIGO COLECTIVO', '2008-10-21', NULL, 1, 'D', NULL, NULL, 'C', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (91, 'PERFIDIA', '2000-08-09', NULL, 3, 'D', NULL, NULL, 'O', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (910, 'ENFRENTAMIENTO - INTERNO', '2006-07-12', NULL, 1, 'C', NULL, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (92, 'ARMA PROHIBIDA', '2001-08-09', NULL, 3, 'D', NULL, NULL, 'O', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (93, 'MINA ILÍCITA / ARMA TRAMPA', '2001-08-09', NULL, 3, 'D', NULL, NULL, 'O', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (95, 'PILLAJE', '2000-08-09', NULL, 3, 'D', NULL, NULL, 'O', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (97, 'MUERTO POR MÉTODOS Y MEDIOS ILÍCITOS', '2001-08-09', NULL, 1, 'D', 2, NULL, 'I', NULL, NULL);
INSERT INTO sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, id_supracategoria, id_tviolencia, id_pconsolidado, contadaen, tipocat, created_at, updated_at) VALUES (98, 'HERIDO POR MÉTODOS Y MEDIOS ILÍCITOS', '2001-08-09', NULL, 1, 'D', 10, NULL, 'I', NULL, NULL);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_escolaridad; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (0, 'SIN INFORMACIÓN', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'PREESCOLAR', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'PRIMARIA', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'SECUNDARIA', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'TÉCNICO', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'PROFESIONAL', '2013-05-16', NULL, NULL, NULL);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_estadocivil; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_estadocivil (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (0, 'SIN INFORMACIÓN', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_estadocivil (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'CASADO/A', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_estadocivil (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'DIVORCIADO/A', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_estadocivil (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'SOLTERO/A', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_estadocivil (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'UNIÓN LIBRE', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_estadocivil (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'VIUDO/A', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_estadocivil (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'SEPARADO/A', '2013-06-16', NULL, NULL, NULL);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_etnia; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', ' ', '2011-04-26', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'AWA', '5 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (100, 'YAUNA', '78 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'YUKO', '80 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'GARÚ', '89 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (103, 'GUAYUÚ', '32 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (104, 'HITNÚ', '33 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (105, 'MACÚ', '40 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (106, 'MIRAÑA', '44 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (107, 'TOTORÓ', '66 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (108, 'YURUTÍ', '82 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (109, 'YURÍ', '81 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'BARÁ', '6 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (110, 'ZENÚ', '83 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'BARASANA', '7 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'BARÍ', '8 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'CAMSA - KAMSA', '35 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'CARIJONA', '13 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'COCAMA', '16 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'COFÁN', '18 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (18, 'COREGUAJE - KOREGUAJE', '37 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (19, 'CUBEO', '20 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'MESTIZO', ' ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'CUIBA', '21 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (21, 'CHIMILA', '14 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (22, 'DESANO', '23 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (23, 'EMBERA', '25 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (25, 'GUAMBIANO', '29 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (26, 'GUANANO - GUANACA', '30 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (27, 'GUAYABERO', '31 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (28, 'HUITOTO - WITOTO', '73 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (29, 'INGA', '34 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'BLANCO', ' ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (30, 'JUPDA', ' ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (31, 'KARAPANA - CARAPANA', '12 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (32, 'KOGUI', '36 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (33, 'CURRIPACO', '22 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (34, 'MACUNA', '41 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (35, 'MACAGUAJE', '39 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (36, 'MOCANÁ', ' ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (37, 'MUISCA', '46 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (38, 'NASA - PAÉZ', '49 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (39, 'NUKAK', ' ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'NEGRO', '200 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (40, 'PASTOS', '50 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (41, 'PIAPOCO', '51 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (42, 'PIJAO', ' ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (43, 'PIRATAPUYO', '53 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (44, 'PUINAVE', '55 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (45, 'SÁLIBA', '56 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (46, 'SIKUANI', '57 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (47, 'SIONA', '58 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (48, 'TATUYO', '64 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (49, 'TINIGUA', ' ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'INDÍGENA', ' ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (50, 'TUCANO', '67 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (51, 'UMBRÁ', ' ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (52, 'U´WA', '70 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (53, 'WAYUU', '72 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (54, 'WIWA - WIWUA', '74 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (55, 'WOUNAAN', '75 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (56, 'YAGUA', '76 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (57, 'YANACONA', '77 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (58, 'YUCUNA', '79 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (59, 'YUKPA', ' ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'ACHAGUA', '1 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (60, 'ROM', '400 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2013-07-05', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (61, 'AMORUA', '2 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (62, 'BETOYE', '9 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (63, 'BORA', '10 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (64, 'CABIYARI', '11 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (65, 'CARAMANTA', '84 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (66, 'CHAMI', '86 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (68, 'CHIRICOA', '15 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (69, 'COCONUCO', '17 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'ANDAKÍ', ' ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (70, 'COROCORO', '87 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (71, 'COYAIMA-NATAGAIMA', '19 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (72, 'DATUANA', '88 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (73, 'DUJOS', '24 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (74, 'EMBERA CATIO', '26 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (75, 'EMBERA CHAMI', '27 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (76, 'EMBERA SIAPIDARA', '28 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (77, 'KATIO', '85 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (78, 'LETUAMA', '38 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (79, 'MASIGUARE', '42 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'ANDOQUE', '3 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (80, 'MATAPI', '43 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (81, 'MUINANE', '45 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (82, 'MURA', '90 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (83, 'NONUYA', '47 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (84, 'OCAINA', '48 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (85, 'PAYOARINI', '91 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (86, 'PIAROA', '52 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (87, 'PISAMIRA', '54 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (88, 'POLINDARA', '94 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (89, 'QUIYASINGAS', '93 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'ARHUACO', '4 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls ', '2011-04-29', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (90, 'SIRIANO', '59 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (91, 'SIRIPU', '60 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (92, 'TAIWANO', '61 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (93, 'TAMA', '92 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (94, 'TANIMUKA', '62 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (95, 'TARIANO', '63 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (96, 'TIKUNAS', '65 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (97, 'TULE', '68 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (98, 'TUYUCA', '69 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_etnia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (99, 'WANANO', '71 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls', '2014-05-30', NULL, NULL, NULL);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_frontera; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_frontera (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'Ecuador', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_frontera (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'Brasil', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_frontera (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'Venezuela', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_frontera (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'Panamá', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_frontera (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'Perú', '2001-01-01', NULL, NULL, NULL);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_iglesia; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', '', '2011-04-26', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'IGLESIA CRISTIANA NO IDENTIFICADA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'AIEC - ASOCIACIÓN DE IGLESIAS EVANGÉLICAS DEL CARIBE', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (19, 'IGLESIA INTERAMERICANA DE COLOMBIA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (21, 'IGLESIA ALIANZA CRISTIANA MISIONERA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (22, 'IGLESIA MENONITA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (23, 'IGLESIA HERMANDAD EN CRISTO', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (24, 'IGLESIA CUADRANGULAR PENIEL', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (25, 'IGLESIA CUADRANGULAR', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (27, 'IGLESIA MOVIMIENTO MISIONERO MUNDIAL', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (29, 'IGLESIA PALABRA DE VIDA (AIEC)', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (30, 'COMUNIDAD CRISTIANA DE FE', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (31, 'IUMEC - IGLESIA UNIÓN MISIONERA EVANGÉLICA DE COLOMBIA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (32, 'IGLESIA BETHESDA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (33, 'IGLESIA CRISTO VIENE PRONTO', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (34, 'IGLESIA CRISTO REINA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (35, 'IGLESIA PENTECOSTAL UNIDA DE COLOMBIA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (36, 'IGLESIA CRISTIANA UNIÓN', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (37, 'CENTRO DE FE Y ESPERANZA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (38, 'IGLESIA TIBERIA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (39, 'IGLESIA LUZ Y VIDA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (40, 'IGLESIA AMOR Y VIDA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (41, 'IGLESIA CRISTO EL REY', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (42, 'IGLESIA CASA DE ALABANZA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (43, 'IGLESIA DE DIOS', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (44, 'IGLESIA CRUZADA CRISTIANA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (45, 'IGLESIA PRESBITERIANA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (46, 'IGLESIA REMANSO DE PAZ', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (47, 'IGLESIA CATÓLICA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (48, 'IGLESIA PENTECOSTAL', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (49, 'IGLESIA ASAMBLEAS DE DIOS', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (50, 'IGLESIA MONTE HOREB', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (51, 'IGLESIA DIOS ES AMOR', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (52, 'IGLESIA ATENAS', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (53, 'IGLESIA BAUTISTA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (54, 'IGLESIA PANAMERICANA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (55, 'IGLESIA HERMANOS MENONITAS', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (56, 'IGLESIA APOSTÓLICA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (57, 'IGLESIA PALABRA DE VIDA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (58, 'IGLESIA CRISTO CENTRO', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (59, 'IGLESIA LIBRE', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (60, 'MISIÓN INTERAMERICANA DE COLOMBIA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (61, 'IGLESIA EVANGÉLICA LAS PALOMAS', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (62, 'MISIÓN CORNERSTONE', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (63, 'IGLESIA EVANGÉLICA TEMPLO DE BELÉN ', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (64, 'IGLESIA EL VERBO', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (65, 'IGLESIA APOSENTO ALTO', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (66, 'CASA DE ORACIÓN DE RIOACHA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (67, 'IGLESIA LUTERANA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (68, 'IGLESIA EVANGELIO VIVO', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (69, 'IGLESIAS PUERTAS AL CIELO', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (70, 'IGLESIA LUZ Y VERDAD', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (71, 'IGLESIA ADVENTISTA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (72, 'IGLESIA CASA DE DIOS', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (73, 'INTEGRACIÓN CRISTIANA DE FE Y ORACIÓN (ICFO)', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (74, 'IGLESIA CENTRO CRISTIANO SILOÉ', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (75, 'IGLESIA MISIONERA MUNDIAL', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (76, 'IGLESIA NUEVA VIDA ', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (77, 'IGLESIA PÉRGAMO', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (78, 'IGLESIA LOS EFESIOS', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (79, 'IGLESIA CRISTO MI ÚNICA ESPERANZA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (80, 'IGLESIA SARDI', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (81, 'IGLESIA ALIANZA COLOMBIANA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (82, 'IGLESIA PUERTAS ABIERTAS', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (83, 'IGLESIA CRISTO TE LLAMA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (84, 'IGLESIA CONFRATERNIDAD', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (85, 'IGLESIA UNIÓN MISIONERA', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (86, 'CENTRO DE AMOR Y FE', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (87, 'IGLESIA CARISMÁTICA VISIÓN A LAS NACIONES ', '', '2011-05-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_iglesia (id, nombre, descripcion, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (88, 'IGLESIA AGUA DE VIDA', '', '2011-05-06', NULL, NULL, NULL);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_maternidad; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_maternidad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (0, 'NO APLICA', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_maternidad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'GESTANTE', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_maternidad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'LACTANTE', '2013-05-16', NULL, NULL, NULL);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_presponsable; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'ESTADO COLOMBIANO', 39, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'DIJIN', 7, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'LOS RASTROJOS', 14, '2013-06-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'LOS URABEÑOS', 14, '2013-06-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (103, 'LOS PAISAS', 14, '2013-06-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (104, 'ÁGUILAS NEGRAS', 14, '2013-06-06', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'INPEC', 2, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'DAS', 2, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'CTI', 38, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'PARAMILITARES', 39, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'AUC', 14, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'ACCU', 14, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'AUTODEFENSAS DE PUERTO BOYACA', 14, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (18, 'AUTODEFENSAS DE RAMON ISAZA', 14, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (19, 'AUTODEFENSAS DE LOS LLANOS ORIENTALES', 14, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'FUERZA PUBLICA', 1, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'AUTODEFENSAS DE SANTANDER Y SUR DEL CESAR', 14, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (21, 'AUTODEFENSAS DE CASANARE', 14, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (22, 'AUTODEFENSAS DE CUNDINAMARCA', 14, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (23, 'AUTODEFENSAS CAMPESINAS DEL MAGDALENA MEDIO, ACMM', 14, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (24, 'AGENTE EXTRANJERO', 36, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (25, 'GUERRILLA', 40, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (26, 'MILICIAS', 25, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (27, 'FARC-EP', 25, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (28, 'ELN', 25, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (29, 'MOVIMIENTO JAIME BATEMAN CAYON', 25, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'FUERZAS MILITARES', 2, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (30, 'ERP', 25, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (31, 'EPL', 25, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (32, 'ERG', 25, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (33, 'GRUPOS DE INTOLERANCIA SOCIAL', 36, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (34, 'INFORMACION CONTRADICTORIA', NULL, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (35, 'SIN INFORMACIÓN', NULL, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (36, 'OTROS', NULL, '2001-06-13', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (37, 'COMBATIENTES', NULL, '2004-01-20', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (38, 'FISCALIA', 1, '2004-07-14', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (39, 'POLO ESTATAL', NULL, '2009-09-20', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'EJERCITO', 2, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (40, 'POLO INSURGENTE', NULL, '2009-09-20', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'ARMADA', 2, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'FUERZA AEREA', 2, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'POLICÍA', 2, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'GAULA', 3, '2001-01-30', NULL, NULL, NULL);
INSERT INTO sivel2_gen_presponsable (id, nombre, papa, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'SIJIN', 7, '2001-01-30', NULL, NULL, NULL);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_profesion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'ABOGADO/A', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'RELIGIOSO/A', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (101, 'AGRICULTOR/A', '2014-02-03', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'INVESTIGADOR/A SOCIAL', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'TECNÓLOGO/A', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'ANTROPÓLOGO/A', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'ARTISTA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'ECONOMISTA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'CONTADOR PÚBLICO/A', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'ODONTÓLOGO/A', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (18, 'SOCIÓLOGO/A', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (19, 'TRABAJADOR/A SOCIAL', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'EDUCADOR/A', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'ADMINISTRADOR PUBLICO/A', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (21, 'OTRO', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (22, 'SIN INFORMACIÓN', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'MÉDICO/A', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'ENFERMERO/A (A)', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'PERIODISTA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'ESTUDIANTE', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'DEFENSOR/A DE DDHH', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'INGENIERO/A', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_profesion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'SACERDOTE', '2001-01-01', NULL, NULL, NULL);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_rangoedad; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_rangoedad (id, nombre, rango, limiteinferior, limitesuperior, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'R1', 'De 0 a 15 Años', 0, 15, '2001-03-23', NULL, NULL, NULL);
INSERT INTO sivel2_gen_rangoedad (id, nombre, rango, limiteinferior, limitesuperior, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'R2', 'De 16 a 25 Años', 16, 25, '2001-03-23', NULL, NULL, NULL);
INSERT INTO sivel2_gen_rangoedad (id, nombre, rango, limiteinferior, limitesuperior, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'R3', 'De 26 a 45 Años', 26, 45, '2001-03-23', NULL, NULL, NULL);
INSERT INTO sivel2_gen_rangoedad (id, nombre, rango, limiteinferior, limitesuperior, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'R4', 'De 46 a 60', 46, 60, '2001-03-23', NULL, NULL, NULL);
INSERT INTO sivel2_gen_rangoedad (id, nombre, rango, limiteinferior, limitesuperior, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'R5', 'De 61 en Adelante', 61, 130, '2001-03-23', NULL, NULL, NULL);
INSERT INTO sivel2_gen_rangoedad (id, nombre, rango, limiteinferior, limitesuperior, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'SN', 'SIN INFORMACIÓN', -1, -1, '2001-03-23', NULL, NULL, NULL);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_rangoedadac; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_rangoedadac (id, nombre, limiteinferior, limitesuperior, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'De 0 a 11', 0, 10, '2014-02-11', NULL, '2014-03-07 19:19:02.690768', NULL);
INSERT INTO sivel2_gen_rangoedadac (id, nombre, limiteinferior, limitesuperior, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'De 12 a 17', 0, 10, '2014-02-11', NULL, '2014-03-07 19:19:02.690768', NULL);
INSERT INTO sivel2_gen_rangoedadac (id, nombre, limiteinferior, limitesuperior, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'De 18 a 25', 16, 25, '2014-02-11', NULL, '2014-03-07 19:19:09.515802', NULL);
INSERT INTO sivel2_gen_rangoedadac (id, nombre, limiteinferior, limitesuperior, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'De 26 a 45', 26, 45, '2014-02-11', NULL, '2014-03-07 19:19:09.527935', NULL);
INSERT INTO sivel2_gen_rangoedadac (id, nombre, limiteinferior, limitesuperior, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'De 46 a 60', 46, 60, '2014-02-11', NULL, '2014-03-07 19:19:09.539237', NULL);
INSERT INTO sivel2_gen_rangoedadac (id, nombre, limiteinferior, limitesuperior, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'De 61 en adelante', 61, NULL, '2014-02-11', NULL, '2014-03-07 19:19:09.549437', NULL);



--
-- Name: sivel2_gen_rangoedadac_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sivel2_gen_rangoedadac_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_region; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_region (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'EJE CAFETERO Y TOLIMA GRANDE', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_region (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'EXTERIOR', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_region (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'COSTA ATLANTICA', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_region (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'ANTIOQUIA CHOCO SANT', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_region (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'LLANOS', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_region (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'CENTRO', '2001-01-01', NULL, NULL, NULL);
INSERT INTO sivel2_gen_region (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'SUR OCCIDENTE', '2001-01-01', NULL, NULL, NULL);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: sivel2_gen_regionsjr; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sivel2_gen_regionsjr (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', '2014-09-01', NULL, '2014-09-01 12:54:42.630253', '2014-09-03 10:40:11.967004');


--
-- PostgreSQL database dump complete
--

    ALTER TABLE ONLY sivel2_gen_categoria
      ADD CONSTRAINT categoria_contadaen_fkey FOREIGN KEY (contadaen) 
      REFERENCES sivel2_gen_categoria(id); 
    ALTER TABLE ONLY sivel2_gen_presponsable
      ADD CONSTRAINT presponsable_papa_fkey FOREIGN KEY (papa) 
      REFERENCES sivel2_gen_presponsable(id);
      
