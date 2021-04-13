--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.0
-- Dumped by pg_dump version 9.5.0

-- Started on 2017-08-16 20:04:44

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 74195)
-- Name: teste; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA IF NOT EXISTS teste;


ALTER SCHEMA teste OWNER TO postgres;

--
-- TOC entry 199 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2249 (class 0 OID 0)
-- Dependencies: 199
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = teste, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 66157)
-- Name: atividade; Type: TABLE; Schema: teste; Owner: postgres
--

CREATE TABLE IF NOT EXISTS atividade (
    codeve integer NOT NULL,
    sequencia integer NOT NULL,
    codtipo integer NOT NULL,
    dataini date,
    horaini time without time zone,
    titulo character varying(100) NOT NULL,
    descricao character varying(200),
    duracao integer
);


ALTER TABLE atividade OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 66160)
-- Name: ativmin; Type: TABLE; Schema: teste; Owner: postgres
--

CREATE TABLE IF NOT EXISTS ativmin (
    codeve integer NOT NULL,
    sequencia integer NOT NULL,
    codpess integer NOT NULL
);


ALTER TABLE ativmin OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 66163)
-- Name: cidade; Type: TABLE; Schema: teste; Owner: postgres
--

CREATE TABLE IF NOT EXISTS cidade (
    codcid integer NOT NULL,
    nome character varying(100) NOT NULL,
    codest integer NOT NULL,
    numhab bigint NOT NULL
);


ALTER TABLE cidade OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 66166)
-- Name: enquadramento; Type: TABLE; Schema: teste; Owner: postgres
--

CREATE TABLE IF NOT EXISTS enquadramento (
    codenq integer NOT NULL,
    descricao character varying(100) NOT NULL
);


ALTER TABLE enquadramento OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 66169)
-- Name: enquadramentopessoa; Type: TABLE; Schema: teste; Owner: postgres
--

CREATE TABLE IF NOT EXISTS enquadramentopessoa (
    codpess integer NOT NULL,
    codenq integer NOT NULL
);


ALTER TABLE enquadramentopessoa OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 66172)
-- Name: estado; Type: TABLE; Schema: teste; Owner: postgres
--

CREATE TABLE IF NOT EXISTS estado (
    codest integer NOT NULL,
    nome character varying(100) NOT NULL,
    sigla character(2) NOT NULL,
    codpais integer NOT NULL
);


ALTER TABLE estado OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 66175)
-- Name: evento; Type: TABLE; Schema: teste; Owner: postgres
--

CREATE TABLE IF NOT EXISTS evento (
    codeve integer NOT NULL,
    codinst integer NOT NULL,
    codsuba integer NOT NULL,
    titulo character varying(100) NOT NULL,
    descricao character varying(200),
    dataini date NOT NULL,
    datafim date NOT NULL
);


ALTER TABLE evento OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 66178)
-- Name: inscativ; Type: TABLE; Schema: teste; Owner: postgres
--

CREATE TABLE IF NOT EXISTS inscativ (
    numeroinsc integer NOT NULL,
    codeve integer NOT NULL,
    sequencia integer NOT NULL,
    valor numeric(12,2)
);


ALTER TABLE inscativ OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 66181)
-- Name: inscricao; Type: TABLE; Schema: teste; Owner: postgres
--

CREATE TABLE IF NOT EXISTS inscricao (
    numeroinsc integer NOT NULL,
    codeve integer NOT NULL,
    codpess integer NOT NULL,
    datainsc date NOT NULL,
    valor numeric(12,2)
);


ALTER TABLE inscricao OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 66184)
-- Name: instituicao; Type: TABLE; Schema: teste; Owner: postgres
--

CREATE TABLE IF NOT EXISTS instituicao (
    codinst integer NOT NULL,
    nome character varying(100) NOT NULL,
    endereco character varying(200),
    codcid integer NOT NULL
);


ALTER TABLE instituicao OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 66187)
-- Name: instituicaopessoa; Type: TABLE; Schema: teste; Owner: postgres
--

CREATE TABLE IF NOT EXISTS instituicaopessoa (
    codinst integer NOT NULL,
    codpess integer NOT NULL
);


ALTER TABLE instituicaopessoa OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 66190)
-- Name: pais; Type: TABLE; Schema: teste; Owner: postgres
--

CREATE TABLE IF NOT EXISTS pais (
    codpais integer NOT NULL,
    nome character varying(100) DEFAULT '.'::character varying
);


ALTER TABLE pais OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 66194)
-- Name: pessoa; Type: TABLE; Schema: teste; Owner: postgres
--

CREATE TABLE IF NOT EXISTS pessoa (
    codpess integer NOT NULL,
    nome character varying(100) NOT NULL,
    endereco character varying(100),
    titulacao character varying(200),
    curriculo character varying(250),
    codcid integer NOT NULL
);


ALTER TABLE pessoa OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 66200)
-- Name: subarea; Type: TABLE; Schema: teste; Owner: postgres
--

CREATE TABLE IF NOT EXISTS subarea (
    codsuba integer NOT NULL,
    descricao character varying(100) NOT NULL
);


ALTER TABLE subarea OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 66203)
-- Name: tipoatividade; Type: TABLE; Schema: teste; Owner: postgres
--

CREATE TABLE IF NOT EXISTS tipoatividade (
    codtipo integer NOT NULL,
    nome character varying(100) NOT NULL
);


ALTER TABLE tipoatividade OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 66206)
-- Name: topeve; Type: TABLE; Schema: teste; Owner: postgres
--

CREATE TABLE IF NOT EXISTS topeve (
    codeve integer NOT NULL,
    codtop integer NOT NULL
);


ALTER TABLE topeve OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 66209)
-- Name: topico; Type: TABLE; Schema: teste; Owner: postgres
--

CREATE TABLE IF NOT EXISTS topico (
    codtop integer NOT NULL,
    descricao character varying(100) NOT NULL
);


ALTER TABLE topico OWNER TO postgres;

SET search_path = teste, pg_catalog;

--
-- TOC entry 198 (class 1259 OID 74196)
-- Name: cidade; Type: TABLE; Schema: teste; Owner: postgres
--

CREATE TABLE IF NOT EXISTS cidade (
    c1 integer,
    c2 character varying(10)
);


ALTER TABLE cidade OWNER TO postgres;

SET search_path = teste, pg_catalog;

--
-- TOC entry 2224 (class 0 OID 66157)
-- Dependencies: 181
-- Data for Name: atividade; Type: TABLE DATA; Schema: teste; Owner: postgres
--

INSERT INTO atividade VALUES (181, 1, 39, '2017-01-13', '07:08:00', 'Fusce', 'est.', 6);
INSERT INTO atividade VALUES (11, 6, 10, '2018-11-14', '09:12:00', 'sit', 'sodales', 7);
INSERT INTO atividade VALUES (165, 9, 24, '2019-03-16', '04:11:00', 'sollicitudin', 'ornare', 7);
INSERT INTO atividade VALUES (94, 1, 16, '2018-02-21', '03:07:00', 'sit amet metus. Aliquam', 'Aliquam nec enim.', 8);
INSERT INTO atividade VALUES (1, 1, 21, '2016-02-16', '11:04:00', 'Aliquam nec enim.', 'amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque,', 7);
INSERT INTO atividade VALUES (2, 3, 33, '2017-05-21', '03:02:00', 'nisi magna sed dui.', 'risus odio, auctor vitae, aliquet nec, imperdiet nec, leo.', 8);
INSERT INTO atividade VALUES (3, 2, 38, '2016-07-21', '09:02:00', 'sodales. Mauris blandit enim consequat', 'ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id', 6);
INSERT INTO atividade VALUES (4, 2, 20, '2019-01-15', '06:03:00', 'dolor vitae dolor. Donec fringilla.', 'eget metus eu erat semper rutrum. Fusce', 2);
INSERT INTO atividade VALUES (5, 2, 37, '2016-03-12', '08:01:00', 'ultricies ligula. Nullam enim.', 'dolor vitae', 6);
INSERT INTO atividade VALUES (6, 1, 46, '2019-05-30', '01:06:00', 'porttitor interdum. Sed', 'mi pede, nonummy ut, molestie in,', 8);
INSERT INTO atividade VALUES (7, 2, 10, '2016-11-25', '06:01:00', 'non, hendrerit id, ante. Nunc', 'ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget', 6);
INSERT INTO atividade VALUES (8, 5, 4, '2017-05-14', '09:10:00', 'sagittis. Duis gravida.', 'Vivamus nisi. Mauris nulla. Integer', 3);
INSERT INTO atividade VALUES (9, 1, 21, '2016-07-24', '03:12:00', 'faucibus ut, nulla.', 'turpis egestas.', 8);
INSERT INTO atividade VALUES (10, 2, 10, '2016-11-23', '02:10:00', 'natoque penatibus et magnis', 'non', 7);
INSERT INTO atividade VALUES (11, 4, 15, '2018-12-03', '10:04:00', 'Etiam vestibulum massa rutrum', 'ante. Nunc mauris sapien, cursus', 5);
INSERT INTO atividade VALUES (12, 3, 21, '2017-07-15', '01:05:00', 'libero at', 'elit, a feugiat tellus lorem', 4);
INSERT INTO atividade VALUES (13, 5, 11, '2019-03-20', '06:05:00', 'Nunc pulvinar arcu et', 'Phasellus at augue id ante dictum cursus.', 4);
INSERT INTO atividade VALUES (14, 4, 13, '2015-10-24', '10:01:00', 'Ut tincidunt vehicula', 'erat. Sed nunc est, mollis', 3);
INSERT INTO atividade VALUES (15, 3, 10, '2018-05-03', '04:11:00', 'Nunc', 'elementum, lorem ut aliquam iaculis,', 2);
INSERT INTO atividade VALUES (16, 5, 22, '2016-10-11', '12:09:00', 'ornare egestas ligula. Nullam feugiat', 'leo elementum sem, vitae aliquam eros turpis non enim.', 6);
INSERT INTO atividade VALUES (17, 2, 50, '2017-02-14', '03:06:00', 'per', 'et malesuada', 3);
INSERT INTO atividade VALUES (18, 4, 2, '2016-06-21', '05:10:00', 'ligula. Nullam enim. Sed nulla', 'arcu. Nunc mauris.', 5);
INSERT INTO atividade VALUES (19, 4, 20, '2019-04-02', '10:01:00', 'mollis. Duis sit amet diam', 'morbi tristique senectus et netus et', 4);
INSERT INTO atividade VALUES (20, 1, 46, '2016-09-05', '12:12:00', 'libero mauris, aliquam eu,', 'in magna. Phasellus dolor', 4);
INSERT INTO atividade VALUES (21, 1, 29, '2018-05-25', '11:03:00', 'odio', 'in faucibus orci luctus et ultrices', 6);
INSERT INTO atividade VALUES (22, 4, 4, '2017-04-22', '08:12:00', 'mus.', 'ipsum porta', 1);
INSERT INTO atividade VALUES (23, 2, 6, '2017-07-27', '11:11:00', 'Integer tincidunt aliquam arcu.', 'eget nisi dictum augue malesuada', 3);
INSERT INTO atividade VALUES (24, 1, 31, '2016-07-09', '01:02:00', 'luctus, ipsum leo elementum', 'semper et, lacinia vitae, sodales at,', 2);
INSERT INTO atividade VALUES (25, 5, 39, '2019-05-09', '08:05:00', 'amet, consectetuer adipiscing elit.', 'scelerisque scelerisque dui. Suspendisse', 4);
INSERT INTO atividade VALUES (26, 5, 49, '2018-06-22', '08:02:00', 'massa', 'ipsum.', 2);
INSERT INTO atividade VALUES (27, 1, 2, '2018-02-10', '08:06:00', 'nisl.', 'eget varius', 5);
INSERT INTO atividade VALUES (28, 4, 20, '2018-11-22', '08:06:00', 'pellentesque massa lobortis ultrices. Vivamus', 'parturient', 7);
INSERT INTO atividade VALUES (29, 3, 50, '2018-11-20', '09:07:00', 'lorem,', 'lectus. Cum sociis natoque penatibus et magnis dis', 3);
INSERT INTO atividade VALUES (30, 1, 21, '2017-12-25', '09:08:00', 'pharetra ut, pharetra sed, hendrerit', 'arcu. Sed et libero.', 5);
INSERT INTO atividade VALUES (31, 3, 8, '2017-05-20', '08:12:00', 'cursus in, hendrerit consectetuer,', 'sem semper', 1);
INSERT INTO atividade VALUES (32, 2, 37, '2019-02-04', '06:12:00', 'nec ante. Maecenas mi', 'libero. Donec', 6);
INSERT INTO atividade VALUES (33, 1, 14, '2017-04-20', '01:02:00', 'tempus non, lacinia', 'sit amet, dapibus', 1);
INSERT INTO atividade VALUES (34, 1, 10, '2018-06-25', '08:10:00', 'non, egestas', 'turpis vitae purus gravida sagittis. Duis gravida.', 1);
INSERT INTO atividade VALUES (35, 5, 7, '2017-03-23', '11:11:00', 'neque sed dictum eleifend,', 'risus. Morbi metus.', 1);
INSERT INTO atividade VALUES (36, 3, 13, '2016-10-14', '02:03:00', 'aliquet', 'metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus', 6);
INSERT INTO atividade VALUES (37, 1, 24, '2019-01-14', '12:01:00', 'Sed neque.', 'a mi fringilla mi lacinia mattis. Integer eu', 7);
INSERT INTO atividade VALUES (38, 1, 16, '2016-07-20', '11:05:00', 'elementum at, egestas a, scelerisque', 'Aenean euismod mauris eu elit. Nulla', 2);
INSERT INTO atividade VALUES (39, 1, 19, '2018-08-18', '08:01:00', 'dui. Cras', 'blandit. Nam nulla magna, malesuada', 5);
INSERT INTO atividade VALUES (40, 4, 11, '2019-02-06', '12:07:00', 'Fusce mollis. Duis', 'penatibus et magnis dis parturient', 1);
INSERT INTO atividade VALUES (41, 3, 26, '2018-01-01', '10:01:00', 'Integer id magna et', 'et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus', 7);
INSERT INTO atividade VALUES (42, 4, 43, '2016-06-01', '03:06:00', 'Sed congue, elit sed', 'Ut sagittis', 7);
INSERT INTO atividade VALUES (43, 4, 35, '2018-07-12', '06:05:00', 'Etiam ligula tortor, dictum eu,', 'sem,', 8);
INSERT INTO atividade VALUES (44, 3, 1, '2018-08-28', '10:12:00', 'ipsum. Donec sollicitudin', 'tellus, imperdiet non,', 5);
INSERT INTO atividade VALUES (45, 4, 33, '2018-04-17', '05:11:00', 'Praesent eu nulla', 'Pellentesque tincidunt', 6);
INSERT INTO atividade VALUES (46, 1, 17, '2017-09-27', '12:06:00', 'lacus, varius et,', 'consequat dolor', 6);
INSERT INTO atividade VALUES (47, 2, 30, '2015-10-28', '07:02:00', 'eget laoreet posuere,', 'felis ullamcorper viverra.', 7);
INSERT INTO atividade VALUES (48, 2, 26, '2019-05-17', '12:09:00', 'libero lacus, varius et,', 'Aliquam ultrices iaculis odio. Nam interdum', 2);
INSERT INTO atividade VALUES (49, 4, 4, '2018-04-23', '06:02:00', 'eu tellus eu augue', 'sed pede. Cum sociis natoque penatibus et magnis', 5);
INSERT INTO atividade VALUES (50, 5, 30, '2017-09-27', '03:06:00', 'vitae, orci.', 'egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta', 8);
INSERT INTO atividade VALUES (51, 1, 48, '2019-05-01', '06:05:00', 'magna. Phasellus dolor', 'at lacus. Quisque purus sapien, gravida', 4);
INSERT INTO atividade VALUES (52, 5, 19, '2015-10-04', '04:05:00', 'mauris', 'Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis', 1);
INSERT INTO atividade VALUES (53, 3, 47, '2018-06-24', '09:11:00', 'purus gravida', 'pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque', 5);
INSERT INTO atividade VALUES (54, 4, 19, '2016-06-12', '08:05:00', 'facilisis, magna', 'turpis nec mauris blandit mattis. Cras eget nisi dictum augue', 6);
INSERT INTO atividade VALUES (55, 5, 20, '2018-08-23', '04:09:00', 'imperdiet nec, leo. Morbi', 'ipsum. Phasellus vitae mauris', 4);
INSERT INTO atividade VALUES (56, 5, 11, '2017-02-14', '02:05:00', 'pretium neque. Morbi quis urna.', 'amet, consectetuer adipiscing elit. Aliquam auctor,', 8);
INSERT INTO atividade VALUES (57, 3, 42, '2016-10-26', '01:01:00', 'Duis volutpat nunc sit amet', 'nec, mollis vitae, posuere at, velit. Cras lorem', 1);
INSERT INTO atividade VALUES (58, 4, 15, '2018-11-23', '12:02:00', 'arcu. Curabitur ut odio', 'purus. Nullam scelerisque neque sed sem egestas', 1);
INSERT INTO atividade VALUES (59, 4, 21, '2016-09-07', '08:07:00', 'nisi. Cum sociis natoque', 'massa. Quisque porttitor eros nec tellus. Nunc lectus', 4);
INSERT INTO atividade VALUES (60, 1, 25, '2018-07-14', '05:03:00', 'amet, consectetuer adipiscing elit. Curabitur', 'Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in', 6);
INSERT INTO atividade VALUES (61, 2, 35, '2019-02-23', '04:01:00', 'congue, elit sed consequat', 'Mauris magna. Duis dignissim tempor arcu.', 5);
INSERT INTO atividade VALUES (62, 2, 41, '2018-12-28', '12:07:00', 'aliquam adipiscing lacus. Ut', 'molestie', 4);
INSERT INTO atividade VALUES (63, 4, 8, '2018-04-03', '10:11:00', 'placerat velit. Quisque', 'dictum eu, eleifend nec, malesuada ut,', 8);
INSERT INTO atividade VALUES (64, 2, 25, '2017-02-16', '03:02:00', 'tortor nibh', 'Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra', 4);
INSERT INTO atividade VALUES (65, 4, 50, '2017-01-10', '07:09:00', 'mauris', 'tellus sem mollis dui, in sodales elit', 6);
INSERT INTO atividade VALUES (66, 1, 18, '2016-10-25', '07:10:00', 'ante lectus', 'nec, euismod', 4);
INSERT INTO atividade VALUES (67, 2, 14, '2015-10-08', '01:03:00', 'magna. Cras convallis convallis dolor.', 'malesuada augue ut lacus. Nulla', 4);
INSERT INTO atividade VALUES (68, 5, 30, '2016-10-10', '04:05:00', 'eget, volutpat', 'lacinia', 7);
INSERT INTO atividade VALUES (69, 1, 50, '2017-09-01', '03:09:00', 'Donec tincidunt.', 'odio a purus. Duis elementum, dui quis accumsan convallis, ante', 6);
INSERT INTO atividade VALUES (70, 4, 13, '2017-09-19', '03:09:00', 'ultrices, mauris ipsum', 'nec tempus mauris erat eget ipsum. Suspendisse', 3);
INSERT INTO atividade VALUES (71, 4, 37, '2018-11-19', '09:11:00', 'arcu et pede. Nunc', 'nec', 1);
INSERT INTO atividade VALUES (72, 3, 4, '2016-10-09', '04:08:00', 'Vivamus molestie dapibus', 'amet, consectetuer adipiscing elit. Etiam laoreet, libero', 6);
INSERT INTO atividade VALUES (73, 4, 25, '2016-05-28', '05:02:00', 'metus facilisis lorem', 'elit sed consequat auctor, nunc', 5);
INSERT INTO atividade VALUES (74, 3, 11, '2016-07-10', '08:03:00', 'tincidunt aliquam', 'erat, eget tincidunt dui augue', 8);
INSERT INTO atividade VALUES (75, 1, 19, '2019-01-24', '04:03:00', 'et', 'eu, euismod', 8);
INSERT INTO atividade VALUES (76, 1, 32, '2017-12-03', '09:08:00', 'euismod enim. Etiam gravida molestie', 'ut odio vel est tempor bibendum. Donec', 8);
INSERT INTO atividade VALUES (77, 2, 12, '2018-01-23', '06:10:00', 'Fusce aliquet magna', 'neque. Nullam ut nisi a odio semper cursus.', 7);
INSERT INTO atividade VALUES (78, 1, 42, '2019-06-09', '12:04:00', 'Cras dolor', 'ante,', 6);
INSERT INTO atividade VALUES (79, 3, 9, '2017-04-30', '01:07:00', 'augue malesuada malesuada. Integer', 'vulputate velit eu sem. Pellentesque ut', 4);
INSERT INTO atividade VALUES (80, 4, 39, '2018-12-20', '03:09:00', 'Phasellus fermentum', 'ad litora torquent per conubia', 3);
INSERT INTO atividade VALUES (81, 1, 36, '2016-11-03', '02:11:00', 'Cras eu', 'pellentesque, tellus sem mollis dui, in sodales elit erat vitae', 5);
INSERT INTO atividade VALUES (82, 4, 44, '2017-05-11', '05:08:00', 'pede sagittis', 'pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec', 4);
INSERT INTO atividade VALUES (83, 4, 12, '2016-02-26', '10:08:00', 'ut,', 'at fringilla purus mauris', 7);
INSERT INTO atividade VALUES (84, 5, 32, '2016-02-08', '01:07:00', 'ligula', 'aliquam, enim nec tempus scelerisque,', 3);
INSERT INTO atividade VALUES (85, 5, 37, '2017-02-19', '11:07:00', 'nisi sem semper erat,', 'sed sem egestas blandit. Nam', 3);
INSERT INTO atividade VALUES (86, 2, 33, '2019-05-09', '01:02:00', 'at lacus. Quisque purus sapien,', 'Curae; Phasellus ornare. Fusce mollis. Duis', 7);
INSERT INTO atividade VALUES (87, 2, 47, '2019-03-03', '10:09:00', 'ante dictum', 'natoque penatibus', 2);
INSERT INTO atividade VALUES (88, 3, 17, '2016-04-29', '10:02:00', 'dui lectus rutrum urna, nec', 'netus et malesuada fames ac turpis egestas. Fusce aliquet magna', 1);
INSERT INTO atividade VALUES (89, 2, 27, '2017-07-06', '02:08:00', 'consequat purus. Maecenas', 'enim. Nunc ut', 1);
INSERT INTO atividade VALUES (90, 4, 49, '2017-08-31', '12:12:00', 'egestas. Fusce aliquet', 'amet massa. Quisque porttitor eros nec tellus.', 1);
INSERT INTO atividade VALUES (91, 1, 27, '2016-12-14', '03:05:00', 'vitae, sodales at, velit. Pellentesque', 'per inceptos hymenaeos. Mauris ut', 3);
INSERT INTO atividade VALUES (92, 4, 40, '2016-07-15', '11:05:00', 'malesuada ut, sem.', 'Morbi sit', 6);
INSERT INTO atividade VALUES (93, 1, 19, '2017-11-10', '01:10:00', 'risus varius orci, in', 'pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod', 5);
INSERT INTO atividade VALUES (95, 5, 21, '2016-01-11', '09:03:00', 'malesuada', 'vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit', 3);
INSERT INTO atividade VALUES (96, 3, 12, '2019-04-24', '03:06:00', 'convallis dolor. Quisque tincidunt', 'a,', 2);
INSERT INTO atividade VALUES (97, 1, 18, '2016-05-02', '01:11:00', 'amet lorem semper auctor. Mauris', 'ridiculus mus. Aenean eget magna. Suspendisse tristique neque', 6);
INSERT INTO atividade VALUES (98, 4, 43, '2018-09-17', '06:01:00', 'eu, placerat', 'vulputate, nisi', 6);
INSERT INTO atividade VALUES (99, 3, 1, '2018-09-29', '10:03:00', 'eget, volutpat ornare,', 'cursus, diam at pretium aliquet,', 3);
INSERT INTO atividade VALUES (100, 2, 29, '2017-01-22', '03:10:00', 'vitae velit egestas lacinia.', 'pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam', 7);
INSERT INTO atividade VALUES (101, 5, 19, '2017-12-16', '08:01:00', 'nibh dolor, nonummy ac, feugiat', 'Proin ultrices. Duis volutpat nunc sit amet metus.', 2);
INSERT INTO atividade VALUES (102, 3, 27, '2016-06-01', '04:06:00', 'Fusce dolor quam, elementum', 'sed tortor. Integer aliquam', 7);
INSERT INTO atividade VALUES (103, 3, 46, '2017-09-21', '11:01:00', 'imperdiet nec, leo.', 'vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi', 3);
INSERT INTO atividade VALUES (104, 2, 34, '2016-07-16', '02:09:00', 'Aenean sed pede nec', 'magnis dis parturient', 4);
INSERT INTO atividade VALUES (105, 1, 34, '2016-05-05', '04:11:00', 'enim', 'turpis', 7);
INSERT INTO atividade VALUES (106, 4, 2, '2018-03-09', '03:03:00', 'vitae mauris sit amet lorem', 'Sed congue, elit sed consequat auctor,', 2);
INSERT INTO atividade VALUES (107, 5, 38, '2017-01-16', '12:08:00', 'tortor', 'dapibus id, blandit at, nisi. Cum sociis', 4);
INSERT INTO atividade VALUES (108, 3, 29, '2016-11-09', '12:02:00', 'mollis lectus pede et', 'urna. Vivamus molestie', 5);
INSERT INTO atividade VALUES (109, 3, 36, '2017-03-03', '07:03:00', 'Integer id magna et ipsum', 'ante. Vivamus non lorem', 4);
INSERT INTO atividade VALUES (110, 3, 15, '2017-12-12', '07:11:00', 'id ante', 'lorem, luctus ut, pellentesque', 3);
INSERT INTO atividade VALUES (111, 5, 50, '2016-05-19', '06:01:00', 'sem mollis dui, in', 'Aenean eget magna. Suspendisse tristique neque venenatis lacus.', 3);
INSERT INTO atividade VALUES (112, 3, 9, '2017-03-11', '12:01:00', 'non, vestibulum nec, euismod', 'nisi magna sed dui. Fusce aliquam, enim nec', 7);
INSERT INTO atividade VALUES (113, 5, 43, '2018-04-30', '05:12:00', 'Aenean egestas hendrerit', 'eleifend vitae, erat. Vivamus nisi. Mauris', 1);
INSERT INTO atividade VALUES (114, 5, 25, '2018-06-02', '04:07:00', 'ligula. Aenean gravida', 'dolor. Nulla semper tellus id nunc interdum feugiat.', 4);
INSERT INTO atividade VALUES (115, 1, 1, '2019-03-22', '06:09:00', 'lobortis quis, pede. Suspendisse dui.', 'in', 6);
INSERT INTO atividade VALUES (116, 4, 7, '2016-05-23', '05:11:00', 'congue', 'Donec tincidunt. Donec', 2);
INSERT INTO atividade VALUES (117, 1, 11, '2017-09-25', '05:01:00', 'id,', 'est', 5);
INSERT INTO atividade VALUES (118, 3, 41, '2017-02-15', '05:11:00', 'urna, nec luctus', 'elementum at, egestas a,', 7);
INSERT INTO atividade VALUES (119, 1, 41, '2017-01-17', '09:12:00', 'augue id', 'nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus', 2);
INSERT INTO atividade VALUES (120, 5, 33, '2018-11-28', '12:04:00', 'mauris sapien, cursus in, hendrerit', 'vulputate, risus a ultricies adipiscing, enim mi tempor', 7);
INSERT INTO atividade VALUES (121, 1, 31, '2016-02-02', '05:01:00', 'magna. Sed eu eros. Nam', 'lectus ante dictum mi, ac mattis velit justo nec', 2);
INSERT INTO atividade VALUES (122, 5, 19, '2016-07-21', '04:02:00', 'sit amet, faucibus ut,', 'ipsum. Phasellus', 8);
INSERT INTO atividade VALUES (123, 3, 12, '2017-05-15', '10:10:00', 'non magna. Nam ligula', 'nisi', 7);
INSERT INTO atividade VALUES (124, 5, 13, '2016-02-28', '03:11:00', 'quam. Curabitur vel lectus. Cum', 'elit sed consequat auctor, nunc nulla vulputate dui, nec tempus', 3);
INSERT INTO atividade VALUES (125, 4, 32, '2017-07-03', '05:03:00', 'elit.', 'sem ut dolor', 8);
INSERT INTO atividade VALUES (126, 1, 43, '2016-12-16', '03:05:00', 'mi', 'nascetur ridiculus mus.', 4);
INSERT INTO atividade VALUES (127, 3, 44, '2017-03-30', '02:09:00', 'varius et,', 'iaculis odio.', 4);
INSERT INTO atividade VALUES (128, 1, 8, '2016-02-12', '01:05:00', 'eget laoreet', 'Donec egestas. Aliquam nec enim.', 6);
INSERT INTO atividade VALUES (129, 2, 43, '2016-06-27', '01:02:00', 'rutrum. Fusce dolor quam, elementum', 'vulputate, posuere vulputate, lacus. Cras', 7);
INSERT INTO atividade VALUES (130, 4, 43, '2018-09-03', '02:09:00', 'ornare, elit elit fermentum', 'tellus id nunc interdum feugiat. Sed nec metus', 6);
INSERT INTO atividade VALUES (131, 5, 23, '2018-09-02', '12:11:00', 'vel', 'felis orci, adipiscing non,', 2);
INSERT INTO atividade VALUES (132, 3, 27, '2019-03-16', '10:04:00', 'tellus non magna. Nam', 'ipsum nunc id enim. Curabitur massa. Vestibulum', 5);
INSERT INTO atividade VALUES (133, 1, 1, '2017-03-12', '09:09:00', 'varius orci,', 'gravida. Praesent eu nulla at sem molestie sodales. Mauris', 4);
INSERT INTO atividade VALUES (134, 2, 5, '2016-03-27', '01:11:00', 'tincidunt aliquam', 'sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna.', 8);
INSERT INTO atividade VALUES (135, 4, 40, '2017-03-28', '10:07:00', 'magna. Ut tincidunt orci', 'auctor, nunc nulla', 8);
INSERT INTO atividade VALUES (136, 3, 10, '2016-08-18', '03:04:00', 'Lorem', 'pede sagittis augue, eu tempor erat neque non', 5);
INSERT INTO atividade VALUES (137, 3, 38, '2016-06-19', '06:09:00', 'sit', 'viverra. Maecenas iaculis aliquet diam. Sed diam lorem,', 8);
INSERT INTO atividade VALUES (138, 4, 27, '2017-08-11', '03:04:00', 'hendrerit a, arcu.', 'nibh lacinia orci, consectetuer euismod est arcu', 1);
INSERT INTO atividade VALUES (139, 3, 37, '2017-03-04', '01:03:00', 'mollis vitae, posuere at, velit.', 'malesuada. Integer id magna et ipsum', 7);
INSERT INTO atividade VALUES (140, 4, 16, '2017-04-29', '03:09:00', 'nisl arcu iaculis enim,', 'ornare tortor at risus. Nunc ac', 3);
INSERT INTO atividade VALUES (141, 2, 39, '2017-05-04', '12:05:00', 'Donec consectetuer mauris id sapien.', 'sed, hendrerit a, arcu. Sed et', 2);
INSERT INTO atividade VALUES (142, 2, 17, '2015-12-12', '03:05:00', 'Curabitur', 'felis. Donec tempor, est ac mattis semper, dui lectus', 7);
INSERT INTO atividade VALUES (143, 3, 10, '2018-07-01', '07:11:00', 'mollis. Phasellus libero mauris, aliquam', 'metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus', 3);
INSERT INTO atividade VALUES (144, 3, 20, '2018-07-12', '09:08:00', 'enim', 'Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit', 4);
INSERT INTO atividade VALUES (145, 2, 41, '2016-01-14', '04:02:00', 'ut odio vel est', 'Nam ligula elit, pretium et, rutrum', 1);
INSERT INTO atividade VALUES (146, 1, 28, '2016-11-21', '01:01:00', 'erat. Vivamus', 'at auctor ullamcorper, nisl arcu iaculis enim, sit amet', 3);
INSERT INTO atividade VALUES (147, 4, 40, '2017-07-17', '09:04:00', 'Nulla', 'semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque', 2);
INSERT INTO atividade VALUES (148, 5, 44, '2018-03-08', '03:02:00', 'magnis dis parturient', 'ultricies sem magna', 4);
INSERT INTO atividade VALUES (149, 5, 29, '2019-04-01', '04:08:00', 'mauris sit amet lorem semper', 'eu neque pellentesque massa', 6);
INSERT INTO atividade VALUES (150, 5, 14, '2017-03-02', '07:11:00', 'dapibus quam quis diam.', 'tortor at risus. Nunc ac sem ut dolor dapibus', 4);
INSERT INTO atividade VALUES (151, 4, 11, '2016-06-19', '08:05:00', 'augue ut lacus. Nulla', 'egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta', 5);
INSERT INTO atividade VALUES (152, 5, 44, '2018-08-26', '06:02:00', 'commodo tincidunt nibh. Phasellus nulla.', 'tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris', 2);
INSERT INTO atividade VALUES (153, 1, 2, '2016-05-20', '03:02:00', 'velit eget laoreet posuere,', 'Suspendisse tristique neque venenatis lacus. Etiam bibendum', 2);
INSERT INTO atividade VALUES (154, 5, 18, '2016-01-06', '03:02:00', 'hendrerit a, arcu. Sed et', 'arcu. Sed eu nibh vulputate mauris sagittis', 1);
INSERT INTO atividade VALUES (155, 3, 23, '2017-12-22', '11:06:00', 'a, dui. Cras', 'elementum sem, vitae aliquam eros turpis non', 5);
INSERT INTO atividade VALUES (156, 4, 49, '2016-01-02', '05:12:00', 'quis,', 'mattis ornare, lectus ante dictum mi, ac mattis velit', 5);
INSERT INTO atividade VALUES (157, 3, 15, '2016-07-23', '04:09:00', 'imperdiet dictum magna. Ut', 'sed, est. Nunc laoreet', 5);
INSERT INTO atividade VALUES (158, 5, 4, '2018-07-18', '05:08:00', 'nibh dolor, nonummy ac,', 'est ac facilisis facilisis, magna', 8);
INSERT INTO atividade VALUES (159, 1, 7, '2018-05-10', '12:11:00', 'nec tempus scelerisque, lorem ipsum', 'neque. Nullam nisl. Maecenas malesuada fringilla', 5);
INSERT INTO atividade VALUES (160, 2, 27, '2018-01-19', '08:01:00', 'Vestibulum', 'malesuada ut, sem. Nulla interdum. Curabitur', 5);
INSERT INTO atividade VALUES (161, 2, 6, '2017-01-29', '02:03:00', 'commodo', 'tristique pellentesque, tellus sem mollis', 5);
INSERT INTO atividade VALUES (162, 4, 11, '2016-07-02', '07:06:00', 'rhoncus.', 'Morbi accumsan laoreet', 6);
INSERT INTO atividade VALUES (163, 4, 25, '2015-12-26', '01:04:00', 'tellus id nunc', 'sagittis felis. Donec tempor, est ac mattis', 2);
INSERT INTO atividade VALUES (164, 2, 44, '2016-01-08', '08:12:00', 'accumsan convallis, ante lectus convallis', 'Curabitur consequat, lectus sit amet', 3);
INSERT INTO atividade VALUES (165, 5, 5, '2018-07-05', '07:11:00', 'amet ornare lectus justo eu', 'consectetuer adipiscing', 2);
INSERT INTO atividade VALUES (166, 4, 40, '2019-05-06', '07:03:00', 'lobortis quam a felis', 'pede et risus. Quisque libero lacus, varius et, euismod et,', 1);
INSERT INTO atividade VALUES (167, 2, 40, '2017-02-16', '07:10:00', 'nec urna et arcu', 'lorem, luctus ut,', 7);
INSERT INTO atividade VALUES (168, 5, 37, '2018-03-24', '02:09:00', 'sagittis', 'eu sem. Pellentesque ut ipsum ac mi', 5);
INSERT INTO atividade VALUES (169, 1, 37, '2016-09-08', '09:09:00', 'odio, auctor vitae, aliquet nec,', 'a ultricies adipiscing, enim mi tempor lorem, eget mollis', 3);
INSERT INTO atividade VALUES (170, 1, 44, '2018-10-17', '01:05:00', 'cursus, diam at', 'arcu. Nunc mauris. Morbi non sapien molestie', 8);
INSERT INTO atividade VALUES (171, 4, 9, '2018-07-27', '09:08:00', 'sollicitudin', 'nulla. In tincidunt congue turpis. In condimentum. Donec at arcu.', 8);
INSERT INTO atividade VALUES (172, 2, 49, '2018-10-14', '11:05:00', 'libero est, congue a,', 'ipsum primis in faucibus orci luctus et ultrices', 3);
INSERT INTO atividade VALUES (173, 2, 28, '2018-02-09', '07:02:00', 'quis, tristique ac, eleifend vitae,', 'fringilla cursus purus.', 3);
INSERT INTO atividade VALUES (174, 1, 38, '2017-01-11', '09:11:00', 'iaculis odio. Nam interdum', 'fringilla. Donec feugiat metus sit amet ante.', 6);
INSERT INTO atividade VALUES (175, 2, 21, '2015-12-20', '02:05:00', 'dapibus gravida. Aliquam tincidunt,', 'Nunc ullamcorper, velit in aliquet lobortis,', 7);
INSERT INTO atividade VALUES (176, 3, 22, '2016-11-23', '11:10:00', 'dui, in sodales elit erat', 'placerat. Cras dictum ultricies', 8);
INSERT INTO atividade VALUES (177, 1, 14, '2016-05-26', '08:12:00', 'risus varius', 'non enim. Mauris quis turpis vitae purus gravida sagittis.', 7);
INSERT INTO atividade VALUES (178, 1, 1, '2016-10-02', '09:05:00', 'eu', 'nec tempus mauris erat eget ipsum. Suspendisse sagittis.', 2);
INSERT INTO atividade VALUES (179, 2, 44, '2019-05-06', '01:05:00', 'lacinia at, iaculis quis, pede.', 'Duis cursus, diam', 5);
INSERT INTO atividade VALUES (180, 5, 16, '2017-06-26', '06:02:00', 'neque vitae semper', 'sit amet diam eu dolor egestas rhoncus. Proin', 2);
INSERT INTO atividade VALUES (182, 5, 29, '2019-05-21', '06:04:00', 'adipiscing fringilla, porttitor', 'amet nulla. Donec non justo. Proin', 1);
INSERT INTO atividade VALUES (183, 2, 19, '2016-01-20', '09:12:00', 'orci. Ut', 'molestie orci tincidunt', 3);
INSERT INTO atividade VALUES (184, 3, 45, '2017-12-31', '10:11:00', 'Quisque varius. Nam porttitor scelerisque', 'Proin vel arcu', 7);
INSERT INTO atividade VALUES (185, 5, 29, '2018-04-02', '05:08:00', 'arcu. Aliquam ultrices iaculis odio.', 'aliquet, sem ut cursus', 3);
INSERT INTO atividade VALUES (186, 2, 29, '2017-08-19', '10:03:00', 'luctus et ultrices posuere cubilia', 'faucibus ut,', 2);
INSERT INTO atividade VALUES (187, 4, 3, '2017-09-13', '07:12:00', 'Integer mollis.', 'tellus faucibus leo, in lobortis', 7);
INSERT INTO atividade VALUES (188, 4, 45, '2018-08-28', '11:10:00', 'Nulla', 'elementum at, egestas a, scelerisque sed, sapien. Nunc', 5);
INSERT INTO atividade VALUES (189, 1, 19, '2017-06-08', '04:12:00', 'Suspendisse dui.', 'Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi', 1);
INSERT INTO atividade VALUES (190, 2, 25, '2017-06-16', '03:06:00', 'blandit viverra.', 'parturient', 8);
INSERT INTO atividade VALUES (191, 2, 39, '2019-01-26', '11:11:00', 'Fusce', 'facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida', 1);
INSERT INTO atividade VALUES (192, 2, 47, '2019-04-22', '11:06:00', 'ut dolor dapibus gravida. Aliquam', 'ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac,', 1);
INSERT INTO atividade VALUES (193, 3, 50, '2016-07-22', '01:12:00', 'tincidunt orci quis lectus.', 'libero mauris, aliquam eu,', 5);
INSERT INTO atividade VALUES (194, 2, 21, '2016-05-14', '03:08:00', 'mauris sapien, cursus', 'dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus', 2);
INSERT INTO atividade VALUES (195, 5, 13, '2018-01-14', '10:02:00', 'id', 'ac', 2);
INSERT INTO atividade VALUES (196, 5, 26, '2016-09-29', '02:11:00', 'Donec', 'mi. Duis risus odio, auctor', 1);
INSERT INTO atividade VALUES (197, 2, 47, '2015-10-22', '07:01:00', 'ut', 'pede sagittis augue, eu tempor erat neque non quam. Pellentesque', 4);
INSERT INTO atividade VALUES (198, 2, 45, '2019-01-11', '11:01:00', 'vestibulum. Mauris magna. Duis dignissim', 'dictum augue malesuada', 2);
INSERT INTO atividade VALUES (199, 1, 25, '2016-10-30', '05:01:00', 'gravida. Praesent', 'nisl. Quisque fringilla euismod enim. Etiam gravida molestie', 3);
INSERT INTO atividade VALUES (200, 4, 36, '2016-10-09', '03:12:00', 'consectetuer mauris id', 'tellus. Phasellus elit', 7);
INSERT INTO atividade VALUES (1, 9, 30, '2017-05-11', '03:01:00', 'sem semper erat, in', 'Suspendisse dui. Fusce diam nunc, ullamcorper', 6);
INSERT INTO atividade VALUES (2, 8, 40, '2017-06-01', '07:07:00', 'Aliquam', 'eros turpis non enim. Mauris quis turpis', 3);
INSERT INTO atividade VALUES (3, 10, 36, '2015-12-23', '06:09:00', 'Nulla tempor augue', 'sem mollis', 3);
INSERT INTO atividade VALUES (4, 10, 16, '2017-11-15', '10:06:00', 'lobortis ultrices. Vivamus rhoncus.', 'enim.', 3);
INSERT INTO atividade VALUES (5, 7, 39, '2017-10-12', '11:09:00', 'Maecenas', 'Phasellus nulla. Integer vulputate,', 7);
INSERT INTO atividade VALUES (6, 10, 42, '2017-04-06', '12:02:00', 'sollicitudin adipiscing ligula.', 'dui, nec tempus mauris erat eget ipsum.', 1);
INSERT INTO atividade VALUES (7, 7, 46, '2017-02-22', '12:05:00', 'sollicitudin adipiscing', 'pede nec ante blandit viverra. Donec tempus,', 5);
INSERT INTO atividade VALUES (8, 10, 23, '2015-10-19', '05:11:00', 'vel pede blandit congue. In', 'Curabitur egestas nunc sed libero. Proin sed turpis', 4);
INSERT INTO atividade VALUES (9, 10, 36, '2018-12-11', '06:03:00', 'Integer mollis. Integer tincidunt', 'pede sagittis augue, eu tempor', 1);
INSERT INTO atividade VALUES (10, 10, 37, '2018-12-05', '10:09:00', 'tempus mauris erat eget ipsum.', 'quis massa. Mauris vestibulum, neque sed', 1);
INSERT INTO atividade VALUES (12, 9, 1, '2015-10-25', '01:04:00', 'et magnis', 'lobortis risus. In mi pede,', 3);
INSERT INTO atividade VALUES (13, 7, 38, '2015-11-21', '01:06:00', 'scelerisque sed, sapien. Nunc', 'ut, nulla. Cras eu tellus', 1);
INSERT INTO atividade VALUES (14, 10, 15, '2017-03-18', '11:03:00', 'fringilla', 'tellus,', 5);
INSERT INTO atividade VALUES (15, 8, 21, '2017-12-08', '05:07:00', 'dui, nec tempus mauris', 'neque. Morbi quis urna. Nunc quis', 3);
INSERT INTO atividade VALUES (16, 9, 3, '2017-05-02', '12:02:00', 'Nullam', 'enim', 8);
INSERT INTO atividade VALUES (17, 8, 32, '2016-05-01', '11:05:00', 'Proin', 'egestas. Aliquam fringilla cursus', 7);
INSERT INTO atividade VALUES (18, 10, 16, '2019-01-19', '12:06:00', 'ipsum dolor sit amet, consectetuer', 'libero mauris, aliquam eu, accumsan sed,', 5);
INSERT INTO atividade VALUES (19, 9, 2, '2018-04-05', '11:12:00', 'at', 'tellus id nunc interdum feugiat.', 8);
INSERT INTO atividade VALUES (20, 6, 24, '2017-05-19', '02:12:00', 'Ut', 'Mauris molestie pharetra nibh. Aliquam ornare,', 1);
INSERT INTO atividade VALUES (21, 8, 37, '2018-08-28', '11:11:00', 'metus', 'Maecenas libero est, congue', 8);
INSERT INTO atividade VALUES (22, 9, 2, '2019-05-29', '07:08:00', 'orci quis lectus. Nullam', 'sit amet nulla. Donec', 4);
INSERT INTO atividade VALUES (23, 10, 34, '2017-11-25', '12:08:00', 'eu nibh vulputate mauris sagittis', 'risus. Donec egestas. Aliquam nec enim. Nunc', 6);
INSERT INTO atividade VALUES (24, 6, 44, '2018-04-07', '11:01:00', 'purus gravida sagittis. Duis', 'ipsum porta elit, a', 7);
INSERT INTO atividade VALUES (25, 10, 6, '2016-02-14', '01:07:00', 'sed dui. Fusce aliquam, enim', 'pharetra sed, hendrerit a, arcu. Sed et libero. Proin', 5);
INSERT INTO atividade VALUES (26, 7, 7, '2019-03-22', '01:02:00', 'dui. Fusce diam', 'Praesent eu', 5);
INSERT INTO atividade VALUES (27, 8, 39, '2016-07-07', '02:04:00', 'Suspendisse eleifend. Cras sed leo.', 'risus. Quisque libero lacus, varius', 8);
INSERT INTO atividade VALUES (28, 6, 50, '2018-10-03', '11:12:00', 'ut, pellentesque eget, dictum', 'molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper,', 4);
INSERT INTO atividade VALUES (29, 6, 6, '2016-03-25', '10:10:00', 'Phasellus dapibus', 'sit amet diam', 5);
INSERT INTO atividade VALUES (30, 6, 11, '2015-10-17', '12:12:00', 'tempus', 'Ut tincidunt orci quis', 2);
INSERT INTO atividade VALUES (31, 8, 38, '2018-11-27', '04:04:00', 'Fusce feugiat. Lorem ipsum', 'consectetuer euismod est arcu ac orci.', 4);
INSERT INTO atividade VALUES (32, 10, 30, '2019-04-23', '07:05:00', 'neque. Nullam', 'Aliquam auctor, velit eget laoreet posuere,', 3);
INSERT INTO atividade VALUES (33, 8, 15, '2017-04-12', '06:12:00', 'tellus. Phasellus elit pede,', 'Curabitur sed tortor. Integer aliquam', 6);
INSERT INTO atividade VALUES (34, 9, 13, '2018-02-08', '12:03:00', 'neque. Morbi', 'magnis dis parturient montes, nascetur', 8);
INSERT INTO atividade VALUES (35, 9, 47, '2017-02-27', '12:11:00', 'mauris. Morbi', 'amet, consectetuer adipiscing elit. Aliquam auctor, velit', 3);
INSERT INTO atividade VALUES (36, 7, 35, '2018-11-17', '11:03:00', 'quis turpis vitae purus', 'adipiscing lacus. Ut', 2);
INSERT INTO atividade VALUES (37, 10, 1, '2016-01-28', '11:03:00', 'Donec sollicitudin adipiscing', 'Morbi non sapien', 8);
INSERT INTO atividade VALUES (38, 9, 15, '2016-11-10', '09:08:00', 'ligula. Aenean gravida nunc', 'elementum, lorem ut aliquam iaculis, lacus', 1);
INSERT INTO atividade VALUES (39, 10, 9, '2018-01-11', '11:04:00', 'erat', 'Phasellus', 1);
INSERT INTO atividade VALUES (40, 9, 12, '2016-02-11', '01:09:00', 'Duis risus', 'a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris', 2);
INSERT INTO atividade VALUES (41, 7, 49, '2016-03-03', '02:02:00', 'Aliquam nec', 'nisi sem semper erat, in consectetuer ipsum nunc id enim.', 4);
INSERT INTO atividade VALUES (42, 7, 10, '2017-09-02', '04:02:00', 'non, lobortis', 'consectetuer adipiscing elit. Aliquam auctor,', 3);
INSERT INTO atividade VALUES (43, 6, 42, '2016-03-06', '11:12:00', 'aliquet nec,', 'ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede.', 6);
INSERT INTO atividade VALUES (44, 6, 28, '2016-12-26', '08:10:00', 'ac turpis egestas. Aliquam', 'ac turpis egestas. Fusce aliquet magna a neque.', 7);
INSERT INTO atividade VALUES (45, 9, 2, '2016-07-23', '06:02:00', 'tortor at risus. Nunc ac', 'nec,', 1);
INSERT INTO atividade VALUES (46, 10, 11, '2017-05-07', '04:07:00', 'Sed id risus', 'Duis a mi fringilla mi', 2);
INSERT INTO atividade VALUES (47, 10, 40, '2018-07-14', '09:04:00', 'Quisque libero lacus,', 'Donec luctus aliquet odio. Etiam ligula tortor,', 7);
INSERT INTO atividade VALUES (48, 9, 5, '2016-08-25', '05:07:00', 'Nunc ullamcorper, velit', 'quam a felis ullamcorper viverra. Maecenas iaculis', 5);
INSERT INTO atividade VALUES (49, 8, 22, '2018-08-28', '08:03:00', 'metus sit', 'nascetur ridiculus mus. Proin vel', 1);
INSERT INTO atividade VALUES (50, 8, 33, '2016-12-09', '04:06:00', 'tempus', 'semper, dui lectus rutrum urna, nec luctus felis purus', 6);
INSERT INTO atividade VALUES (51, 7, 15, '2015-12-23', '07:12:00', 'turpis vitae purus gravida sagittis.', 'vitae', 1);
INSERT INTO atividade VALUES (52, 9, 9, '2017-12-22', '10:04:00', 'ornare, facilisis eget, ipsum. Donec', 'amet, risus. Donec', 1);
INSERT INTO atividade VALUES (53, 10, 44, '2016-06-28', '04:12:00', 'lacinia vitae, sodales', 'non leo. Vivamus', 4);
INSERT INTO atividade VALUES (54, 9, 14, '2017-07-23', '11:04:00', 'dolor egestas rhoncus.', 'eros non enim commodo hendrerit. Donec porttitor tellus non magna.', 6);
INSERT INTO atividade VALUES (55, 9, 4, '2016-04-12', '05:10:00', 'Nunc sed orci', 'diam lorem, auctor quis,', 2);
INSERT INTO atividade VALUES (56, 8, 39, '2017-01-29', '01:05:00', 'ipsum leo', 'molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est,', 4);
INSERT INTO atividade VALUES (57, 7, 34, '2017-10-12', '11:02:00', 'Integer vitae nibh.', 'sed orci lobortis augue scelerisque mollis.', 4);
INSERT INTO atividade VALUES (58, 10, 50, '2018-08-14', '03:04:00', 'orci quis lectus. Nullam suscipit,', 'convallis est, vitae', 7);
INSERT INTO atividade VALUES (59, 6, 2, '2015-10-05', '04:05:00', 'pharetra ut, pharetra', 'vestibulum nec,', 1);
INSERT INTO atividade VALUES (60, 8, 18, '2018-06-29', '06:12:00', 'Curabitur massa.', 'sodales nisi', 1);
INSERT INTO atividade VALUES (61, 6, 32, '2018-11-29', '01:06:00', 'Pellentesque tincidunt tempus', 'Curabitur sed tortor. Integer', 4);
INSERT INTO atividade VALUES (62, 10, 3, '2016-12-21', '11:07:00', 'dis parturient montes, nascetur ridiculus', 'quam.', 3);
INSERT INTO atividade VALUES (63, 7, 16, '2016-03-07', '01:02:00', 'luctus', 'sed pede nec ante', 4);
INSERT INTO atividade VALUES (64, 8, 33, '2017-03-01', '06:06:00', 'enim. Curabitur massa.', 'sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus', 7);
INSERT INTO atividade VALUES (65, 6, 8, '2018-03-18', '10:01:00', 'gravida. Praesent eu nulla at', 'lacus. Nulla tincidunt, neque vitae semper egestas, urna', 4);
INSERT INTO atividade VALUES (66, 6, 21, '2018-04-20', '11:02:00', 'Aliquam tincidunt, nunc ac mattis', 'scelerisque scelerisque dui. Suspendisse ac', 5);
INSERT INTO atividade VALUES (67, 8, 30, '2019-02-28', '07:08:00', 'nunc. In at pede. Cras', 'velit eget laoreet posuere, enim nisl elementum purus, accumsan', 3);
INSERT INTO atividade VALUES (68, 7, 33, '2017-12-14', '09:06:00', 'montes, nascetur ridiculus mus.', 'Duis sit amet', 5);
INSERT INTO atividade VALUES (69, 7, 46, '2019-01-16', '04:03:00', 'neque. Nullam nisl.', 'ornare,', 5);
INSERT INTO atividade VALUES (70, 10, 35, '2019-03-12', '06:09:00', 'Quisque ornare tortor at risus.', 'metus.', 7);
INSERT INTO atividade VALUES (71, 8, 29, '2016-05-24', '01:02:00', 'dapibus quam quis', 'parturient montes,', 7);
INSERT INTO atividade VALUES (72, 6, 17, '2018-11-08', '05:01:00', 'at', 'quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod', 8);
INSERT INTO atividade VALUES (73, 7, 10, '2019-05-17', '01:10:00', 'ut eros non', 'nec, leo.', 8);
INSERT INTO atividade VALUES (74, 6, 14, '2017-02-21', '12:02:00', 'sed tortor. Integer', 'felis. Donec tempor, est ac mattis semper, dui lectus rutrum', 8);
INSERT INTO atividade VALUES (75, 6, 17, '2017-05-25', '03:06:00', 'non massa non ante', 'ut, molestie in, tempus eu, ligula. Aenean euismod mauris', 6);
INSERT INTO atividade VALUES (76, 6, 27, '2018-12-15', '12:10:00', 'odio. Aliquam vulputate', 'in faucibus orci luctus et ultrices posuere cubilia Curae;', 4);
INSERT INTO atividade VALUES (77, 10, 35, '2018-11-05', '11:06:00', 'Vivamus non', 'Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo.', 6);
INSERT INTO atividade VALUES (78, 10, 47, '2015-12-24', '06:02:00', 'vitae aliquam eros turpis', 'gravida. Praesent', 2);
INSERT INTO atividade VALUES (79, 6, 33, '2019-01-18', '07:04:00', 'Aliquam', 'In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede', 7);
INSERT INTO atividade VALUES (80, 10, 3, '2018-03-08', '08:06:00', 'fringilla, porttitor vulputate,', 'pede ac urna. Ut tincidunt vehicula', 1);
INSERT INTO atividade VALUES (81, 8, 38, '2016-08-19', '01:04:00', 'nibh. Aliquam ornare,', 'a feugiat tellus lorem eu', 4);
INSERT INTO atividade VALUES (82, 7, 39, '2018-06-19', '11:11:00', 'Nunc', 'nunc interdum feugiat. Sed nec metus facilisis', 4);
INSERT INTO atividade VALUES (83, 10, 47, '2016-12-22', '07:06:00', 'tincidunt pede ac urna.', 'auctor velit. Aliquam nisl. Nulla eu', 2);
INSERT INTO atividade VALUES (84, 8, 27, '2018-06-13', '02:11:00', 'nunc', 'mus. Proin vel nisl. Quisque fringilla', 3);
INSERT INTO atividade VALUES (85, 6, 28, '2019-03-12', '01:03:00', 'suscipit, est ac', 'nunc sit amet metus.', 8);
INSERT INTO atividade VALUES (86, 9, 36, '2018-10-07', '09:05:00', 'aliquam arcu.', 'aliquet libero. Integer in magna.', 4);
INSERT INTO atividade VALUES (87, 6, 10, '2017-10-01', '03:12:00', 'facilisis vitae, orci. Phasellus dapibus', 'odio a', 1);
INSERT INTO atividade VALUES (88, 9, 8, '2016-12-13', '12:09:00', 'vitae, posuere', 'risus. Morbi metus. Vivamus euismod urna. Nullam', 6);
INSERT INTO atividade VALUES (89, 7, 44, '2018-10-20', '07:02:00', 'semper', 'quis accumsan convallis, ante lectus', 1);
INSERT INTO atividade VALUES (90, 9, 17, '2018-03-11', '04:08:00', 'Fusce mi lorem, vehicula et,', 'ipsum.', 5);
INSERT INTO atividade VALUES (91, 8, 31, '2017-11-09', '02:04:00', 'magna a tortor. Nunc commodo', 'risus, at fringilla purus mauris a nunc. In', 6);
INSERT INTO atividade VALUES (92, 10, 14, '2016-02-25', '09:10:00', 'ligula eu enim. Etiam imperdiet', 'mauris, rhoncus id, mollis nec,', 7);
INSERT INTO atividade VALUES (93, 6, 25, '2016-11-04', '01:01:00', 'pharetra. Quisque ac', 'Cras eget nisi dictum', 6);
INSERT INTO atividade VALUES (94, 10, 1, '2017-09-27', '06:01:00', 'nunc sed libero. Proin', 'id, libero. Donec consectetuer', 1);
INSERT INTO atividade VALUES (95, 7, 42, '2017-02-02', '12:10:00', 'commodo at, libero. Morbi', 'in lobortis tellus justo sit', 5);
INSERT INTO atividade VALUES (96, 7, 21, '2018-03-11', '08:07:00', 'non lorem', 'vitae aliquam eros turpis non enim. Mauris', 6);
INSERT INTO atividade VALUES (97, 6, 15, '2015-10-18', '06:10:00', 'in felis. Nulla', 'senectus et netus et malesuada fames ac turpis', 5);
INSERT INTO atividade VALUES (98, 6, 31, '2018-12-28', '05:06:00', 'hendrerit a,', 'adipiscing lacus. Ut nec urna et arcu', 5);
INSERT INTO atividade VALUES (99, 10, 32, '2017-08-05', '10:02:00', 'quis, tristique ac,', 'vel turpis. Aliquam adipiscing lobortis', 3);
INSERT INTO atividade VALUES (100, 10, 41, '2017-10-04', '04:07:00', 'dolor. Donec fringilla. Donec feugiat', 'est, congue a,', 2);
INSERT INTO atividade VALUES (101, 10, 17, '2017-07-06', '08:04:00', 'nec urna et arcu imperdiet', 'magnis dis parturient montes, nascetur ridiculus mus.', 2);
INSERT INTO atividade VALUES (102, 7, 30, '2017-12-06', '03:05:00', 'dictum augue malesuada malesuada.', 'adipiscing elit. Aliquam', 5);
INSERT INTO atividade VALUES (103, 10, 50, '2016-03-16', '05:04:00', 'varius', 'lectus. Nullam suscipit, est ac facilisis facilisis,', 2);
INSERT INTO atividade VALUES (104, 6, 40, '2016-04-28', '07:06:00', 'laoreet posuere, enim', 'eu arcu. Morbi sit amet massa. Quisque', 1);
INSERT INTO atividade VALUES (105, 10, 24, '2017-07-17', '09:04:00', 'vitae erat', 'vel arcu eu odio tristique pharetra. Quisque ac', 6);
INSERT INTO atividade VALUES (106, 8, 43, '2016-07-17', '01:05:00', 'Integer eu lacus. Quisque imperdiet,', 'lacus vestibulum lorem, sit amet', 3);
INSERT INTO atividade VALUES (107, 9, 33, '2018-11-09', '05:04:00', 'ornare sagittis felis. Donec tempor,', 'neque et nunc. Quisque ornare tortor at', 3);
INSERT INTO atividade VALUES (108, 7, 26, '2017-08-05', '10:05:00', 'Maecenas malesuada fringilla', 'elit, pharetra ut, pharetra', 4);
INSERT INTO atividade VALUES (109, 10, 14, '2018-10-14', '07:05:00', 'ac metus vitae', 'vel, convallis in, cursus et, eros. Proin ultrices.', 4);
INSERT INTO atividade VALUES (110, 8, 11, '2019-05-04', '09:06:00', 'lectus ante', 'enim', 6);
INSERT INTO atividade VALUES (111, 8, 42, '2017-08-12', '10:05:00', 'Suspendisse', 'ut mi. Duis risus odio,', 6);
INSERT INTO atividade VALUES (112, 6, 45, '2019-05-14', '08:06:00', 'bibendum. Donec felis orci, adipiscing', 'porttitor interdum. Sed auctor odio', 7);
INSERT INTO atividade VALUES (113, 9, 21, '2016-09-30', '06:04:00', 'Donec consectetuer', 'Nam ac nulla. In tincidunt congue turpis.', 3);
INSERT INTO atividade VALUES (114, 8, 30, '2015-11-24', '10:04:00', 'ac mattis velit justo nec', 'a odio semper cursus. Integer mollis. Integer tincidunt', 7);
INSERT INTO atividade VALUES (115, 10, 13, '2017-03-25', '04:03:00', 'Nullam velit dui,', 'penatibus', 4);
INSERT INTO atividade VALUES (116, 8, 33, '2017-06-03', '12:03:00', 'Donec', 'malesuada fames ac turpis egestas. Fusce', 2);
INSERT INTO atividade VALUES (117, 10, 27, '2019-01-07', '06:09:00', 'venenatis lacus. Etiam bibendum fermentum', 'Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum', 3);
INSERT INTO atividade VALUES (118, 9, 47, '2018-03-15', '07:04:00', 'magna. Cras convallis convallis', 'dapibus id, blandit at, nisi. Cum', 8);
INSERT INTO atividade VALUES (119, 7, 30, '2018-07-09', '07:11:00', 'vitae purus gravida sagittis. Duis', 'velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque', 4);
INSERT INTO atividade VALUES (120, 10, 4, '2017-03-17', '06:03:00', 'Ut sagittis lobortis mauris. Suspendisse', 'nunc est, mollis non, cursus non, egestas a,', 2);
INSERT INTO atividade VALUES (121, 7, 9, '2016-06-16', '11:01:00', 'pede, nonummy', 'tristique ac, eleifend vitae, erat. Vivamus nisi.', 7);
INSERT INTO atividade VALUES (122, 9, 30, '2019-02-03', '07:03:00', 'posuere', 'elit fermentum risus, at fringilla purus', 3);
INSERT INTO atividade VALUES (123, 6, 17, '2019-03-27', '07:10:00', 'diam. Sed', 'eu erat semper rutrum. Fusce dolor quam, elementum at, egestas', 5);
INSERT INTO atividade VALUES (124, 9, 22, '2016-05-24', '12:02:00', 'tristique', 'sed tortor. Integer aliquam adipiscing lacus.', 2);
INSERT INTO atividade VALUES (125, 7, 6, '2018-07-16', '03:12:00', 'Suspendisse sed', 'orci, consectetuer euismod', 6);
INSERT INTO atividade VALUES (126, 10, 4, '2017-10-19', '01:04:00', 'faucibus leo, in', 'Morbi quis urna. Nunc quis arcu vel', 7);
INSERT INTO atividade VALUES (127, 6, 27, '2016-10-10', '08:06:00', 'ornare.', 'nec ligula consectetuer rhoncus. Nullam velit dui, semper et,', 5);
INSERT INTO atividade VALUES (128, 9, 19, '2019-05-19', '10:09:00', 'rutrum', 'Integer vitae nibh. Donec est mauris, rhoncus id, mollis', 2);
INSERT INTO atividade VALUES (129, 7, 8, '2017-01-05', '05:02:00', 'nisi dictum', 'pede, malesuada vel,', 1);
INSERT INTO atividade VALUES (130, 8, 17, '2018-04-05', '02:06:00', 'rutrum eu, ultrices sit', 'Cum sociis natoque penatibus et', 1);
INSERT INTO atividade VALUES (131, 6, 2, '2017-07-15', '01:10:00', 'mollis vitae, posuere at, velit.', 'Nullam ut nisi a odio semper', 4);
INSERT INTO atividade VALUES (132, 8, 21, '2017-03-16', '06:03:00', 'Maecenas', 'tempor augue ac ipsum. Phasellus vitae mauris sit', 6);
INSERT INTO atividade VALUES (133, 9, 17, '2017-03-21', '09:07:00', 'sem ut dolor dapibus gravida.', 'Donec fringilla. Donec feugiat metus', 4);
INSERT INTO atividade VALUES (134, 9, 38, '2018-11-08', '01:06:00', 'Sed molestie. Sed', 'arcu', 7);
INSERT INTO atividade VALUES (135, 8, 31, '2016-10-29', '01:04:00', 'nec, eleifend non, dapibus rutrum,', 'eleifend egestas. Sed pharetra, felis eget varius', 7);
INSERT INTO atividade VALUES (136, 7, 45, '2019-03-18', '02:03:00', 'Phasellus elit', 'ligula consectetuer rhoncus. Nullam', 7);
INSERT INTO atividade VALUES (137, 6, 27, '2017-08-02', '06:11:00', 'lacinia orci, consectetuer', 'ornare lectus justo eu arcu. Morbi sit amet massa.', 5);
INSERT INTO atividade VALUES (138, 7, 22, '2019-05-15', '03:11:00', 'libero', 'dolor dolor,', 3);
INSERT INTO atividade VALUES (139, 7, 47, '2015-12-30', '04:12:00', 'cubilia', 'ante. Maecenas mi felis, adipiscing fringilla,', 3);
INSERT INTO atividade VALUES (140, 7, 38, '2017-01-01', '03:08:00', 'facilisis', 'penatibus et magnis dis parturient montes, nascetur', 1);
INSERT INTO atividade VALUES (141, 10, 34, '2018-08-30', '09:04:00', 'ut nisi a odio semper', 'ultrices a,', 7);
INSERT INTO atividade VALUES (142, 6, 31, '2018-01-25', '07:11:00', 'Maecenas malesuada fringilla', 'et,', 4);
INSERT INTO atividade VALUES (143, 6, 7, '2018-01-26', '09:12:00', 'adipiscing non, luctus sit', 'vulputate', 2);
INSERT INTO atividade VALUES (144, 9, 38, '2016-04-13', '05:12:00', 'Pellentesque ut ipsum', 'dapibus id, blandit at, nisi. Cum', 2);
INSERT INTO atividade VALUES (145, 6, 43, '2018-10-16', '10:03:00', 'rhoncus id,', 'vitae odio sagittis semper. Nam tempor', 2);
INSERT INTO atividade VALUES (146, 9, 22, '2018-06-17', '03:05:00', 'nec metus facilisis lorem tristique', 'turpis.', 2);
INSERT INTO atividade VALUES (147, 6, 45, '2018-07-17', '01:10:00', 'inceptos hymenaeos. Mauris ut', 'rutrum', 6);
INSERT INTO atividade VALUES (148, 6, 9, '2016-03-23', '11:02:00', 'tincidunt congue turpis. In condimentum.', 'rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at,', 5);
INSERT INTO atividade VALUES (149, 8, 43, '2016-08-26', '04:08:00', 'quis lectus. Nullam suscipit,', 'magna a neque. Nullam ut nisi a', 6);
INSERT INTO atividade VALUES (150, 7, 11, '2019-03-24', '01:09:00', 'ornare tortor at risus. Nunc', 'Nunc sollicitudin commodo ipsum. Suspendisse non leo.', 6);
INSERT INTO atividade VALUES (151, 9, 17, '2019-02-14', '07:03:00', 'nulla vulputate dui, nec tempus', 'orci, adipiscing non,', 1);
INSERT INTO atividade VALUES (152, 7, 40, '2017-10-13', '12:01:00', 'dignissim. Maecenas ornare egestas', 'urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus', 1);
INSERT INTO atividade VALUES (153, 10, 49, '2016-08-10', '01:07:00', 'ultrices a, auctor non,', 'non, bibendum sed, est. Nunc laoreet lectus quis massa.', 8);
INSERT INTO atividade VALUES (154, 8, 25, '2017-10-14', '03:05:00', 'orci luctus et ultrices', 'imperdiet dictum magna. Ut tincidunt orci quis', 6);
INSERT INTO atividade VALUES (155, 7, 27, '2016-09-26', '04:11:00', 'gravida non,', 'odio. Phasellus at augue id ante dictum cursus. Nunc', 7);
INSERT INTO atividade VALUES (156, 6, 32, '2017-01-16', '01:02:00', 'Quisque varius. Nam porttitor', 'magnis dis parturient montes, nascetur', 7);
INSERT INTO atividade VALUES (157, 7, 8, '2018-03-20', '11:06:00', 'lobortis. Class aptent taciti sociosqu', 'amet, risus.', 5);
INSERT INTO atividade VALUES (158, 10, 47, '2017-03-17', '01:05:00', 'eu tellus eu', 'ullamcorper magna. Sed eu eros.', 2);
INSERT INTO atividade VALUES (159, 6, 36, '2017-02-21', '12:09:00', 'quis accumsan convallis, ante lectus', 'Duis gravida. Praesent', 4);
INSERT INTO atividade VALUES (160, 6, 17, '2018-02-22', '09:05:00', 'Fusce mollis.', 'erat semper rutrum. Fusce dolor quam, elementum at, egestas a,', 5);
INSERT INTO atividade VALUES (161, 7, 28, '2016-01-19', '09:02:00', 'nulla vulputate', 'pellentesque eget, dictum placerat, augue. Sed molestie.', 1);
INSERT INTO atividade VALUES (162, 10, 38, '2016-08-19', '05:07:00', 'vitae erat vel', 'mollis. Phasellus libero mauris, aliquam eu, accumsan', 2);
INSERT INTO atividade VALUES (163, 6, 9, '2017-07-02', '03:02:00', 'posuere at,', 'mauris sit amet lorem semper auctor. Mauris vel turpis.', 6);
INSERT INTO atividade VALUES (164, 6, 18, '2016-03-21', '08:12:00', 'lorem', 'dictum eleifend, nunc risus varius orci, in', 4);
INSERT INTO atividade VALUES (166, 9, 37, '2018-01-15', '03:09:00', 'enim. Etiam gravida molestie', 'urna. Nullam lobortis quam a', 3);
INSERT INTO atividade VALUES (167, 6, 21, '2017-08-21', '03:07:00', 'auctor non, feugiat', 'vulputate velit eu sem. Pellentesque ut', 5);
INSERT INTO atividade VALUES (168, 8, 1, '2017-12-09', '03:01:00', 'pretium et,', 'non, luctus sit amet,', 7);
INSERT INTO atividade VALUES (169, 6, 44, '2016-11-14', '07:02:00', 'semper pretium', 'eget massa. Suspendisse eleifend.', 6);
INSERT INTO atividade VALUES (170, 7, 45, '2017-07-30', '04:05:00', 'non arcu. Vivamus', 'Pellentesque tincidunt tempus risus. Donec egestas. Duis', 5);
INSERT INTO atividade VALUES (171, 6, 32, '2016-12-01', '07:03:00', 'sed pede. Cum sociis natoque', 'libero', 6);
INSERT INTO atividade VALUES (172, 9, 8, '2016-12-24', '01:05:00', 'ac', 'Cras eu', 6);
INSERT INTO atividade VALUES (42, 11, 14, '2016-10-14', '01:01:00', 'sodales nisi magna', 'velit dui,', 1);
INSERT INTO atividade VALUES (173, 8, 45, '2018-07-18', '07:07:00', 'leo, in lobortis', 'Etiam ligula tortor, dictum eu, placerat eget, venenatis', 3);
INSERT INTO atividade VALUES (174, 6, 10, '2017-01-30', '07:01:00', 'urna,', 'ultricies', 5);
INSERT INTO atividade VALUES (175, 9, 41, '2016-10-16', '04:03:00', 'neque sed', 'Aliquam nec enim. Nunc ut', 2);
INSERT INTO atividade VALUES (176, 8, 22, '2017-01-25', '11:04:00', 'nec enim. Nunc ut erat.', 'Curabitur sed tortor. Integer aliquam adipiscing', 2);
INSERT INTO atividade VALUES (177, 9, 23, '2016-08-21', '08:08:00', 'pede, ultrices a, auctor non,', 'sapien molestie orci tincidunt', 8);
INSERT INTO atividade VALUES (178, 6, 4, '2018-04-09', '12:10:00', 'dictum placerat,', 'torquent per conubia', 6);
INSERT INTO atividade VALUES (179, 7, 41, '2016-05-25', '11:06:00', 'quam quis', 'nunc sed libero. Proin sed turpis nec', 8);
INSERT INTO atividade VALUES (180, 6, 33, '2018-02-14', '08:04:00', 'eleifend', 'Quisque', 6);
INSERT INTO atividade VALUES (181, 9, 46, '2018-09-13', '06:05:00', 'amet, faucibus ut, nulla. Cras', 'eu tellus. Phasellus elit', 7);
INSERT INTO atividade VALUES (182, 9, 46, '2015-12-10', '10:03:00', 'turpis egestas. Aliquam fringilla', 'mollis lectus pede et risus. Quisque libero lacus, varius et,', 1);
INSERT INTO atividade VALUES (183, 7, 8, '2016-05-20', '10:04:00', 'dictum augue malesuada malesuada. Integer', 'in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris', 5);
INSERT INTO atividade VALUES (184, 8, 38, '2016-12-17', '07:04:00', 'tellus. Phasellus elit', 'mauris id sapien. Cras', 2);
INSERT INTO atividade VALUES (185, 8, 28, '2017-10-03', '06:10:00', 'eu nulla at sem molestie', 'metus urna convallis erat, eget', 5);
INSERT INTO atividade VALUES (186, 10, 13, '2015-11-14', '09:04:00', 'Duis dignissim', 'metus eu', 4);
INSERT INTO atividade VALUES (187, 6, 47, '2019-04-30', '02:01:00', 'et, lacinia vitae,', 'erat', 8);
INSERT INTO atividade VALUES (188, 6, 29, '2016-05-24', '02:07:00', 'in lobortis tellus', 'accumsan sed, facilisis vitae,', 2);
INSERT INTO atividade VALUES (189, 9, 35, '2016-11-18', '05:01:00', 'ante dictum', 'mi pede, nonummy', 3);
INSERT INTO atividade VALUES (190, 9, 42, '2019-05-26', '03:11:00', 'nec, eleifend non, dapibus rutrum,', 'facilisis', 1);
INSERT INTO atividade VALUES (191, 7, 18, '2019-06-02', '02:03:00', 'et, lacinia vitae,', 'mollis. Phasellus libero', 6);
INSERT INTO atividade VALUES (192, 7, 22, '2016-08-12', '08:05:00', 'turpis. Nulla aliquet.', 'pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna.', 8);
INSERT INTO atividade VALUES (193, 7, 9, '2018-04-08', '04:03:00', 'sit amet,', 'convallis erat, eget tincidunt dui augue eu tellus. Phasellus', 2);
INSERT INTO atividade VALUES (194, 6, 42, '2016-01-20', '12:11:00', 'sodales elit erat', 'magna sed dui. Fusce aliquam, enim nec', 3);
INSERT INTO atividade VALUES (195, 9, 40, '2017-07-06', '12:04:00', 'interdum. Nunc sollicitudin', 'odio, auctor', 3);
INSERT INTO atividade VALUES (196, 8, 2, '2017-06-26', '10:11:00', 'tristique aliquet. Phasellus fermentum convallis', 'vestibulum. Mauris magna. Duis dignissim', 2);
INSERT INTO atividade VALUES (197, 8, 34, '2016-06-18', '08:12:00', 'nulla', 'Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet.', 7);
INSERT INTO atividade VALUES (198, 9, 1, '2016-09-14', '08:06:00', 'adipiscing elit. Etiam laoreet, libero', 'non, luctus sit amet, faucibus ut, nulla. Cras eu', 5);
INSERT INTO atividade VALUES (199, 8, 46, '2016-04-27', '05:02:00', 'Nulla facilisi. Sed neque. Sed', 'Sed diam lorem, auctor quis, tristique ac, eleifend', 2);
INSERT INTO atividade VALUES (200, 10, 17, '2015-10-16', '11:12:00', 'lorem lorem, luctus', 'eleifend. Cras sed leo.', 1);
INSERT INTO atividade VALUES (1, 15, 49, '2018-04-10', '01:09:00', 'litora', 'Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem', 1);
INSERT INTO atividade VALUES (2, 13, 38, '2018-07-14', '07:12:00', 'in felis. Nulla tempor', 'neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec', 8);
INSERT INTO atividade VALUES (3, 13, 8, '2019-02-12', '10:12:00', 'nonummy ipsum non', 'orci.', 3);
INSERT INTO atividade VALUES (4, 14, 43, '2017-01-25', '04:01:00', 'Ut tincidunt orci', 'Curabitur consequat,', 7);
INSERT INTO atividade VALUES (5, 13, 16, '2018-02-10', '11:01:00', 'viverra. Maecenas iaculis aliquet diam.', 'et pede. Nunc', 5);
INSERT INTO atividade VALUES (6, 15, 20, '2019-04-30', '08:12:00', 'risus varius orci, in', 'neque vitae', 5);
INSERT INTO atividade VALUES (7, 15, 5, '2018-11-25', '11:05:00', 'ac mattis semper,', 'sagittis. Duis gravida.', 5);
INSERT INTO atividade VALUES (8, 12, 32, '2019-02-03', '07:01:00', 'vitae, orci. Phasellus dapibus quam', 'rutrum lorem ac risus. Morbi', 6);
INSERT INTO atividade VALUES (9, 14, 13, '2018-03-28', '03:04:00', 'euismod mauris eu', 'Vivamus euismod urna. Nullam lobortis quam', 5);
INSERT INTO atividade VALUES (10, 15, 21, '2016-09-20', '10:10:00', 'tristique', 'a feugiat tellus lorem eu metus. In lorem.', 2);
INSERT INTO atividade VALUES (11, 15, 12, '2019-01-18', '01:05:00', 'Sed pharetra, felis eget varius', 'orci, adipiscing non, luctus', 3);
INSERT INTO atividade VALUES (12, 13, 31, '2018-03-05', '11:11:00', 'eros. Proin ultrices. Duis volutpat', 'dui, in sodales', 8);
INSERT INTO atividade VALUES (13, 14, 8, '2019-03-16', '01:02:00', 'scelerisque neque. Nullam', 'magna a neque. Nullam', 5);
INSERT INTO atividade VALUES (14, 15, 22, '2017-06-11', '09:12:00', 'ornare,', 'lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus', 5);
INSERT INTO atividade VALUES (15, 14, 10, '2018-11-08', '11:06:00', 'augue malesuada malesuada. Integer id', 'blandit viverra. Donec tempus, lorem', 4);
INSERT INTO atividade VALUES (16, 14, 6, '2016-07-23', '08:07:00', 'pharetra. Quisque ac libero', 'facilisis facilisis, magna tellus faucibus leo, in lobortis', 2);
INSERT INTO atividade VALUES (17, 15, 20, '2016-05-10', '06:07:00', 'et', 'arcu ac orci. Ut semper pretium', 1);
INSERT INTO atividade VALUES (18, 15, 39, '2019-02-15', '06:12:00', 'varius et, euismod et,', 'elementum, lorem ut', 6);
INSERT INTO atividade VALUES (19, 11, 11, '2018-04-23', '05:06:00', 'Donec tempus,', 'Proin eget odio. Aliquam vulputate', 2);
INSERT INTO atividade VALUES (20, 15, 39, '2016-12-12', '12:07:00', 'leo, in lobortis tellus', 'nec tellus. Nunc lectus pede, ultrices a, auctor non,', 8);
INSERT INTO atividade VALUES (21, 13, 46, '2016-10-16', '09:04:00', 'blandit', 'risus. Donec egestas. Duis', 2);
INSERT INTO atividade VALUES (22, 15, 50, '2016-05-17', '04:09:00', 'a, magna.', 'sem elit, pharetra ut, pharetra sed, hendrerit a,', 6);
INSERT INTO atividade VALUES (23, 15, 41, '2019-03-05', '12:02:00', 'nec urna', 'vestibulum', 6);
INSERT INTO atividade VALUES (24, 13, 40, '2017-08-26', '01:06:00', 'vitae, posuere at, velit. Cras', 'felis purus ac tellus. Suspendisse sed', 7);
INSERT INTO atividade VALUES (25, 13, 41, '2017-04-07', '09:01:00', 'egestas a, scelerisque sed,', 'mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate,', 5);
INSERT INTO atividade VALUES (26, 11, 11, '2018-05-29', '04:10:00', 'egestas blandit. Nam nulla magna,', 'fringilla. Donec', 6);
INSERT INTO atividade VALUES (27, 15, 5, '2019-06-02', '09:10:00', 'vulputate, posuere', 'magna a tortor. Nunc commodo auctor velit. Aliquam nisl.', 8);
INSERT INTO atividade VALUES (28, 15, 18, '2017-03-05', '09:05:00', 'ornare lectus justo eu', 'sit amet,', 5);
INSERT INTO atividade VALUES (29, 14, 1, '2016-02-02', '04:01:00', 'nibh. Donec', 'dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum.', 2);
INSERT INTO atividade VALUES (30, 13, 6, '2019-04-13', '03:07:00', 'rutrum, justo. Praesent luctus.', 'lectus. Nullam suscipit, est', 4);
INSERT INTO atividade VALUES (31, 13, 37, '2016-12-21', '02:01:00', 'luctus', 'Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis,', 4);
INSERT INTO atividade VALUES (32, 14, 3, '2018-08-12', '03:03:00', 'sapien, cursus', 'enim nisl elementum purus, accumsan', 8);
INSERT INTO atividade VALUES (33, 13, 26, '2015-11-13', '03:01:00', 'rhoncus. Proin nisl', 'nunc. In at pede. Cras vulputate', 4);
INSERT INTO atividade VALUES (34, 12, 50, '2017-04-24', '01:07:00', 'malesuada vel, convallis', 'dis parturient', 4);
INSERT INTO atividade VALUES (35, 13, 47, '2018-05-14', '05:10:00', 'tellus, imperdiet non, vestibulum nec,', 'blandit. Nam nulla magna, malesuada vel, convallis', 4);
INSERT INTO atividade VALUES (36, 13, 12, '2018-09-09', '06:05:00', 'aliquet, sem ut cursus luctus,', 'Aliquam ornare, libero', 6);
INSERT INTO atividade VALUES (37, 14, 15, '2017-05-16', '07:11:00', 'ultrices posuere cubilia Curae;', 'risus. Nulla eget metus eu erat semper rutrum.', 4);
INSERT INTO atividade VALUES (38, 12, 43, '2016-12-07', '03:03:00', 'montes, nascetur ridiculus mus. Aenean', 'semper egestas, urna justo faucibus lectus, a sollicitudin orci', 5);
INSERT INTO atividade VALUES (39, 15, 37, '2019-01-30', '05:07:00', 'eleifend. Cras sed leo. Cras', 'Donec vitae erat vel pede blandit congue.', 4);
INSERT INTO atividade VALUES (40, 12, 31, '2018-11-05', '04:05:00', 'Suspendisse sagittis. Nullam vitae diam.', 'eu, placerat eget, venenatis a, magna. Lorem ipsum dolor', 8);
INSERT INTO atividade VALUES (41, 11, 4, '2018-06-26', '06:03:00', 'pellentesque, tellus sem mollis', 'nisl sem, consequat nec,', 1);
INSERT INTO atividade VALUES (43, 15, 38, '2017-01-07', '02:05:00', 'justo nec ante. Maecenas', 'nunc sed libero. Proin sed', 3);
INSERT INTO atividade VALUES (44, 11, 15, '2018-04-20', '02:08:00', 'orci, adipiscing non, luctus', 'justo sit amet nulla. Donec non justo. Proin non', 2);
INSERT INTO atividade VALUES (45, 14, 20, '2018-12-24', '09:10:00', 'sem.', 'pede blandit congue. In scelerisque', 5);
INSERT INTO atividade VALUES (46, 15, 50, '2019-04-29', '11:09:00', 'Proin mi. Aliquam gravida', 'feugiat metus sit', 4);
INSERT INTO atividade VALUES (47, 12, 24, '2016-01-30', '06:12:00', 'velit. Pellentesque ultricies', 'id ante dictum', 3);
INSERT INTO atividade VALUES (48, 14, 37, '2018-01-29', '09:02:00', 'eu metus. In lorem.', 'iaculis', 3);
INSERT INTO atividade VALUES (49, 15, 49, '2016-04-03', '06:06:00', 'massa non ante', 'magna. Praesent interdum ligula', 4);
INSERT INTO atividade VALUES (50, 15, 17, '2017-08-11', '09:12:00', 'iaculis', 'sit amet ultricies sem', 5);
INSERT INTO atividade VALUES (51, 13, 40, '2017-10-06', '06:12:00', 'commodo', 'enim. Etiam imperdiet', 3);
INSERT INTO atividade VALUES (52, 13, 39, '2018-01-24', '03:11:00', 'Maecenas libero est,', 'ac ipsum. Phasellus vitae mauris', 1);
INSERT INTO atividade VALUES (53, 13, 28, '2019-01-22', '03:09:00', 'justo faucibus', 'tellus id nunc interdum feugiat. Sed', 1);
INSERT INTO atividade VALUES (54, 15, 18, '2017-01-15', '09:04:00', 'arcu ac orci.', 'egestas hendrerit neque. In ornare sagittis felis.', 3);
INSERT INTO atividade VALUES (55, 15, 8, '2019-02-23', '05:03:00', 'Proin sed turpis nec mauris', 'elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum', 4);
INSERT INTO atividade VALUES (56, 12, 30, '2016-10-29', '10:02:00', 'Nunc commodo auctor velit.', 'lacus. Aliquam rutrum lorem', 7);
INSERT INTO atividade VALUES (57, 15, 28, '2017-04-21', '09:11:00', 'urna. Nullam lobortis quam a', 'id,', 7);
INSERT INTO atividade VALUES (58, 14, 46, '2018-09-28', '12:10:00', 'eu, ultrices sit amet,', 'ipsum primis in', 2);
INSERT INTO atividade VALUES (59, 15, 36, '2018-04-04', '06:06:00', 'ornare, lectus ante', 'enim, gravida sit amet, dapibus id, blandit at, nisi.', 4);
INSERT INTO atividade VALUES (60, 15, 26, '2019-06-04', '06:06:00', 'metus eu erat semper rutrum.', 'dui,', 6);
INSERT INTO atividade VALUES (61, 13, 6, '2019-04-20', '10:05:00', 'sit amet massa.', 'enim diam vel arcu. Curabitur ut odio', 6);
INSERT INTO atividade VALUES (62, 14, 29, '2017-05-14', '10:07:00', 'iaculis aliquet diam.', 'Mauris vel turpis. Aliquam adipiscing', 7);
INSERT INTO atividade VALUES (63, 14, 22, '2018-10-22', '01:01:00', 'dis', 'pede. Praesent', 5);
INSERT INTO atividade VALUES (64, 11, 8, '2017-05-07', '04:01:00', 'a', 'mauris, aliquam eu, accumsan sed, facilisis vitae,', 7);
INSERT INTO atividade VALUES (65, 14, 41, '2018-08-29', '03:01:00', 'in, tempus eu,', 'molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est,', 5);
INSERT INTO atividade VALUES (66, 13, 31, '2016-12-05', '08:03:00', 'at', 'cursus et,', 6);
INSERT INTO atividade VALUES (67, 14, 40, '2017-04-17', '08:08:00', 'justo faucibus lectus,', 'leo, in lobortis', 1);
INSERT INTO atividade VALUES (68, 12, 13, '2019-02-10', '06:09:00', 'Nullam lobortis quam a', 'luctus aliquet odio. Etiam', 2);
INSERT INTO atividade VALUES (69, 11, 42, '2018-07-17', '04:11:00', 'at', 'dolor, tempus non, lacinia at, iaculis quis,', 1);
INSERT INTO atividade VALUES (70, 13, 41, '2016-12-03', '06:03:00', 'metus. In nec', 'ultrices. Vivamus rhoncus. Donec est.', 4);
INSERT INTO atividade VALUES (71, 13, 15, '2018-12-15', '07:03:00', 'eget,', 'Cras', 6);
INSERT INTO atividade VALUES (72, 12, 8, '2018-02-19', '10:06:00', 'malesuada vel, venenatis vel,', 'eleifend, nunc risus varius orci,', 8);
INSERT INTO atividade VALUES (73, 14, 11, '2018-04-22', '11:09:00', 'Nullam', 'arcu.', 6);
INSERT INTO atividade VALUES (74, 14, 44, '2018-03-15', '09:06:00', 'nonummy ut, molestie in,', 'urna suscipit nonummy. Fusce fermentum fermentum arcu.', 3);
INSERT INTO atividade VALUES (75, 11, 46, '2016-09-16', '02:08:00', 'lacus. Etiam bibendum fermentum', 'arcu ac', 8);
INSERT INTO atividade VALUES (76, 12, 14, '2017-07-26', '05:04:00', 'justo. Praesent luctus.', 'nec tellus. Nunc lectus pede,', 2);
INSERT INTO atividade VALUES (77, 15, 37, '2016-12-28', '11:11:00', 'urna', 'nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra.', 4);
INSERT INTO atividade VALUES (78, 15, 28, '2018-07-13', '03:03:00', 'magnis', 'lorem. Donec elementum, lorem ut', 7);
INSERT INTO atividade VALUES (79, 11, 3, '2018-02-11', '03:04:00', 'turpis', 'pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac', 7);
INSERT INTO atividade VALUES (80, 11, 27, '2016-12-20', '07:09:00', 'ut odio vel est', 'ac arcu. Nunc mauris. Morbi non sapien molestie', 8);
INSERT INTO atividade VALUES (81, 12, 30, '2017-12-10', '10:09:00', 'convallis', 'eget, ipsum. Donec sollicitudin', 6);
INSERT INTO atividade VALUES (82, 12, 33, '2016-02-04', '01:01:00', 'Cras', 'nostra, per inceptos', 8);
INSERT INTO atividade VALUES (83, 14, 6, '2018-02-20', '03:02:00', 'ac orci. Ut semper', 'Quisque libero', 7);
INSERT INTO atividade VALUES (84, 11, 36, '2018-02-21', '03:05:00', 'tellus. Nunc lectus pede,', 'porttitor scelerisque neque.', 6);
INSERT INTO atividade VALUES (85, 11, 34, '2018-01-04', '10:04:00', 'faucibus orci luctus et', 'Quisque libero lacus,', 3);
INSERT INTO atividade VALUES (86, 13, 11, '2016-07-16', '06:10:00', 'erat neque non quam. Pellentesque', 'malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras', 1);
INSERT INTO atividade VALUES (87, 11, 15, '2016-05-29', '03:08:00', 'auctor velit. Aliquam nisl. Nulla', 'luctus et ultrices posuere', 4);
INSERT INTO atividade VALUES (88, 13, 32, '2018-12-03', '12:08:00', 'et magnis', 'dictum mi, ac mattis', 8);
INSERT INTO atividade VALUES (89, 13, 16, '2017-08-07', '05:07:00', 'magna. Praesent interdum ligula', 'dui quis accumsan convallis, ante lectus convallis est, vitae sodales', 7);
INSERT INTO atividade VALUES (90, 12, 18, '2017-04-06', '07:04:00', 'at', 'mi. Aliquam gravida mauris ut mi.', 6);
INSERT INTO atividade VALUES (91, 13, 50, '2016-02-13', '02:08:00', 'Aenean egestas hendrerit neque.', 'erat vel pede', 2);
INSERT INTO atividade VALUES (92, 14, 24, '2018-07-21', '01:04:00', 'eu, ligula. Aenean', 'feugiat', 8);
INSERT INTO atividade VALUES (93, 13, 38, '2018-03-28', '06:11:00', 'nec, euismod in, dolor. Fusce', 'faucibus', 5);
INSERT INTO atividade VALUES (94, 11, 4, '2017-05-25', '10:04:00', 'amet ornare', 'dui quis accumsan convallis, ante', 1);
INSERT INTO atividade VALUES (95, 15, 22, '2015-12-09', '12:11:00', 'Proin velit. Sed malesuada', 'dis parturient montes, nascetur ridiculus', 8);
INSERT INTO atividade VALUES (96, 14, 13, '2018-05-20', '07:04:00', 'viverra.', 'elit pede, malesuada vel, venenatis vel, faucibus id,', 5);
INSERT INTO atividade VALUES (97, 15, 23, '2018-05-17', '06:03:00', 'et ultrices posuere', 'et magnis dis', 2);
INSERT INTO atividade VALUES (98, 12, 47, '2019-05-08', '05:07:00', 'lacus. Aliquam rutrum lorem', 'Phasellus at augue id ante dictum cursus. Nunc mauris elit,', 6);
INSERT INTO atividade VALUES (99, 13, 32, '2018-07-30', '02:10:00', 'Quisque varius. Nam porttitor', 'fringilla', 7);
INSERT INTO atividade VALUES (100, 13, 3, '2018-07-31', '05:07:00', 'sem. Nulla interdum. Curabitur', 'nulla. In tincidunt congue', 5);
INSERT INTO atividade VALUES (101, 11, 18, '2016-11-27', '07:02:00', 'eu', 'ut eros non enim commodo hendrerit. Donec porttitor tellus', 1);
INSERT INTO atividade VALUES (102, 11, 45, '2018-11-13', '01:06:00', 'enim, condimentum', 'a neque. Nullam ut nisi a odio semper cursus.', 6);
INSERT INTO atividade VALUES (103, 15, 13, '2019-02-10', '08:05:00', 'et ultrices', 'fames ac turpis egestas. Fusce aliquet magna a neque.', 5);
INSERT INTO atividade VALUES (104, 15, 30, '2018-07-18', '11:07:00', 'ut odio', 'diam. Pellentesque habitant morbi tristique senectus et', 5);
INSERT INTO atividade VALUES (105, 15, 40, '2017-10-07', '01:06:00', 'vitae,', 'adipiscing. Mauris', 7);
INSERT INTO atividade VALUES (106, 15, 43, '2018-03-03', '11:09:00', 'diam nunc, ullamcorper eu, euismod', 'a, aliquet vel, vulputate eu, odio. Phasellus at', 3);
INSERT INTO atividade VALUES (107, 13, 13, '2016-10-17', '07:01:00', 'semper egestas, urna justo faucibus', 'nec, mollis vitae, posuere at,', 6);
INSERT INTO atividade VALUES (108, 12, 16, '2019-05-24', '01:05:00', 'et magnis', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur', 7);
INSERT INTO atividade VALUES (109, 13, 36, '2018-04-16', '10:06:00', 'mattis semper,', 'et ipsum cursus vestibulum. Mauris', 4);
INSERT INTO atividade VALUES (110, 14, 43, '2018-02-05', '06:01:00', 'nunc sed', 'enim consequat purus. Maecenas libero est, congue a,', 5);
INSERT INTO atividade VALUES (111, 13, 17, '2016-08-21', '05:05:00', 'Nunc pulvinar arcu et', 'orci, consectetuer euismod est arcu ac', 4);
INSERT INTO atividade VALUES (112, 11, 48, '2018-03-26', '08:09:00', 'augue', 'montes, nascetur ridiculus', 7);
INSERT INTO atividade VALUES (113, 11, 49, '2018-11-30', '03:07:00', 'Nunc quis arcu', 'felis, adipiscing fringilla, porttitor vulputate, posuere vulputate,', 2);
INSERT INTO atividade VALUES (114, 11, 25, '2017-09-19', '05:05:00', 'consectetuer adipiscing elit. Etiam', 'Suspendisse dui. Fusce diam', 3);
INSERT INTO atividade VALUES (115, 11, 7, '2015-12-11', '02:05:00', 'dapibus id, blandit at, nisi.', 'non justo. Proin non massa', 5);
INSERT INTO atividade VALUES (116, 11, 16, '2017-01-24', '08:08:00', 'consequat', 'nisi. Aenean eget', 5);
INSERT INTO atividade VALUES (117, 13, 21, '2017-12-28', '08:11:00', 'pellentesque massa', 'libero. Morbi accumsan laoreet', 4);
INSERT INTO atividade VALUES (118, 11, 42, '2019-03-03', '10:01:00', 'Cras lorem lorem, luctus', 'non sapien molestie orci', 1);
INSERT INTO atividade VALUES (119, 14, 12, '2015-12-15', '09:10:00', 'tincidunt. Donec', 'nonummy ut, molestie in,', 2);
INSERT INTO atividade VALUES (120, 15, 41, '2018-05-07', '09:05:00', 'neque sed sem egestas blandit.', 'purus mauris', 8);
INSERT INTO atividade VALUES (121, 12, 45, '2019-02-08', '05:12:00', 'gravida. Aliquam tincidunt,', 'lectus sit amet luctus', 5);
INSERT INTO atividade VALUES (122, 14, 40, '2016-12-10', '03:05:00', 'amet,', 'Donec consectetuer mauris id sapien. Cras dolor', 1);
INSERT INTO atividade VALUES (123, 15, 46, '2017-12-01', '04:01:00', 'montes,', 'risus varius', 4);
INSERT INTO atividade VALUES (124, 13, 32, '2016-10-04', '12:09:00', 'sociis natoque penatibus et', 'in consequat enim diam vel', 2);
INSERT INTO atividade VALUES (125, 13, 13, '2019-05-22', '12:12:00', 'euismod', 'arcu vel', 8);
INSERT INTO atividade VALUES (126, 13, 31, '2017-07-01', '11:04:00', 'blandit enim consequat', 'iaculis nec, eleifend non, dapibus', 8);
INSERT INTO atividade VALUES (127, 11, 9, '2016-09-17', '05:07:00', 'lacus. Quisque purus sapien, gravida', 'et', 6);
INSERT INTO atividade VALUES (128, 12, 24, '2016-11-19', '08:11:00', 'sagittis.', 'vel lectus.', 1);
INSERT INTO atividade VALUES (129, 13, 6, '2017-05-25', '01:02:00', 'Duis gravida.', 'dictum eleifend, nunc risus', 2);
INSERT INTO atividade VALUES (130, 13, 8, '2018-08-31', '02:04:00', 'pharetra', 'Duis dignissim tempor arcu. Vestibulum ut eros non', 2);
INSERT INTO atividade VALUES (131, 11, 6, '2019-05-30', '11:03:00', 'Vestibulum', 'dapibus quam quis', 2);
INSERT INTO atividade VALUES (132, 12, 6, '2016-03-12', '04:02:00', 'elit pede, malesuada vel, venenatis', 'Vivamus nibh dolor, nonummy ac, feugiat', 4);
INSERT INTO atividade VALUES (133, 14, 32, '2018-01-30', '02:01:00', 'risus. Donec egestas.', 'et ultrices posuere cubilia Curae; Donec tincidunt. Donec', 4);
INSERT INTO atividade VALUES (134, 11, 9, '2017-02-18', '09:05:00', 'imperdiet dictum magna.', 'tellus. Phasellus elit pede,', 5);
INSERT INTO atividade VALUES (135, 11, 10, '2016-08-09', '02:08:00', 'lorem, luctus ut, pellentesque', 'diam. Proin dolor. Nulla', 4);
INSERT INTO atividade VALUES (136, 13, 41, '2017-10-11', '12:06:00', 'Proin mi. Aliquam gravida', 'non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet,', 5);
INSERT INTO atividade VALUES (137, 13, 29, '2015-11-07', '05:05:00', 'Nulla facilisi. Sed neque. Sed', 'felis orci,', 4);
INSERT INTO atividade VALUES (138, 15, 9, '2015-11-23', '11:02:00', 'adipiscing lacus. Ut nec urna', 'et, rutrum eu, ultrices', 5);
INSERT INTO atividade VALUES (139, 14, 7, '2016-02-08', '06:09:00', 'arcu.', 'Donec elementum, lorem ut', 8);
INSERT INTO atividade VALUES (140, 14, 30, '2017-06-27', '12:03:00', 'facilisi. Sed neque.', 'Duis gravida. Praesent eu nulla', 2);
INSERT INTO atividade VALUES (141, 12, 39, '2018-12-04', '10:12:00', 'et malesuada fames ac', 'eget ipsum. Suspendisse sagittis.', 1);
INSERT INTO atividade VALUES (142, 13, 11, '2016-04-12', '01:11:00', 'ut odio vel', 'Suspendisse aliquet molestie tellus.', 4);
INSERT INTO atividade VALUES (143, 14, 50, '2017-07-22', '12:04:00', 'Mauris', 'adipiscing lobortis', 1);
INSERT INTO atividade VALUES (144, 13, 2, '2016-05-25', '01:09:00', 'et', 'id, blandit at, nisi. Cum sociis natoque', 3);
INSERT INTO atividade VALUES (145, 11, 34, '2019-04-29', '08:02:00', 'Maecenas malesuada fringilla', 'rhoncus. Proin nisl sem, consequat', 2);
INSERT INTO atividade VALUES (146, 14, 50, '2018-07-19', '06:03:00', 'Duis mi', 'magna, malesuada', 7);
INSERT INTO atividade VALUES (147, 13, 18, '2017-09-04', '04:05:00', 'enim,', 'velit. Cras lorem lorem,', 6);
INSERT INTO atividade VALUES (148, 13, 23, '2016-02-22', '09:09:00', 'lacus, varius et, euismod', 'porta elit, a feugiat tellus', 8);
INSERT INTO atividade VALUES (149, 11, 18, '2016-04-20', '02:07:00', 'libero est,', 'nisi', 5);
INSERT INTO atividade VALUES (150, 13, 48, '2019-01-07', '03:07:00', 'sociosqu ad litora torquent per', 'egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio.', 5);
INSERT INTO atividade VALUES (151, 11, 49, '2017-04-20', '07:08:00', 'quis urna.', 'nisl. Quisque fringilla euismod', 1);
INSERT INTO atividade VALUES (152, 14, 39, '2017-06-12', '02:02:00', 'Aliquam nec enim. Nunc', 'in consequat enim', 8);
INSERT INTO atividade VALUES (153, 14, 14, '2015-11-18', '04:02:00', 'felis eget varius ultrices, mauris', 'in felis. Nulla tempor augue ac ipsum.', 8);
INSERT INTO atividade VALUES (154, 14, 45, '2017-01-12', '08:10:00', 'mollis non, cursus', 'urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas', 3);
INSERT INTO atividade VALUES (155, 14, 24, '2016-09-05', '11:04:00', 'semper erat, in consectetuer ipsum', 'hymenaeos. Mauris ut quam vel', 5);
INSERT INTO atividade VALUES (156, 14, 40, '2019-01-03', '02:07:00', 'lacus. Nulla tincidunt, neque', 'lectus justo eu arcu. Morbi sit', 5);
INSERT INTO atividade VALUES (157, 14, 37, '2018-04-18', '01:11:00', 'rutrum urna, nec', 'est tempor bibendum. Donec felis orci, adipiscing non, luctus sit', 3);
INSERT INTO atividade VALUES (158, 14, 32, '2016-12-19', '07:11:00', 'posuere at,', 'metus. Aliquam erat volutpat. Nulla facilisis.', 3);
INSERT INTO atividade VALUES (159, 12, 12, '2017-01-25', '03:11:00', 'Vivamus non lorem vitae', 'metus. Aenean sed pede nec ante blandit', 1);
INSERT INTO atividade VALUES (160, 11, 47, '2018-04-01', '09:08:00', 'lorem, eget mollis lectus', 'tempus risus. Donec egestas. Duis ac arcu. Nunc', 3);
INSERT INTO atividade VALUES (161, 12, 29, '2018-09-09', '07:07:00', 'semper cursus. Integer mollis.', 'Nunc mauris. Morbi non', 5);
INSERT INTO atividade VALUES (162, 12, 37, '2017-07-09', '04:02:00', 'sem ut dolor dapibus gravida.', 'mauris eu elit. Nulla', 2);
INSERT INTO atividade VALUES (163, 15, 5, '2017-12-06', '06:05:00', 'eu dolor egestas', 'mollis. Duis sit amet', 3);
INSERT INTO atividade VALUES (164, 11, 45, '2016-01-03', '09:08:00', 'sem, vitae', 'Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae,', 1);
INSERT INTO atividade VALUES (165, 13, 17, '2017-12-02', '01:09:00', 'metus. In', 'Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros.', 8);
INSERT INTO atividade VALUES (166, 12, 20, '2018-03-08', '09:11:00', 'Proin vel nisl.', 'dapibus ligula.', 4);
INSERT INTO atividade VALUES (167, 13, 30, '2017-10-12', '01:03:00', 'quam a felis ullamcorper', 'lorem vitae odio sagittis semper. Nam tempor', 5);
INSERT INTO atividade VALUES (168, 15, 19, '2018-07-01', '05:11:00', 'Integer aliquam adipiscing lacus. Ut', 'aliquet diam. Sed', 2);
INSERT INTO atividade VALUES (169, 11, 21, '2017-01-27', '11:09:00', 'venenatis', 'Cum sociis natoque penatibus et magnis dis parturient', 4);
INSERT INTO atividade VALUES (170, 14, 32, '2018-09-08', '04:05:00', 'et, eros.', 'fringilla', 4);
INSERT INTO atividade VALUES (171, 11, 12, '2017-11-11', '03:06:00', 'urna convallis erat, eget tincidunt', 'orci, adipiscing non, luctus sit amet, faucibus ut, nulla.', 8);
INSERT INTO atividade VALUES (172, 13, 29, '2017-03-29', '07:11:00', 'sagittis lobortis mauris.', 'ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non,', 4);
INSERT INTO atividade VALUES (173, 11, 46, '2016-05-15', '11:02:00', 'non sapien molestie orci', 'Donec elementum, lorem ut', 8);
INSERT INTO atividade VALUES (174, 11, 18, '2019-03-14', '11:02:00', 'quam dignissim', 'dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue,', 5);
INSERT INTO atividade VALUES (175, 11, 30, '2018-09-24', '04:03:00', 'enim. Mauris quis turpis vitae', 'eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit', 7);
INSERT INTO atividade VALUES (176, 14, 13, '2017-05-05', '03:12:00', 'Aenean massa. Integer vitae', 'montes, nascetur ridiculus mus. Proin vel arcu eu odio', 5);
INSERT INTO atividade VALUES (177, 14, 44, '2017-03-31', '09:03:00', 'Aliquam', 'dui. Suspendisse ac metus vitae velit egestas lacinia.', 3);
INSERT INTO atividade VALUES (178, 11, 30, '2017-05-27', '08:04:00', 'vitae', 'eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula.', 7);
INSERT INTO atividade VALUES (179, 15, 14, '2018-01-10', '10:07:00', 'nec ante. Maecenas', 'facilisis non, bibendum sed, est. Nunc laoreet lectus quis', 1);
INSERT INTO atividade VALUES (180, 14, 12, '2016-10-10', '08:03:00', 'rutrum lorem ac risus. Morbi', 'cursus, diam at pretium aliquet,', 4);
INSERT INTO atividade VALUES (181, 12, 48, '2016-09-09', '11:02:00', 'tincidunt', 'risus. In mi pede, nonummy ut, molestie in, tempus', 1);
INSERT INTO atividade VALUES (182, 13, 48, '2019-05-05', '06:07:00', 'magna a', 'elementum, dui quis accumsan convallis, ante', 7);
INSERT INTO atividade VALUES (183, 13, 50, '2017-02-14', '03:06:00', 'placerat velit. Quisque varius.', 'enim consequat purus.', 3);
INSERT INTO atividade VALUES (184, 11, 30, '2017-08-25', '02:06:00', 'sed sem egestas', 'per conubia nostra, per inceptos hymenaeos. Mauris ut quam', 2);
INSERT INTO atividade VALUES (185, 12, 45, '2017-06-24', '07:02:00', 'Duis cursus, diam at', 'risus. Duis a mi fringilla mi lacinia mattis. Integer', 6);
INSERT INTO atividade VALUES (186, 14, 1, '2018-03-05', '01:06:00', 'rhoncus. Proin nisl sem,', 'egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede.', 8);
INSERT INTO atividade VALUES (187, 13, 26, '2019-05-09', '02:05:00', 'commodo ipsum. Suspendisse non', 'lobortis mauris. Suspendisse aliquet molestie', 3);
INSERT INTO atividade VALUES (188, 14, 33, '2018-12-10', '11:02:00', 'dapibus gravida. Aliquam tincidunt,', 'pede. Nunc sed', 7);
INSERT INTO atividade VALUES (189, 11, 16, '2015-10-18', '06:02:00', 'diam lorem, auctor quis, tristique', 'Aliquam nisl.', 8);
INSERT INTO atividade VALUES (190, 11, 25, '2019-05-20', '10:10:00', 'ultricies sem magna nec', 'Phasellus dolor elit, pellentesque a,', 8);
INSERT INTO atividade VALUES (191, 13, 24, '2018-01-27', '11:01:00', 'Aliquam tincidunt, nunc ac mattis', 'tellus faucibus leo, in lobortis tellus justo sit amet nulla.', 7);
INSERT INTO atividade VALUES (192, 13, 5, '2019-02-13', '08:03:00', 'faucibus', 'In lorem. Donec elementum, lorem ut aliquam iaculis,', 2);
INSERT INTO atividade VALUES (193, 15, 45, '2018-11-15', '09:08:00', 'erat semper rutrum. Fusce dolor', 'Aliquam tincidunt,', 4);
INSERT INTO atividade VALUES (194, 12, 31, '2018-05-01', '02:01:00', 'Cras vehicula', 'dapibus quam', 1);
INSERT INTO atividade VALUES (195, 13, 24, '2016-07-09', '09:08:00', 'quam, elementum at, egestas a,', 'feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem', 8);
INSERT INTO atividade VALUES (196, 15, 23, '2018-08-27', '04:11:00', 'lobortis quam a felis ullamcorper', 'massa rutrum magna. Cras convallis convallis', 5);
INSERT INTO atividade VALUES (197, 12, 43, '2017-07-13', '08:10:00', 'amet diam eu dolor', 'tempus, lorem fringilla ornare placerat, orci lacus vestibulum', 3);
INSERT INTO atividade VALUES (198, 15, 30, '2017-01-12', '05:04:00', 'montes, nascetur ridiculus mus.', 'vitae, orci. Phasellus', 6);
INSERT INTO atividade VALUES (199, 12, 6, '2016-01-01', '06:01:00', 'commodo at, libero. Morbi accumsan', 'felis eget varius ultrices, mauris ipsum', 8);
INSERT INTO atividade VALUES (200, 13, 34, '2016-03-20', '04:10:00', 'risus varius orci, in consequat', 'faucibus orci', 7);


--
-- TOC entry 2225 (class 0 OID 66160)
-- Dependencies: 182
-- Data for Name: ativmin; Type: TABLE DATA; Schema: teste; Owner: postgres
--

INSERT INTO ativmin VALUES (1, 1, 20);
INSERT INTO ativmin VALUES (1, 9, 10);
INSERT INTO ativmin VALUES (1, 9, 103);
INSERT INTO ativmin VALUES (2, 3, 130);
INSERT INTO ativmin VALUES (2, 8, 20);
INSERT INTO ativmin VALUES (4, 2, 80);
INSERT INTO ativmin VALUES (5, 2, 10);
INSERT INTO ativmin VALUES (7, 7, 80);
INSERT INTO ativmin VALUES (8, 10, 12);


--
-- TOC entry 2226 (class 0 OID 66163)
-- Dependencies: 183
-- Data for Name: cidade; Type: TABLE DATA; Schema: teste; Owner: postgres
--

INSERT INTO cidade VALUES (1, 'sdopjspf', 1, 1);
INSERT INTO cidade VALUES (2, 'Santa Cruz do Sul', 1, 80000);
INSERT INTO cidade VALUES (3, 'orci tincidunt', 16, 122508);
INSERT INTO cidade VALUES (4, 'Vestibulum ut', 106, 421806);
INSERT INTO cidade VALUES (5, 'dui', 82, 348450);
INSERT INTO cidade VALUES (6, 'Maecenas libero est,', 49, 420152);
INSERT INTO cidade VALUES (7, 'in aliquet lobortis,', 196, 482607);
INSERT INTO cidade VALUES (8, 'gravida. Praesent eu', 93, 385229);
INSERT INTO cidade VALUES (9, 'porttitor tellus', 136, 195254);
INSERT INTO cidade VALUES (10, 'adipiscing elit.', 133, 99668);
INSERT INTO cidade VALUES (11, 'orci, adipiscing', 110, 368650);
INSERT INTO cidade VALUES (12, 'ante.', 42, 38770);
INSERT INTO cidade VALUES (13, 'luctus aliquet odio. Etiam', 75, 307473);
INSERT INTO cidade VALUES (14, 'Sed auctor odio a', 133, 305501);
INSERT INTO cidade VALUES (15, 'elit,', 169, 320149);
INSERT INTO cidade VALUES (16, 'massa. Suspendisse eleifend.', 32, 151146);
INSERT INTO cidade VALUES (17, 'neque pellentesque massa lobortis', 75, 418321);
INSERT INTO cidade VALUES (18, 'erat semper rutrum.', 192, 17265);
INSERT INTO cidade VALUES (19, 'ligula. Donec', 99, 252481);
INSERT INTO cidade VALUES (20, 'mauris sapien,', 31, 350667);
INSERT INTO cidade VALUES (21, 'ornare, facilisis', 60, 261351);
INSERT INTO cidade VALUES (22, 'dictum sapien. Aenean massa.', 186, 481057);
INSERT INTO cidade VALUES (23, 'tellus faucibus leo,', 90, 384221);
INSERT INTO cidade VALUES (24, 'aliquet', 200, 302180);
INSERT INTO cidade VALUES (25, 'vel est tempor bibendum.', 90, 185020);
INSERT INTO cidade VALUES (26, 'urna justo', 192, 201755);
INSERT INTO cidade VALUES (27, 'id', 106, 224778);
INSERT INTO cidade VALUES (28, 'vitae aliquam', 170, 340651);
INSERT INTO cidade VALUES (29, 'mi pede,', 48, 73934);
INSERT INTO cidade VALUES (30, 'Cras pellentesque.', 10, 82896);
INSERT INTO cidade VALUES (31, 'felis, adipiscing fringilla,', 146, 247065);
INSERT INTO cidade VALUES (32, 'Donec', 154, 361067);
INSERT INTO cidade VALUES (33, 'nibh. Quisque nonummy', 4, 107399);
INSERT INTO cidade VALUES (34, 'aliquet, metus', 135, 486881);
INSERT INTO cidade VALUES (35, 'bibendum sed, est.', 4, 101134);
INSERT INTO cidade VALUES (36, 'adipiscing, enim mi', 9, 432827);
INSERT INTO cidade VALUES (37, 'Duis', 86, 140030);
INSERT INTO cidade VALUES (38, 'non,', 168, 236446);
INSERT INTO cidade VALUES (39, 'libero. Proin', 78, 280723);
INSERT INTO cidade VALUES (40, 'molestie', 121, 76768);
INSERT INTO cidade VALUES (41, 'eleifend vitae,', 175, 310728);
INSERT INTO cidade VALUES (42, 'Ut tincidunt orci quis', 103, 272813);
INSERT INTO cidade VALUES (43, 'sed', 119, 265581);
INSERT INTO cidade VALUES (44, 'velit. Sed malesuada', 144, 317051);
INSERT INTO cidade VALUES (45, 'nunc. Quisque', 107, 72153);
INSERT INTO cidade VALUES (46, 'pretium aliquet,', 149, 184863);
INSERT INTO cidade VALUES (47, 'justo nec ante.', 130, 62565);
INSERT INTO cidade VALUES (48, 'Duis', 119, 127360);
INSERT INTO cidade VALUES (49, 'Suspendisse commodo tincidunt', 127, 231497);
INSERT INTO cidade VALUES (50, 'Ut nec', 98, 73526);
INSERT INTO cidade VALUES (51, 'natoque penatibus et magnis', 78, 41327);
INSERT INTO cidade VALUES (52, 'Nam', 98, 53501);
INSERT INTO cidade VALUES (53, 'eget, dictum placerat,', 199, 9598);
INSERT INTO cidade VALUES (54, 'neque. Nullam nisl. Maecenas', 91, 365504);
INSERT INTO cidade VALUES (55, 'purus. Nullam', 107, 51223);
INSERT INTO cidade VALUES (56, 'lobortis', 157, 62672);
INSERT INTO cidade VALUES (57, 'interdum', 141, 207718);
INSERT INTO cidade VALUES (58, 'ipsum cursus vestibulum.', 71, 97325);
INSERT INTO cidade VALUES (59, 'Donec', 64, 370717);
INSERT INTO cidade VALUES (60, 'tristique senectus et netus', 125, 400540);
INSERT INTO cidade VALUES (61, 'ac', 194, 307946);
INSERT INTO cidade VALUES (62, 'velit.', 106, 210483);
INSERT INTO cidade VALUES (63, 'Proin', 68, 32064);
INSERT INTO cidade VALUES (64, 'in felis. Nulla tempor', 23, 59819);
INSERT INTO cidade VALUES (65, 'sagittis placerat. Cras dictum', 75, 409322);
INSERT INTO cidade VALUES (66, 'Duis', 68, 364110);
INSERT INTO cidade VALUES (67, 'enim nec', 57, 326986);
INSERT INTO cidade VALUES (68, 'Sed auctor', 84, 454812);
INSERT INTO cidade VALUES (69, 'Quisque fringilla', 97, 193037);
INSERT INTO cidade VALUES (70, 'ultricies ornare, elit elit', 16, 6901);
INSERT INTO cidade VALUES (71, 'Integer mollis.', 43, 206643);
INSERT INTO cidade VALUES (72, 'vulputate mauris', 10, 162468);
INSERT INTO cidade VALUES (73, 'a,', 34, 209979);
INSERT INTO cidade VALUES (74, 'luctus,', 90, 251900);
INSERT INTO cidade VALUES (75, 'purus gravida sagittis.', 188, 366059);
INSERT INTO cidade VALUES (76, 'Praesent eu dui.', 178, 176874);
INSERT INTO cidade VALUES (77, 'scelerisque', 8, 186331);
INSERT INTO cidade VALUES (78, 'Nam porttitor scelerisque', 176, 57555);
INSERT INTO cidade VALUES (79, 'Etiam gravida', 147, 44162);
INSERT INTO cidade VALUES (80, 'leo.', 26, 388493);
INSERT INTO cidade VALUES (81, 'lorem semper auctor.', 143, 147429);
INSERT INTO cidade VALUES (82, 'mi fringilla', 193, 80587);
INSERT INTO cidade VALUES (83, 'varius et, euismod et,', 114, 449435);
INSERT INTO cidade VALUES (84, 'placerat, augue. Sed', 141, 228696);
INSERT INTO cidade VALUES (85, 'porta elit, a feugiat', 108, 370973);
INSERT INTO cidade VALUES (86, 'neque', 137, 208297);
INSERT INTO cidade VALUES (87, 'rutrum eu,', 90, 206342);
INSERT INTO cidade VALUES (88, 'in felis. Nulla tempor', 96, 288035);
INSERT INTO cidade VALUES (89, 'sit amet', 147, 94361);
INSERT INTO cidade VALUES (90, 'lacus. Aliquam rutrum', 126, 347340);
INSERT INTO cidade VALUES (91, 'Ut', 156, 97628);
INSERT INTO cidade VALUES (92, 'eget magna. Suspendisse tristique', 168, 240248);
INSERT INTO cidade VALUES (93, 'fermentum fermentum', 140, 188945);
INSERT INTO cidade VALUES (94, 'erat', 93, 190056);
INSERT INTO cidade VALUES (95, 'dui, in', 44, 455850);
INSERT INTO cidade VALUES (96, 'In ornare sagittis felis.', 74, 346293);
INSERT INTO cidade VALUES (97, 'risus a', 6, 50401);
INSERT INTO cidade VALUES (98, 'vitae', 95, 327141);
INSERT INTO cidade VALUES (99, 'netus et', 48, 126297);
INSERT INTO cidade VALUES (100, 'Curae; Donec tincidunt.', 197, 36896);
INSERT INTO cidade VALUES (101, 'eu tellus eu augue', 8, 342046);
INSERT INTO cidade VALUES (102, 'senectus', 110, 249979);
INSERT INTO cidade VALUES (103, 'Suspendisse eleifend. Cras sed', 168, 381566);
INSERT INTO cidade VALUES (104, 'Sed auctor odio a', 52, 104265);
INSERT INTO cidade VALUES (105, 'auctor non,', 114, 143194);
INSERT INTO cidade VALUES (106, 'sollicitudin', 99, 21300);
INSERT INTO cidade VALUES (107, 'enim, sit amet ornare', 59, 364516);
INSERT INTO cidade VALUES (108, 'lacus.', 197, 138634);
INSERT INTO cidade VALUES (109, 'ut, pharetra', 101, 9412);
INSERT INTO cidade VALUES (110, 'magnis', 177, 23111);
INSERT INTO cidade VALUES (111, 'elit fermentum risus, at', 166, 361010);
INSERT INTO cidade VALUES (112, 'justo nec', 121, 43987);
INSERT INTO cidade VALUES (113, 'molestie', 69, 85153);
INSERT INTO cidade VALUES (114, 'Nulla facilisi.', 22, 419264);
INSERT INTO cidade VALUES (115, 'arcu. Vestibulum ut', 108, 198811);
INSERT INTO cidade VALUES (116, 'vel lectus.', 125, 260090);
INSERT INTO cidade VALUES (117, 'enim. Sed nulla', 133, 62774);
INSERT INTO cidade VALUES (118, 'aliquet', 198, 272186);
INSERT INTO cidade VALUES (119, 'per inceptos hymenaeos. Mauris', 50, 409038);
INSERT INTO cidade VALUES (120, 'consectetuer', 88, 424138);
INSERT INTO cidade VALUES (121, 'sollicitudin a,', 120, 390751);
INSERT INTO cidade VALUES (122, 'erat,', 148, 350336);
INSERT INTO cidade VALUES (123, 'Donec', 112, 137976);
INSERT INTO cidade VALUES (124, 'erat vitae risus. Duis', 82, 91426);
INSERT INTO cidade VALUES (125, 'a, auctor', 79, 35619);
INSERT INTO cidade VALUES (126, 'cursus, diam', 93, 190567);
INSERT INTO cidade VALUES (127, 'Mauris vel turpis. Aliquam', 16, 353740);
INSERT INTO cidade VALUES (128, 'nisi', 78, 257873);
INSERT INTO cidade VALUES (129, 'ornare lectus justo', 162, 490551);
INSERT INTO cidade VALUES (130, 'montes, nascetur ridiculus mus.', 21, 272698);
INSERT INTO cidade VALUES (131, 'ipsum ac mi eleifend', 111, 331414);
INSERT INTO cidade VALUES (132, 'quam. Pellentesque habitant', 191, 481334);
INSERT INTO cidade VALUES (133, 'eget', 127, 172762);
INSERT INTO cidade VALUES (134, 'ipsum primis in', 107, 47768);
INSERT INTO cidade VALUES (135, 'Integer eu lacus. Quisque', 7, 305219);
INSERT INTO cidade VALUES (136, 'amet ante.', 187, 208392);
INSERT INTO cidade VALUES (137, 'malesuada augue', 69, 369460);
INSERT INTO cidade VALUES (138, 'orci', 172, 222779);
INSERT INTO cidade VALUES (139, 'a,', 145, 206479);
INSERT INTO cidade VALUES (140, 'molestie dapibus ligula. Aliquam', 22, 337872);
INSERT INTO cidade VALUES (141, 'erat. Etiam', 12, 371192);
INSERT INTO cidade VALUES (142, 'ut aliquam iaculis,', 135, 295272);
INSERT INTO cidade VALUES (143, 'Aliquam adipiscing lobortis', 200, 352453);
INSERT INTO cidade VALUES (144, 'dolor. Donec', 151, 466400);
INSERT INTO cidade VALUES (145, 'sem magna nec', 120, 45642);
INSERT INTO cidade VALUES (146, 'dictum ultricies ligula. Nullam', 13, 229472);
INSERT INTO cidade VALUES (147, 'amet metus. Aliquam', 120, 392412);
INSERT INTO cidade VALUES (148, 'accumsan', 132, 353713);
INSERT INTO cidade VALUES (149, 'nulla. Cras', 46, 358045);
INSERT INTO cidade VALUES (150, 'lectus pede,', 186, 451769);
INSERT INTO cidade VALUES (151, 'Donec non justo.', 167, 464176);
INSERT INTO cidade VALUES (152, 'blandit. Nam nulla', 50, 292678);
INSERT INTO cidade VALUES (153, 'Cum sociis natoque', 98, 424465);
INSERT INTO cidade VALUES (154, 'ultrices', 172, 275294);
INSERT INTO cidade VALUES (155, 'tristique', 86, 228996);
INSERT INTO cidade VALUES (156, 'Mauris blandit enim consequat', 56, 42176);
INSERT INTO cidade VALUES (157, 'mi lacinia mattis.', 181, 253780);
INSERT INTO cidade VALUES (158, 'eleifend.', 123, 415801);
INSERT INTO cidade VALUES (159, 'dolor.', 150, 224727);
INSERT INTO cidade VALUES (160, 'metus eu erat', 31, 499686);
INSERT INTO cidade VALUES (161, 'tristique senectus et', 185, 321433);
INSERT INTO cidade VALUES (162, 'Phasellus', 68, 391815);
INSERT INTO cidade VALUES (163, 'nisl sem, consequat', 65, 381623);
INSERT INTO cidade VALUES (164, 'tristique senectus', 5, 301322);
INSERT INTO cidade VALUES (165, 'Cras pellentesque. Sed', 152, 462604);
INSERT INTO cidade VALUES (166, 'Suspendisse sagittis. Nullam', 109, 184896);
INSERT INTO cidade VALUES (167, 'sem. Pellentesque ut', 28, 145255);
INSERT INTO cidade VALUES (168, 'ornare, libero at auctor', 114, 145913);
INSERT INTO cidade VALUES (169, 'fringilla,', 59, 245211);
INSERT INTO cidade VALUES (170, 'vehicula.', 132, 315149);
INSERT INTO cidade VALUES (171, 'Mauris eu turpis.', 185, 490919);
INSERT INTO cidade VALUES (172, 'hendrerit', 178, 472485);
INSERT INTO cidade VALUES (173, 'volutpat nunc sit', 44, 322140);
INSERT INTO cidade VALUES (174, 'at lacus. Quisque', 29, 378409);
INSERT INTO cidade VALUES (175, 'Nunc sed orci lobortis', 138, 140799);
INSERT INTO cidade VALUES (176, 'tellus non', 96, 126429);
INSERT INTO cidade VALUES (177, 'metus vitae velit', 128, 384869);
INSERT INTO cidade VALUES (178, 'lacus.', 107, 146627);
INSERT INTO cidade VALUES (179, 'Pellentesque tincidunt tempus risus.', 7, 227856);
INSERT INTO cidade VALUES (180, 'lacus. Nulla tincidunt, neque', 111, 461942);
INSERT INTO cidade VALUES (181, 'ut eros', 180, 385114);
INSERT INTO cidade VALUES (182, 'fringilla euismod enim.', 84, 20790);
INSERT INTO cidade VALUES (183, 'nunc sed pede.', 183, 51452);
INSERT INTO cidade VALUES (184, 'euismod urna. Nullam lobortis', 81, 193481);
INSERT INTO cidade VALUES (185, 'vitae', 24, 20483);
INSERT INTO cidade VALUES (186, 'eu odio tristique', 71, 324685);
INSERT INTO cidade VALUES (187, 'est, mollis non,', 94, 192510);
INSERT INTO cidade VALUES (188, 'a, auctor non,', 156, 11561);
INSERT INTO cidade VALUES (189, 'mollis dui, in sodales', 92, 337229);
INSERT INTO cidade VALUES (190, 'dignissim pharetra.', 179, 437419);
INSERT INTO cidade VALUES (191, 'Morbi', 188, 403168);
INSERT INTO cidade VALUES (192, 'ipsum. Phasellus', 87, 170263);
INSERT INTO cidade VALUES (193, 'egestas ligula.', 182, 274454);
INSERT INTO cidade VALUES (194, 'auctor. Mauris vel', 66, 128515);
INSERT INTO cidade VALUES (195, 'eu dui.', 162, 396942);
INSERT INTO cidade VALUES (196, 'Cras vulputate velit eu', 166, 292868);
INSERT INTO cidade VALUES (197, 'aptent taciti sociosqu', 187, 143655);
INSERT INTO cidade VALUES (198, 'nulla at sem molestie', 4, 412750);
INSERT INTO cidade VALUES (199, 'consectetuer', 95, 475627);
INSERT INTO cidade VALUES (200, 'at auctor ullamcorper, nisl', 36, 452964);


--
-- TOC entry 2227 (class 0 OID 66166)
-- Dependencies: 184
-- Data for Name: enquadramento; Type: TABLE DATA; Schema: teste; Owner: postgres
--

INSERT INTO enquadramento VALUES (1, 'professor');
INSERT INTO enquadramento VALUES (2, 'aluno');
INSERT INTO enquadramento VALUES (3, 'pesquisador');
INSERT INTO enquadramento VALUES (4, 'outro');


--
-- TOC entry 2228 (class 0 OID 66169)
-- Dependencies: 185
-- Data for Name: enquadramentopessoa; Type: TABLE DATA; Schema: teste; Owner: postgres
--

INSERT INTO enquadramentopessoa VALUES (10, 1);


--
-- TOC entry 2229 (class 0 OID 66172)
-- Dependencies: 186
-- Data for Name: estado; Type: TABLE DATA; Schema: teste; Owner: postgres
--

INSERT INTO estado VALUES (1, 'Rio dsnfd', 'RS', 1);
INSERT INTO estado VALUES (2, 'Qualquer cois', 'QQ', 2);
INSERT INTO estado VALUES (3, 'tincidunt. Donec', 'NU', 183);
INSERT INTO estado VALUES (4, 'nulla.', 'AB', 104);
INSERT INTO estado VALUES (5, 'Quisque purus sapien,', 'NL', 64);
INSERT INTO estado VALUES (6, 'velit egestas', 'SC', 35);
INSERT INTO estado VALUES (7, 'nec,', 'IL', 20);
INSERT INTO estado VALUES (8, 'auctor non, feugiat', 'QC', 47);
INSERT INTO estado VALUES (9, 'sed dolor.', 'QC', 35);
INSERT INTO estado VALUES (10, 'Aliquam tincidunt, nunc', 'IN', 113);
INSERT INTO estado VALUES (11, 'aliquet, sem', 'OK', 15);
INSERT INTO estado VALUES (12, 'egestas a, dui.', 'NB', 43);
INSERT INTO estado VALUES (13, 'rhoncus. Proin nisl', 'SD', 188);
INSERT INTO estado VALUES (14, 'Aenean', 'UT', 134);
INSERT INTO estado VALUES (15, 'augue', 'HI', 72);
INSERT INTO estado VALUES (16, 'Aliquam rutrum lorem', 'NS', 90);
INSERT INTO estado VALUES (17, 'adipiscing', 'MA', 185);
INSERT INTO estado VALUES (18, 'tellus sem', 'DE', 175);
INSERT INTO estado VALUES (19, 'id', 'MT', 95);
INSERT INTO estado VALUES (20, 'turpis', 'SC', 133);
INSERT INTO estado VALUES (21, 'magna.', 'NC', 15);
INSERT INTO estado VALUES (22, 'habitant', 'AB', 165);
INSERT INTO estado VALUES (23, 'sem semper', 'NU', 42);
INSERT INTO estado VALUES (24, 'leo elementum', 'NV', 70);
INSERT INTO estado VALUES (25, 'amet', 'WV', 137);
INSERT INTO estado VALUES (26, 'eu lacus.', 'NB', 187);
INSERT INTO estado VALUES (27, 'sed turpis nec', 'QC', 10);
INSERT INTO estado VALUES (28, 'magna. Lorem', 'DE', 3);
INSERT INTO estado VALUES (29, 'non lorem', 'GA', 168);
INSERT INTO estado VALUES (30, 'Curae; Donec', 'MN', 73);
INSERT INTO estado VALUES (31, 'Donec', 'MD', 124);
INSERT INTO estado VALUES (32, 'magna', 'MB', 75);
INSERT INTO estado VALUES (33, 'mi', 'MB', 135);
INSERT INTO estado VALUES (34, 'nulla.', 'IN', 100);
INSERT INTO estado VALUES (35, 'eu', 'SD', 185);
INSERT INTO estado VALUES (36, 'risus,', 'NB', 41);
INSERT INTO estado VALUES (37, 'Nullam enim. Sed', 'CT', 53);
INSERT INTO estado VALUES (38, 'erat nonummy', 'NC', 57);
INSERT INTO estado VALUES (39, 'metus eu', 'PE', 78);
INSERT INTO estado VALUES (40, 'vestibulum, neque', 'NU', 54);
INSERT INTO estado VALUES (41, 'varius orci, in', 'AK', 58);
INSERT INTO estado VALUES (42, 'nunc', 'CO', 95);
INSERT INTO estado VALUES (43, 'aliquet. Proin', 'NB', 39);
INSERT INTO estado VALUES (44, 'ut lacus. Nulla', 'NH', 109);
INSERT INTO estado VALUES (45, 'dictum cursus. Nunc', 'YT', 44);
INSERT INTO estado VALUES (46, 'iaculis, lacus pede', 'WA', 88);
INSERT INTO estado VALUES (47, 'egestas', 'MB', 15);
INSERT INTO estado VALUES (48, 'Praesent interdum', 'NS', 106);
INSERT INTO estado VALUES (49, 'arcu imperdiet ullamcorper.', 'GA', 94);
INSERT INTO estado VALUES (50, 'non magna. Nam', 'ON', 139);
INSERT INTO estado VALUES (51, 'purus, accumsan interdum', 'NH', 82);
INSERT INTO estado VALUES (52, 'Nam', 'NS', 146);
INSERT INTO estado VALUES (53, 'quam.', 'NL', 96);
INSERT INTO estado VALUES (54, 'varius', 'GA', 18);
INSERT INTO estado VALUES (55, 'volutpat. Nulla dignissim.', 'ON', 163);
INSERT INTO estado VALUES (56, 'vestibulum', 'NE', 147);
INSERT INTO estado VALUES (57, 'libero. Donec consectetuer', 'MN', 6);
INSERT INTO estado VALUES (58, 'dolor.', 'MT', 32);
INSERT INTO estado VALUES (59, 'luctus, ipsum leo', 'NU', 46);
INSERT INTO estado VALUES (60, 'Quisque tincidunt', 'NU', 140);
INSERT INTO estado VALUES (61, 'iaculis', 'TN', 66);
INSERT INTO estado VALUES (62, 'Nam nulla', 'YT', 160);
INSERT INTO estado VALUES (63, 'montes, nascetur', 'SK', 159);
INSERT INTO estado VALUES (64, 'erat.', 'YT', 59);
INSERT INTO estado VALUES (65, 'mauris,', 'NL', 134);
INSERT INTO estado VALUES (66, 'amet massa.', 'AB', 188);
INSERT INTO estado VALUES (67, 'pretium neque.', 'QC', 26);
INSERT INTO estado VALUES (68, 'faucibus', 'FL', 137);
INSERT INTO estado VALUES (69, 'eget metus. In', 'PE', 40);
INSERT INTO estado VALUES (70, 'elementum', 'MT', 105);
INSERT INTO estado VALUES (71, 'rutrum', 'HI', 193);
INSERT INTO estado VALUES (72, 'gravida', 'ON', 163);
INSERT INTO estado VALUES (73, 'luctus', 'OR', 37);
INSERT INTO estado VALUES (74, 'Suspendisse commodo', 'CT', 56);
INSERT INTO estado VALUES (75, 'amet,', 'NH', 66);
INSERT INTO estado VALUES (76, 'arcu', 'VA', 40);
INSERT INTO estado VALUES (77, 'Quisque nonummy ipsum', 'MB', 138);
INSERT INTO estado VALUES (78, 'aliquet, sem', 'RI', 65);
INSERT INTO estado VALUES (79, 'Quisque porttitor eros', 'MB', 197);
INSERT INTO estado VALUES (80, 'egestas lacinia.', 'YT', 97);
INSERT INTO estado VALUES (81, 'lectus,', 'MB', 24);
INSERT INTO estado VALUES (82, 'turpis.', 'KY', 54);
INSERT INTO estado VALUES (83, 'consequat', 'MN', 60);
INSERT INTO estado VALUES (84, 'nunc sit amet', 'NU', 5);
INSERT INTO estado VALUES (85, 'erat, eget tincidunt', 'WA', 17);
INSERT INTO estado VALUES (86, 'egestas. Sed', 'NM', 163);
INSERT INTO estado VALUES (87, 'nisi sem semper', 'AB', 153);
INSERT INTO estado VALUES (88, 'ornare', 'NM', 158);
INSERT INTO estado VALUES (89, 'eu nibh vulputate', 'MT', 153);
INSERT INTO estado VALUES (90, 'tempus scelerisque,', 'NT', 189);
INSERT INTO estado VALUES (91, 'eleifend egestas.', 'PE', 107);
INSERT INTO estado VALUES (92, 'purus gravida sagittis.', 'NT', 139);
INSERT INTO estado VALUES (93, 'porttitor eros', 'KY', 149);
INSERT INTO estado VALUES (94, 'lorem', 'NB', 158);
INSERT INTO estado VALUES (95, 'enim mi', 'NB', 133);
INSERT INTO estado VALUES (96, 'non magna. Nam', 'NS', 183);
INSERT INTO estado VALUES (97, 'Donec', 'NM', 34);
INSERT INTO estado VALUES (98, 'eu', 'IA', 79);
INSERT INTO estado VALUES (99, 'Etiam', 'KS', 116);
INSERT INTO estado VALUES (100, 'Sed', 'NT', 130);
INSERT INTO estado VALUES (101, 'Nunc', 'MO', 135);
INSERT INTO estado VALUES (102, 'Etiam ligula', 'QC', 130);
INSERT INTO estado VALUES (103, 'neque. Morbi', 'YT', 119);
INSERT INTO estado VALUES (104, 'morbi tristique', 'NL', 186);
INSERT INTO estado VALUES (105, 'lectus rutrum', 'SC', 21);
INSERT INTO estado VALUES (106, 'mi tempor', 'AB', 127);
INSERT INTO estado VALUES (107, 'In at', 'NT', 162);
INSERT INTO estado VALUES (108, 'Proin mi. Aliquam', 'NS', 107);
INSERT INTO estado VALUES (109, 'vel, venenatis', 'NU', 196);
INSERT INTO estado VALUES (110, 'pharetra. Nam', 'ND', 67);
INSERT INTO estado VALUES (111, 'nunc, ullamcorper eu,', 'TN', 122);
INSERT INTO estado VALUES (112, 'sed, hendrerit', 'NT', 146);
INSERT INTO estado VALUES (113, 'dolor dapibus gravida.', 'FL', 160);
INSERT INTO estado VALUES (114, 'purus sapien, gravida', 'KS', 162);
INSERT INTO estado VALUES (115, 'aliquet', 'NS', 8);
INSERT INTO estado VALUES (116, 'eu', 'KS', 123);
INSERT INTO estado VALUES (117, 'Donec fringilla. Donec', 'KY', 139);
INSERT INTO estado VALUES (118, 'lorem,', 'RI', 58);
INSERT INTO estado VALUES (119, 'ante. Nunc', 'WY', 6);
INSERT INTO estado VALUES (120, 'Phasellus in felis.', 'KY', 88);
INSERT INTO estado VALUES (121, 'mauris, aliquam', 'NB', 186);
INSERT INTO estado VALUES (122, 'nibh. Aliquam ornare,', 'NV', 9);
INSERT INTO estado VALUES (123, 'Ut', 'PE', 115);
INSERT INTO estado VALUES (124, 'mollis.', 'BC', 10);
INSERT INTO estado VALUES (125, 'scelerisque neque', 'NB', 39);
INSERT INTO estado VALUES (126, 'Duis', 'NH', 123);
INSERT INTO estado VALUES (127, 'Curabitur massa.', 'SK', 107);
INSERT INTO estado VALUES (128, 'ac nulla.', 'KS', 145);
INSERT INTO estado VALUES (129, 'erat vel pede', 'QC', 165);
INSERT INTO estado VALUES (130, 'sociis', 'KS', 175);
INSERT INTO estado VALUES (131, 'sem egestas', 'NT', 74);
INSERT INTO estado VALUES (132, 'dolor, nonummy', 'IN', 149);
INSERT INTO estado VALUES (133, 'dui. Cras pellentesque.', 'NS', 10);
INSERT INTO estado VALUES (134, 'condimentum eget, volutpat', 'QC', 196);
INSERT INTO estado VALUES (135, 'luctus sit', 'AZ', 41);
INSERT INTO estado VALUES (136, 'nisl arcu iaculis', 'AB', 100);
INSERT INTO estado VALUES (137, 'varius orci, in', 'AL', 191);
INSERT INTO estado VALUES (138, 'parturient montes, nascetur', 'GA', 98);
INSERT INTO estado VALUES (139, 'Pellentesque', 'AK', 32);
INSERT INTO estado VALUES (140, 'per', 'NU', 76);
INSERT INTO estado VALUES (141, 'dolor egestas rhoncus.', 'WA', 146);
INSERT INTO estado VALUES (142, 'sed pede.', 'MB', 175);
INSERT INTO estado VALUES (143, 'neque. Nullam ut', 'NT', 193);
INSERT INTO estado VALUES (144, 'dictum ultricies', 'DC', 42);
INSERT INTO estado VALUES (145, 'et,', 'NS', 158);
INSERT INTO estado VALUES (146, 'vulputate', 'AB', 126);
INSERT INTO estado VALUES (147, 'ante lectus convallis', 'YT', 55);
INSERT INTO estado VALUES (148, 'ut cursus luctus,', 'NL', 126);
INSERT INTO estado VALUES (149, 'porttitor', 'MD', 148);
INSERT INTO estado VALUES (150, 'Duis volutpat', 'AK', 116);
INSERT INTO estado VALUES (151, 'metus. In nec', 'ON', 147);
INSERT INTO estado VALUES (152, 'nulla vulputate', 'MN', 105);
INSERT INTO estado VALUES (153, 'mus. Proin vel', 'ON', 139);
INSERT INTO estado VALUES (154, 'arcu. Sed eu', 'UT', 127);
INSERT INTO estado VALUES (155, 'Proin vel', 'WV', 59);
INSERT INTO estado VALUES (156, 'purus. Duis', 'NL', 88);
INSERT INTO estado VALUES (157, 'sed sem egestas', 'MB', 159);
INSERT INTO estado VALUES (158, 'Phasellus dapibus', 'BC', 115);
INSERT INTO estado VALUES (159, 'sed', 'CO', 6);
INSERT INTO estado VALUES (160, 'Nullam lobortis quam', 'NU', 30);
INSERT INTO estado VALUES (161, 'pharetra, felis', 'NU', 191);
INSERT INTO estado VALUES (162, 'imperdiet non,', 'QC', 27);
INSERT INTO estado VALUES (163, 'ligula', 'MB', 67);
INSERT INTO estado VALUES (164, 'non', 'MB', 186);
INSERT INTO estado VALUES (165, 'Proin', 'NB', 118);
INSERT INTO estado VALUES (166, 'ipsum primis in', 'MN', 91);
INSERT INTO estado VALUES (167, 'risus odio,', 'NT', 110);
INSERT INTO estado VALUES (168, 'ut ipsum', 'NL', 86);
INSERT INTO estado VALUES (169, 'mauris. Morbi non', 'NU', 158);
INSERT INTO estado VALUES (170, 'libero. Proin sed', 'PE', 192);
INSERT INTO estado VALUES (171, 'Vivamus sit amet', 'IN', 63);
INSERT INTO estado VALUES (172, 'pede. Suspendisse dui.', 'NB', 158);
INSERT INTO estado VALUES (173, 'nibh enim, gravida', 'NU', 174);
INSERT INTO estado VALUES (174, 'nunc. Quisque', 'AL', 111);
INSERT INTO estado VALUES (175, 'sed, hendrerit a,', 'BC', 71);
INSERT INTO estado VALUES (176, 'est, mollis', 'NT', 200);
INSERT INTO estado VALUES (177, 'Proin eget', 'YT', 23);
INSERT INTO estado VALUES (178, 'neque tellus,', 'ON', 134);
INSERT INTO estado VALUES (179, 'nisi', 'NU', 112);
INSERT INTO estado VALUES (180, 'Donec egestas. Duis', 'TX', 152);
INSERT INTO estado VALUES (181, 'ligula', 'NC', 50);
INSERT INTO estado VALUES (182, 'risus. Nulla', 'NJ', 127);
INSERT INTO estado VALUES (183, 'Nulla aliquet. Proin', 'KY', 124);
INSERT INTO estado VALUES (184, 'augue', 'NH', 113);
INSERT INTO estado VALUES (185, 'magna.', 'QC', 135);
INSERT INTO estado VALUES (186, 'at, iaculis', 'AB', 109);
INSERT INTO estado VALUES (187, 'feugiat non,', 'VT', 79);
INSERT INTO estado VALUES (188, 'sociosqu ad', 'CT', 73);
INSERT INTO estado VALUES (189, 'quis lectus. Nullam', 'YT', 162);
INSERT INTO estado VALUES (190, 'ornare, facilisis', 'HI', 163);
INSERT INTO estado VALUES (191, 'porttitor scelerisque neque.', 'VA', 150);
INSERT INTO estado VALUES (192, 'Nulla tempor', 'PE', 49);
INSERT INTO estado VALUES (193, 'Praesent interdum', 'GA', 20);
INSERT INTO estado VALUES (194, 'auctor odio', 'PE', 175);
INSERT INTO estado VALUES (195, 'magna nec', 'PA', 33);
INSERT INTO estado VALUES (196, 'lacus. Quisque', 'AL', 44);
INSERT INTO estado VALUES (197, 'blandit enim consequat', 'NT', 97);
INSERT INTO estado VALUES (198, 'Donec non justo.', 'FL', 157);
INSERT INTO estado VALUES (199, 'porttitor', 'WY', 104);
INSERT INTO estado VALUES (200, 'ultrices a, auctor', 'MB', 19);


--
-- TOC entry 2230 (class 0 OID 66175)
-- Dependencies: 187
-- Data for Name: evento; Type: TABLE DATA; Schema: teste; Owner: postgres
--

INSERT INTO evento VALUES (52, 150, 21, 'Nulla dignissim. Maecenas', 'Proin dolor. Nulla semper tellus id nunc interdum feugiat.', '2016-11-09', '2016-11-23');
INSERT INTO evento VALUES (53, 7, 26, 'in faucibus orci luctus et', 'ut erat.', '2019-02-24', '2019-03-10');
INSERT INTO evento VALUES (54, 32, 4, 'rhoncus. Nullam', 'orci,', '2019-05-08', '2019-05-22');
INSERT INTO evento VALUES (55, 106, 44, 'Cras lorem lorem, luctus', 'Donec luctus aliquet', '2015-12-14', '2015-12-28');
INSERT INTO evento VALUES (56, 7, 35, 'felis. Nulla tempor augue ac', 'ut dolor dapibus gravida. Aliquam', '2017-08-07', '2017-08-21');
INSERT INTO evento VALUES (57, 98, 9, 'odio, auctor', 'Aliquam adipiscing lobortis risus. In mi', '2018-05-02', '2018-05-16');
INSERT INTO evento VALUES (58, 148, 30, 'convallis erat, eget tincidunt', 'egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum', '2015-11-02', '2015-11-16');
INSERT INTO evento VALUES (59, 145, 49, 'Proin mi. Aliquam gravida mauris', 'nec, imperdiet nec, leo.', '2018-01-19', '2018-02-02');
INSERT INTO evento VALUES (60, 135, 43, 'accumsan convallis, ante lectus convallis', 'massa.', '2015-11-04', '2015-11-18');
INSERT INTO evento VALUES (61, 47, 7, 'ut nisi a odio semper', 'lorem, luctus ut, pellentesque', '2015-11-13', '2015-11-27');
INSERT INTO evento VALUES (62, 200, 40, 'dis parturient montes,', 'in, dolor. Fusce feugiat. Lorem ipsum dolor sit', '2018-01-21', '2018-02-04');
INSERT INTO evento VALUES (63, 107, 26, 'mollis. Duis sit', 'eu turpis.', '2016-10-05', '2016-10-19');
INSERT INTO evento VALUES (64, 13, 43, 'arcu. Sed', 'Cum sociis natoque penatibus et magnis dis parturient montes,', '2018-02-18', '2018-03-04');
INSERT INTO evento VALUES (65, 189, 25, 'magna. Lorem ipsum', 'tellus justo sit amet nulla. Donec non justo. Proin non', '2019-01-09', '2019-01-23');
INSERT INTO evento VALUES (66, 184, 10, 'vitae erat vel pede', 'sed, sapien. Nunc', '2019-03-18', '2019-04-01');
INSERT INTO evento VALUES (67, 198, 13, 'sed leo. Cras vehicula aliquet', 'Proin non massa non ante bibendum', '2017-07-31', '2017-08-14');
INSERT INTO evento VALUES (68, 81, 6, 'leo.', 'Cras lorem lorem, luctus', '2017-12-14', '2017-12-28');
INSERT INTO evento VALUES (69, 75, 21, 'pede', 'at risus. Nunc ac', '2015-12-22', '2016-01-05');
INSERT INTO evento VALUES (70, 84, 17, 'fringilla, porttitor vulputate,', 'diam. Sed', '2017-01-30', '2017-02-13');
INSERT INTO evento VALUES (180, 153, 49, 'diam.', 'auctor, velit', '2016-07-02', '2016-07-16');
INSERT INTO evento VALUES (71, 109, 2, 'Pellentesque tincidunt tempus', 'purus mauris a nunc. In at pede. Cras', '2017-08-24', '2017-09-07');
INSERT INTO evento VALUES (72, 64, 38, 'sagittis.', 'sed pede', '2016-02-09', '2016-02-23');
INSERT INTO evento VALUES (73, 155, 28, 'risus. Quisque libero lacus,', 'lorem vitae odio sagittis semper. Nam', '2018-08-29', '2018-09-12');
INSERT INTO evento VALUES (74, 28, 46, 'Duis sit amet', 'dolor dapibus gravida. Aliquam tincidunt, nunc ac', '2017-02-11', '2017-02-25');
INSERT INTO evento VALUES (75, 31, 3, 'vestibulum. Mauris', 'velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus.', '2016-05-16', '2016-05-30');
INSERT INTO evento VALUES (76, 186, 27, 'orci. Ut', 'ante. Vivamus non lorem vitae odio sagittis semper. Nam', '2018-05-18', '2018-06-01');
INSERT INTO evento VALUES (77, 59, 7, 'diam lorem, auctor quis, tristique', 'convallis dolor. Quisque', '2017-01-03', '2017-01-17');
INSERT INTO evento VALUES (78, 5, 4, 'lacinia mattis. Integer', 'eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec', '2016-05-27', '2016-06-10');
INSERT INTO evento VALUES (79, 187, 5, 'purus,', 'fringilla ornare placerat, orci', '2018-02-16', '2018-03-02');
INSERT INTO evento VALUES (80, 80, 24, 'eu dui. Cum sociis', 'tincidunt', '2017-07-17', '2017-07-31');
INSERT INTO evento VALUES (81, 199, 49, 'Maecenas iaculis', 'a neque. Nullam ut nisi', '2017-11-17', '2017-12-01');
INSERT INTO evento VALUES (82, 98, 38, 'quam a', 'lectus rutrum', '2015-11-27', '2015-12-11');
INSERT INTO evento VALUES (83, 77, 7, 'libero. Proin mi.', 'ultrices sit amet, risus. Donec nibh enim, gravida sit amet,', '2016-11-17', '2016-12-01');
INSERT INTO evento VALUES (84, 18, 44, 'a, dui. Cras', 'ac mattis ornare, lectus', '2017-11-06', '2017-11-20');
INSERT INTO evento VALUES (85, 156, 37, 'tellus. Suspendisse sed', 'sit amet, faucibus ut,', '2016-04-10', '2016-04-24');
INSERT INTO evento VALUES (86, 44, 19, 'nibh sit amet', 'Nam nulla magna, malesuada vel, convallis in, cursus', '2019-03-06', '2019-03-20');
INSERT INTO evento VALUES (87, 110, 11, 'vulputate dui, nec tempus', 'neque. Morbi quis urna. Nunc quis', '2015-12-20', '2016-01-03');
INSERT INTO evento VALUES (88, 50, 48, 'Integer eu lacus. Quisque imperdiet,', 'convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum', '2016-05-13', '2016-05-27');
INSERT INTO evento VALUES (89, 63, 1, 'Curabitur massa. Vestibulum accumsan', 'aliquet nec,', '2019-02-08', '2019-02-22');
INSERT INTO evento VALUES (90, 168, 45, 'sem, consequat nec, mollis', 'enim non nisi. Aenean', '2016-05-16', '2016-05-30');
INSERT INTO evento VALUES (91, 139, 31, 'non, egestas a,', 'eleifend', '2017-09-21', '2017-10-05');
INSERT INTO evento VALUES (92, 195, 33, 'pretium et,', 'auctor vitae, aliquet nec,', '2018-11-16', '2018-11-30');
INSERT INTO evento VALUES (93, 58, 32, 'Nam tempor diam dictum sapien.', 'sed sem egestas blandit. Nam', '2018-06-18', '2018-07-02');
INSERT INTO evento VALUES (94, 182, 38, 'justo. Praesent luctus. Curabitur egestas', 'consectetuer adipiscing elit. Aliquam auctor, velit eget', '2019-03-14', '2019-03-28');
INSERT INTO evento VALUES (95, 105, 26, 'luctus et ultrices posuere cubilia', 'Morbi non sapien molestie orci tincidunt adipiscing. Mauris', '2015-12-04', '2015-12-18');
INSERT INTO evento VALUES (96, 64, 22, 'metus facilisis lorem tristique aliquet.', 'ipsum dolor sit amet, consectetuer adipiscing', '2016-05-29', '2016-06-12');
INSERT INTO evento VALUES (97, 191, 26, 'lacus. Aliquam rutrum lorem', 'vestibulum', '2017-12-21', '2018-01-04');
INSERT INTO evento VALUES (98, 66, 20, 'lobortis. Class aptent taciti', 'Sed nunc est, mollis non, cursus', '2017-04-20', '2017-05-04');
INSERT INTO evento VALUES (99, 24, 22, 'amet, consectetuer adipiscing elit. Aliquam', 'nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim.', '2018-11-02', '2018-11-16');
INSERT INTO evento VALUES (100, 197, 25, 'amet', 'fermentum convallis ligula. Donec luctus aliquet odio. Etiam', '2016-07-13', '2016-07-27');
INSERT INTO evento VALUES (101, 31, 2, 'libero mauris,', 'nulla vulputate dui, nec tempus mauris erat eget ipsum.', '2017-08-20', '2017-09-03');
INSERT INTO evento VALUES (102, 9, 38, 'sem magna', 'diam lorem,', '2015-10-31', '2015-11-14');
INSERT INTO evento VALUES (103, 139, 22, 'Vivamus euismod urna. Nullam', 'litora torquent per conubia nostra, per inceptos', '2018-02-08', '2018-02-22');
INSERT INTO evento VALUES (104, 92, 41, 'eget, ipsum. Donec sollicitudin', 'tristique neque venenatis lacus. Etiam bibendum fermentum metus.', '2017-02-17', '2017-03-03');
INSERT INTO evento VALUES (105, 169, 40, 'sit', 'magna, malesuada vel, convallis in, cursus et,', '2017-08-01', '2017-08-15');
INSERT INTO evento VALUES (106, 129, 41, 'ac turpis egestas. Aliquam fringilla', 'velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer', '2016-02-16', '2016-03-01');
INSERT INTO evento VALUES (107, 122, 46, 'nibh. Phasellus nulla.', 'malesuada. Integer id magna et ipsum', '2018-06-30', '2018-07-14');
INSERT INTO evento VALUES (108, 49, 14, 'amet, consectetuer adipiscing elit. Aliquam', 'vel lectus. Cum sociis natoque penatibus et', '2017-08-21', '2017-09-04');
INSERT INTO evento VALUES (109, 51, 5, 'interdum. Nunc sollicitudin', 'Morbi non sapien molestie', '2016-08-12', '2016-08-26');
INSERT INTO evento VALUES (110, 120, 13, 'ac', 'dignissim pharetra.', '2017-04-21', '2017-05-05');
INSERT INTO evento VALUES (111, 122, 38, 'ultrices sit amet,', 'egestas ligula. Nullam feugiat placerat velit. Quisque', '2018-01-11', '2018-01-25');
INSERT INTO evento VALUES (112, 42, 11, 'ornare placerat,', 'neque', '2015-12-23', '2016-01-06');
INSERT INTO evento VALUES (113, 46, 17, 'neque.', 'lacinia. Sed congue, elit', '2017-05-31', '2017-06-14');
INSERT INTO evento VALUES (114, 179, 30, 'dapibus ligula. Aliquam erat volutpat.', 'faucibus orci luctus et ultrices posuere', '2018-03-25', '2018-04-08');
INSERT INTO evento VALUES (115, 132, 6, 'In condimentum. Donec', 'non, hendrerit id, ante. Nunc mauris sapien, cursus in,', '2017-03-14', '2017-03-28');
INSERT INTO evento VALUES (116, 88, 24, 'ut, pharetra', 'sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy', '2019-06-01', '2019-06-15');
INSERT INTO evento VALUES (117, 69, 10, 'venenatis', 'risus quis diam luctus lobortis. Class aptent taciti sociosqu', '2017-08-17', '2017-08-31');
INSERT INTO evento VALUES (118, 98, 4, 'non justo. Proin', 'tincidunt, nunc ac', '2017-10-10', '2017-10-24');
INSERT INTO evento VALUES (119, 72, 10, 'ut, sem. Nulla', 'tincidunt pede ac urna. Ut tincidunt', '2017-04-21', '2017-05-05');
INSERT INTO evento VALUES (120, 83, 11, 'mi', 'lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at', '2018-08-13', '2018-08-27');
INSERT INTO evento VALUES (121, 94, 19, 'eu lacus. Quisque', 'eu tellus eu augue', '2019-04-15', '2019-04-29');
INSERT INTO evento VALUES (122, 150, 35, 'Curabitur massa. Vestibulum accumsan', 'neque. In ornare sagittis', '2018-06-30', '2018-07-14');
INSERT INTO evento VALUES (123, 34, 40, 'id nunc interdum', 'ac turpis egestas. Aliquam fringilla', '2017-09-06', '2017-09-20');
INSERT INTO evento VALUES (124, 138, 39, 'ac', 'Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam', '2017-04-12', '2017-04-26');
INSERT INTO evento VALUES (125, 45, 19, 'tristique ac, eleifend vitae, erat.', 'nulla vulputate dui,', '2017-07-25', '2017-08-08');
INSERT INTO evento VALUES (126, 76, 36, 'egestas.', 'sed dui. Fusce aliquam, enim nec', '2018-10-01', '2018-10-15');
INSERT INTO evento VALUES (127, 61, 14, 'commodo', 'ante lectus', '2016-03-15', '2016-03-29');
INSERT INTO evento VALUES (128, 86, 18, 'elit. Aliquam', 'lorem fringilla', '2018-02-18', '2018-03-04');
INSERT INTO evento VALUES (129, 169, 40, 'Integer vulputate, risus', 'Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat', '2018-07-07', '2018-07-21');
INSERT INTO evento VALUES (130, 96, 11, 'molestie pharetra nibh. Aliquam', 'aliquet nec, imperdiet nec, leo. Morbi', '2015-12-03', '2015-12-17');
INSERT INTO evento VALUES (131, 8, 48, 'purus. Maecenas libero est,', 'auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In', '2017-01-28', '2017-02-11');
INSERT INTO evento VALUES (132, 128, 6, 'elit. Etiam laoreet,', 'consectetuer', '2017-07-30', '2017-08-13');
INSERT INTO evento VALUES (133, 50, 24, 'ultrices sit amet, risus. Donec', 'odio semper cursus. Integer mollis.', '2016-07-12', '2016-07-26');
INSERT INTO evento VALUES (134, 35, 16, 'Nullam suscipit, est ac facilisis', 'netus et', '2016-02-08', '2016-02-22');
INSERT INTO evento VALUES (135, 195, 34, 'est', 'erat, eget tincidunt dui augue eu tellus. Phasellus elit pede,', '2017-09-17', '2017-10-01');
INSERT INTO evento VALUES (136, 137, 50, 'erat. Vivamus nisi.', 'Mauris nulla.', '2016-01-05', '2016-01-19');
INSERT INTO evento VALUES (137, 114, 40, 'ac urna. Ut', 'magnis dis parturient montes, nascetur ridiculus', '2018-12-19', '2019-01-02');
INSERT INTO evento VALUES (138, 133, 42, 'mauris id sapien. Cras dolor', 'odio a purus. Duis', '2016-10-08', '2016-10-22');
INSERT INTO evento VALUES (139, 142, 26, 'Nam ligula elit, pretium', 'dui. Fusce', '2016-01-14', '2016-01-28');
INSERT INTO evento VALUES (140, 86, 4, 'amet orci. Ut sagittis', 'magna. Duis dignissim tempor arcu. Vestibulum ut eros', '2017-11-11', '2017-11-25');
INSERT INTO evento VALUES (141, 21, 24, 'quam. Curabitur vel', 'quis urna. Nunc quis arcu vel quam dignissim pharetra.', '2016-11-01', '2016-11-15');
INSERT INTO evento VALUES (142, 10, 21, 'montes, nascetur ridiculus', 'metus. In nec orci. Donec', '2018-11-16', '2018-11-30');
INSERT INTO evento VALUES (143, 9, 5, 'erat semper rutrum. Fusce dolor', 'id risus quis diam luctus lobortis. Class aptent', '2017-12-30', '2018-01-13');
INSERT INTO evento VALUES (164, 162, 31, 'ullamcorper. Duis at lacus. Quisque', 'Fusce mi lorem, vehicula et, rutrum', '2017-10-25', '2017-11-08');
INSERT INTO evento VALUES (165, 120, 19, 'lacinia at, iaculis', 'amet nulla. Donec non', '2018-11-25', '2018-12-09');
INSERT INTO evento VALUES (166, 33, 32, 'interdum. Nunc', 'justo nec ante. Maecenas mi felis, adipiscing fringilla,', '2018-02-22', '2018-03-08');
INSERT INTO evento VALUES (167, 188, 5, 'id', 'Sed eu nibh vulputate mauris sagittis placerat. Cras dictum', '2015-10-31', '2015-11-14');
INSERT INTO evento VALUES (168, 24, 19, 'eros. Nam consequat dolor', 'Sed eu', '2015-11-13', '2015-11-27');
INSERT INTO evento VALUES (169, 103, 48, 'Vivamus euismod urna. Nullam', 'risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non', '2016-09-11', '2016-09-25');
INSERT INTO evento VALUES (170, 172, 29, 'massa. Suspendisse eleifend. Cras', 'accumsan interdum libero', '2019-01-02', '2019-01-16');
INSERT INTO evento VALUES (171, 4, 19, 'posuere cubilia Curae; Phasellus', 'mus. Proin vel arcu', '2016-02-29', '2016-03-14');
INSERT INTO evento VALUES (172, 34, 13, 'In mi pede,', 'risus. Donec egestas. Duis ac', '2017-05-15', '2017-05-29');
INSERT INTO evento VALUES (173, 148, 28, 'orci, in consequat enim', 'mollis dui, in sodales elit erat vitae', '2016-08-08', '2016-08-22');
INSERT INTO evento VALUES (174, 111, 9, 'faucibus. Morbi vehicula. Pellentesque', 'Vestibulum ante ipsum primis in faucibus', '2016-09-03', '2016-09-17');
INSERT INTO evento VALUES (175, 111, 20, 'turpis. Aliquam', 'lorem, vehicula et, rutrum eu, ultrices sit amet, risus.', '2016-10-25', '2016-11-08');
INSERT INTO evento VALUES (176, 40, 42, 'Pellentesque ut ipsum ac mi', 'felis.', '2017-11-13', '2017-11-27');
INSERT INTO evento VALUES (177, 31, 12, 'Duis dignissim tempor', 'eros. Proin ultrices. Duis volutpat', '2016-06-21', '2016-07-05');
INSERT INTO evento VALUES (178, 169, 9, 'In ornare sagittis', 'Aliquam ultrices iaculis odio. Nam interdum', '2018-02-21', '2018-03-07');
INSERT INTO evento VALUES (179, 57, 8, 'semper rutrum.', 'in sodales elit erat vitae', '2017-03-26', '2017-04-09');
INSERT INTO evento VALUES (181, 114, 19, 'felis orci, adipiscing non, luctus', 'ultrices. Duis', '2018-07-05', '2018-07-19');
INSERT INTO evento VALUES (182, 127, 18, 'nisi', 'nibh enim, gravida sit amet, dapibus id, blandit at, nisi.', '2018-09-17', '2018-10-01');
INSERT INTO evento VALUES (183, 189, 38, 'quam a felis ullamcorper', 'inceptos hymenaeos. Mauris', '2016-07-19', '2016-08-02');
INSERT INTO evento VALUES (184, 89, 27, 'lobortis, nisi nibh', 'tellus lorem eu metus. In lorem.', '2017-03-29', '2017-04-12');
INSERT INTO evento VALUES (185, 100, 17, 'Donec dignissim magna a tortor.', 'aliquet nec, imperdiet nec,', '2017-09-17', '2017-10-01');
INSERT INTO evento VALUES (186, 136, 48, 'ac mattis', 'ligula. Nullam enim. Sed', '2018-01-29', '2018-02-12');
INSERT INTO evento VALUES (187, 73, 2, 'amet, faucibus ut, nulla. Cras', 'mollis dui,', '2018-06-15', '2018-06-29');
INSERT INTO evento VALUES (188, 193, 3, 'mauris id sapien.', 'sit amet, consectetuer adipiscing elit.', '2017-09-22', '2017-10-06');
INSERT INTO evento VALUES (189, 180, 43, 'enim, condimentum', 'convallis in, cursus et, eros. Proin', '2018-11-08', '2018-11-22');
INSERT INTO evento VALUES (190, 30, 3, 'Fusce', 'commodo hendrerit. Donec porttitor tellus non magna. Nam', '2018-08-12', '2018-08-26');
INSERT INTO evento VALUES (191, 186, 21, 'tincidunt tempus risus.', 'tortor at risus. Nunc ac sem ut dolor dapibus', '2017-08-16', '2017-08-30');
INSERT INTO evento VALUES (192, 163, 13, 'ultrices. Vivamus rhoncus. Donec est.', 'mauris, aliquam eu, accumsan sed, facilisis vitae, orci.', '2019-04-26', '2019-05-10');
INSERT INTO evento VALUES (193, 98, 34, 'eget', 'rutrum eu, ultrices sit', '2017-03-17', '2017-03-31');
INSERT INTO evento VALUES (194, 164, 11, 'amet ante.', 'ipsum. Curabitur consequat, lectus sit amet', '2017-07-01', '2017-07-15');
INSERT INTO evento VALUES (195, 199, 34, 'dictum eu, eleifend nec, malesuada', 'Curabitur vel lectus. Cum sociis natoque penatibus', '2016-05-19', '2016-06-02');
INSERT INTO evento VALUES (196, 152, 28, 'ac', 'Morbi neque tellus, imperdiet non, vestibulum nec, euismod in,', '2015-11-24', '2015-12-08');
INSERT INTO evento VALUES (197, 40, 32, 'ipsum leo', 'lobortis quis, pede. Suspendisse', '2018-10-21', '2018-11-04');
INSERT INTO evento VALUES (198, 41, 41, 'massa. Quisque porttitor eros', 'risus. Nunc ac sem ut dolor dapibus gravida. Aliquam', '2016-01-02', '2016-01-16');
INSERT INTO evento VALUES (199, 162, 34, 'eu', 'dolor, tempus non, lacinia at, iaculis quis, pede.', '2018-12-05', '2018-12-19');
INSERT INTO evento VALUES (200, 13, 40, 'lacus. Ut', 'Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus.', '2017-07-05', '2017-07-19');
INSERT INTO evento VALUES (1, 175, 25, 'ipsum leo elementum sem,', 'nibh lacinia orci, consectetuer euismod', '2016-09-27', '2016-10-11');
INSERT INTO evento VALUES (2, 196, 1, 'nascetur ridiculus mus. Proin', 'sem. Nulla interdum. Curabitur dictum. Phasellus', '2017-05-20', '2017-06-03');
INSERT INTO evento VALUES (3, 25, 40, 'Donec luctus', 'cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum', '2017-04-29', '2017-05-13');
INSERT INTO evento VALUES (4, 76, 40, 'vestibulum, neque', 'ipsum sodales purus, in molestie tortor', '2018-09-13', '2018-09-27');
INSERT INTO evento VALUES (5, 159, 12, 'ornare sagittis felis. Donec tempor,', 'commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat,', '2018-11-04', '2018-11-18');
INSERT INTO evento VALUES (6, 114, 35, 'pharetra. Quisque', 'quam. Pellentesque habitant morbi tristique senectus et netus et', '2015-10-14', '2015-10-28');
INSERT INTO evento VALUES (7, 9, 41, 'blandit viverra. Donec tempus, lorem', 'Nullam lobortis', '2016-02-09', '2016-02-23');
INSERT INTO evento VALUES (8, 170, 14, 'Nam', 'odio,', '2018-11-18', '2018-12-02');
INSERT INTO evento VALUES (9, 144, 21, 'convallis dolor. Quisque tincidunt', 'penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2019-05-19', '2019-06-02');
INSERT INTO evento VALUES (10, 101, 32, 'hendrerit neque. In', 'feugiat placerat', '2018-07-24', '2018-08-07');
INSERT INTO evento VALUES (11, 77, 35, 'venenatis', 'Curabitur', '2018-11-26', '2018-12-10');
INSERT INTO evento VALUES (12, 126, 4, 'sagittis lobortis mauris. Suspendisse', 'convallis in, cursus et, eros. Proin ultrices. Duis', '2018-11-05', '2018-11-19');
INSERT INTO evento VALUES (13, 168, 30, 'velit', 'eu, odio. Phasellus at augue id ante dictum', '2017-02-11', '2017-02-25');
INSERT INTO evento VALUES (14, 193, 22, 'in faucibus orci', 'ut odio vel est tempor', '2015-11-10', '2015-11-24');
INSERT INTO evento VALUES (15, 12, 49, 'eu', 'in, tempus eu, ligula. Aenean', '2019-04-03', '2019-04-17');
INSERT INTO evento VALUES (16, 2, 42, 'mollis. Integer tincidunt aliquam arcu.', 'fringilla, porttitor vulputate, posuere vulputate, lacus. Cras', '2016-01-10', '2016-01-24');
INSERT INTO evento VALUES (17, 198, 13, 'urna.', 'Sed congue, elit sed consequat auctor, nunc nulla', '2016-09-12', '2016-09-26');
INSERT INTO evento VALUES (18, 116, 28, 'quis arcu', 'aliquam eu, accumsan sed, facilisis vitae,', '2016-11-24', '2016-12-08');
INSERT INTO evento VALUES (19, 178, 26, 'sagittis lobortis mauris.', 'dui. Fusce diam', '2017-02-27', '2017-03-13');
INSERT INTO evento VALUES (20, 185, 15, 'accumsan interdum libero dui nec', 'aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend', '2018-06-01', '2018-06-15');
INSERT INTO evento VALUES (21, 42, 47, 'dictum.', 'fringilla', '2018-05-27', '2018-06-10');
INSERT INTO evento VALUES (22, 10, 50, 'Pellentesque', 'fermentum convallis ligula. Donec luctus aliquet odio. Etiam', '2017-04-03', '2017-04-17');
INSERT INTO evento VALUES (23, 163, 15, 'sem ut', 'lorem,', '2018-10-09', '2018-10-23');
INSERT INTO evento VALUES (24, 41, 45, 'nisl. Nulla eu', 'sociis natoque penatibus et', '2019-03-13', '2019-03-27');
INSERT INTO evento VALUES (25, 129, 15, 'malesuada malesuada. Integer id magna', 'eros. Proin ultrices.', '2017-07-03', '2017-07-17');
INSERT INTO evento VALUES (26, 185, 25, 'vitae dolor. Donec fringilla.', 'Quisque imperdiet, erat nonummy ultricies ornare, elit', '2016-09-10', '2016-09-24');
INSERT INTO evento VALUES (27, 187, 33, 'vestibulum nec, euismod in, dolor.', 'nibh enim, gravida sit amet, dapibus id, blandit', '2018-10-16', '2018-10-30');
INSERT INTO evento VALUES (28, 152, 27, 'orci. Donec nibh. Quisque', 'fringilla mi lacinia mattis. Integer eu lacus.', '2019-05-14', '2019-05-28');
INSERT INTO evento VALUES (29, 196, 44, 'dapibus ligula. Aliquam erat', 'diam. Pellentesque habitant morbi tristique senectus', '2017-07-05', '2017-07-19');
INSERT INTO evento VALUES (30, 5, 11, 'arcu. Sed', 'iaculis quis, pede. Praesent eu dui. Cum sociis', '2019-05-17', '2019-05-31');
INSERT INTO evento VALUES (31, 167, 35, 'id,', 'lacinia. Sed congue, elit sed consequat auctor, nunc nulla', '2019-02-25', '2019-03-11');
INSERT INTO evento VALUES (32, 88, 38, 'eu dolor egestas', 'vitae odio sagittis semper. Nam tempor diam dictum', '2015-12-19', '2016-01-02');
INSERT INTO evento VALUES (33, 151, 25, 'libero. Proin sed turpis', 'ligula consectetuer rhoncus. Nullam velit dui,', '2017-09-21', '2017-10-05');
INSERT INTO evento VALUES (34, 71, 28, 'sapien. Nunc', 'sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique', '2018-03-12', '2018-03-26');
INSERT INTO evento VALUES (35, 21, 48, 'Sed auctor odio a purus.', 'facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus', '2016-03-17', '2016-03-31');
INSERT INTO evento VALUES (36, 20, 38, 'sit amet diam', 'Morbi non sapien molestie', '2017-04-14', '2017-04-28');
INSERT INTO evento VALUES (37, 198, 41, 'turpis.', 'tellus', '2016-05-15', '2016-05-29');
INSERT INTO evento VALUES (38, 105, 41, 'Nulla interdum.', 'elit, a feugiat tellus', '2018-12-07', '2018-12-21');
INSERT INTO evento VALUES (39, 106, 36, 'velit egestas', 'volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing', '2017-08-17', '2017-08-31');
INSERT INTO evento VALUES (40, 107, 43, 'nibh vulputate', 'ut, sem. Nulla interdum.', '2017-01-27', '2017-02-10');
INSERT INTO evento VALUES (41, 61, 21, 'lorem tristique aliquet. Phasellus fermentum', 'diam. Duis mi enim, condimentum eget, volutpat', '2017-07-16', '2017-07-30');
INSERT INTO evento VALUES (42, 11, 32, 'odio.', 'Nunc', '2017-07-19', '2017-08-02');
INSERT INTO evento VALUES (43, 170, 28, 'sit amet risus. Donec egestas.', 'tristique pharetra. Quisque ac libero nec ligula consectetuer', '2018-05-19', '2018-06-02');
INSERT INTO evento VALUES (44, 186, 13, 'Duis', 'mollis', '2019-01-08', '2019-01-22');
INSERT INTO evento VALUES (45, 126, 27, 'Morbi accumsan laoreet ipsum.', 'ullamcorper', '2019-05-28', '2019-06-11');
INSERT INTO evento VALUES (46, 17, 19, 'sapien, gravida', 'consectetuer adipiscing', '2016-08-29', '2016-09-12');
INSERT INTO evento VALUES (47, 66, 10, 'auctor odio a purus.', 'Aenean eget magna.', '2019-01-16', '2019-01-30');
INSERT INTO evento VALUES (48, 128, 7, 'metus', 'dictum mi, ac', '2017-08-15', '2017-08-29');
INSERT INTO evento VALUES (49, 191, 8, 'accumsan', 'Nulla interdum. Curabitur dictum. Phasellus', '2017-10-11', '2017-10-25');
INSERT INTO evento VALUES (50, 158, 5, 'risus varius orci, in', 'ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero', '2016-03-21', '2016-04-04');
INSERT INTO evento VALUES (51, 78, 4, 'elit', 'sit', '2017-04-10', '2017-04-24');
INSERT INTO evento VALUES (144, 99, 23, 'risus quis diam luctus', 'volutpat.', '2018-01-03', '2018-01-17');
INSERT INTO evento VALUES (145, 42, 23, 'egestas. Sed pharetra, felis eget', 'tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque', '2018-05-22', '2018-06-05');
INSERT INTO evento VALUES (146, 79, 2, 'non, lobortis', 'sapien. Nunc pulvinar arcu et pede. Nunc', '2017-03-22', '2017-04-05');
INSERT INTO evento VALUES (147, 133, 38, 'a, aliquet vel,', 'eget mollis lectus', '2018-01-10', '2018-01-24');
INSERT INTO evento VALUES (148, 53, 16, 'cursus. Nunc mauris elit, dictum', 'quam dignissim pharetra. Nam', '2017-05-27', '2017-06-10');
INSERT INTO evento VALUES (149, 88, 42, 'adipiscing', 'at', '2017-03-27', '2017-04-10');
INSERT INTO evento VALUES (150, 16, 16, 'pede ac urna. Ut', 'nec, eleifend', '2016-05-09', '2016-05-23');
INSERT INTO evento VALUES (151, 154, 27, 'mi. Duis risus', 'nostra, per inceptos hymenaeos. Mauris', '2016-12-05', '2016-12-19');
INSERT INTO evento VALUES (152, 4, 7, 'magna', 'tempus risus. Donec egestas.', '2018-05-14', '2018-05-28');
INSERT INTO evento VALUES (153, 71, 29, 'ac libero nec', 'ante dictum mi, ac mattis velit justo nec', '2017-02-01', '2017-02-15');
INSERT INTO evento VALUES (154, 11, 9, 'eu elit. Nulla facilisi.', 'blandit. Nam nulla magna,', '2016-09-25', '2016-10-09');
INSERT INTO evento VALUES (155, 78, 23, 'adipiscing', 'nisl arcu iaculis enim, sit', '2019-02-23', '2019-03-09');
INSERT INTO evento VALUES (156, 110, 13, 'ullamcorper magna. Sed eu eros.', 'non sapien molestie', '2017-07-06', '2017-07-20');
INSERT INTO evento VALUES (157, 77, 12, 'est. Mauris eu', 'quam dignissim pharetra. Nam ac nulla. In tincidunt', '2018-04-07', '2018-04-21');
INSERT INTO evento VALUES (158, 134, 3, 'molestie. Sed', 'Cras convallis convallis dolor.', '2016-03-15', '2016-03-29');
INSERT INTO evento VALUES (159, 37, 23, 'dui. Fusce', 'mauris sapien, cursus in, hendrerit consectetuer, cursus', '2019-05-06', '2019-05-20');
INSERT INTO evento VALUES (160, 163, 3, 'imperdiet', 'Quisque', '2017-03-28', '2017-04-11');
INSERT INTO evento VALUES (161, 55, 31, 'Aenean eget metus. In', 'enim nisl elementum purus, accumsan interdum libero dui', '2018-06-30', '2018-07-14');
INSERT INTO evento VALUES (162, 74, 6, 'amet, consectetuer', 'Nunc sollicitudin commodo ipsum. Suspendisse', '2017-10-13', '2017-10-27');
INSERT INTO evento VALUES (163, 101, 9, 'ipsum dolor sit amet, consectetuer', 'Mauris eu turpis. Nulla aliquet.', '2016-03-01', '2016-03-15');


--
-- TOC entry 2231 (class 0 OID 66178)
-- Dependencies: 188
-- Data for Name: inscativ; Type: TABLE DATA; Schema: teste; Owner: postgres
--

INSERT INTO inscativ VALUES (1, 90, 12, 15.00);
INSERT INTO inscativ VALUES (2, 45, 14, 15.00);
INSERT INTO inscativ VALUES (3, 199, 12, 15.00);
INSERT INTO inscativ VALUES (4, 120, 15, 15.00);
INSERT INTO inscativ VALUES (5, 134, 11, 15.00);
INSERT INTO inscativ VALUES (6, 84, 11, 15.00);
INSERT INTO inscativ VALUES (7, 3, 13, 15.00);
INSERT INTO inscativ VALUES (8, 155, 14, 15.00);
INSERT INTO inscativ VALUES (9, 75, 11, 15.00);
INSERT INTO inscativ VALUES (10, 143, 14, 15.00);
INSERT INTO inscativ VALUES (11, 152, 14, 15.00);
INSERT INTO inscativ VALUES (12, 171, 11, 15.00);
INSERT INTO inscativ VALUES (13, 89, 13, 15.00);
INSERT INTO inscativ VALUES (14, 169, 11, 15.00);
INSERT INTO inscativ VALUES (15, 53, 13, 15.00);
INSERT INTO inscativ VALUES (16, 165, 13, 15.00);
INSERT INTO inscativ VALUES (17, 14, 15, 15.00);
INSERT INTO inscativ VALUES (18, 173, 11, 15.00);
INSERT INTO inscativ VALUES (19, 11, 15, 15.00);
INSERT INTO inscativ VALUES (20, 3, 13, 15.00);
INSERT INTO inscativ VALUES (21, 12, 13, 15.00);
INSERT INTO inscativ VALUES (22, 85, 11, 15.00);
INSERT INTO inscativ VALUES (23, 49, 15, 15.00);
INSERT INTO inscativ VALUES (24, 112, 11, 15.00);
INSERT INTO inscativ VALUES (25, 92, 14, 15.00);
INSERT INTO inscativ VALUES (26, 61, 13, 15.00);
INSERT INTO inscativ VALUES (27, 29, 14, 15.00);
INSERT INTO inscativ VALUES (28, 155, 14, 15.00);
INSERT INTO inscativ VALUES (29, 35, 13, 15.00);
INSERT INTO inscativ VALUES (30, 48, 14, 15.00);
INSERT INTO inscativ VALUES (31, 69, 11, 15.00);
INSERT INTO inscativ VALUES (32, 186, 14, 15.00);
INSERT INTO inscativ VALUES (33, 45, 14, 15.00);
INSERT INTO inscativ VALUES (34, 43, 15, 15.00);
INSERT INTO inscativ VALUES (35, 101, 11, 15.00);
INSERT INTO inscativ VALUES (36, 153, 14, 15.00);
INSERT INTO inscativ VALUES (37, 81, 12, 15.00);
INSERT INTO inscativ VALUES (38, 90, 12, 15.00);
INSERT INTO inscativ VALUES (39, 132, 12, 15.00);
INSERT INTO inscativ VALUES (40, 84, 11, 15.00);
INSERT INTO inscativ VALUES (41, 88, 13, 15.00);
INSERT INTO inscativ VALUES (42, 95, 15, 15.00);
INSERT INTO inscativ VALUES (43, 77, 15, 15.00);
INSERT INTO inscativ VALUES (44, 120, 15, 15.00);
INSERT INTO inscativ VALUES (45, 193, 15, 15.00);
INSERT INTO inscativ VALUES (46, 150, 13, 15.00);
INSERT INTO inscativ VALUES (47, 154, 14, 15.00);
INSERT INTO inscativ VALUES (48, 19, 11, 15.00);
INSERT INTO inscativ VALUES (49, 116, 11, 15.00);
INSERT INTO inscativ VALUES (50, 58, 14, 15.00);
INSERT INTO inscativ VALUES (51, 46, 15, 15.00);
INSERT INTO inscativ VALUES (52, 91, 13, 15.00);
INSERT INTO inscativ VALUES (53, 79, 11, 15.00);
INSERT INTO inscativ VALUES (54, 58, 14, 15.00);
INSERT INTO inscativ VALUES (55, 139, 14, 15.00);
INSERT INTO inscativ VALUES (56, 13, 14, 15.00);
INSERT INTO inscativ VALUES (57, 141, 12, 15.00);
INSERT INTO inscativ VALUES (58, 152, 14, 15.00);
INSERT INTO inscativ VALUES (59, 199, 12, 15.00);
INSERT INTO inscativ VALUES (60, 119, 14, 15.00);
INSERT INTO inscativ VALUES (61, 158, 14, 15.00);
INSERT INTO inscativ VALUES (62, 186, 14, 15.00);
INSERT INTO inscativ VALUES (63, 188, 14, 15.00);
INSERT INTO inscativ VALUES (64, 8, 12, 15.00);
INSERT INTO inscativ VALUES (65, 90, 12, 15.00);
INSERT INTO inscativ VALUES (66, 134, 11, 15.00);
INSERT INTO inscativ VALUES (67, 93, 13, 15.00);
INSERT INTO inscativ VALUES (68, 46, 15, 15.00);
INSERT INTO inscativ VALUES (69, 85, 11, 15.00);
INSERT INTO inscativ VALUES (70, 139, 14, 15.00);
INSERT INTO inscativ VALUES (71, 93, 13, 15.00);
INSERT INTO inscativ VALUES (72, 34, 12, 15.00);
INSERT INTO inscativ VALUES (73, 57, 15, 15.00);
INSERT INTO inscativ VALUES (74, 37, 14, 15.00);
INSERT INTO inscativ VALUES (75, 95, 15, 15.00);
INSERT INTO inscativ VALUES (76, 22, 15, 15.00);
INSERT INTO inscativ VALUES (77, 169, 11, 15.00);
INSERT INTO inscativ VALUES (78, 89, 13, 15.00);
INSERT INTO inscativ VALUES (79, 200, 13, 15.00);
INSERT INTO inscativ VALUES (80, 18, 15, 15.00);
INSERT INTO inscativ VALUES (81, 200, 13, 15.00);
INSERT INTO inscativ VALUES (82, 191, 13, 15.00);
INSERT INTO inscativ VALUES (83, 82, 12, 15.00);
INSERT INTO inscativ VALUES (84, 152, 14, 15.00);
INSERT INTO inscativ VALUES (85, 58, 14, 15.00);
INSERT INTO inscativ VALUES (86, 138, 15, 15.00);
INSERT INTO inscativ VALUES (87, 6, 15, 15.00);
INSERT INTO inscativ VALUES (88, 200, 13, 15.00);
INSERT INTO inscativ VALUES (89, 71, 13, 15.00);
INSERT INTO inscativ VALUES (90, 20, 15, 15.00);
INSERT INTO inscativ VALUES (91, 163, 15, 15.00);
INSERT INTO inscativ VALUES (92, 58, 14, 15.00);
INSERT INTO inscativ VALUES (93, 91, 13, 15.00);
INSERT INTO inscativ VALUES (94, 48, 14, 15.00);
INSERT INTO inscativ VALUES (95, 137, 13, 15.00);
INSERT INTO inscativ VALUES (96, 48, 14, 15.00);
INSERT INTO inscativ VALUES (97, 115, 11, 15.00);
INSERT INTO inscativ VALUES (98, 29, 14, 15.00);
INSERT INTO inscativ VALUES (99, 36, 13, 15.00);
INSERT INTO inscativ VALUES (100, 22, 15, 15.00);
INSERT INTO inscativ VALUES (101, 123, 15, 15.00);
INSERT INTO inscativ VALUES (102, 34, 12, 15.00);
INSERT INTO inscativ VALUES (103, 187, 13, 15.00);
INSERT INTO inscativ VALUES (104, 38, 12, 15.00);
INSERT INTO inscativ VALUES (105, 26, 11, 15.00);
INSERT INTO inscativ VALUES (106, 43, 15, 15.00);
INSERT INTO inscativ VALUES (107, 112, 11, 15.00);
INSERT INTO inscativ VALUES (108, 2, 13, 15.00);
INSERT INTO inscativ VALUES (109, 1, 15, 15.00);
INSERT INTO inscativ VALUES (110, 110, 14, 15.00);
INSERT INTO inscativ VALUES (111, 146, 14, 15.00);
INSERT INTO inscativ VALUES (112, 107, 13, 15.00);
INSERT INTO inscativ VALUES (113, 185, 12, 15.00);
INSERT INTO inscativ VALUES (114, 61, 13, 15.00);
INSERT INTO inscativ VALUES (115, 85, 11, 15.00);
INSERT INTO inscativ VALUES (116, 116, 11, 15.00);
INSERT INTO inscativ VALUES (117, 91, 13, 15.00);
INSERT INTO inscativ VALUES (118, 14, 15, 15.00);
INSERT INTO inscativ VALUES (119, 86, 13, 15.00);
INSERT INTO inscativ VALUES (120, 177, 14, 15.00);
INSERT INTO inscativ VALUES (121, 107, 13, 15.00);
INSERT INTO inscativ VALUES (122, 37, 14, 15.00);
INSERT INTO inscativ VALUES (123, 27, 15, 15.00);
INSERT INTO inscativ VALUES (124, 166, 12, 15.00);
INSERT INTO inscativ VALUES (125, 101, 11, 15.00);
INSERT INTO inscativ VALUES (126, 169, 11, 15.00);
INSERT INTO inscativ VALUES (127, 18, 15, 15.00);
INSERT INTO inscativ VALUES (128, 161, 12, 15.00);
INSERT INTO inscativ VALUES (129, 26, 11, 15.00);
INSERT INTO inscativ VALUES (130, 50, 15, 15.00);
INSERT INTO inscativ VALUES (131, 53, 13, 15.00);
INSERT INTO inscativ VALUES (132, 159, 12, 15.00);
INSERT INTO inscativ VALUES (133, 198, 15, 15.00);
INSERT INTO inscativ VALUES (134, 159, 12, 15.00);
INSERT INTO inscativ VALUES (135, 79, 11, 15.00);
INSERT INTO inscativ VALUES (136, 183, 13, 15.00);
INSERT INTO inscativ VALUES (137, 114, 11, 15.00);
INSERT INTO inscativ VALUES (138, 184, 11, 15.00);
INSERT INTO inscativ VALUES (139, 195, 13, 15.00);
INSERT INTO inscativ VALUES (140, 146, 14, 15.00);
INSERT INTO inscativ VALUES (141, 148, 13, 15.00);
INSERT INTO inscativ VALUES (142, 146, 14, 15.00);
INSERT INTO inscativ VALUES (143, 47, 12, 15.00);
INSERT INTO inscativ VALUES (144, 35, 13, 15.00);
INSERT INTO inscativ VALUES (145, 170, 14, 15.00);
INSERT INTO inscativ VALUES (146, 137, 13, 15.00);
INSERT INTO inscativ VALUES (147, 51, 13, 15.00);
INSERT INTO inscativ VALUES (148, 4, 14, 15.00);
INSERT INTO inscativ VALUES (149, 8, 12, 15.00);
INSERT INTO inscativ VALUES (150, 150, 13, 15.00);
INSERT INTO inscativ VALUES (151, 6, 15, 15.00);
INSERT INTO inscativ VALUES (152, 83, 14, 15.00);
INSERT INTO inscativ VALUES (153, 18, 15, 15.00);
INSERT INTO inscativ VALUES (154, 36, 13, 15.00);
INSERT INTO inscativ VALUES (155, 105, 15, 15.00);
INSERT INTO inscativ VALUES (156, 123, 15, 15.00);
INSERT INTO inscativ VALUES (157, 60, 15, 15.00);
INSERT INTO inscativ VALUES (158, 132, 12, 15.00);
INSERT INTO inscativ VALUES (159, 101, 11, 15.00);
INSERT INTO inscativ VALUES (160, 192, 13, 15.00);
INSERT INTO inscativ VALUES (161, 55, 15, 15.00);
INSERT INTO inscativ VALUES (162, 142, 13, 15.00);
INSERT INTO inscativ VALUES (163, 13, 14, 15.00);
INSERT INTO inscativ VALUES (164, 63, 14, 15.00);
INSERT INTO inscativ VALUES (165, 54, 15, 15.00);
INSERT INTO inscativ VALUES (166, 62, 14, 15.00);
INSERT INTO inscativ VALUES (167, 71, 13, 15.00);
INSERT INTO inscativ VALUES (168, 194, 12, 15.00);
INSERT INTO inscativ VALUES (169, 17, 15, 15.00);
INSERT INTO inscativ VALUES (170, 132, 12, 15.00);
INSERT INTO inscativ VALUES (171, 85, 11, 15.00);
INSERT INTO inscativ VALUES (172, 25, 13, 15.00);
INSERT INTO inscativ VALUES (173, 97, 15, 15.00);
INSERT INTO inscativ VALUES (174, 148, 13, 15.00);
INSERT INTO inscativ VALUES (175, 12, 13, 15.00);
INSERT INTO inscativ VALUES (176, 59, 15, 15.00);
INSERT INTO inscativ VALUES (177, 24, 13, 15.00);
INSERT INTO inscativ VALUES (178, 159, 12, 15.00);
INSERT INTO inscativ VALUES (179, 66, 13, 15.00);
INSERT INTO inscativ VALUES (180, 154, 14, 15.00);
INSERT INTO inscativ VALUES (181, 173, 11, 15.00);
INSERT INTO inscativ VALUES (182, 126, 13, 15.00);
INSERT INTO inscativ VALUES (183, 97, 15, 15.00);
INSERT INTO inscativ VALUES (184, 103, 15, 15.00);
INSERT INTO inscativ VALUES (185, 180, 14, 15.00);
INSERT INTO inscativ VALUES (186, 32, 14, 15.00);
INSERT INTO inscativ VALUES (187, 182, 13, 15.00);
INSERT INTO inscativ VALUES (188, 88, 13, 15.00);
INSERT INTO inscativ VALUES (189, 84, 11, 15.00);
INSERT INTO inscativ VALUES (190, 69, 11, 15.00);
INSERT INTO inscativ VALUES (191, 35, 13, 15.00);
INSERT INTO inscativ VALUES (192, 36, 13, 15.00);
INSERT INTO inscativ VALUES (193, 15, 14, 15.00);
INSERT INTO inscativ VALUES (194, 184, 11, 15.00);
INSERT INTO inscativ VALUES (195, 5, 13, 15.00);
INSERT INTO inscativ VALUES (196, 131, 11, 15.00);
INSERT INTO inscativ VALUES (197, 24, 13, 15.00);
INSERT INTO inscativ VALUES (198, 154, 14, 15.00);
INSERT INTO inscativ VALUES (199, 115, 11, 15.00);
INSERT INTO inscativ VALUES (200, 123, 15, 15.00);
INSERT INTO inscativ VALUES (201, 109, 13, 15.00);
INSERT INTO inscativ VALUES (202, 159, 12, 15.00);
INSERT INTO inscativ VALUES (203, 95, 15, 15.00);
INSERT INTO inscativ VALUES (204, 15, 14, 15.00);
INSERT INTO inscativ VALUES (205, 67, 14, 15.00);
INSERT INTO inscativ VALUES (206, 61, 13, 15.00);
INSERT INTO inscativ VALUES (207, 58, 14, 15.00);
INSERT INTO inscativ VALUES (208, 80, 11, 15.00);
INSERT INTO inscativ VALUES (209, 85, 11, 15.00);
INSERT INTO inscativ VALUES (210, 139, 14, 15.00);
INSERT INTO inscativ VALUES (211, 196, 15, 15.00);
INSERT INTO inscativ VALUES (212, 28, 15, 15.00);
INSERT INTO inscativ VALUES (213, 161, 12, 15.00);
INSERT INTO inscativ VALUES (214, 91, 13, 15.00);
INSERT INTO inscativ VALUES (215, 121, 12, 15.00);
INSERT INTO inscativ VALUES (216, 30, 13, 15.00);
INSERT INTO inscativ VALUES (217, 51, 13, 15.00);
INSERT INTO inscativ VALUES (218, 165, 13, 15.00);
INSERT INTO inscativ VALUES (219, 59, 15, 15.00);
INSERT INTO inscativ VALUES (220, 18, 15, 15.00);
INSERT INTO inscativ VALUES (221, 108, 12, 15.00);
INSERT INTO inscativ VALUES (222, 165, 13, 15.00);
INSERT INTO inscativ VALUES (223, 24, 13, 15.00);
INSERT INTO inscativ VALUES (224, 99, 13, 15.00);
INSERT INTO inscativ VALUES (225, 176, 14, 15.00);
INSERT INTO inscativ VALUES (226, 57, 15, 15.00);
INSERT INTO inscativ VALUES (227, 74, 14, 15.00);
INSERT INTO inscativ VALUES (228, 51, 13, 15.00);
INSERT INTO inscativ VALUES (229, 142, 13, 15.00);
INSERT INTO inscativ VALUES (230, 60, 15, 15.00);
INSERT INTO inscativ VALUES (231, 130, 13, 15.00);
INSERT INTO inscativ VALUES (232, 59, 15, 15.00);
INSERT INTO inscativ VALUES (233, 6, 15, 15.00);
INSERT INTO inscativ VALUES (234, 66, 13, 15.00);
INSERT INTO inscativ VALUES (235, 53, 13, 15.00);
INSERT INTO inscativ VALUES (236, 33, 13, 15.00);
INSERT INTO inscativ VALUES (237, 66, 13, 15.00);
INSERT INTO inscativ VALUES (238, 11, 15, 15.00);
INSERT INTO inscativ VALUES (239, 147, 13, 15.00);
INSERT INTO inscativ VALUES (240, 157, 14, 15.00);
INSERT INTO inscativ VALUES (241, 180, 14, 15.00);
INSERT INTO inscativ VALUES (242, 11, 15, 15.00);
INSERT INTO inscativ VALUES (243, 79, 11, 15.00);
INSERT INTO inscativ VALUES (244, 143, 14, 15.00);
INSERT INTO inscativ VALUES (245, 94, 11, 15.00);
INSERT INTO inscativ VALUES (246, 54, 15, 15.00);
INSERT INTO inscativ VALUES (247, 51, 13, 15.00);
INSERT INTO inscativ VALUES (248, 136, 13, 15.00);
INSERT INTO inscativ VALUES (249, 74, 14, 15.00);
INSERT INTO inscativ VALUES (250, 124, 13, 15.00);
INSERT INTO inscativ VALUES (251, 102, 11, 15.00);
INSERT INTO inscativ VALUES (252, 115, 11, 15.00);
INSERT INTO inscativ VALUES (253, 129, 13, 15.00);
INSERT INTO inscativ VALUES (254, 167, 13, 15.00);
INSERT INTO inscativ VALUES (255, 126, 13, 15.00);
INSERT INTO inscativ VALUES (256, 183, 13, 15.00);
INSERT INTO inscativ VALUES (257, 195, 13, 15.00);
INSERT INTO inscativ VALUES (258, 34, 12, 15.00);
INSERT INTO inscativ VALUES (259, 153, 14, 15.00);
INSERT INTO inscativ VALUES (260, 91, 13, 15.00);
INSERT INTO inscativ VALUES (261, 109, 13, 15.00);
INSERT INTO inscativ VALUES (262, 136, 13, 15.00);
INSERT INTO inscativ VALUES (263, 30, 13, 15.00);
INSERT INTO inscativ VALUES (264, 197, 12, 15.00);
INSERT INTO inscativ VALUES (265, 104, 15, 15.00);
INSERT INTO inscativ VALUES (266, 2, 13, 15.00);
INSERT INTO inscativ VALUES (267, 123, 15, 15.00);
INSERT INTO inscativ VALUES (268, 135, 11, 15.00);
INSERT INTO inscativ VALUES (269, 48, 14, 15.00);
INSERT INTO inscativ VALUES (270, 7, 15, 15.00);
INSERT INTO inscativ VALUES (271, 170, 14, 15.00);
INSERT INTO inscativ VALUES (272, 116, 11, 15.00);
INSERT INTO inscativ VALUES (273, 55, 15, 15.00);
INSERT INTO inscativ VALUES (274, 66, 13, 15.00);
INSERT INTO inscativ VALUES (275, 90, 12, 15.00);
INSERT INTO inscativ VALUES (276, 23, 15, 15.00);
INSERT INTO inscativ VALUES (277, 117, 13, 15.00);
INSERT INTO inscativ VALUES (278, 22, 15, 15.00);
INSERT INTO inscativ VALUES (279, 75, 11, 15.00);
INSERT INTO inscativ VALUES (280, 149, 11, 15.00);
INSERT INTO inscativ VALUES (281, 168, 15, 15.00);
INSERT INTO inscativ VALUES (282, 33, 13, 15.00);
INSERT INTO inscativ VALUES (283, 58, 14, 15.00);
INSERT INTO inscativ VALUES (284, 174, 11, 15.00);
INSERT INTO inscativ VALUES (285, 145, 11, 15.00);
INSERT INTO inscativ VALUES (286, 98, 12, 15.00);
INSERT INTO inscativ VALUES (287, 16, 14, 15.00);
INSERT INTO inscativ VALUES (288, 92, 14, 15.00);
INSERT INTO inscativ VALUES (289, 160, 11, 15.00);
INSERT INTO inscativ VALUES (290, 173, 11, 15.00);
INSERT INTO inscativ VALUES (291, 21, 13, 15.00);
INSERT INTO inscativ VALUES (292, 13, 14, 15.00);
INSERT INTO inscativ VALUES (293, 85, 11, 15.00);
INSERT INTO inscativ VALUES (294, 66, 13, 15.00);
INSERT INTO inscativ VALUES (295, 153, 14, 15.00);
INSERT INTO inscativ VALUES (296, 49, 15, 15.00);
INSERT INTO inscativ VALUES (297, 155, 14, 15.00);
INSERT INTO inscativ VALUES (298, 195, 13, 15.00);
INSERT INTO inscativ VALUES (299, 102, 11, 15.00);
INSERT INTO inscativ VALUES (300, 125, 13, 15.00);
INSERT INTO inscativ VALUES (301, 69, 11, 15.00);
INSERT INTO inscativ VALUES (302, 106, 15, 15.00);
INSERT INTO inscativ VALUES (303, 150, 13, 15.00);
INSERT INTO inscativ VALUES (304, 56, 12, 15.00);
INSERT INTO inscativ VALUES (305, 90, 12, 15.00);
INSERT INTO inscativ VALUES (306, 141, 12, 15.00);
INSERT INTO inscativ VALUES (307, 32, 14, 15.00);
INSERT INTO inscativ VALUES (308, 80, 11, 15.00);
INSERT INTO inscativ VALUES (309, 107, 13, 15.00);
INSERT INTO inscativ VALUES (310, 186, 14, 15.00);
INSERT INTO inscativ VALUES (311, 66, 13, 15.00);
INSERT INTO inscativ VALUES (312, 116, 11, 15.00);
INSERT INTO inscativ VALUES (313, 166, 12, 15.00);
INSERT INTO inscativ VALUES (314, 75, 11, 15.00);
INSERT INTO inscativ VALUES (315, 17, 15, 15.00);
INSERT INTO inscativ VALUES (316, 135, 11, 15.00);
INSERT INTO inscativ VALUES (317, 127, 11, 15.00);
INSERT INTO inscativ VALUES (318, 10, 15, 15.00);
INSERT INTO inscativ VALUES (319, 73, 14, 15.00);
INSERT INTO inscativ VALUES (320, 78, 15, 15.00);
INSERT INTO inscativ VALUES (321, 196, 15, 15.00);
INSERT INTO inscativ VALUES (322, 48, 14, 15.00);
INSERT INTO inscativ VALUES (323, 48, 14, 15.00);
INSERT INTO inscativ VALUES (324, 78, 15, 15.00);
INSERT INTO inscativ VALUES (325, 5, 13, 15.00);
INSERT INTO inscativ VALUES (326, 181, 12, 15.00);
INSERT INTO inscativ VALUES (327, 53, 13, 15.00);
INSERT INTO inscativ VALUES (328, 178, 11, 15.00);
INSERT INTO inscativ VALUES (329, 148, 13, 15.00);
INSERT INTO inscativ VALUES (330, 66, 13, 15.00);
INSERT INTO inscativ VALUES (331, 57, 15, 15.00);
INSERT INTO inscativ VALUES (332, 189, 11, 15.00);
INSERT INTO inscativ VALUES (333, 168, 15, 15.00);
INSERT INTO inscativ VALUES (334, 143, 14, 15.00);
INSERT INTO inscativ VALUES (335, 169, 11, 15.00);
INSERT INTO inscativ VALUES (336, 136, 13, 15.00);
INSERT INTO inscativ VALUES (337, 184, 11, 15.00);
INSERT INTO inscativ VALUES (338, 144, 13, 15.00);
INSERT INTO inscativ VALUES (339, 97, 15, 15.00);
INSERT INTO inscativ VALUES (340, 148, 13, 15.00);
INSERT INTO inscativ VALUES (341, 83, 14, 15.00);
INSERT INTO inscativ VALUES (342, 167, 13, 15.00);
INSERT INTO inscativ VALUES (343, 115, 11, 15.00);
INSERT INTO inscativ VALUES (344, 93, 13, 15.00);
INSERT INTO inscativ VALUES (345, 176, 14, 15.00);
INSERT INTO inscativ VALUES (346, 179, 15, 15.00);
INSERT INTO inscativ VALUES (347, 37, 14, 15.00);
INSERT INTO inscativ VALUES (348, 76, 12, 15.00);
INSERT INTO inscativ VALUES (349, 106, 15, 15.00);
INSERT INTO inscativ VALUES (350, 199, 12, 15.00);
INSERT INTO inscativ VALUES (351, 33, 13, 15.00);
INSERT INTO inscativ VALUES (352, 3, 13, 15.00);
INSERT INTO inscativ VALUES (353, 155, 14, 15.00);
INSERT INTO inscativ VALUES (354, 139, 14, 15.00);
INSERT INTO inscativ VALUES (355, 30, 13, 15.00);
INSERT INTO inscativ VALUES (356, 34, 12, 15.00);
INSERT INTO inscativ VALUES (357, 131, 11, 15.00);
INSERT INTO inscativ VALUES (358, 173, 11, 15.00);
INSERT INTO inscativ VALUES (359, 139, 14, 15.00);
INSERT INTO inscativ VALUES (360, 175, 11, 15.00);
INSERT INTO inscativ VALUES (361, 147, 13, 15.00);
INSERT INTO inscativ VALUES (362, 111, 13, 15.00);
INSERT INTO inscativ VALUES (363, 56, 12, 15.00);
INSERT INTO inscativ VALUES (364, 149, 11, 15.00);
INSERT INTO inscativ VALUES (365, 132, 12, 15.00);
INSERT INTO inscativ VALUES (366, 175, 11, 15.00);
INSERT INTO inscativ VALUES (367, 12, 13, 15.00);
INSERT INTO inscativ VALUES (368, 28, 15, 15.00);
INSERT INTO inscativ VALUES (369, 166, 12, 15.00);
INSERT INTO inscativ VALUES (370, 123, 15, 15.00);
INSERT INTO inscativ VALUES (371, 46, 15, 15.00);
INSERT INTO inscativ VALUES (372, 18, 15, 15.00);
INSERT INTO inscativ VALUES (373, 6, 15, 15.00);
INSERT INTO inscativ VALUES (374, 124, 13, 15.00);
INSERT INTO inscativ VALUES (375, 64, 11, 15.00);
INSERT INTO inscativ VALUES (376, 3, 13, 15.00);
INSERT INTO inscativ VALUES (377, 118, 11, 15.00);
INSERT INTO inscativ VALUES (378, 45, 14, 15.00);
INSERT INTO inscativ VALUES (379, 59, 15, 15.00);
INSERT INTO inscativ VALUES (380, 67, 14, 15.00);
INSERT INTO inscativ VALUES (381, 67, 14, 15.00);
INSERT INTO inscativ VALUES (382, 92, 14, 15.00);
INSERT INTO inscativ VALUES (383, 144, 13, 15.00);
INSERT INTO inscativ VALUES (384, 177, 14, 15.00);
INSERT INTO inscativ VALUES (385, 131, 11, 15.00);
INSERT INTO inscativ VALUES (386, 34, 12, 15.00);
INSERT INTO inscativ VALUES (387, 118, 11, 15.00);
INSERT INTO inscativ VALUES (388, 115, 11, 15.00);
INSERT INTO inscativ VALUES (389, 197, 12, 15.00);
INSERT INTO inscativ VALUES (390, 102, 11, 15.00);
INSERT INTO inscativ VALUES (391, 6, 15, 15.00);
INSERT INTO inscativ VALUES (392, 55, 15, 15.00);
INSERT INTO inscativ VALUES (393, 160, 11, 15.00);
INSERT INTO inscativ VALUES (394, 175, 11, 15.00);
INSERT INTO inscativ VALUES (395, 50, 15, 15.00);
INSERT INTO inscativ VALUES (396, 117, 13, 15.00);
INSERT INTO inscativ VALUES (397, 149, 11, 15.00);
INSERT INTO inscativ VALUES (398, 159, 12, 15.00);
INSERT INTO inscativ VALUES (399, 174, 11, 15.00);
INSERT INTO inscativ VALUES (400, 161, 12, 15.00);


--
-- TOC entry 2232 (class 0 OID 66181)
-- Dependencies: 189
-- Data for Name: inscricao; Type: TABLE DATA; Schema: teste; Owner: postgres
--

INSERT INTO inscricao VALUES (1, 90, 64, '2016-05-28', 3.00);
INSERT INTO inscricao VALUES (2, 45, 91, '2017-06-27', 18.00);
INSERT INTO inscricao VALUES (3, 199, 100, '2015-10-27', 13.00);
INSERT INTO inscricao VALUES (4, 120, 118, '2015-09-21', 13.00);
INSERT INTO inscricao VALUES (5, 134, 189, '2015-12-10', 17.00);
INSERT INTO inscricao VALUES (6, 84, 199, '2017-11-12', 8.00);
INSERT INTO inscricao VALUES (7, 3, 160, '2016-04-05', 24.00);
INSERT INTO inscricao VALUES (8, 155, 155, '2016-06-28', 6.00);
INSERT INTO inscricao VALUES (9, 75, 133, '2017-08-14', 29.00);
INSERT INTO inscricao VALUES (10, 143, 8, '2016-09-09', 2.00);
INSERT INTO inscricao VALUES (11, 152, 97, '2016-02-13', 11.00);
INSERT INTO inscricao VALUES (12, 171, 142, '2016-09-25', 25.00);
INSERT INTO inscricao VALUES (13, 89, 141, '2017-06-29', 10.00);
INSERT INTO inscricao VALUES (14, 169, 60, '2017-08-08', 28.00);
INSERT INTO inscricao VALUES (15, 53, 194, '2015-10-24', 26.00);
INSERT INTO inscricao VALUES (16, 165, 77, '2017-11-10', 26.00);
INSERT INTO inscricao VALUES (17, 14, 80, '2016-07-21', 19.00);
INSERT INTO inscricao VALUES (18, 173, 35, '2016-05-30', 13.00);
INSERT INTO inscricao VALUES (19, 11, 110, '2016-01-06', 2.00);
INSERT INTO inscricao VALUES (20, 3, 52, '2017-11-25', 4.00);
INSERT INTO inscricao VALUES (21, 12, 4, '2017-09-15', 18.00);
INSERT INTO inscricao VALUES (22, 85, 174, '2015-11-19', 9.00);
INSERT INTO inscricao VALUES (23, 49, 62, '2017-09-21', 30.00);
INSERT INTO inscricao VALUES (24, 112, 31, '2017-07-23', 9.00);
INSERT INTO inscricao VALUES (25, 92, 84, '2016-09-03', 8.00);
INSERT INTO inscricao VALUES (26, 61, 48, '2017-11-07', 20.00);
INSERT INTO inscricao VALUES (27, 29, 61, '2017-09-22', 2.00);
INSERT INTO inscricao VALUES (28, 155, 34, '2016-06-27', 7.00);
INSERT INTO inscricao VALUES (29, 35, 44, '2017-09-01', 23.00);
INSERT INTO inscricao VALUES (30, 48, 47, '2016-09-16', 1.00);
INSERT INTO inscricao VALUES (31, 69, 58, '2016-06-30', 2.00);
INSERT INTO inscricao VALUES (32, 186, 143, '2016-07-06', 28.00);
INSERT INTO inscricao VALUES (33, 45, 191, '2015-10-11', 7.00);
INSERT INTO inscricao VALUES (34, 43, 102, '2016-03-30', 12.00);
INSERT INTO inscricao VALUES (35, 101, 194, '2016-01-21', 24.00);
INSERT INTO inscricao VALUES (36, 153, 55, '2017-03-08', 1.00);
INSERT INTO inscricao VALUES (37, 81, 83, '2017-08-20', 10.00);
INSERT INTO inscricao VALUES (38, 90, 37, '2016-08-27', 15.00);
INSERT INTO inscricao VALUES (39, 132, 72, '2017-07-09', 22.00);
INSERT INTO inscricao VALUES (40, 84, 120, '2017-05-21', 29.00);
INSERT INTO inscricao VALUES (41, 88, 189, '2015-10-09', 7.00);
INSERT INTO inscricao VALUES (42, 95, 175, '2017-11-20', 29.00);
INSERT INTO inscricao VALUES (43, 77, 19, '2016-12-19', 27.00);
INSERT INTO inscricao VALUES (44, 120, 62, '2015-09-11', 13.00);
INSERT INTO inscricao VALUES (45, 193, 162, '2016-10-03', 12.00);
INSERT INTO inscricao VALUES (46, 150, 115, '2016-05-20', 20.00);
INSERT INTO inscricao VALUES (47, 154, 196, '2015-09-18', 2.00);
INSERT INTO inscricao VALUES (48, 19, 85, '2016-02-27', 8.00);
INSERT INTO inscricao VALUES (49, 116, 17, '2017-04-25', 18.00);
INSERT INTO inscricao VALUES (50, 58, 100, '2015-12-22', 6.00);
INSERT INTO inscricao VALUES (51, 46, 187, '2015-12-09', 5.00);
INSERT INTO inscricao VALUES (52, 91, 82, '2017-06-04', 1.00);
INSERT INTO inscricao VALUES (53, 79, 158, '2016-07-10', 4.00);
INSERT INTO inscricao VALUES (54, 58, 78, '2016-12-31', 13.00);
INSERT INTO inscricao VALUES (55, 139, 71, '2016-11-14', 7.00);
INSERT INTO inscricao VALUES (56, 13, 20, '2017-08-20', 24.00);
INSERT INTO inscricao VALUES (57, 141, 173, '2017-08-13', 24.00);
INSERT INTO inscricao VALUES (58, 152, 191, '2016-01-31', 6.00);
INSERT INTO inscricao VALUES (59, 199, 107, '2015-09-28', 9.00);
INSERT INTO inscricao VALUES (60, 119, 165, '2016-11-30', 24.00);
INSERT INTO inscricao VALUES (61, 158, 10, '2015-09-12', 22.00);
INSERT INTO inscricao VALUES (62, 186, 100, '2015-11-27', 4.00);
INSERT INTO inscricao VALUES (63, 188, 179, '2017-04-14', 28.00);
INSERT INTO inscricao VALUES (64, 8, 37, '2016-12-15', 9.00);
INSERT INTO inscricao VALUES (65, 90, 175, '2017-11-11', 20.00);
INSERT INTO inscricao VALUES (66, 134, 187, '2016-08-15', 23.00);
INSERT INTO inscricao VALUES (67, 93, 127, '2016-12-26', 18.00);
INSERT INTO inscricao VALUES (68, 46, 78, '2016-10-28', 17.00);
INSERT INTO inscricao VALUES (69, 85, 77, '2015-09-30', 3.00);
INSERT INTO inscricao VALUES (70, 139, 195, '2015-11-10', 28.00);
INSERT INTO inscricao VALUES (71, 93, 153, '2017-06-30', 29.00);
INSERT INTO inscricao VALUES (72, 34, 138, '2017-10-22', 14.00);
INSERT INTO inscricao VALUES (73, 57, 125, '2015-12-24', 11.00);
INSERT INTO inscricao VALUES (74, 37, 133, '2016-03-05', 16.00);
INSERT INTO inscricao VALUES (75, 95, 22, '2017-04-05', 13.00);
INSERT INTO inscricao VALUES (76, 22, 156, '2017-06-22', 11.00);
INSERT INTO inscricao VALUES (77, 169, 48, '2017-03-14', 30.00);
INSERT INTO inscricao VALUES (78, 89, 94, '2015-11-02', 11.00);
INSERT INTO inscricao VALUES (79, 200, 178, '2016-07-22', 23.00);
INSERT INTO inscricao VALUES (80, 18, 117, '2016-05-05', 22.00);
INSERT INTO inscricao VALUES (81, 200, 9, '2017-02-23', 15.00);
INSERT INTO inscricao VALUES (82, 191, 43, '2015-09-21', 5.00);
INSERT INTO inscricao VALUES (83, 82, 99, '2015-10-27', 24.00);
INSERT INTO inscricao VALUES (84, 152, 136, '2017-05-09', 14.00);
INSERT INTO inscricao VALUES (85, 58, 30, '2017-11-03', 17.00);
INSERT INTO inscricao VALUES (86, 138, 52, '2015-09-07', 10.00);
INSERT INTO inscricao VALUES (87, 6, 21, '2015-09-18', 18.00);
INSERT INTO inscricao VALUES (88, 200, 110, '2017-03-06', 2.00);
INSERT INTO inscricao VALUES (89, 71, 110, '2017-10-05', 28.00);
INSERT INTO inscricao VALUES (90, 20, 127, '2017-05-14', 16.00);
INSERT INTO inscricao VALUES (91, 163, 127, '2016-08-03', 17.00);
INSERT INTO inscricao VALUES (92, 58, 117, '2016-01-30', 23.00);
INSERT INTO inscricao VALUES (93, 91, 198, '2017-02-23', 8.00);
INSERT INTO inscricao VALUES (94, 48, 149, '2017-02-16', 29.00);
INSERT INTO inscricao VALUES (95, 137, 7, '2015-10-03', 3.00);
INSERT INTO inscricao VALUES (96, 48, 145, '2016-07-02', 11.00);
INSERT INTO inscricao VALUES (97, 115, 150, '2015-10-11', 14.00);
INSERT INTO inscricao VALUES (98, 29, 149, '2016-09-02', 30.00);
INSERT INTO inscricao VALUES (99, 36, 20, '2016-07-29', 17.00);
INSERT INTO inscricao VALUES (100, 22, 39, '2017-06-01', 6.00);
INSERT INTO inscricao VALUES (101, 123, 2, '2015-12-27', 25.00);
INSERT INTO inscricao VALUES (102, 34, 59, '2016-06-29', 12.00);
INSERT INTO inscricao VALUES (103, 187, 150, '2016-11-28', 12.00);
INSERT INTO inscricao VALUES (104, 38, 197, '2015-11-07', 4.00);
INSERT INTO inscricao VALUES (105, 26, 133, '2016-09-26', 5.00);
INSERT INTO inscricao VALUES (106, 43, 181, '2015-09-22', 27.00);
INSERT INTO inscricao VALUES (107, 112, 95, '2017-05-28', 19.00);
INSERT INTO inscricao VALUES (108, 2, 123, '2016-02-13', 11.00);
INSERT INTO inscricao VALUES (109, 1, 159, '2017-05-07', 14.00);
INSERT INTO inscricao VALUES (110, 110, 180, '2016-01-20', 20.00);
INSERT INTO inscricao VALUES (111, 146, 102, '2015-10-04', 20.00);
INSERT INTO inscricao VALUES (112, 107, 135, '2015-09-08', 29.00);
INSERT INTO inscricao VALUES (113, 185, 121, '2017-01-27', 21.00);
INSERT INTO inscricao VALUES (114, 61, 159, '2015-10-15', 21.00);
INSERT INTO inscricao VALUES (115, 85, 185, '2015-12-10', 11.00);
INSERT INTO inscricao VALUES (116, 116, 28, '2016-06-25', 8.00);
INSERT INTO inscricao VALUES (117, 91, 139, '2017-02-22', 22.00);
INSERT INTO inscricao VALUES (118, 14, 141, '2017-08-20', 10.00);
INSERT INTO inscricao VALUES (119, 86, 142, '2017-04-09', 4.00);
INSERT INTO inscricao VALUES (120, 177, 51, '2017-11-07', 1.00);
INSERT INTO inscricao VALUES (121, 107, 196, '2017-08-22', 16.00);
INSERT INTO inscricao VALUES (122, 37, 103, '2017-09-13', 6.00);
INSERT INTO inscricao VALUES (123, 27, 88, '2017-04-09', 25.00);
INSERT INTO inscricao VALUES (124, 166, 148, '2017-03-21', 18.00);
INSERT INTO inscricao VALUES (125, 101, 33, '2016-11-18', 16.00);
INSERT INTO inscricao VALUES (126, 169, 148, '2017-05-18', 20.00);
INSERT INTO inscricao VALUES (127, 18, 38, '2017-01-14', 11.00);
INSERT INTO inscricao VALUES (128, 161, 52, '2017-07-26', 2.00);
INSERT INTO inscricao VALUES (129, 26, 138, '2016-09-11', 23.00);
INSERT INTO inscricao VALUES (130, 50, 115, '2017-11-21', 1.00);
INSERT INTO inscricao VALUES (131, 53, 21, '2016-10-28', 30.00);
INSERT INTO inscricao VALUES (132, 159, 58, '2015-09-03', 16.00);
INSERT INTO inscricao VALUES (133, 198, 85, '2017-04-14', 29.00);
INSERT INTO inscricao VALUES (134, 159, 50, '2017-10-14', 21.00);
INSERT INTO inscricao VALUES (135, 79, 150, '2016-08-25', 26.00);
INSERT INTO inscricao VALUES (136, 183, 119, '2016-11-07', 18.00);
INSERT INTO inscricao VALUES (137, 114, 136, '2016-12-19', 23.00);
INSERT INTO inscricao VALUES (138, 184, 97, '2017-08-28', 1.00);
INSERT INTO inscricao VALUES (139, 195, 123, '2016-09-16', 22.00);
INSERT INTO inscricao VALUES (140, 146, 172, '2016-05-14', 9.00);
INSERT INTO inscricao VALUES (141, 148, 25, '2016-03-26', 12.00);
INSERT INTO inscricao VALUES (142, 146, 183, '2017-08-09', 21.00);
INSERT INTO inscricao VALUES (143, 47, 181, '2017-10-06', 3.00);
INSERT INTO inscricao VALUES (144, 35, 140, '2016-01-15', 11.00);
INSERT INTO inscricao VALUES (145, 170, 19, '2016-08-03', 3.00);
INSERT INTO inscricao VALUES (146, 137, 1, '2017-04-24', 21.00);
INSERT INTO inscricao VALUES (147, 51, 115, '2015-09-07', 11.00);
INSERT INTO inscricao VALUES (148, 4, 99, '2017-11-21', 26.00);
INSERT INTO inscricao VALUES (149, 8, 93, '2017-04-07', 14.00);
INSERT INTO inscricao VALUES (150, 150, 39, '2015-09-27', 10.00);
INSERT INTO inscricao VALUES (151, 6, 187, '2016-11-17', 14.00);
INSERT INTO inscricao VALUES (152, 83, 133, '2016-08-16', 11.00);
INSERT INTO inscricao VALUES (153, 18, 179, '2015-12-23', 8.00);
INSERT INTO inscricao VALUES (154, 36, 14, '2016-08-16', 29.00);
INSERT INTO inscricao VALUES (155, 105, 183, '2016-12-05', 2.00);
INSERT INTO inscricao VALUES (156, 123, 119, '2015-11-29', 2.00);
INSERT INTO inscricao VALUES (157, 60, 170, '2017-07-04', 19.00);
INSERT INTO inscricao VALUES (158, 132, 173, '2017-06-14', 4.00);
INSERT INTO inscricao VALUES (159, 101, 181, '2017-09-26', 18.00);
INSERT INTO inscricao VALUES (160, 192, 130, '2016-03-11', 24.00);
INSERT INTO inscricao VALUES (161, 55, 136, '2017-10-15', 21.00);
INSERT INTO inscricao VALUES (162, 142, 18, '2017-10-30', 11.00);
INSERT INTO inscricao VALUES (163, 13, 35, '2016-08-05', 8.00);
INSERT INTO inscricao VALUES (164, 63, 71, '2017-01-20', 10.00);
INSERT INTO inscricao VALUES (165, 54, 176, '2017-03-10', 7.00);
INSERT INTO inscricao VALUES (166, 62, 98, '2015-11-21', 25.00);
INSERT INTO inscricao VALUES (167, 71, 157, '2017-08-09', 21.00);
INSERT INTO inscricao VALUES (168, 194, 89, '2016-05-31', 17.00);
INSERT INTO inscricao VALUES (169, 17, 190, '2017-08-28', 14.00);
INSERT INTO inscricao VALUES (170, 132, 182, '2015-09-03', 3.00);
INSERT INTO inscricao VALUES (171, 85, 36, '2016-01-12', 24.00);
INSERT INTO inscricao VALUES (172, 25, 178, '2017-07-11', 26.00);
INSERT INTO inscricao VALUES (173, 97, 190, '2017-07-09', 1.00);
INSERT INTO inscricao VALUES (174, 148, 53, '2017-01-08', 12.00);
INSERT INTO inscricao VALUES (175, 12, 106, '2017-01-07', 8.00);
INSERT INTO inscricao VALUES (176, 59, 167, '2016-03-21', 23.00);
INSERT INTO inscricao VALUES (177, 24, 38, '2016-01-16', 16.00);
INSERT INTO inscricao VALUES (178, 159, 31, '2016-09-26', 30.00);
INSERT INTO inscricao VALUES (179, 66, 48, '2017-06-20', 28.00);
INSERT INTO inscricao VALUES (180, 154, 179, '2015-11-22', 25.00);
INSERT INTO inscricao VALUES (181, 173, 63, '2017-08-12', 1.00);
INSERT INTO inscricao VALUES (182, 126, 88, '2017-09-11', 27.00);
INSERT INTO inscricao VALUES (183, 97, 184, '2015-12-12', 26.00);
INSERT INTO inscricao VALUES (184, 103, 132, '2016-03-17', 4.00);
INSERT INTO inscricao VALUES (185, 180, 144, '2016-05-05', 19.00);
INSERT INTO inscricao VALUES (186, 32, 2, '2016-12-22', 14.00);
INSERT INTO inscricao VALUES (187, 182, 26, '2016-05-08', 20.00);
INSERT INTO inscricao VALUES (188, 88, 184, '2016-02-13', 25.00);
INSERT INTO inscricao VALUES (189, 84, 50, '2017-01-02', 2.00);
INSERT INTO inscricao VALUES (190, 69, 4, '2017-02-16', 28.00);
INSERT INTO inscricao VALUES (191, 35, 176, '2017-05-22', 8.00);
INSERT INTO inscricao VALUES (192, 36, 101, '2016-08-27', 21.00);
INSERT INTO inscricao VALUES (193, 15, 198, '2016-06-18', 19.00);
INSERT INTO inscricao VALUES (194, 184, 100, '2016-12-02', 8.00);
INSERT INTO inscricao VALUES (195, 5, 80, '2015-10-10', 30.00);
INSERT INTO inscricao VALUES (196, 131, 112, '2015-10-08', 30.00);
INSERT INTO inscricao VALUES (197, 24, 93, '2016-03-12', 4.00);
INSERT INTO inscricao VALUES (198, 154, 181, '2017-10-23', 1.00);
INSERT INTO inscricao VALUES (199, 115, 65, '2015-09-22', 9.00);
INSERT INTO inscricao VALUES (200, 123, 133, '2017-11-19', 9.00);
INSERT INTO inscricao VALUES (201, 109, 167, '2016-10-11', 5.00);
INSERT INTO inscricao VALUES (202, 159, 3, '2016-06-30', 20.00);
INSERT INTO inscricao VALUES (203, 95, 17, '2016-02-18', 20.00);
INSERT INTO inscricao VALUES (204, 15, 1, '2016-12-23', 5.00);
INSERT INTO inscricao VALUES (205, 67, 6, '2017-11-10', 17.00);
INSERT INTO inscricao VALUES (206, 61, 136, '2016-01-25', 4.00);
INSERT INTO inscricao VALUES (207, 58, 160, '2016-07-23', 18.00);
INSERT INTO inscricao VALUES (208, 80, 114, '2017-10-10', 15.00);
INSERT INTO inscricao VALUES (209, 85, 29, '2017-02-09', 24.00);
INSERT INTO inscricao VALUES (210, 139, 151, '2017-09-19', 14.00);
INSERT INTO inscricao VALUES (211, 196, 60, '2016-09-09', 9.00);
INSERT INTO inscricao VALUES (212, 28, 19, '2017-10-06', 9.00);
INSERT INTO inscricao VALUES (213, 161, 113, '2016-05-09', 12.00);
INSERT INTO inscricao VALUES (214, 91, 127, '2016-05-02', 12.00);
INSERT INTO inscricao VALUES (215, 121, 193, '2016-04-10', 13.00);
INSERT INTO inscricao VALUES (216, 30, 54, '2016-03-16', 3.00);
INSERT INTO inscricao VALUES (217, 51, 112, '2016-08-21', 27.00);
INSERT INTO inscricao VALUES (218, 165, 191, '2016-06-08', 14.00);
INSERT INTO inscricao VALUES (219, 59, 75, '2015-10-22', 18.00);
INSERT INTO inscricao VALUES (220, 18, 13, '2017-03-24', 11.00);
INSERT INTO inscricao VALUES (221, 108, 9, '2016-09-18', 20.00);
INSERT INTO inscricao VALUES (222, 165, 37, '2016-08-09', 23.00);
INSERT INTO inscricao VALUES (223, 24, 197, '2016-06-23', 9.00);
INSERT INTO inscricao VALUES (224, 99, 88, '2016-11-05', 29.00);
INSERT INTO inscricao VALUES (225, 176, 8, '2015-11-23', 27.00);
INSERT INTO inscricao VALUES (226, 57, 38, '2016-02-24', 6.00);
INSERT INTO inscricao VALUES (227, 74, 89, '2016-04-18', 22.00);
INSERT INTO inscricao VALUES (228, 51, 53, '2015-11-28', 21.00);
INSERT INTO inscricao VALUES (229, 142, 112, '2016-11-05', 2.00);
INSERT INTO inscricao VALUES (230, 60, 129, '2017-10-18', 4.00);
INSERT INTO inscricao VALUES (231, 130, 36, '2015-11-23', 5.00);
INSERT INTO inscricao VALUES (232, 59, 1, '2017-09-28', 11.00);
INSERT INTO inscricao VALUES (233, 6, 24, '2017-07-26', 10.00);
INSERT INTO inscricao VALUES (234, 66, 123, '2017-08-07', 23.00);
INSERT INTO inscricao VALUES (235, 53, 98, '2017-09-13', 24.00);
INSERT INTO inscricao VALUES (236, 33, 155, '2017-11-15', 30.00);
INSERT INTO inscricao VALUES (237, 66, 29, '2016-06-24', 13.00);
INSERT INTO inscricao VALUES (238, 11, 79, '2017-04-08', 21.00);
INSERT INTO inscricao VALUES (239, 147, 21, '2016-09-11', 8.00);
INSERT INTO inscricao VALUES (240, 157, 80, '2017-05-02', 27.00);
INSERT INTO inscricao VALUES (241, 180, 9, '2016-08-13', 3.00);
INSERT INTO inscricao VALUES (242, 11, 68, '2016-09-09', 3.00);
INSERT INTO inscricao VALUES (243, 79, 74, '2015-09-19', 6.00);
INSERT INTO inscricao VALUES (244, 143, 140, '2017-11-07', 24.00);
INSERT INTO inscricao VALUES (245, 94, 192, '2015-10-05', 9.00);
INSERT INTO inscricao VALUES (246, 54, 24, '2017-07-12', 2.00);
INSERT INTO inscricao VALUES (247, 51, 90, '2015-11-16', 6.00);
INSERT INTO inscricao VALUES (248, 136, 101, '2017-05-07', 18.00);
INSERT INTO inscricao VALUES (249, 74, 48, '2017-02-07', 21.00);
INSERT INTO inscricao VALUES (250, 124, 4, '2017-06-14', 3.00);
INSERT INTO inscricao VALUES (251, 102, 183, '2016-01-24', 5.00);
INSERT INTO inscricao VALUES (252, 115, 194, '2017-10-01', 15.00);
INSERT INTO inscricao VALUES (253, 129, 72, '2017-04-05', 26.00);
INSERT INTO inscricao VALUES (254, 167, 14, '2017-04-27', 16.00);
INSERT INTO inscricao VALUES (255, 126, 108, '2017-03-17', 15.00);
INSERT INTO inscricao VALUES (256, 183, 162, '2016-06-03', 19.00);
INSERT INTO inscricao VALUES (257, 195, 12, '2017-05-27', 2.00);
INSERT INTO inscricao VALUES (258, 34, 148, '2017-08-30', 17.00);
INSERT INTO inscricao VALUES (259, 153, 22, '2016-12-09', 24.00);
INSERT INTO inscricao VALUES (260, 91, 145, '2016-06-06', 25.00);
INSERT INTO inscricao VALUES (261, 109, 46, '2016-09-26', 22.00);
INSERT INTO inscricao VALUES (262, 136, 161, '2017-05-22', 21.00);
INSERT INTO inscricao VALUES (263, 30, 90, '2017-09-19', 2.00);
INSERT INTO inscricao VALUES (264, 197, 56, '2016-12-04', 4.00);
INSERT INTO inscricao VALUES (265, 104, 182, '2016-01-08', 20.00);
INSERT INTO inscricao VALUES (266, 2, 165, '2016-02-03', 15.00);
INSERT INTO inscricao VALUES (267, 123, 159, '2017-06-08', 16.00);
INSERT INTO inscricao VALUES (268, 135, 193, '2017-04-08', 8.00);
INSERT INTO inscricao VALUES (269, 48, 145, '2017-02-28', 12.00);
INSERT INTO inscricao VALUES (270, 7, 36, '2015-12-08', 3.00);
INSERT INTO inscricao VALUES (271, 170, 144, '2016-02-03', 10.00);
INSERT INTO inscricao VALUES (272, 116, 80, '2016-09-10', 4.00);
INSERT INTO inscricao VALUES (273, 55, 110, '2016-04-09', 18.00);
INSERT INTO inscricao VALUES (274, 66, 107, '2016-12-03', 26.00);
INSERT INTO inscricao VALUES (275, 90, 10, '2017-09-22', 23.00);
INSERT INTO inscricao VALUES (276, 23, 11, '2017-02-11', 18.00);
INSERT INTO inscricao VALUES (277, 117, 134, '2015-12-28', 12.00);
INSERT INTO inscricao VALUES (278, 22, 68, '2016-06-16', 11.00);
INSERT INTO inscricao VALUES (279, 75, 116, '2016-07-14', 2.00);
INSERT INTO inscricao VALUES (280, 149, 122, '2016-01-11', 8.00);
INSERT INTO inscricao VALUES (281, 168, 92, '2016-05-31', 29.00);
INSERT INTO inscricao VALUES (282, 33, 8, '2017-01-13', 11.00);
INSERT INTO inscricao VALUES (283, 58, 63, '2017-08-08', 28.00);
INSERT INTO inscricao VALUES (284, 174, 128, '2016-08-15', 14.00);
INSERT INTO inscricao VALUES (285, 145, 18, '2017-02-26', 15.00);
INSERT INTO inscricao VALUES (286, 98, 41, '2016-10-05', 16.00);
INSERT INTO inscricao VALUES (287, 16, 157, '2017-04-27', 6.00);
INSERT INTO inscricao VALUES (288, 92, 179, '2016-05-28', 17.00);
INSERT INTO inscricao VALUES (289, 160, 53, '2017-10-18', 4.00);
INSERT INTO inscricao VALUES (290, 173, 2, '2016-02-08', 22.00);
INSERT INTO inscricao VALUES (291, 21, 169, '2017-10-23', 6.00);
INSERT INTO inscricao VALUES (292, 13, 2, '2016-02-20', 7.00);
INSERT INTO inscricao VALUES (293, 85, 59, '2017-08-02', 16.00);
INSERT INTO inscricao VALUES (294, 66, 33, '2016-10-07', 6.00);
INSERT INTO inscricao VALUES (295, 153, 177, '2015-09-25', 8.00);
INSERT INTO inscricao VALUES (296, 49, 75, '2016-06-26', 14.00);
INSERT INTO inscricao VALUES (297, 155, 90, '2017-11-14', 8.00);
INSERT INTO inscricao VALUES (298, 195, 182, '2016-05-26', 4.00);
INSERT INTO inscricao VALUES (299, 102, 141, '2017-02-27', 12.00);
INSERT INTO inscricao VALUES (300, 125, 114, '2017-08-29', 13.00);
INSERT INTO inscricao VALUES (301, 69, 135, '2016-07-20', 8.00);
INSERT INTO inscricao VALUES (302, 106, 147, '2015-12-27', 8.00);
INSERT INTO inscricao VALUES (303, 150, 32, '2016-01-19', 17.00);
INSERT INTO inscricao VALUES (304, 56, 97, '2016-07-25', 22.00);
INSERT INTO inscricao VALUES (305, 90, 49, '2017-07-26', 18.00);
INSERT INTO inscricao VALUES (306, 141, 97, '2016-08-23', 29.00);
INSERT INTO inscricao VALUES (307, 32, 52, '2016-03-24', 13.00);
INSERT INTO inscricao VALUES (308, 80, 47, '2016-02-13', 10.00);
INSERT INTO inscricao VALUES (309, 107, 148, '2017-10-06', 1.00);
INSERT INTO inscricao VALUES (310, 186, 73, '2016-09-20', 18.00);
INSERT INTO inscricao VALUES (311, 66, 142, '2016-06-01', 8.00);
INSERT INTO inscricao VALUES (312, 116, 47, '2016-06-09', 30.00);
INSERT INTO inscricao VALUES (313, 166, 197, '2016-07-24', 5.00);
INSERT INTO inscricao VALUES (314, 75, 52, '2017-02-17', 20.00);
INSERT INTO inscricao VALUES (315, 17, 141, '2016-05-19', 27.00);
INSERT INTO inscricao VALUES (316, 135, 81, '2016-10-10', 11.00);
INSERT INTO inscricao VALUES (317, 127, 113, '2017-09-10', 19.00);
INSERT INTO inscricao VALUES (318, 10, 193, '2017-06-02', 26.00);
INSERT INTO inscricao VALUES (319, 73, 99, '2017-09-08', 18.00);
INSERT INTO inscricao VALUES (320, 78, 84, '2015-10-16', 29.00);
INSERT INTO inscricao VALUES (321, 196, 150, '2017-06-09', 20.00);
INSERT INTO inscricao VALUES (322, 48, 65, '2016-11-24', 27.00);
INSERT INTO inscricao VALUES (323, 48, 30, '2016-09-29', 27.00);
INSERT INTO inscricao VALUES (324, 78, 105, '2015-12-24', 4.00);
INSERT INTO inscricao VALUES (325, 5, 121, '2016-02-25', 26.00);
INSERT INTO inscricao VALUES (326, 181, 55, '2017-03-14', 8.00);
INSERT INTO inscricao VALUES (327, 53, 182, '2015-12-27', 25.00);
INSERT INTO inscricao VALUES (328, 178, 191, '2017-07-28', 23.00);
INSERT INTO inscricao VALUES (329, 148, 64, '2016-01-22', 8.00);
INSERT INTO inscricao VALUES (330, 66, 141, '2017-01-01', 21.00);
INSERT INTO inscricao VALUES (331, 57, 136, '2016-05-20', 13.00);
INSERT INTO inscricao VALUES (332, 189, 184, '2017-02-13', 23.00);
INSERT INTO inscricao VALUES (333, 168, 31, '2017-06-12', 27.00);
INSERT INTO inscricao VALUES (334, 143, 109, '2017-07-25', 13.00);
INSERT INTO inscricao VALUES (335, 169, 113, '2017-05-03', 1.00);
INSERT INTO inscricao VALUES (336, 136, 94, '2016-08-08', 9.00);
INSERT INTO inscricao VALUES (337, 184, 146, '2017-02-14', 6.00);
INSERT INTO inscricao VALUES (338, 144, 123, '2016-03-23', 5.00);
INSERT INTO inscricao VALUES (339, 97, 71, '2016-07-07', 15.00);
INSERT INTO inscricao VALUES (340, 148, 136, '2015-12-27', 6.00);
INSERT INTO inscricao VALUES (341, 83, 193, '2016-03-19', 26.00);
INSERT INTO inscricao VALUES (342, 167, 181, '2015-10-16', 23.00);
INSERT INTO inscricao VALUES (343, 115, 149, '2017-10-14', 28.00);
INSERT INTO inscricao VALUES (344, 93, 91, '2016-12-08', 14.00);
INSERT INTO inscricao VALUES (345, 176, 60, '2016-01-25', 1.00);
INSERT INTO inscricao VALUES (346, 179, 195, '2017-01-01', 15.00);
INSERT INTO inscricao VALUES (347, 37, 179, '2017-07-24', 7.00);
INSERT INTO inscricao VALUES (348, 76, 123, '2016-09-09', 25.00);
INSERT INTO inscricao VALUES (349, 106, 19, '2017-07-03', 6.00);
INSERT INTO inscricao VALUES (350, 199, 167, '2016-11-12', 26.00);
INSERT INTO inscricao VALUES (351, 33, 50, '2015-12-22', 25.00);
INSERT INTO inscricao VALUES (352, 3, 16, '2016-07-19', 22.00);
INSERT INTO inscricao VALUES (353, 155, 131, '2017-10-29', 14.00);
INSERT INTO inscricao VALUES (354, 139, 23, '2016-04-17', 28.00);
INSERT INTO inscricao VALUES (355, 30, 198, '2015-12-21', 7.00);
INSERT INTO inscricao VALUES (356, 34, 177, '2017-02-25', 6.00);
INSERT INTO inscricao VALUES (357, 131, 13, '2017-01-30', 3.00);
INSERT INTO inscricao VALUES (358, 173, 88, '2017-06-12', 21.00);
INSERT INTO inscricao VALUES (359, 139, 194, '2016-05-27', 24.00);
INSERT INTO inscricao VALUES (360, 175, 193, '2017-01-02', 19.00);
INSERT INTO inscricao VALUES (361, 147, 25, '2017-03-25', 26.00);
INSERT INTO inscricao VALUES (362, 111, 27, '2016-03-24', 29.00);
INSERT INTO inscricao VALUES (363, 56, 182, '2017-05-02', 18.00);
INSERT INTO inscricao VALUES (364, 149, 120, '2017-09-11', 22.00);
INSERT INTO inscricao VALUES (365, 132, 150, '2017-08-10', 21.00);
INSERT INTO inscricao VALUES (366, 175, 183, '2016-09-17', 18.00);
INSERT INTO inscricao VALUES (367, 12, 113, '2016-03-05', 20.00);
INSERT INTO inscricao VALUES (368, 28, 86, '2016-02-03', 3.00);
INSERT INTO inscricao VALUES (369, 166, 24, '2017-08-31', 2.00);
INSERT INTO inscricao VALUES (370, 123, 199, '2015-09-03', 30.00);
INSERT INTO inscricao VALUES (371, 46, 145, '2017-08-30', 4.00);
INSERT INTO inscricao VALUES (372, 18, 56, '2017-03-27', 8.00);
INSERT INTO inscricao VALUES (373, 6, 112, '2017-08-23', 6.00);
INSERT INTO inscricao VALUES (374, 124, 60, '2016-06-19', 24.00);
INSERT INTO inscricao VALUES (375, 64, 192, '2017-07-27', 16.00);
INSERT INTO inscricao VALUES (376, 3, 166, '2017-08-09', 13.00);
INSERT INTO inscricao VALUES (377, 118, 178, '2016-08-05', 30.00);
INSERT INTO inscricao VALUES (378, 45, 6, '2017-02-18', 13.00);
INSERT INTO inscricao VALUES (379, 59, 172, '2016-05-17', 16.00);
INSERT INTO inscricao VALUES (380, 67, 94, '2017-11-01', 16.00);
INSERT INTO inscricao VALUES (381, 67, 140, '2016-03-03', 8.00);
INSERT INTO inscricao VALUES (382, 92, 157, '2016-09-08', 16.00);
INSERT INTO inscricao VALUES (383, 144, 162, '2017-01-09', 3.00);
INSERT INTO inscricao VALUES (384, 177, 85, '2016-01-04', 12.00);
INSERT INTO inscricao VALUES (385, 131, 149, '2016-11-12', 10.00);
INSERT INTO inscricao VALUES (386, 34, 152, '2017-09-28', 5.00);
INSERT INTO inscricao VALUES (387, 118, 69, '2016-06-16', 2.00);
INSERT INTO inscricao VALUES (388, 115, 114, '2016-02-18', 3.00);
INSERT INTO inscricao VALUES (389, 197, 172, '2017-10-22', 29.00);
INSERT INTO inscricao VALUES (390, 102, 39, '2017-03-25', 13.00);
INSERT INTO inscricao VALUES (391, 6, 106, '2017-03-21', 3.00);
INSERT INTO inscricao VALUES (392, 55, 197, '2017-07-25', 27.00);
INSERT INTO inscricao VALUES (393, 160, 141, '2016-09-11', 21.00);
INSERT INTO inscricao VALUES (394, 175, 118, '2017-02-26', 4.00);
INSERT INTO inscricao VALUES (395, 50, 48, '2016-09-09', 26.00);
INSERT INTO inscricao VALUES (396, 117, 81, '2017-09-13', 19.00);
INSERT INTO inscricao VALUES (397, 149, 199, '2017-04-03', 29.00);
INSERT INTO inscricao VALUES (398, 159, 113, '2016-10-07', 16.00);
INSERT INTO inscricao VALUES (399, 174, 110, '2016-12-01', 12.00);
INSERT INTO inscricao VALUES (400, 161, 12, '2016-04-15', 18.00);


--
-- TOC entry 2233 (class 0 OID 66184)
-- Dependencies: 190
-- Data for Name: instituicao; Type: TABLE DATA; Schema: teste; Owner: postgres
--

INSERT INTO instituicao VALUES (1, 'interdum. Sed auctor', 'Suspendisse tristique', 17);
INSERT INTO instituicao VALUES (2, 'arcu vel', 'sit amet, risus. Donec nibh', 192);
INSERT INTO instituicao VALUES (3, 'justo nec ante. Maecenas', 'Proin dolor.', 65);
INSERT INTO instituicao VALUES (4, 'non massa non ante', 'cursus et, magna. Praesent interdum', 10);
INSERT INTO instituicao VALUES (5, 'neque', 'sed pede.', 121);
INSERT INTO instituicao VALUES (6, 'eleifend egestas. Sed', 'primis in faucibus orci luctus', 30);
INSERT INTO instituicao VALUES (7, 'magnis dis', 'nunc id enim.', 37);
INSERT INTO instituicao VALUES (8, 'metus vitae velit egestas', 'arcu. Vestibulum ante ipsum', 125);
INSERT INTO instituicao VALUES (9, 'malesuada.', 'enim. Curabitur massa.', 132);
INSERT INTO instituicao VALUES (10, 'Maecenas malesuada', 'risus quis diam', 105);
INSERT INTO instituicao VALUES (11, 'Curabitur', 'massa rutrum magna. Cras', 190);
INSERT INTO instituicao VALUES (12, 'inceptos hymenaeos.', 'eget odio. Aliquam', 170);
INSERT INTO instituicao VALUES (13, 'ac metus vitae', 'luctus, ipsum leo elementum', 127);
INSERT INTO instituicao VALUES (14, 'magna. Ut tincidunt', 'porttitor', 179);
INSERT INTO instituicao VALUES (15, 'arcu iaculis enim,', 'consequat auctor,', 190);
INSERT INTO instituicao VALUES (16, 'Nulla eu neque pellentesque', 'turpis vitae', 28);
INSERT INTO instituicao VALUES (17, 'hendrerit neque.', 'semper auctor.', 166);
INSERT INTO instituicao VALUES (18, 'bibendum ullamcorper. Duis cursus,', 'eget metus eu erat', 93);
INSERT INTO instituicao VALUES (19, 'imperdiet ornare. In', 'pede ac', 156);
INSERT INTO instituicao VALUES (20, 'nunc nulla vulputate dui,', 'neque et nunc. Quisque ornare', 125);
INSERT INTO instituicao VALUES (21, 'diam', 'neque. Morbi quis urna. Nunc', 42);
INSERT INTO instituicao VALUES (22, 'elit fermentum risus, at', 'sem.', 81);
INSERT INTO instituicao VALUES (23, 'est ac mattis', 'lorem. Donec', 135);
INSERT INTO instituicao VALUES (24, 'Proin nisl sem, consequat', 'lacus. Cras', 90);
INSERT INTO instituicao VALUES (25, 'massa. Vestibulum', 'vitae dolor.', 42);
INSERT INTO instituicao VALUES (26, 'Nulla', 'sed tortor. Integer aliquam adipiscing', 175);
INSERT INTO instituicao VALUES (27, 'ultrices. Duis volutpat nunc', 'mi eleifend egestas. Sed pharetra,', 89);
INSERT INTO instituicao VALUES (28, 'pede.', 'et pede. Nunc', 127);
INSERT INTO instituicao VALUES (29, 'Aliquam vulputate ullamcorper magna.', 'lorem, vehicula et,', 108);
INSERT INTO instituicao VALUES (30, 'lobortis quam', 'Aliquam nisl. Nulla eu neque', 149);
INSERT INTO instituicao VALUES (31, 'nec tellus. Nunc', 'magna. Duis dignissim tempor arcu.', 121);
INSERT INTO instituicao VALUES (32, 'sagittis semper. Nam', 'elit. Aliquam auctor,', 151);
INSERT INTO instituicao VALUES (33, 'dignissim. Maecenas ornare egestas', 'urna.', 173);
INSERT INTO instituicao VALUES (34, 'dignissim lacus. Aliquam', 'sem semper', 65);
INSERT INTO instituicao VALUES (35, 'sapien. Aenean', 'tincidunt dui augue eu tellus.', 4);
INSERT INTO instituicao VALUES (36, 'Duis ac arcu.', 'enim. Nunc', 197);
INSERT INTO instituicao VALUES (37, 'non, lobortis quis,', 'eu tempor', 82);
INSERT INTO instituicao VALUES (38, 'laoreet posuere, enim nisl', 'interdum ligula eu enim.', 195);
INSERT INTO instituicao VALUES (39, 'orci. Ut sagittis lobortis', 'vel lectus. Cum sociis natoque', 194);
INSERT INTO instituicao VALUES (40, 'risus. Donec', 'Sed pharetra, felis eget', 6);
INSERT INTO instituicao VALUES (41, 'erat semper rutrum. Fusce', 'sollicitudin commodo ipsum. Suspendisse non', 192);
INSERT INTO instituicao VALUES (42, 'tempus scelerisque, lorem', 'blandit congue. In', 45);
INSERT INTO instituicao VALUES (43, 'Phasellus ornare.', 'eu, ultrices sit amet,', 138);
INSERT INTO instituicao VALUES (44, 'velit in aliquet', 'non, bibendum sed,', 101);
INSERT INTO instituicao VALUES (45, 'sodales', 'ornare,', 181);
INSERT INTO instituicao VALUES (46, 'vitae semper egestas,', 'egestas. Fusce aliquet magna', 160);
INSERT INTO instituicao VALUES (47, 'vulputate mauris sagittis', 'aliquet molestie tellus.', 22);
INSERT INTO instituicao VALUES (48, 'nulla', 'at arcu.', 191);
INSERT INTO instituicao VALUES (49, 'imperdiet dictum magna.', 'ligula. Aenean', 192);
INSERT INTO instituicao VALUES (50, 'id enim.', 'eget massa. Suspendisse eleifend. Cras', 5);
INSERT INTO instituicao VALUES (51, 'facilisis vitae,', 'Sed eu', 176);
INSERT INTO instituicao VALUES (52, 'nunc', 'Quisque fringilla euismod enim. Etiam', 105);
INSERT INTO instituicao VALUES (53, 'cursus in, hendrerit', 'sodales. Mauris blandit enim', 13);
INSERT INTO instituicao VALUES (54, 'ac metus vitae', 'ullamcorper. Duis at', 66);
INSERT INTO instituicao VALUES (55, 'in', 'eros', 122);
INSERT INTO instituicao VALUES (56, 'nec tempus scelerisque, lorem', 'consequat enim diam vel arcu.', 96);
INSERT INTO instituicao VALUES (57, 'nisl. Maecenas malesuada fringilla', 'tincidunt. Donec vitae erat', 99);
INSERT INTO instituicao VALUES (58, 'dictum mi, ac', 'libero', 132);
INSERT INTO instituicao VALUES (59, 'tincidunt', 'Cras vehicula', 95);
INSERT INTO instituicao VALUES (60, 'Etiam laoreet, libero', 'sapien molestie orci tincidunt adipiscing.', 32);
INSERT INTO instituicao VALUES (61, 'purus', 'rutrum magna. Cras convallis', 95);
INSERT INTO instituicao VALUES (62, 'lobortis,', 'dis parturient montes,', 99);
INSERT INTO instituicao VALUES (63, 'faucibus lectus, a sollicitudin', 'est, congue a,', 8);
INSERT INTO instituicao VALUES (64, 'Nulla eget metus eu', 'sem molestie sodales.', 20);
INSERT INTO instituicao VALUES (65, 'ullamcorper. Duis cursus, diam', 'sem egestas blandit.', 177);
INSERT INTO instituicao VALUES (66, 'enim. Nunc', 'malesuada fames ac', 130);
INSERT INTO instituicao VALUES (67, 'augue eu tellus. Phasellus', 'malesuada augue ut', 17);
INSERT INTO instituicao VALUES (68, 'luctus', 'a, arcu. Sed et', 20);
INSERT INTO instituicao VALUES (69, 'eu nibh vulputate', 'nunc, ullamcorper eu, euismod', 75);
INSERT INTO instituicao VALUES (70, 'eget nisi dictum', 'Fusce feugiat. Lorem ipsum', 198);
INSERT INTO instituicao VALUES (71, 'vel,', 'In', 121);
INSERT INTO instituicao VALUES (72, 'mus. Proin', 'Etiam', 39);
INSERT INTO instituicao VALUES (73, 'elementum at,', 'felis orci,', 83);
INSERT INTO instituicao VALUES (74, 'non, luctus sit amet,', 'Nunc sed orci lobortis augue', 179);
INSERT INTO instituicao VALUES (75, 'Suspendisse tristique neque venenatis', 'vel arcu.', 116);
INSERT INTO instituicao VALUES (76, 'aliquet. Phasellus fermentum', 'sem eget massa.', 199);
INSERT INTO instituicao VALUES (77, 'quam. Curabitur vel lectus.', 'Ut semper pretium', 8);
INSERT INTO instituicao VALUES (78, 'at,', 'luctus, ipsum', 9);
INSERT INTO instituicao VALUES (79, 'tellus non magna. Nam', 'Quisque ornare', 38);
INSERT INTO instituicao VALUES (80, 'et pede. Nunc', 'diam nunc, ullamcorper', 73);
INSERT INTO instituicao VALUES (81, 'erat volutpat.', 'lobortis tellus justo sit amet', 122);
INSERT INTO instituicao VALUES (82, 'montes,', 'sapien.', 76);
INSERT INTO instituicao VALUES (83, 'sapien, gravida non, sollicitudin', 'tincidunt orci quis lectus. Nullam', 144);
INSERT INTO instituicao VALUES (84, 'feugiat non,', 'nostra, per inceptos', 128);
INSERT INTO instituicao VALUES (85, 'arcu iaculis enim, sit', 'arcu. Sed eu nibh vulputate', 168);
INSERT INTO instituicao VALUES (86, 'faucibus leo, in lobortis', 'sit', 116);
INSERT INTO instituicao VALUES (87, 'mus. Proin vel', 'gravida', 101);
INSERT INTO instituicao VALUES (88, 'nec,', 'suscipit nonummy. Fusce', 7);
INSERT INTO instituicao VALUES (89, 'vel', 'nibh. Quisque nonummy ipsum', 48);
INSERT INTO instituicao VALUES (90, 'dui nec urna suscipit', 'a tortor. Nunc', 9);
INSERT INTO instituicao VALUES (91, 'molestie. Sed', 'primis', 197);
INSERT INTO instituicao VALUES (92, 'consequat, lectus sit', 'purus', 166);
INSERT INTO instituicao VALUES (93, 'metus urna convallis erat,', 'sagittis. Nullam vitae', 108);
INSERT INTO instituicao VALUES (94, 'tempor', 'scelerisque', 189);
INSERT INTO instituicao VALUES (95, 'turpis', 'non, lobortis quis,', 64);
INSERT INTO instituicao VALUES (96, 'Fusce mollis.', 'orci, consectetuer euismod', 34);
INSERT INTO instituicao VALUES (97, 'Suspendisse sagittis. Nullam vitae', 'sit amet luctus vulputate, nisi', 192);
INSERT INTO instituicao VALUES (98, 'at,', 'in', 161);
INSERT INTO instituicao VALUES (99, 'Proin mi. Aliquam gravida', 'laoreet lectus', 11);
INSERT INTO instituicao VALUES (100, 'lectus, a sollicitudin orci', 'ornare sagittis felis. Donec', 199);
INSERT INTO instituicao VALUES (101, 'risus.', 'facilisis eget,', 130);
INSERT INTO instituicao VALUES (102, 'Donec luctus aliquet', 'Vestibulum ante ipsum primis', 111);
INSERT INTO instituicao VALUES (103, 'pretium aliquet,', 'tellus eu', 197);
INSERT INTO instituicao VALUES (104, 'Sed malesuada augue ut', 'eleifend. Cras sed leo.', 160);
INSERT INTO instituicao VALUES (105, 'ultrices', 'vel, convallis', 77);
INSERT INTO instituicao VALUES (106, 'egestas. Aliquam nec enim.', 'ac turpis egestas. Aliquam', 55);
INSERT INTO instituicao VALUES (107, 'pede sagittis augue, eu', 'risus. In mi', 154);
INSERT INTO instituicao VALUES (108, 'nec', 'Nulla semper tellus id', 196);
INSERT INTO instituicao VALUES (109, 'varius', 'mollis', 76);
INSERT INTO instituicao VALUES (110, 'egestas. Fusce aliquet magna', 'Suspendisse sagittis. Nullam vitae', 101);
INSERT INTO instituicao VALUES (111, 'blandit. Nam nulla magna,', 'ipsum leo', 53);
INSERT INTO instituicao VALUES (112, 'nunc', 'luctus vulputate,', 50);
INSERT INTO instituicao VALUES (113, 'sagittis.', 'cursus vestibulum. Mauris magna. Duis', 149);
INSERT INTO instituicao VALUES (114, 'ullamcorper eu, euismod ac,', 'Etiam imperdiet dictum magna. Ut', 113);
INSERT INTO instituicao VALUES (115, 'feugiat metus', 'pede, ultrices a, auctor', 97);
INSERT INTO instituicao VALUES (116, 'Cras dictum ultricies', 'sodales.', 76);
INSERT INTO instituicao VALUES (117, 'Ut', 'tellus. Nunc', 6);
INSERT INTO instituicao VALUES (118, 'euismod', 'mattis ornare, lectus', 82);
INSERT INTO instituicao VALUES (119, 'Proin vel', 'eu', 17);
INSERT INTO instituicao VALUES (120, 'sit amet, consectetuer', 'tincidunt, nunc', 70);
INSERT INTO instituicao VALUES (121, 'Cras dictum ultricies ligula.', 'Proin nisl sem,', 10);
INSERT INTO instituicao VALUES (122, 'Quisque purus', 'egestas a, dui. Cras', 156);
INSERT INTO instituicao VALUES (123, 'et, eros. Proin ultrices.', 'nostra, per inceptos hymenaeos. Mauris', 24);
INSERT INTO instituicao VALUES (124, 'cursus a,', 'magna. Duis dignissim tempor arcu.', 159);
INSERT INTO instituicao VALUES (125, 'cursus a, enim.', 'lorem semper auctor. Mauris vel', 18);
INSERT INTO instituicao VALUES (126, 'eu tellus', 'nec ante blandit viverra. Donec', 40);
INSERT INTO instituicao VALUES (127, 'odio.', 'turpis.', 40);
INSERT INTO instituicao VALUES (128, 'Proin vel', 'id risus', 44);
INSERT INTO instituicao VALUES (129, 'purus gravida', 'sit amet ante.', 25);
INSERT INTO instituicao VALUES (130, 'magna, malesuada', 'massa', 54);
INSERT INTO instituicao VALUES (131, 'Curabitur consequat, lectus sit', 'nisi nibh lacinia orci, consectetuer', 168);
INSERT INTO instituicao VALUES (132, 'lectus,', 'eu dolor', 31);
INSERT INTO instituicao VALUES (133, 'risus. Morbi metus. Vivamus', 'ridiculus', 3);
INSERT INTO instituicao VALUES (134, 'interdum.', 'sit amet ultricies', 10);
INSERT INTO instituicao VALUES (135, 'dui, nec', 'ac ipsum. Phasellus', 166);
INSERT INTO instituicao VALUES (136, 'a nunc. In at', 'nisl elementum', 11);
INSERT INTO instituicao VALUES (137, 'sed, facilisis vitae,', 'Morbi neque tellus,', 180);
INSERT INTO instituicao VALUES (138, 'at pretium aliquet,', 'tristique senectus et netus', 78);
INSERT INTO instituicao VALUES (139, 'non enim commodo', 'cursus in, hendrerit consectetuer,', 41);
INSERT INTO instituicao VALUES (140, 'et netus et', 'Donec egestas. Duis ac', 8);
INSERT INTO instituicao VALUES (141, 'magna a neque.', 'nec luctus felis', 6);
INSERT INTO instituicao VALUES (142, 'tempor,', 'quis urna.', 63);
INSERT INTO instituicao VALUES (143, 'Cras convallis', 'non justo.', 154);
INSERT INTO instituicao VALUES (144, 'Integer eu lacus.', 'nisi', 46);
INSERT INTO instituicao VALUES (145, 'eget', 'malesuada fringilla', 26);
INSERT INTO instituicao VALUES (146, 'sit amet, consectetuer', 'Phasellus fermentum convallis ligula.', 49);
INSERT INTO instituicao VALUES (147, 'purus. Duis elementum,', 'posuere, enim nisl', 169);
INSERT INTO instituicao VALUES (148, 'Phasellus fermentum', 'Nunc sed orci lobortis', 98);
INSERT INTO instituicao VALUES (149, 'euismod', 'purus gravida sagittis. Duis gravida.', 15);
INSERT INTO instituicao VALUES (150, 'pretium neque. Morbi', 'lacus pede sagittis augue, eu', 193);
INSERT INTO instituicao VALUES (151, 'vestibulum nec, euismod', 'lobortis. Class aptent taciti', 120);
INSERT INTO instituicao VALUES (152, 'lorem ac risus. Morbi', 'enim. Nunc', 53);
INSERT INTO instituicao VALUES (153, 'egestas', 'auctor ullamcorper, nisl arcu iaculis', 112);
INSERT INTO instituicao VALUES (154, 'facilisi. Sed neque.', 'vel,', 13);
INSERT INTO instituicao VALUES (155, 'sit', 'turpis.', 164);
INSERT INTO instituicao VALUES (156, 'vel, convallis in, cursus', 'fermentum convallis ligula. Donec luctus', 182);
INSERT INTO instituicao VALUES (157, 'eu augue porttitor interdum.', 'non arcu.', 151);
INSERT INTO instituicao VALUES (158, 'arcu', 'id magna', 90);
INSERT INTO instituicao VALUES (159, 'lectus pede, ultrices', 'dictum', 61);
INSERT INTO instituicao VALUES (160, 'ante blandit viverra.', 'in aliquet lobortis, nisi', 79);
INSERT INTO instituicao VALUES (161, 'Phasellus fermentum', 'nunc,', 188);
INSERT INTO instituicao VALUES (162, 'libero', 'adipiscing', 164);
INSERT INTO instituicao VALUES (163, 'risus. Duis a', 'a, enim.', 89);
INSERT INTO instituicao VALUES (164, 'a felis ullamcorper', 'mauris id sapien. Cras dolor', 96);
INSERT INTO instituicao VALUES (165, 'nibh', 'iaculis quis,', 189);
INSERT INTO instituicao VALUES (166, 'Cras', 'suscipit, est ac', 61);
INSERT INTO instituicao VALUES (167, 'odio.', 'et netus et malesuada fames', 74);
INSERT INTO instituicao VALUES (168, 'nisi a', 'vitae', 181);
INSERT INTO instituicao VALUES (169, 'orci luctus et ultrices', 'nisi a', 184);
INSERT INTO instituicao VALUES (170, 'amet', 'Aliquam fringilla cursus', 87);
INSERT INTO instituicao VALUES (171, 'ligula', 'risus.', 78);
INSERT INTO instituicao VALUES (172, 'odio', 'magnis dis', 172);
INSERT INTO instituicao VALUES (173, 'magnis dis', 'nostra, per inceptos hymenaeos. Mauris', 85);
INSERT INTO instituicao VALUES (174, 'cursus a,', 'non', 69);
INSERT INTO instituicao VALUES (175, 'netus et', 'ut lacus.', 3);
INSERT INTO instituicao VALUES (176, 'est', 'neque tellus, imperdiet', 55);
INSERT INTO instituicao VALUES (177, 'Praesent', 'quis lectus. Nullam', 112);
INSERT INTO instituicao VALUES (178, 'ligula. Nullam', 'vel, convallis', 146);
INSERT INTO instituicao VALUES (179, 'a, magna.', 'facilisis, magna tellus faucibus', 39);
INSERT INTO instituicao VALUES (180, 'senectus et', 'diam eu dolor egestas', 149);
INSERT INTO instituicao VALUES (181, 'lobortis.', 'at,', 61);
INSERT INTO instituicao VALUES (182, 'sit amet ante.', 'penatibus et magnis dis parturient', 16);
INSERT INTO instituicao VALUES (183, 'egestas.', 'justo. Proin non massa', 47);
INSERT INTO instituicao VALUES (184, 'nisi. Aenean eget metus.', 'leo. Cras vehicula', 30);
INSERT INTO instituicao VALUES (185, 'mattis', 'In condimentum.', 39);
INSERT INTO instituicao VALUES (186, 'Aenean sed pede nec', 'odio a purus.', 158);
INSERT INTO instituicao VALUES (187, 'Vestibulum', 'sit amet', 144);
INSERT INTO instituicao VALUES (188, 'urna. Ut', 'elit. Curabitur sed', 147);
INSERT INTO instituicao VALUES (189, 'semper, dui', 'egestas a, dui. Cras', 21);
INSERT INTO instituicao VALUES (190, 'tempor bibendum. Donec', 'elementum purus, accumsan interdum libero', 39);
INSERT INTO instituicao VALUES (191, 'volutpat nunc sit', 'a neque. Nullam ut nisi', 186);
INSERT INTO instituicao VALUES (192, 'est ac facilisis', 'mauris, rhoncus id,', 147);
INSERT INTO instituicao VALUES (193, 'dui', 'amet, consectetuer adipiscing elit. Etiam', 142);
INSERT INTO instituicao VALUES (194, 'diam luctus', 'neque', 164);
INSERT INTO instituicao VALUES (195, 'non, bibendum sed, est.', 'eu erat semper rutrum. Fusce', 37);
INSERT INTO instituicao VALUES (196, 'mauris id', 'ac mattis semper,', 96);
INSERT INTO instituicao VALUES (197, 'sit amet', 'Curabitur consequat, lectus', 73);
INSERT INTO instituicao VALUES (198, 'libero mauris,', 'sagittis', 100);
INSERT INTO instituicao VALUES (199, 'risus. Morbi metus.', 'quis diam', 190);
INSERT INTO instituicao VALUES (200, 'metus. Aenean sed', 'lacinia orci, consectetuer', 104);


--
-- TOC entry 2234 (class 0 OID 66187)
-- Dependencies: 191
-- Data for Name: instituicaopessoa; Type: TABLE DATA; Schema: teste; Owner: postgres
--

INSERT INTO instituicaopessoa VALUES (17, 157);
INSERT INTO instituicaopessoa VALUES (70, 54);
INSERT INTO instituicaopessoa VALUES (121, 47);
INSERT INTO instituicaopessoa VALUES (28, 60);
INSERT INTO instituicaopessoa VALUES (184, 182);
INSERT INTO instituicaopessoa VALUES (183, 139);
INSERT INTO instituicaopessoa VALUES (40, 52);
INSERT INTO instituicaopessoa VALUES (43, 12);
INSERT INTO instituicaopessoa VALUES (77, 73);
INSERT INTO instituicaopessoa VALUES (31, 47);
INSERT INTO instituicaopessoa VALUES (73, 18);
INSERT INTO instituicaopessoa VALUES (137, 72);
INSERT INTO instituicaopessoa VALUES (82, 23);
INSERT INTO instituicaopessoa VALUES (28, 190);
INSERT INTO instituicaopessoa VALUES (72, 45);
INSERT INTO instituicaopessoa VALUES (146, 142);
INSERT INTO instituicaopessoa VALUES (99, 66);
INSERT INTO instituicaopessoa VALUES (189, 126);
INSERT INTO instituicaopessoa VALUES (125, 172);
INSERT INTO instituicaopessoa VALUES (108, 108);
INSERT INTO instituicaopessoa VALUES (111, 148);
INSERT INTO instituicaopessoa VALUES (159, 154);
INSERT INTO instituicaopessoa VALUES (156, 2);
INSERT INTO instituicaopessoa VALUES (166, 33);
INSERT INTO instituicaopessoa VALUES (74, 197);
INSERT INTO instituicaopessoa VALUES (79, 146);
INSERT INTO instituicaopessoa VALUES (14, 16);
INSERT INTO instituicaopessoa VALUES (18, 96);
INSERT INTO instituicaopessoa VALUES (38, 46);
INSERT INTO instituicaopessoa VALUES (85, 109);
INSERT INTO instituicaopessoa VALUES (91, 30);
INSERT INTO instituicaopessoa VALUES (50, 189);
INSERT INTO instituicaopessoa VALUES (95, 38);
INSERT INTO instituicaopessoa VALUES (115, 20);
INSERT INTO instituicaopessoa VALUES (10, 22);
INSERT INTO instituicaopessoa VALUES (128, 121);
INSERT INTO instituicaopessoa VALUES (169, 87);
INSERT INTO instituicaopessoa VALUES (75, 125);
INSERT INTO instituicaopessoa VALUES (88, 40);
INSERT INTO instituicaopessoa VALUES (157, 162);
INSERT INTO instituicaopessoa VALUES (36, 35);
INSERT INTO instituicaopessoa VALUES (50, 126);
INSERT INTO instituicaopessoa VALUES (145, 87);
INSERT INTO instituicaopessoa VALUES (171, 29);
INSERT INTO instituicaopessoa VALUES (195, 62);
INSERT INTO instituicaopessoa VALUES (59, 45);
INSERT INTO instituicaopessoa VALUES (50, 153);
INSERT INTO instituicaopessoa VALUES (83, 165);
INSERT INTO instituicaopessoa VALUES (173, 92);
INSERT INTO instituicaopessoa VALUES (186, 101);
INSERT INTO instituicaopessoa VALUES (12, 155);
INSERT INTO instituicaopessoa VALUES (187, 86);
INSERT INTO instituicaopessoa VALUES (79, 75);
INSERT INTO instituicaopessoa VALUES (126, 36);
INSERT INTO instituicaopessoa VALUES (36, 161);
INSERT INTO instituicaopessoa VALUES (70, 143);
INSERT INTO instituicaopessoa VALUES (10, 119);
INSERT INTO instituicaopessoa VALUES (68, 155);
INSERT INTO instituicaopessoa VALUES (6, 39);
INSERT INTO instituicaopessoa VALUES (183, 1);
INSERT INTO instituicaopessoa VALUES (100, 41);
INSERT INTO instituicaopessoa VALUES (45, 150);
INSERT INTO instituicaopessoa VALUES (194, 127);
INSERT INTO instituicaopessoa VALUES (115, 167);
INSERT INTO instituicaopessoa VALUES (19, 100);
INSERT INTO instituicaopessoa VALUES (67, 31);
INSERT INTO instituicaopessoa VALUES (55, 54);
INSERT INTO instituicaopessoa VALUES (116, 134);
INSERT INTO instituicaopessoa VALUES (128, 41);
INSERT INTO instituicaopessoa VALUES (169, 163);
INSERT INTO instituicaopessoa VALUES (2, 38);
INSERT INTO instituicaopessoa VALUES (106, 12);
INSERT INTO instituicaopessoa VALUES (157, 174);
INSERT INTO instituicaopessoa VALUES (166, 163);
INSERT INTO instituicaopessoa VALUES (12, 149);
INSERT INTO instituicaopessoa VALUES (163, 112);
INSERT INTO instituicaopessoa VALUES (190, 8);
INSERT INTO instituicaopessoa VALUES (62, 183);
INSERT INTO instituicaopessoa VALUES (134, 176);
INSERT INTO instituicaopessoa VALUES (150, 153);
INSERT INTO instituicaopessoa VALUES (13, 108);
INSERT INTO instituicaopessoa VALUES (194, 95);
INSERT INTO instituicaopessoa VALUES (16, 98);
INSERT INTO instituicaopessoa VALUES (191, 55);
INSERT INTO instituicaopessoa VALUES (65, 30);
INSERT INTO instituicaopessoa VALUES (54, 114);
INSERT INTO instituicaopessoa VALUES (3, 178);
INSERT INTO instituicaopessoa VALUES (73, 118);
INSERT INTO instituicaopessoa VALUES (138, 95);
INSERT INTO instituicaopessoa VALUES (166, 76);
INSERT INTO instituicaopessoa VALUES (66, 196);
INSERT INTO instituicaopessoa VALUES (72, 32);
INSERT INTO instituicaopessoa VALUES (117, 55);
INSERT INTO instituicaopessoa VALUES (3, 6);
INSERT INTO instituicaopessoa VALUES (74, 200);
INSERT INTO instituicaopessoa VALUES (63, 87);
INSERT INTO instituicaopessoa VALUES (108, 56);
INSERT INTO instituicaopessoa VALUES (181, 123);
INSERT INTO instituicaopessoa VALUES (153, 172);
INSERT INTO instituicaopessoa VALUES (178, 17);
INSERT INTO instituicaopessoa VALUES (1, 31);
INSERT INTO instituicaopessoa VALUES (131, 4);
INSERT INTO instituicaopessoa VALUES (9, 4);
INSERT INTO instituicaopessoa VALUES (121, 147);
INSERT INTO instituicaopessoa VALUES (99, 86);
INSERT INTO instituicaopessoa VALUES (22, 165);
INSERT INTO instituicaopessoa VALUES (81, 94);
INSERT INTO instituicaopessoa VALUES (196, 198);
INSERT INTO instituicaopessoa VALUES (148, 199);
INSERT INTO instituicaopessoa VALUES (4, 22);
INSERT INTO instituicaopessoa VALUES (199, 66);
INSERT INTO instituicaopessoa VALUES (109, 106);
INSERT INTO instituicaopessoa VALUES (122, 89);
INSERT INTO instituicaopessoa VALUES (28, 74);
INSERT INTO instituicaopessoa VALUES (61, 6);
INSERT INTO instituicaopessoa VALUES (91, 61);
INSERT INTO instituicaopessoa VALUES (36, 22);
INSERT INTO instituicaopessoa VALUES (64, 44);
INSERT INTO instituicaopessoa VALUES (25, 185);
INSERT INTO instituicaopessoa VALUES (191, 124);
INSERT INTO instituicaopessoa VALUES (70, 12);
INSERT INTO instituicaopessoa VALUES (88, 151);
INSERT INTO instituicaopessoa VALUES (106, 84);
INSERT INTO instituicaopessoa VALUES (149, 54);
INSERT INTO instituicaopessoa VALUES (82, 152);
INSERT INTO instituicaopessoa VALUES (75, 80);
INSERT INTO instituicaopessoa VALUES (18, 183);
INSERT INTO instituicaopessoa VALUES (185, 139);
INSERT INTO instituicaopessoa VALUES (72, 13);
INSERT INTO instituicaopessoa VALUES (13, 132);
INSERT INTO instituicaopessoa VALUES (18, 103);
INSERT INTO instituicaopessoa VALUES (193, 54);
INSERT INTO instituicaopessoa VALUES (124, 56);
INSERT INTO instituicaopessoa VALUES (97, 149);
INSERT INTO instituicaopessoa VALUES (40, 88);
INSERT INTO instituicaopessoa VALUES (73, 110);
INSERT INTO instituicaopessoa VALUES (100, 160);
INSERT INTO instituicaopessoa VALUES (61, 5);
INSERT INTO instituicaopessoa VALUES (44, 9);
INSERT INTO instituicaopessoa VALUES (58, 126);
INSERT INTO instituicaopessoa VALUES (161, 132);
INSERT INTO instituicaopessoa VALUES (5, 179);
INSERT INTO instituicaopessoa VALUES (115, 190);
INSERT INTO instituicaopessoa VALUES (117, 187);
INSERT INTO instituicaopessoa VALUES (3, 130);
INSERT INTO instituicaopessoa VALUES (118, 20);
INSERT INTO instituicaopessoa VALUES (32, 110);
INSERT INTO instituicaopessoa VALUES (73, 156);
INSERT INTO instituicaopessoa VALUES (166, 170);
INSERT INTO instituicaopessoa VALUES (105, 6);
INSERT INTO instituicaopessoa VALUES (57, 177);
INSERT INTO instituicaopessoa VALUES (116, 156);
INSERT INTO instituicaopessoa VALUES (137, 176);
INSERT INTO instituicaopessoa VALUES (161, 180);
INSERT INTO instituicaopessoa VALUES (185, 18);
INSERT INTO instituicaopessoa VALUES (106, 145);
INSERT INTO instituicaopessoa VALUES (150, 110);
INSERT INTO instituicaopessoa VALUES (123, 65);
INSERT INTO instituicaopessoa VALUES (100, 40);
INSERT INTO instituicaopessoa VALUES (51, 102);
INSERT INTO instituicaopessoa VALUES (169, 168);
INSERT INTO instituicaopessoa VALUES (122, 1);
INSERT INTO instituicaopessoa VALUES (78, 195);
INSERT INTO instituicaopessoa VALUES (157, 44);
INSERT INTO instituicaopessoa VALUES (164, 61);
INSERT INTO instituicaopessoa VALUES (49, 21);
INSERT INTO instituicaopessoa VALUES (38, 164);
INSERT INTO instituicaopessoa VALUES (177, 174);
INSERT INTO instituicaopessoa VALUES (140, 138);
INSERT INTO instituicaopessoa VALUES (154, 124);
INSERT INTO instituicaopessoa VALUES (155, 59);
INSERT INTO instituicaopessoa VALUES (69, 105);
INSERT INTO instituicaopessoa VALUES (169, 191);
INSERT INTO instituicaopessoa VALUES (169, 68);
INSERT INTO instituicaopessoa VALUES (31, 19);
INSERT INTO instituicaopessoa VALUES (170, 200);
INSERT INTO instituicaopessoa VALUES (76, 16);
INSERT INTO instituicaopessoa VALUES (183, 130);
INSERT INTO instituicaopessoa VALUES (69, 99);
INSERT INTO instituicaopessoa VALUES (64, 197);
INSERT INTO instituicaopessoa VALUES (139, 32);
INSERT INTO instituicaopessoa VALUES (160, 141);
INSERT INTO instituicaopessoa VALUES (70, 65);
INSERT INTO instituicaopessoa VALUES (153, 26);
INSERT INTO instituicaopessoa VALUES (38, 119);
INSERT INTO instituicaopessoa VALUES (188, 50);
INSERT INTO instituicaopessoa VALUES (67, 151);
INSERT INTO instituicaopessoa VALUES (162, 57);
INSERT INTO instituicaopessoa VALUES (187, 91);
INSERT INTO instituicaopessoa VALUES (200, 65);
INSERT INTO instituicaopessoa VALUES (86, 157);
INSERT INTO instituicaopessoa VALUES (108, 50);
INSERT INTO instituicaopessoa VALUES (158, 23);
INSERT INTO instituicaopessoa VALUES (40, 92);
INSERT INTO instituicaopessoa VALUES (198, 189);
INSERT INTO instituicaopessoa VALUES (44, 74);
INSERT INTO instituicaopessoa VALUES (5, 27);
INSERT INTO instituicaopessoa VALUES (3, 73);


--
-- TOC entry 2235 (class 0 OID 66190)
-- Dependencies: 192
-- Data for Name: pais; Type: TABLE DATA; Schema: teste; Owner: postgres
--

INSERT INTO pais VALUES (1, 'sdfnsfsd');
INSERT INTO pais VALUES (2, 'msmndfpsifds');
INSERT INTO pais VALUES (3, 'convallis');
INSERT INTO pais VALUES (4, 'eget');
INSERT INTO pais VALUES (5, 'Cras');
INSERT INTO pais VALUES (6, 'eget metus. In');
INSERT INTO pais VALUES (7, 'Aliquam nisl. Nulla');
INSERT INTO pais VALUES (8, 'mauris sit amet');
INSERT INTO pais VALUES (9, 'enim commodo');
INSERT INTO pais VALUES (10, 'nec,');
INSERT INTO pais VALUES (11, 'amet, dapibus id,');
INSERT INTO pais VALUES (12, 'ornare tortor');
INSERT INTO pais VALUES (13, 'Suspendisse sed');
INSERT INTO pais VALUES (14, 'varius ultrices,');
INSERT INTO pais VALUES (15, 'Integer eu lacus.');
INSERT INTO pais VALUES (16, 'feugiat.');
INSERT INTO pais VALUES (17, 'nisi');
INSERT INTO pais VALUES (18, 'vitae sodales nisi');
INSERT INTO pais VALUES (19, 'Nulla facilisi.');
INSERT INTO pais VALUES (20, 'cursus et, magna.');
INSERT INTO pais VALUES (21, 'fringilla');
INSERT INTO pais VALUES (22, 'erat. Sed nunc');
INSERT INTO pais VALUES (23, 'lacinia at,');
INSERT INTO pais VALUES (24, 'enim');
INSERT INTO pais VALUES (25, 'purus.');
INSERT INTO pais VALUES (26, 'nonummy');
INSERT INTO pais VALUES (27, 'arcu ac orci.');
INSERT INTO pais VALUES (28, 'Maecenas ornare egestas');
INSERT INTO pais VALUES (29, 'Aliquam');
INSERT INTO pais VALUES (30, 'nulla.');
INSERT INTO pais VALUES (31, 'ut');
INSERT INTO pais VALUES (32, 'tortor nibh sit');
INSERT INTO pais VALUES (33, 'amet, consectetuer adipiscing');
INSERT INTO pais VALUES (34, 'urna justo faucibus');
INSERT INTO pais VALUES (35, 'pede. Cras vulputate');
INSERT INTO pais VALUES (36, 'sit amet diam');
INSERT INTO pais VALUES (37, 'orci lacus');
INSERT INTO pais VALUES (38, 'erat. Sed');
INSERT INTO pais VALUES (39, 'lacinia');
INSERT INTO pais VALUES (40, 'dapibus');
INSERT INTO pais VALUES (41, 'ornare.');
INSERT INTO pais VALUES (42, 'senectus et');
INSERT INTO pais VALUES (43, 'adipiscing ligula. Aenean');
INSERT INTO pais VALUES (44, 'luctus, ipsum');
INSERT INTO pais VALUES (45, 'Aenean eget magna.');
INSERT INTO pais VALUES (46, 'commodo');
INSERT INTO pais VALUES (47, 'risus. Quisque libero');
INSERT INTO pais VALUES (48, 'metus vitae');
INSERT INTO pais VALUES (49, 'iaculis enim, sit');
INSERT INTO pais VALUES (50, 'quam.');
INSERT INTO pais VALUES (51, 'rhoncus');
INSERT INTO pais VALUES (52, 'at arcu. Vestibulum');
INSERT INTO pais VALUES (53, 'lorem lorem, luctus');
INSERT INTO pais VALUES (54, 'dictum. Proin eget');
INSERT INTO pais VALUES (55, 'nunc ac mattis');
INSERT INTO pais VALUES (56, 'imperdiet non,');
INSERT INTO pais VALUES (57, 'odio.');
INSERT INTO pais VALUES (58, 'egestas.');
INSERT INTO pais VALUES (59, 'felis. Donec');
INSERT INTO pais VALUES (60, 'Nunc');
INSERT INTO pais VALUES (61, 'faucibus.');
INSERT INTO pais VALUES (62, 'quam quis diam.');
INSERT INTO pais VALUES (63, 'ridiculus');
INSERT INTO pais VALUES (64, 'lorem ut aliquam');
INSERT INTO pais VALUES (65, 'Suspendisse dui.');
INSERT INTO pais VALUES (66, 'vitae erat');
INSERT INTO pais VALUES (67, 'dolor');
INSERT INTO pais VALUES (68, 'Curabitur consequat,');
INSERT INTO pais VALUES (69, 'adipiscing. Mauris molestie');
INSERT INTO pais VALUES (70, 'blandit');
INSERT INTO pais VALUES (71, 'dolor,');
INSERT INTO pais VALUES (72, 'eleifend vitae,');
INSERT INTO pais VALUES (73, 'pretium et, rutrum');
INSERT INTO pais VALUES (74, 'Donec feugiat');
INSERT INTO pais VALUES (75, 'arcu');
INSERT INTO pais VALUES (76, 'molestie');
INSERT INTO pais VALUES (77, 'lobortis risus. In');
INSERT INTO pais VALUES (78, 'leo');
INSERT INTO pais VALUES (79, 'Fusce aliquet');
INSERT INTO pais VALUES (80, 'purus gravida sagittis.');
INSERT INTO pais VALUES (81, 'luctus');
INSERT INTO pais VALUES (82, 'eget odio. Aliquam');
INSERT INTO pais VALUES (83, 'ac risus. Morbi');
INSERT INTO pais VALUES (84, 'sapien,');
INSERT INTO pais VALUES (85, 'rutrum magna.');
INSERT INTO pais VALUES (86, 'et');
INSERT INTO pais VALUES (87, 'lorem, sit');
INSERT INTO pais VALUES (88, 'Nulla');
INSERT INTO pais VALUES (89, 'a');
INSERT INTO pais VALUES (90, 'mi enim,');
INSERT INTO pais VALUES (91, 'ipsum primis');
INSERT INTO pais VALUES (92, 'Quisque varius.');
INSERT INTO pais VALUES (93, 'elit. Etiam laoreet,');
INSERT INTO pais VALUES (94, 'ante lectus');
INSERT INTO pais VALUES (95, 'dis parturient montes,');
INSERT INTO pais VALUES (96, 'nibh. Phasellus');
INSERT INTO pais VALUES (97, 'id,');
INSERT INTO pais VALUES (98, 'ante. Maecenas mi');
INSERT INTO pais VALUES (99, 'elit. Curabitur sed');
INSERT INTO pais VALUES (100, 'et, rutrum');
INSERT INTO pais VALUES (101, 'eget');
INSERT INTO pais VALUES (102, 'Nunc commodo');
INSERT INTO pais VALUES (103, 'Donec');
INSERT INTO pais VALUES (104, 'Vestibulum');
INSERT INTO pais VALUES (105, 'arcu.');
INSERT INTO pais VALUES (106, 'lacus. Etiam bibendum');
INSERT INTO pais VALUES (107, 'Nulla');
INSERT INTO pais VALUES (108, 'Fusce');
INSERT INTO pais VALUES (109, 'Nam');
INSERT INTO pais VALUES (110, 'sapien. Nunc pulvinar');
INSERT INTO pais VALUES (111, 'porttitor');
INSERT INTO pais VALUES (112, 'Proin eget odio.');
INSERT INTO pais VALUES (113, 'accumsan neque et');
INSERT INTO pais VALUES (114, 'ridiculus');
INSERT INTO pais VALUES (115, 'id magna et');
INSERT INTO pais VALUES (116, 'leo.');
INSERT INTO pais VALUES (117, 'ante,');
INSERT INTO pais VALUES (118, 'nibh vulputate');
INSERT INTO pais VALUES (119, 'rhoncus.');
INSERT INTO pais VALUES (120, 'Vivamus');
INSERT INTO pais VALUES (121, 'imperdiet');
INSERT INTO pais VALUES (122, 'eget');
INSERT INTO pais VALUES (123, 'malesuada fames');
INSERT INTO pais VALUES (124, 'tempor arcu. Vestibulum');
INSERT INTO pais VALUES (125, 'accumsan convallis,');
INSERT INTO pais VALUES (126, 'pede blandit');
INSERT INTO pais VALUES (127, 'eu nibh vulputate');
INSERT INTO pais VALUES (128, 'hendrerit id, ante.');
INSERT INTO pais VALUES (129, 'commodo at,');
INSERT INTO pais VALUES (130, 'viverra.');
INSERT INTO pais VALUES (131, 'ut, nulla.');
INSERT INTO pais VALUES (132, 'orci');
INSERT INTO pais VALUES (133, 'adipiscing fringilla, porttitor');
INSERT INTO pais VALUES (134, 'ut');
INSERT INTO pais VALUES (135, 'lectus justo');
INSERT INTO pais VALUES (136, 'euismod et,');
INSERT INTO pais VALUES (137, 'purus');
INSERT INTO pais VALUES (138, 'fermentum metus.');
INSERT INTO pais VALUES (139, 'ante ipsum');
INSERT INTO pais VALUES (140, 'in,');
INSERT INTO pais VALUES (141, 'In lorem. Donec');
INSERT INTO pais VALUES (142, 'nulla. Cras eu');
INSERT INTO pais VALUES (143, 'sodales elit');
INSERT INTO pais VALUES (144, 'purus');
INSERT INTO pais VALUES (145, 'nisl arcu iaculis');
INSERT INTO pais VALUES (146, 'enim.');
INSERT INTO pais VALUES (147, 'molestie tortor nibh');
INSERT INTO pais VALUES (148, 'ultrices posuere cubilia');
INSERT INTO pais VALUES (149, 'nec urna');
INSERT INTO pais VALUES (150, 'a, scelerisque sed,');
INSERT INTO pais VALUES (151, 'Nunc');
INSERT INTO pais VALUES (152, 'cursus in, hendrerit');
INSERT INTO pais VALUES (153, 'feugiat placerat velit.');
INSERT INTO pais VALUES (154, 'eleifend');
INSERT INTO pais VALUES (155, 'nisi magna');
INSERT INTO pais VALUES (156, 'enim, sit');
INSERT INTO pais VALUES (157, 'dis');
INSERT INTO pais VALUES (158, 'placerat, orci lacus');
INSERT INTO pais VALUES (159, 'tortor,');
INSERT INTO pais VALUES (160, 'adipiscing elit.');
INSERT INTO pais VALUES (161, 'nascetur');
INSERT INTO pais VALUES (162, 'purus');
INSERT INTO pais VALUES (163, 'mauris.');
INSERT INTO pais VALUES (164, 'Cras dictum');
INSERT INTO pais VALUES (165, 'ligula. Aliquam erat');
INSERT INTO pais VALUES (166, 'vehicula. Pellentesque');
INSERT INTO pais VALUES (167, 'sit amet, dapibus');
INSERT INTO pais VALUES (168, 'Aenean egestas hendrerit');
INSERT INTO pais VALUES (169, 'nec enim. Nunc');
INSERT INTO pais VALUES (170, 'vehicula et, rutrum');
INSERT INTO pais VALUES (171, 'Mauris vestibulum,');
INSERT INTO pais VALUES (172, 'cursus et, eros.');
INSERT INTO pais VALUES (173, 'dapibus rutrum, justo.');
INSERT INTO pais VALUES (174, 'ad litora');
INSERT INTO pais VALUES (175, 'urna');
INSERT INTO pais VALUES (176, 'nisl.');
INSERT INTO pais VALUES (177, 'Cras sed');
INSERT INTO pais VALUES (178, 'sit');
INSERT INTO pais VALUES (179, 'metus vitae');
INSERT INTO pais VALUES (180, 'ac');
INSERT INTO pais VALUES (181, 'libero.');
INSERT INTO pais VALUES (182, 'lacinia mattis.');
INSERT INTO pais VALUES (183, 'nec tempus');
INSERT INTO pais VALUES (184, 'Quisque');
INSERT INTO pais VALUES (185, 'est mauris,');
INSERT INTO pais VALUES (186, 'massa. Integer vitae');
INSERT INTO pais VALUES (187, 'justo sit');
INSERT INTO pais VALUES (188, 'Cum');
INSERT INTO pais VALUES (189, 'Cras');
INSERT INTO pais VALUES (190, 'nec tempus scelerisque,');
INSERT INTO pais VALUES (191, 'sed, sapien.');
INSERT INTO pais VALUES (192, 'mi pede, nonummy');
INSERT INTO pais VALUES (193, 'quis diam.');
INSERT INTO pais VALUES (194, 'pharetra, felis eget');
INSERT INTO pais VALUES (195, 'Nunc lectus pede,');
INSERT INTO pais VALUES (196, 'Aliquam');
INSERT INTO pais VALUES (197, 'aliquet');
INSERT INTO pais VALUES (198, 'Donec non justo.');
INSERT INTO pais VALUES (199, 'Ut');
INSERT INTO pais VALUES (200, 'nunc. In at');


--
-- TOC entry 2236 (class 0 OID 66194)
-- Dependencies: 193
-- Data for Name: pessoa; Type: TABLE DATA; Schema: teste; Owner: postgres
--

INSERT INTO pessoa VALUES (10, 'sdfdsf', 'sdfsf', 'sdfsdf', 'sdfsf', 1);
INSERT INTO pessoa VALUES (1, '14', 'Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas', 'justo. Proin non massa non', 'lorem vitae', 71);
INSERT INTO pessoa VALUES (2, '14', 'arcu iaculis enim, sit amet', 'semper cursus.', 'ut eros non enim commodo hendrerit. Donec', 27);
INSERT INTO pessoa VALUES (3, '12', 'lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed', 'aliquet.', 'magna. Cras convallis convallis dolor. Quisque tincidunt pede ac', 141);
INSERT INTO pessoa VALUES (4, '12', 'magna tellus faucibus leo, in lobortis tellus', 'laoreet, libero et tristique pellentesque,', 'tellus faucibus leo, in', 84);
INSERT INTO pessoa VALUES (5, '11', 'ultrices a, auctor non, feugiat nec, diam. Duis mi enim,', 'non arcu. Vivamus sit', 'sed orci lobortis augue scelerisque', 176);
INSERT INTO pessoa VALUES (6, '15', 'mollis vitae, posuere at,', 'arcu. Sed et libero. Proin', 'orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam', 67);
INSERT INTO pessoa VALUES (7, '14', 'eu nibh vulputate', 'mollis nec, cursus', 'gravida. Praesent eu nulla at sem', 104);
INSERT INTO pessoa VALUES (8, '12', 'dis parturient montes, nascetur ridiculus mus. Proin vel', 'arcu.', 'amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor', 36);
INSERT INTO pessoa VALUES (9, '15', 'eros. Proin ultrices. Duis volutpat nunc sit amet', 'lorem', 'Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi', 8);
INSERT INTO pessoa VALUES (11, '12', 'non', 'mus. Aenean eget', 'mauris. Integer sem', 179);
INSERT INTO pessoa VALUES (12, '11', 'ornare, lectus ante', 'nonummy.', 'non sapien molestie orci', 27);
INSERT INTO pessoa VALUES (13, '11', 'cursus a,', 'a neque.', 'ac,', 67);
INSERT INTO pessoa VALUES (14, '11', 'malesuada malesuada. Integer id', 'Donec', 'primis in', 124);
INSERT INTO pessoa VALUES (15, '12', 'vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant', 'quam quis diam. Pellentesque habitant', 'Proin', 15);
INSERT INTO pessoa VALUES (16, '12', 'augue id ante dictum cursus. Nunc mauris', 'diam. Pellentesque habitant', 'pede nec ante blandit viverra.', 40);
INSERT INTO pessoa VALUES (17, '14', 'nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu.', 'elit, a feugiat tellus', 'gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum', 197);
INSERT INTO pessoa VALUES (18, '12', 'Aliquam ultrices iaculis odio. Nam interdum', 'Donec est. Nunc', 'leo elementum sem, vitae aliquam eros turpis non enim.', 183);
INSERT INTO pessoa VALUES (19, '14', 'tortor, dictum eu,', 'fermentum fermentum arcu. Vestibulum', 'nulla vulputate dui, nec tempus mauris', 106);
INSERT INTO pessoa VALUES (20, '12', 'aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam', 'nisl. Maecenas', 'nibh sit amet orci. Ut sagittis lobortis mauris.', 1);
INSERT INTO pessoa VALUES (21, '13', 'velit.', 'sit amet', 'vel arcu eu odio tristique pharetra. Quisque ac', 24);
INSERT INTO pessoa VALUES (22, '12', 'dis parturient montes, nascetur ridiculus', 'arcu. Vestibulum ante ipsum primis', 'lectus pede et risus. Quisque libero lacus, varius', 170);
INSERT INTO pessoa VALUES (23, '11', 'fringilla euismod enim. Etiam gravida molestie arcu.', 'pede, nonummy', 'eget ipsum. Suspendisse', 86);
INSERT INTO pessoa VALUES (24, '12', 'est arcu ac orci. Ut semper pretium neque. Morbi', 'vel nisl. Quisque fringilla', 'in lobortis', 9);
INSERT INTO pessoa VALUES (25, '11', 'eu turpis. Nulla', 'libero', 'eu, ligula. Aenean euismod mauris eu elit. Nulla', 57);
INSERT INTO pessoa VALUES (26, '11', 'lobortis. Class aptent taciti sociosqu ad litora torquent per', 'lacus. Etiam', 'Sed eget', 133);
INSERT INTO pessoa VALUES (27, '15', 'tempor lorem, eget mollis lectus pede et risus.', 'Cras', 'ut, nulla. Cras eu tellus eu augue', 48);
INSERT INTO pessoa VALUES (28, '13', 'Donec elementum,', 'sodales at, velit. Pellentesque ultricies', 'massa rutrum magna. Cras convallis', 108);
INSERT INTO pessoa VALUES (29, '14', 'mauris id sapien. Cras dolor', 'Suspendisse aliquet, sem ut', 'et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus', 58);
INSERT INTO pessoa VALUES (30, '14', 'Aenean sed pede', 'facilisis non,', 'gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum', 49);
INSERT INTO pessoa VALUES (31, '14', 'conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien', 'nunc sed libero. Proin', 'facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer', 1);
INSERT INTO pessoa VALUES (32, '15', 'nec, leo. Morbi neque tellus, imperdiet non, vestibulum', 'non enim.', 'tellus', 178);
INSERT INTO pessoa VALUES (33, '13', 'ullamcorper. Duis cursus, diam', 'egestas rhoncus. Proin', 'ac turpis egestas. Aliquam fringilla cursus purus.', 189);
INSERT INTO pessoa VALUES (34, '15', 'ornare lectus justo eu arcu. Morbi', 'neque. Nullam', 'malesuada malesuada. Integer id', 2);
INSERT INTO pessoa VALUES (35, '12', 'parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse', 'ante, iaculis nec, eleifend', 'aliquet. Phasellus fermentum convallis ligula. Donec', 84);
INSERT INTO pessoa VALUES (36, '12', 'dolor, tempus non, lacinia at, iaculis quis, pede.', 'ipsum. Suspendisse', 'mauris. Morbi non sapien molestie', 36);
INSERT INTO pessoa VALUES (37, '14', 'blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus', 'ridiculus', 'auctor vitae, aliquet nec, imperdiet nec,', 84);
INSERT INTO pessoa VALUES (38, '11', 'vitae erat vel', 'interdum ligula eu', 'et, rutrum eu,', 162);
INSERT INTO pessoa VALUES (39, '11', 'et, rutrum', 'Donec dignissim magna a', 'cursus. Integer mollis. Integer', 186);
INSERT INTO pessoa VALUES (40, '11', 'Cum sociis natoque penatibus et magnis dis parturient', 'magna. Sed eu eros. Nam', 'metus eu erat semper rutrum. Fusce dolor', 183);
INSERT INTO pessoa VALUES (41, '13', 'Vivamus nibh dolor, nonummy ac, feugiat non, lobortis', 'Mauris', 'Donec felis orci, adipiscing non, luctus sit amet, faucibus ut,', 97);
INSERT INTO pessoa VALUES (42, '11', 'neque tellus,', 'in molestie tortor nibh', 'quis lectus. Nullam suscipit, est', 119);
INSERT INTO pessoa VALUES (43, '14', 'id risus', 'Quisque fringilla', 'augue. Sed molestie. Sed', 126);
INSERT INTO pessoa VALUES (44, '11', 'egestas hendrerit neque. In ornare sagittis', 'interdum.', 'mollis. Integer tincidunt aliquam arcu. Aliquam', 139);
INSERT INTO pessoa VALUES (45, '12', 'tincidunt', 'pede. Suspendisse dui. Fusce', 'elementum sem,', 31);
INSERT INTO pessoa VALUES (46, '12', 'Cras interdum.', 'non ante bibendum ullamcorper. Duis', 'vehicula aliquet libero. Integer in magna.', 51);
INSERT INTO pessoa VALUES (47, '14', 'ligula elit, pretium et, rutrum non, hendrerit', 'sed tortor.', 'magna, malesuada vel, convallis in, cursus et, eros. Proin', 11);
INSERT INTO pessoa VALUES (48, '13', 'nec urna suscipit nonummy.', 'erat volutpat. Nulla', 'pharetra nibh. Aliquam', 35);
INSERT INTO pessoa VALUES (49, '12', 'pede', 'aliquet vel,', 'laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend,', 104);
INSERT INTO pessoa VALUES (50, '11', 'libero nec ligula consectetuer', 'vulputate, nisi sem semper', 'non, vestibulum nec, euismod in, dolor. Fusce feugiat.', 124);
INSERT INTO pessoa VALUES (51, '13', 'turpis egestas. Aliquam fringilla cursus purus.', 'Mauris eu turpis.', 'molestie tellus. Aenean egestas hendrerit neque. In ornare', 161);
INSERT INTO pessoa VALUES (52, '11', 'Sed malesuada augue ut lacus. Nulla tincidunt, neque', 'consectetuer adipiscing elit. Curabitur sed', 'eu eros. Nam consequat dolor vitae dolor.', 66);
INSERT INTO pessoa VALUES (53, '14', 'tellus faucibus leo, in lobortis tellus justo sit amet nulla.', 'leo. Vivamus nibh dolor, nonummy', 'feugiat', 13);
INSERT INTO pessoa VALUES (54, '13', 'dui, in sodales elit erat vitae risus. Duis', 'tortor nibh', 'Nunc ac sem ut dolor dapibus gravida. Aliquam', 181);
INSERT INTO pessoa VALUES (55, '12', 'vel arcu eu odio tristique pharetra. Quisque ac', 'nec luctus felis purus', 'dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis', 114);
INSERT INTO pessoa VALUES (56, '13', 'at, nisi. Cum sociis natoque penatibus et magnis dis parturient', 'tellus. Phasellus elit', 'malesuada fames ac turpis egestas. Aliquam fringilla', 64);
INSERT INTO pessoa VALUES (57, '13', 'malesuada ut, sem. Nulla interdum.', 'est ac mattis', 'tellus faucibus leo, in lobortis tellus', 179);
INSERT INTO pessoa VALUES (58, '12', 'amet lorem semper auctor.', 'Nunc mauris elit, dictum', 'vestibulum lorem,', 105);
INSERT INTO pessoa VALUES (59, '15', 'Class', 'ac mi', 'euismod ac, fermentum vel, mauris. Integer sem elit,', 69);
INSERT INTO pessoa VALUES (60, '14', 'Duis volutpat nunc sit amet', 'dictum. Proin', 'Cum sociis natoque penatibus et magnis dis parturient', 141);
INSERT INTO pessoa VALUES (61, '11', 'sem, consequat nec, mollis vitae, posuere at, velit. Cras', 'neque sed dictum eleifend,', 'cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum', 144);
INSERT INTO pessoa VALUES (62, '12', 'aliquet molestie tellus. Aenean egestas hendrerit neque. In', 'Phasellus nulla. Integer', 'non, lobortis', 155);
INSERT INTO pessoa VALUES (63, '11', 'eu nulla at', 'tortor. Integer aliquam adipiscing lacus.', 'ligula. Aenean', 149);
INSERT INTO pessoa VALUES (64, '13', 'Nunc ut', 'nunc. Quisque ornare tortor', 'sed leo. Cras vehicula aliquet libero. Integer in', 20);
INSERT INTO pessoa VALUES (65, '14', 'lorem tristique aliquet. Phasellus fermentum convallis ligula.', 'et,', 'mollis dui, in sodales', 150);
INSERT INTO pessoa VALUES (66, '11', 'Phasellus at augue', 'neque sed dictum eleifend, nunc', 'consequat auctor,', 118);
INSERT INTO pessoa VALUES (67, '12', 'Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis', 'risus. Nulla', 'mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio.', 127);
INSERT INTO pessoa VALUES (68, '11', 'rhoncus. Nullam', 'Integer sem elit, pharetra ut,', 'non nisi. Aenean eget metus. In nec orci.', 121);
INSERT INTO pessoa VALUES (69, '13', 'vel lectus. Cum sociis natoque penatibus et magnis dis', 'ipsum. Phasellus vitae mauris sit', 'fringilla ornare placerat, orci lacus', 59);
INSERT INTO pessoa VALUES (70, '14', 'hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In', 'et', 'interdum', 60);
INSERT INTO pessoa VALUES (71, '15', 'sapien. Cras dolor dolor,', 'eu, ligula. Aenean euismod mauris', 'interdum ligula eu enim. Etiam imperdiet dictum magna.', 57);
INSERT INTO pessoa VALUES (72, '15', 'imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus.', 'a tortor. Nunc commodo auctor', 'elementum, dui quis accumsan', 21);
INSERT INTO pessoa VALUES (73, '12', 'gravida non,', 'amet nulla. Donec', 'velit in aliquet lobortis, nisi nibh lacinia', 72);
INSERT INTO pessoa VALUES (74, '13', 'Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies', 'Lorem ipsum dolor', 'laoreet, libero et', 184);
INSERT INTO pessoa VALUES (75, '14', 'volutpat. Nulla facilisis. Suspendisse commodo', 'Integer vitae nibh. Donec est', 'ullamcorper magna. Sed eu eros.', 7);
INSERT INTO pessoa VALUES (76, '12', 'tempor lorem, eget mollis', 'congue,', 'Nulla interdum. Curabitur dictum.', 193);
INSERT INTO pessoa VALUES (77, '13', 'Integer urna. Vivamus', 'lectus', 'felis', 83);
INSERT INTO pessoa VALUES (78, '11', 'ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem', 'Pellentesque', 'non leo. Vivamus nibh dolor, nonummy ac,', 180);
INSERT INTO pessoa VALUES (79, '11', 'faucibus orci luctus et ultrices posuere cubilia Curae; Donec', 'Aliquam ornare,', 'arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt', 138);
INSERT INTO pessoa VALUES (80, '12', 'aliquet odio.', 'gravida sit amet, dapibus id,', 'Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor,', 199);
INSERT INTO pessoa VALUES (81, '11', 'ultrices iaculis odio. Nam', 'Mauris', 'ante lectus convallis est, vitae sodales', 88);
INSERT INTO pessoa VALUES (82, '13', 'dui. Fusce aliquam, enim', 'vitae, orci. Phasellus dapibus', 'Cum sociis natoque penatibus et', 35);
INSERT INTO pessoa VALUES (83, '12', 'pellentesque a, facilisis non, bibendum', 'id risus quis', 'Nulla facilisi. Sed neque. Sed eget lacus. Mauris', 99);
INSERT INTO pessoa VALUES (84, '15', 'nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor', 'feugiat non,', 'dapibus ligula. Aliquam erat volutpat.', 23);
INSERT INTO pessoa VALUES (85, '14', 'nulla at sem molestie sodales.', 'feugiat.', 'vestibulum. Mauris magna. Duis dignissim tempor arcu.', 98);
INSERT INTO pessoa VALUES (86, '15', 'inceptos', 'faucibus', 'dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum', 137);
INSERT INTO pessoa VALUES (87, '12', 'euismod mauris eu elit. Nulla facilisi. Sed', 'et, lacinia vitae, sodales', 'egestas. Aliquam nec enim. Nunc', 43);
INSERT INTO pessoa VALUES (88, '13', 'orci quis lectus. Nullam suscipit, est', 'adipiscing elit.', 'nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor', 146);
INSERT INTO pessoa VALUES (89, '13', 'ac turpis egestas. Aliquam fringilla cursus purus.', 'sociosqu ad litora', 'vulputate, nisi sem semper erat,', 51);
INSERT INTO pessoa VALUES (90, '13', 'massa. Quisque', 'Aliquam vulputate ullamcorper magna. Sed', 'hendrerit consectetuer, cursus et, magna. Praesent', 94);
INSERT INTO pessoa VALUES (91, '11', 'a odio semper cursus. Integer mollis. Integer tincidunt', 'Fusce fermentum fermentum', 'In condimentum.', 128);
INSERT INTO pessoa VALUES (92, '14', 'enim nisl elementum purus,', 'ullamcorper, nisl arcu iaculis', 'convallis est, vitae sodales nisi', 145);
INSERT INTO pessoa VALUES (93, '11', 'mollis nec, cursus a,', 'congue. In', 'convallis', 39);
INSERT INTO pessoa VALUES (94, '12', 'nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas.', 'bibendum. Donec', 'Duis a mi fringilla mi lacinia mattis.', 122);
INSERT INTO pessoa VALUES (95, '13', 'Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu', 'scelerisque mollis. Phasellus libero', 'vel arcu eu odio tristique pharetra. Quisque ac libero', 160);
INSERT INTO pessoa VALUES (96, '11', 'placerat. Cras dictum ultricies', 'mi lacinia mattis.', 'congue a, aliquet vel, vulputate eu, odio. Phasellus at augue', 182);
INSERT INTO pessoa VALUES (97, '12', 'ornare. In faucibus. Morbi', 'a', 'Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat,', 116);
INSERT INTO pessoa VALUES (98, '15', 'ipsum nunc id enim.', 'vestibulum massa', 'scelerisque neque sed sem egestas blandit. Nam nulla', 100);
INSERT INTO pessoa VALUES (99, '13', 'semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In', 'ornare, elit elit fermentum', 'sed dictum eleifend, nunc risus varius', 193);
INSERT INTO pessoa VALUES (100, '15', 'lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras', 'arcu. Sed et libero.', 'Vestibulum ut eros non enim commodo', 57);
INSERT INTO pessoa VALUES (101, '15', 'nec ligula consectetuer rhoncus. Nullam velit dui, semper et,', 'Curae; Donec', 'eget varius ultrices, mauris ipsum porta', 110);
INSERT INTO pessoa VALUES (102, '15', 'Duis a mi fringilla mi lacinia mattis. Integer', 'felis orci, adipiscing non, luctus', 'eu tellus eu augue porttitor interdum. Sed', 6);
INSERT INTO pessoa VALUES (103, '14', 'pede nec ante blandit viverra. Donec tempus,', 'malesuada ut, sem.', 'justo', 10);
INSERT INTO pessoa VALUES (104, '11', 'semper pretium neque. Morbi quis urna. Nunc quis arcu', 'turpis.', 'nec, diam. Duis', 58);
INSERT INTO pessoa VALUES (105, '11', 'dictum ultricies ligula. Nullam enim. Sed nulla', 'Proin nisl sem, consequat nec,', 'lacus. Nulla tincidunt, neque', 35);
INSERT INTO pessoa VALUES (106, '11', 'amet ante. Vivamus', 'Nam nulla magna,', 'tellus non magna. Nam ligula elit,', 100);
INSERT INTO pessoa VALUES (107, '12', 'Cras interdum. Nunc', 'ridiculus mus. Proin', 'convallis, ante lectus convallis', 79);
INSERT INTO pessoa VALUES (108, '11', 'elit, pellentesque', 'auctor odio a', 'elementum, lorem ut aliquam iaculis, lacus pede sagittis', 116);
INSERT INTO pessoa VALUES (109, '12', 'risus varius orci, in', 'ac metus vitae velit', 'in sodales elit erat vitae risus. Duis a mi', 170);
INSERT INTO pessoa VALUES (110, '11', 'Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin', 'dolor. Fusce mi lorem, vehicula', 'malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit.', 147);
INSERT INTO pessoa VALUES (111, '12', 'sem ut cursus luctus,', 'natoque penatibus et', 'mattis ornare, lectus ante dictum mi, ac', 168);
INSERT INTO pessoa VALUES (112, '14', 'neque. Nullam nisl. Maecenas', 'Integer tincidunt', 'Cras vulputate velit', 93);
INSERT INTO pessoa VALUES (113, '14', 'nisi. Aenean eget', 'interdum enim', 'ipsum. Phasellus vitae mauris sit amet lorem semper auctor.', 24);
INSERT INTO pessoa VALUES (114, '15', 'purus sapien, gravida non, sollicitudin a,', 'blandit mattis.', 'egestas a, scelerisque sed, sapien.', 152);
INSERT INTO pessoa VALUES (115, '14', 'arcu iaculis', 'elit erat vitae', 'risus quis diam', 116);
INSERT INTO pessoa VALUES (116, '13', 'nunc. In at pede. Cras vulputate velit', 'Aliquam erat volutpat. Nulla', 'pellentesque. Sed dictum. Proin eget odio. Aliquam', 96);
INSERT INTO pessoa VALUES (117, '15', 'ipsum porta', 'Aliquam ultrices iaculis odio. Nam', 'Aenean', 178);
INSERT INTO pessoa VALUES (118, '14', 'auctor. Mauris', 'dapibus', 'sem ut dolor', 51);
INSERT INTO pessoa VALUES (119, '13', 'vel lectus. Cum', 'orci, in', 'vitae risus. Duis a mi fringilla mi lacinia mattis. Integer', 1);
INSERT INTO pessoa VALUES (120, '13', 'mus. Aenean eget magna. Suspendisse tristique neque', 'lorem, luctus ut,', 'ante dictum mi, ac mattis velit justo nec', 27);
INSERT INTO pessoa VALUES (121, '15', 'Aliquam nec enim. Nunc ut erat. Sed nunc', 'magna.', 'ante. Maecenas', 78);
INSERT INTO pessoa VALUES (122, '12', 'Proin sed', 'eleifend vitae, erat. Vivamus nisi.', 'vitae, orci. Phasellus dapibus quam', 160);
INSERT INTO pessoa VALUES (123, '14', 'sollicitudin a, malesuada id, erat. Etiam vestibulum massa', 'tempus,', 'dolor vitae dolor. Donec fringilla. Donec feugiat metus sit', 49);
INSERT INTO pessoa VALUES (124, '13', 'velit. Aliquam nisl. Nulla eu neque pellentesque massa', 'dictum ultricies ligula. Nullam', 'a nunc. In at pede. Cras vulputate', 100);
INSERT INTO pessoa VALUES (125, '12', 'Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus', 'ut', 'nunc sed libero. Proin sed', 79);
INSERT INTO pessoa VALUES (126, '14', 'vitae', 'ut eros non enim commodo', 'facilisis lorem tristique', 51);
INSERT INTO pessoa VALUES (127, '15', 'tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris', 'in lobortis tellus justo', 'tempor lorem, eget mollis lectus', 8);
INSERT INTO pessoa VALUES (128, '12', 'tincidunt congue turpis. In condimentum. Donec', 'turpis. Aliquam adipiscing lobortis risus.', 'lectus justo eu arcu. Morbi sit', 117);
INSERT INTO pessoa VALUES (129, '13', 'blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus', 'diam. Duis mi', 'nibh dolor, nonummy', 183);
INSERT INTO pessoa VALUES (130, '12', 'lorem, eget', 'Maecenas malesuada fringilla est. Mauris', 'euismod mauris eu elit. Nulla facilisi. Sed', 75);
INSERT INTO pessoa VALUES (131, '13', 'id, erat. Etiam vestibulum massa rutrum', 'Fusce', 'ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget', 67);
INSERT INTO pessoa VALUES (132, '13', 'diam dictum sapien. Aenean massa. Integer vitae nibh. Donec', 'rhoncus. Nullam velit dui,', 'per inceptos hymenaeos. Mauris ut', 159);
INSERT INTO pessoa VALUES (133, '12', 'ultricies', 'justo eu arcu.', 'luctus felis purus', 138);
INSERT INTO pessoa VALUES (134, '13', 'dis parturient montes, nascetur', 'semper rutrum. Fusce dolor quam,', 'Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi', 96);
INSERT INTO pessoa VALUES (135, '13', 'magnis dis parturient', 'ante. Vivamus non', 'pede sagittis augue, eu tempor erat neque', 123);
INSERT INTO pessoa VALUES (136, '13', 'ornare lectus justo eu arcu. Morbi sit amet massa. Quisque', 'orci sem eget massa.', 'nulla ante, iaculis nec, eleifend non,', 137);
INSERT INTO pessoa VALUES (137, '13', 'ad litora torquent per conubia nostra, per inceptos hymenaeos.', 'eleifend nec, malesuada ut, sem.', 'augue malesuada malesuada. Integer id magna et ipsum', 124);
INSERT INTO pessoa VALUES (138, '11', 'bibendum. Donec felis', 'malesuada', 'Suspendisse tristique neque venenatis lacus. Etiam bibendum', 102);
INSERT INTO pessoa VALUES (139, '15', 'Quisque purus', 'odio. Etiam ligula tortor, dictum', 'ac facilisis facilisis, magna tellus faucibus leo, in lobortis', 37);
INSERT INTO pessoa VALUES (140, '15', 'mattis ornare, lectus ante dictum mi, ac mattis velit justo', 'vitae sodales', 'Aliquam tincidunt, nunc ac mattis', 8);
INSERT INTO pessoa VALUES (141, '12', 'nunc id', 'nonummy ac, feugiat', 'eu nulla at sem molestie', 19);
INSERT INTO pessoa VALUES (142, '14', 'quam vel sapien imperdiet ornare. In faucibus.', 'Cras lorem lorem, luctus', 'velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat,', 22);
INSERT INTO pessoa VALUES (143, '11', 'egestas. Aliquam nec', 'vitae dolor. Donec fringilla. Donec', 'vitae, orci. Phasellus dapibus quam quis diam. Pellentesque', 192);
INSERT INTO pessoa VALUES (144, '14', 'Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede,', 'dui', 'erat. Sed', 164);
INSERT INTO pessoa VALUES (145, '12', 'Sed', 'orci. Ut', 'ultricies dignissim lacus. Aliquam rutrum lorem', 31);
INSERT INTO pessoa VALUES (146, '11', 'et, euismod et, commodo at, libero. Morbi', 'dapibus rutrum,', 'In ornare', 129);
INSERT INTO pessoa VALUES (147, '13', 'sociis natoque penatibus et magnis dis', 'molestie pharetra nibh.', 'aliquet molestie tellus. Aenean egestas hendrerit', 178);
INSERT INTO pessoa VALUES (148, '13', 'Suspendisse dui. Fusce diam nunc, ullamcorper eu,', 'elit', 'tempor', 24);
INSERT INTO pessoa VALUES (149, '11', 'erat volutpat. Nulla', 'luctus et ultrices', 'ullamcorper, velit in aliquet lobortis, nisi nibh lacinia', 173);
INSERT INTO pessoa VALUES (150, '12', 'amet diam eu dolor egestas rhoncus.', 'congue. In scelerisque scelerisque dui.', 'Sed eu nibh vulputate mauris sagittis placerat. Cras', 30);
INSERT INTO pessoa VALUES (151, '12', 'Curabitur', 'pede, malesuada vel,', 'In ornare', 38);
INSERT INTO pessoa VALUES (152, '15', 'mauris eu elit. Nulla facilisi.', 'ac tellus. Suspendisse sed', 'tristique', 114);
INSERT INTO pessoa VALUES (153, '12', 'ullamcorper magna.', 'metus. Aliquam erat volutpat. Nulla', 'quam. Pellentesque habitant morbi tristique senectus et netus et', 44);
INSERT INTO pessoa VALUES (154, '13', 'pellentesque.', 'purus', 'eu arcu. Morbi sit amet massa. Quisque', 25);
INSERT INTO pessoa VALUES (155, '14', 'pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum.', 'semper. Nam', 'gravida sit amet,', 195);
INSERT INTO pessoa VALUES (156, '14', 'convallis erat, eget tincidunt dui augue eu tellus.', 'tortor,', 'dignissim pharetra. Nam ac', 7);
INSERT INTO pessoa VALUES (157, '13', 'rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede', 'nascetur ridiculus mus.', 'malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer', 13);
INSERT INTO pessoa VALUES (158, '15', 'Sed eget lacus. Mauris non dui nec urna', 'feugiat placerat velit. Quisque', 'Quisque libero lacus, varius et, euismod', 16);
INSERT INTO pessoa VALUES (159, '13', 'malesuada augue ut lacus. Nulla tincidunt, neque', 'Pellentesque ut ipsum ac', 'Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam', 94);
INSERT INTO pessoa VALUES (160, '14', 'aliquet, metus urna', 'amet nulla. Donec', 'orci, adipiscing non, luctus', 29);
INSERT INTO pessoa VALUES (161, '11', 'mauris blandit mattis. Cras eget', 'consectetuer rhoncus. Nullam velit dui,', 'vulputate, risus', 61);
INSERT INTO pessoa VALUES (162, '15', 'aliquet', 'bibendum ullamcorper.', 'Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada', 21);
INSERT INTO pessoa VALUES (163, '13', 'condimentum. Donec at arcu. Vestibulum ante ipsum primis', 'est. Nunc', 'convallis in, cursus et,', 67);
INSERT INTO pessoa VALUES (164, '13', 'scelerisque scelerisque dui. Suspendisse ac', 'ut', 'pharetra nibh.', 198);
INSERT INTO pessoa VALUES (165, '14', 'mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat', 'convallis dolor. Quisque tincidunt pede', 'enim, sit amet ornare lectus justo eu', 191);
INSERT INTO pessoa VALUES (166, '14', 'Class aptent taciti sociosqu', 'dis parturient', 'urna, nec luctus felis purus ac tellus.', 181);
INSERT INTO pessoa VALUES (167, '13', 'Morbi sit amet', 'eleifend', 'ante lectus', 16);
INSERT INTO pessoa VALUES (168, '14', 'Fusce fermentum fermentum', 'Nullam nisl. Maecenas', 'porttitor interdum. Sed auctor odio a', 9);
INSERT INTO pessoa VALUES (169, '12', 'elementum at, egestas', 'commodo ipsum.', 'parturient montes, nascetur ridiculus', 145);
INSERT INTO pessoa VALUES (170, '14', 'ullamcorper magna. Sed eu eros. Nam', 'sit', 'justo nec ante. Maecenas mi felis, adipiscing', 134);
INSERT INTO pessoa VALUES (171, '15', 'mi lacinia mattis.', 'ut lacus.', 'odio a purus.', 10);
INSERT INTO pessoa VALUES (172, '13', 'Cum sociis natoque penatibus et magnis dis', 'in felis. Nulla tempor augue', 'euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur', 109);
INSERT INTO pessoa VALUES (173, '12', 'ornare tortor at risus. Nunc ac sem ut dolor dapibus', 'In', 'commodo at, libero.', 195);
INSERT INTO pessoa VALUES (174, '15', 'adipiscing', 'tellus.', 'dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue,', 92);
INSERT INTO pessoa VALUES (175, '11', 'Donec elementum, lorem ut aliquam iaculis,', 'ultricies ornare, elit', 'aliquet, metus urna', 55);
INSERT INTO pessoa VALUES (176, '15', 'amet ante.', 'dui.', 'consectetuer', 69);
INSERT INTO pessoa VALUES (177, '15', 'sit amet, dapibus id, blandit at, nisi.', 'volutpat. Nulla', 'nonummy ut, molestie in, tempus', 143);
INSERT INTO pessoa VALUES (178, '13', 'libero et tristique', 'aliquet,', 'sed dolor. Fusce mi lorem, vehicula', 64);
INSERT INTO pessoa VALUES (179, '11', 'mi tempor lorem, eget', 'consectetuer mauris id sapien. Cras', 'vitae purus gravida sagittis. Duis gravida.', 122);
INSERT INTO pessoa VALUES (180, '14', 'lorem tristique aliquet.', 'lectus pede, ultrices a,', 'In nec orci. Donec nibh.', 54);
INSERT INTO pessoa VALUES (181, '11', 'purus ac tellus. Suspendisse sed dolor. Fusce', 'et arcu imperdiet ullamcorper. Duis', 'ridiculus mus. Donec dignissim magna a tortor. Nunc', 86);
INSERT INTO pessoa VALUES (182, '15', 'scelerisque, lorem ipsum sodales purus,', 'adipiscing', 'urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim.', 18);
INSERT INTO pessoa VALUES (183, '12', 'mi. Duis risus', 'id nunc interdum feugiat. Sed', 'mauris blandit', 81);
INSERT INTO pessoa VALUES (184, '13', 'non enim. Mauris quis', 'in sodales elit erat', 'Lorem ipsum dolor', 179);
INSERT INTO pessoa VALUES (185, '15', 'Nam nulla magna, malesuada vel,', 'ac ipsum. Phasellus vitae mauris', 'adipiscing. Mauris molestie pharetra nibh. Aliquam', 22);
INSERT INTO pessoa VALUES (186, '11', 'enim consequat purus. Maecenas libero est, congue a,', 'tincidunt.', 'Aliquam vulputate ullamcorper magna. Sed eu', 10);
INSERT INTO pessoa VALUES (187, '15', 'enim', 'eget lacus. Mauris', 'mi. Duis risus odio, auctor vitae,', 126);
INSERT INTO pessoa VALUES (188, '15', 'ultricies dignissim', 'nisi. Mauris nulla. Integer', 'mattis. Cras eget nisi', 44);
INSERT INTO pessoa VALUES (189, '15', 'a odio semper cursus. Integer', 'Sed', 'Donec fringilla. Donec feugiat', 198);
INSERT INTO pessoa VALUES (190, '11', 'Quisque purus sapien,', 'lorem eu metus. In lorem.', 'luctus vulputate,', 128);
INSERT INTO pessoa VALUES (191, '12', 'nonummy ut, molestie in, tempus eu, ligula. Aenean euismod', 'Donec felis orci,', 'morbi tristique', 63);
INSERT INTO pessoa VALUES (192, '12', 'auctor vitae, aliquet nec, imperdiet', 'lacinia. Sed congue, elit', 'commodo at, libero. Morbi accumsan laoreet', 114);
INSERT INTO pessoa VALUES (193, '15', 'ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et,', 'arcu eu odio tristique pharetra.', 'libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus', 92);
INSERT INTO pessoa VALUES (194, '15', 'auctor non, feugiat nec, diam. Duis mi enim, condimentum eget,', 'pulvinar arcu et pede. Nunc', 'dui. Fusce aliquam,', 53);
INSERT INTO pessoa VALUES (195, '11', 'pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec', 'egestas. Aliquam fringilla', 'malesuada vel, convallis in, cursus et, eros. Proin', 33);
INSERT INTO pessoa VALUES (196, '11', 'lorem ut aliquam iaculis, lacus pede sagittis augue, eu', 'Mauris nulla. Integer urna. Vivamus', 'molestie tellus. Aenean egestas hendrerit neque. In ornare', 64);
INSERT INTO pessoa VALUES (197, '14', 'Phasellus', 'tortor,', 'tellus. Suspendisse', 155);
INSERT INTO pessoa VALUES (198, '11', 'magna tellus faucibus leo, in lobortis tellus justo sit', 'rutrum', 'risus.', 27);
INSERT INTO pessoa VALUES (199, '14', 'Nunc', 'nonummy ultricies ornare,', 'Nullam vitae diam. Proin dolor. Nulla', 196);
INSERT INTO pessoa VALUES (200, '12', 'pede et risus. Quisque libero lacus, varius', 'Quisque ac libero nec', 'nisi. Aenean eget metus.', 10);


--
-- TOC entry 2237 (class 0 OID 66200)
-- Dependencies: 194
-- Data for Name: subarea; Type: TABLE DATA; Schema: teste; Owner: postgres
--

INSERT INTO subarea VALUES (1, 'risus odio,');
INSERT INTO subarea VALUES (2, 'et ultrices posuere cubilia');
INSERT INTO subarea VALUES (3, 'consectetuer mauris');
INSERT INTO subarea VALUES (4, 'volutpat.');
INSERT INTO subarea VALUES (5, 'Aliquam erat');
INSERT INTO subarea VALUES (6, 'convallis');
INSERT INTO subarea VALUES (7, 'rhoncus.');
INSERT INTO subarea VALUES (8, 'nisi');
INSERT INTO subarea VALUES (9, 'tortor at risus. Nunc');
INSERT INTO subarea VALUES (10, 'iaculis quis, pede.');
INSERT INTO subarea VALUES (11, 'erat eget');
INSERT INTO subarea VALUES (12, 'dui, in sodales elit');
INSERT INTO subarea VALUES (13, 'Cum');
INSERT INTO subarea VALUES (14, 'tellus non magna. Nam');
INSERT INTO subarea VALUES (15, 'dolor sit');
INSERT INTO subarea VALUES (16, 'a');
INSERT INTO subarea VALUES (17, 'Aliquam gravida mauris ut');
INSERT INTO subarea VALUES (18, 'nostra, per inceptos hymenaeos.');
INSERT INTO subarea VALUES (19, 'nulla at sem');
INSERT INTO subarea VALUES (20, 'morbi');
INSERT INTO subarea VALUES (21, 'enim consequat purus.');
INSERT INTO subarea VALUES (22, 'euismod est arcu');
INSERT INTO subarea VALUES (23, 'scelerisque scelerisque dui.');
INSERT INTO subarea VALUES (24, 'non,');
INSERT INTO subarea VALUES (25, 'sit amet, consectetuer');
INSERT INTO subarea VALUES (26, 'eu,');
INSERT INTO subarea VALUES (27, 'Nulla eget metus');
INSERT INTO subarea VALUES (28, 'quis lectus. Nullam suscipit,');
INSERT INTO subarea VALUES (29, 'lacinia orci,');
INSERT INTO subarea VALUES (30, 'elit.');
INSERT INTO subarea VALUES (31, 'posuere at, velit.');
INSERT INTO subarea VALUES (32, 'ridiculus mus.');
INSERT INTO subarea VALUES (33, 'Nam');
INSERT INTO subarea VALUES (34, 'vulputate velit eu sem.');
INSERT INTO subarea VALUES (35, 'accumsan sed, facilisis');
INSERT INTO subarea VALUES (36, 'metus. In nec orci.');
INSERT INTO subarea VALUES (37, 'vestibulum.');
INSERT INTO subarea VALUES (38, 'in faucibus orci luctus');
INSERT INTO subarea VALUES (39, 'Sed et');
INSERT INTO subarea VALUES (40, 'pharetra');
INSERT INTO subarea VALUES (41, 'Nulla facilisi. Sed');
INSERT INTO subarea VALUES (42, 'pharetra');
INSERT INTO subarea VALUES (43, 'vel,');
INSERT INTO subarea VALUES (44, 'leo, in lobortis tellus');
INSERT INTO subarea VALUES (45, 'accumsan sed, facilisis');
INSERT INTO subarea VALUES (46, 'risus quis');
INSERT INTO subarea VALUES (47, 'Nam nulla');
INSERT INTO subarea VALUES (48, 'at, nisi. Cum sociis');
INSERT INTO subarea VALUES (49, 'eleifend');
INSERT INTO subarea VALUES (50, 'risus. Duis');
INSERT INTO subarea VALUES (51, 'Sem evento');


--
-- TOC entry 2238 (class 0 OID 66203)
-- Dependencies: 195
-- Data for Name: tipoatividade; Type: TABLE DATA; Schema: teste; Owner: postgres
--

INSERT INTO tipoatividade VALUES (1, 'Proin dolor. Nulla');
INSERT INTO tipoatividade VALUES (2, 'at, egestas');
INSERT INTO tipoatividade VALUES (3, 'Suspendisse non leo. Vivamus');
INSERT INTO tipoatividade VALUES (4, 'Mauris ut quam vel');
INSERT INTO tipoatividade VALUES (5, 'cursus a, enim. Suspendisse');
INSERT INTO tipoatividade VALUES (6, 'eget, venenatis a, magna.');
INSERT INTO tipoatividade VALUES (7, 'facilisis, magna tellus');
INSERT INTO tipoatividade VALUES (8, 'in faucibus orci');
INSERT INTO tipoatividade VALUES (9, 'elit erat vitae risus.');
INSERT INTO tipoatividade VALUES (10, 'urna. Vivamus');
INSERT INTO tipoatividade VALUES (11, 'elit, pretium');
INSERT INTO tipoatividade VALUES (12, 'Nulla');
INSERT INTO tipoatividade VALUES (13, 'et risus. Quisque libero');
INSERT INTO tipoatividade VALUES (14, 'purus mauris');
INSERT INTO tipoatividade VALUES (15, 'elit');
INSERT INTO tipoatividade VALUES (16, 'montes, nascetur ridiculus');
INSERT INTO tipoatividade VALUES (17, 'ut cursus');
INSERT INTO tipoatividade VALUES (18, 'dictum. Phasellus in');
INSERT INTO tipoatividade VALUES (19, 'Donec');
INSERT INTO tipoatividade VALUES (20, 'Fusce aliquet');
INSERT INTO tipoatividade VALUES (21, 'auctor ullamcorper, nisl');
INSERT INTO tipoatividade VALUES (22, 'nisl. Maecenas malesuada fringilla');
INSERT INTO tipoatividade VALUES (23, 'vulputate mauris sagittis placerat.');
INSERT INTO tipoatividade VALUES (24, 'Sed');
INSERT INTO tipoatividade VALUES (25, 'Donec non');
INSERT INTO tipoatividade VALUES (26, 'auctor');
INSERT INTO tipoatividade VALUES (27, 'enim');
INSERT INTO tipoatividade VALUES (28, 'Nunc sollicitudin commodo');
INSERT INTO tipoatividade VALUES (29, 'semper');
INSERT INTO tipoatividade VALUES (30, 'a, enim. Suspendisse aliquet,');
INSERT INTO tipoatividade VALUES (31, 'Fusce mi lorem,');
INSERT INTO tipoatividade VALUES (32, 'pede. Nunc sed orci');
INSERT INTO tipoatividade VALUES (33, 'mauris. Suspendisse aliquet');
INSERT INTO tipoatividade VALUES (34, 'scelerisque');
INSERT INTO tipoatividade VALUES (35, 'Aliquam nisl. Nulla eu');
INSERT INTO tipoatividade VALUES (36, 'eu dui. Cum sociis');
INSERT INTO tipoatividade VALUES (37, 'metus. Aenean sed pede');
INSERT INTO tipoatividade VALUES (38, 'commodo');
INSERT INTO tipoatividade VALUES (39, 'sem,');
INSERT INTO tipoatividade VALUES (40, 'montes, nascetur ridiculus');
INSERT INTO tipoatividade VALUES (41, 'scelerisque scelerisque dui. Suspendisse');
INSERT INTO tipoatividade VALUES (42, 'leo.');
INSERT INTO tipoatividade VALUES (43, 'Phasellus fermentum convallis ligula.');
INSERT INTO tipoatividade VALUES (44, 'hendrerit a, arcu. Sed');
INSERT INTO tipoatividade VALUES (45, 'tempus non, lacinia at,');
INSERT INTO tipoatividade VALUES (46, 'enim');
INSERT INTO tipoatividade VALUES (47, 'amet');
INSERT INTO tipoatividade VALUES (48, 'laoreet, libero et');
INSERT INTO tipoatividade VALUES (49, 'vulputate dui,');
INSERT INTO tipoatividade VALUES (50, 'urna. Vivamus molestie');
INSERT INTO tipoatividade VALUES (51, 'Quisque ac');
INSERT INTO tipoatividade VALUES (52, 'est.');
INSERT INTO tipoatividade VALUES (53, 'orci lobortis augue scelerisque');
INSERT INTO tipoatividade VALUES (54, 'Phasellus in');
INSERT INTO tipoatividade VALUES (55, 'Aliquam');
INSERT INTO tipoatividade VALUES (56, 'fermentum vel, mauris.');
INSERT INTO tipoatividade VALUES (57, 'ac sem ut');
INSERT INTO tipoatividade VALUES (58, 'non enim commodo hendrerit.');
INSERT INTO tipoatividade VALUES (59, 'elit. Etiam laoreet,');
INSERT INTO tipoatividade VALUES (60, 'purus ac tellus.');
INSERT INTO tipoatividade VALUES (61, 'Cum sociis');
INSERT INTO tipoatividade VALUES (62, 'vestibulum. Mauris magna. Duis');
INSERT INTO tipoatividade VALUES (63, 'molestie tellus. Aenean');
INSERT INTO tipoatividade VALUES (64, 'dictum mi,');
INSERT INTO tipoatividade VALUES (65, 'vulputate,');
INSERT INTO tipoatividade VALUES (66, 'sociis natoque');
INSERT INTO tipoatividade VALUES (67, 'eget,');
INSERT INTO tipoatividade VALUES (68, 'elit.');
INSERT INTO tipoatividade VALUES (69, 'tincidunt, neque');
INSERT INTO tipoatividade VALUES (70, 'dignissim tempor');
INSERT INTO tipoatividade VALUES (71, 'pellentesque. Sed');
INSERT INTO tipoatividade VALUES (72, 'feugiat. Lorem ipsum');
INSERT INTO tipoatividade VALUES (73, 'Nunc');
INSERT INTO tipoatividade VALUES (74, 'tincidunt congue turpis.');
INSERT INTO tipoatividade VALUES (75, 'nibh.');
INSERT INTO tipoatividade VALUES (76, 'tempus');
INSERT INTO tipoatividade VALUES (77, 'Nulla interdum. Curabitur');
INSERT INTO tipoatividade VALUES (78, 'arcu.');
INSERT INTO tipoatividade VALUES (79, 'turpis nec mauris');
INSERT INTO tipoatividade VALUES (80, 'erat,');
INSERT INTO tipoatividade VALUES (81, 'risus. Donec');
INSERT INTO tipoatividade VALUES (82, 'montes, nascetur ridiculus');
INSERT INTO tipoatividade VALUES (83, 'nascetur ridiculus mus. Donec');
INSERT INTO tipoatividade VALUES (84, 'augue ac ipsum. Phasellus');
INSERT INTO tipoatividade VALUES (85, 'litora');
INSERT INTO tipoatividade VALUES (86, 'a sollicitudin orci sem');
INSERT INTO tipoatividade VALUES (87, 'mauris. Morbi');
INSERT INTO tipoatividade VALUES (88, 'vitae semper');
INSERT INTO tipoatividade VALUES (89, 'quis, pede. Suspendisse');
INSERT INTO tipoatividade VALUES (90, 'sem');
INSERT INTO tipoatividade VALUES (91, 'Nullam');
INSERT INTO tipoatividade VALUES (92, 'dictum eu, placerat');
INSERT INTO tipoatividade VALUES (93, 'mauris erat eget');
INSERT INTO tipoatividade VALUES (94, 'lorem');
INSERT INTO tipoatividade VALUES (95, 'conubia nostra,');
INSERT INTO tipoatividade VALUES (96, 'In');
INSERT INTO tipoatividade VALUES (97, 'ridiculus mus. Donec dignissim');
INSERT INTO tipoatividade VALUES (98, 'ac facilisis');
INSERT INTO tipoatividade VALUES (99, 'luctus ut,');
INSERT INTO tipoatividade VALUES (100, 'nulla. Cras eu tellus');
INSERT INTO tipoatividade VALUES (101, 'sed libero. Proin');
INSERT INTO tipoatividade VALUES (102, 'enim mi tempor lorem,');
INSERT INTO tipoatividade VALUES (103, 'dictum placerat, augue. Sed');
INSERT INTO tipoatividade VALUES (104, 'ligula. Nullam');
INSERT INTO tipoatividade VALUES (105, 'massa.');
INSERT INTO tipoatividade VALUES (106, 'posuere at,');
INSERT INTO tipoatividade VALUES (107, 'urna et arcu imperdiet');
INSERT INTO tipoatividade VALUES (108, 'ac');
INSERT INTO tipoatividade VALUES (109, 'tincidunt aliquam arcu. Aliquam');
INSERT INTO tipoatividade VALUES (110, 'aliquet magna');
INSERT INTO tipoatividade VALUES (111, 'et, rutrum');
INSERT INTO tipoatividade VALUES (112, 'Sed eu eros. Nam');
INSERT INTO tipoatividade VALUES (113, 'lorem semper');
INSERT INTO tipoatividade VALUES (114, 'pede, malesuada vel,');
INSERT INTO tipoatividade VALUES (115, 'amet, risus.');
INSERT INTO tipoatividade VALUES (116, 'mauris.');
INSERT INTO tipoatividade VALUES (117, 'vulputate,');
INSERT INTO tipoatividade VALUES (118, 'mollis lectus pede et');
INSERT INTO tipoatividade VALUES (119, 'odio');
INSERT INTO tipoatividade VALUES (120, 'malesuada fringilla');
INSERT INTO tipoatividade VALUES (121, 'vulputate, risus a');
INSERT INTO tipoatividade VALUES (122, 'auctor ullamcorper, nisl');
INSERT INTO tipoatividade VALUES (123, 'metus. Aenean sed pede');
INSERT INTO tipoatividade VALUES (124, 'venenatis lacus. Etiam');
INSERT INTO tipoatividade VALUES (125, 'Nunc sed orci');
INSERT INTO tipoatividade VALUES (126, 'odio. Nam interdum');
INSERT INTO tipoatividade VALUES (127, 'placerat. Cras dictum');
INSERT INTO tipoatividade VALUES (128, 'mollis');
INSERT INTO tipoatividade VALUES (129, 'at risus. Nunc');
INSERT INTO tipoatividade VALUES (130, 'dictum cursus. Nunc');
INSERT INTO tipoatividade VALUES (131, 'enim. Etiam');
INSERT INTO tipoatividade VALUES (132, 'aliquet');
INSERT INTO tipoatividade VALUES (133, 'leo. Morbi neque');
INSERT INTO tipoatividade VALUES (134, 'vel quam');
INSERT INTO tipoatividade VALUES (135, 'vitae');
INSERT INTO tipoatividade VALUES (136, 'nascetur');
INSERT INTO tipoatividade VALUES (137, 'dui. Suspendisse ac');
INSERT INTO tipoatividade VALUES (138, 'arcu. Vestibulum ut eros');
INSERT INTO tipoatividade VALUES (139, 'amet, dapibus');
INSERT INTO tipoatividade VALUES (140, 'mauris,');
INSERT INTO tipoatividade VALUES (141, 'feugiat non, lobortis');
INSERT INTO tipoatividade VALUES (142, 'sem.');
INSERT INTO tipoatividade VALUES (143, 'bibendum sed,');
INSERT INTO tipoatividade VALUES (144, 'eget');
INSERT INTO tipoatividade VALUES (145, 'hendrerit consectetuer,');
INSERT INTO tipoatividade VALUES (146, 'Sed nec');
INSERT INTO tipoatividade VALUES (147, 'Sed');
INSERT INTO tipoatividade VALUES (148, 'orci,');
INSERT INTO tipoatividade VALUES (149, 'aliquet, metus urna');
INSERT INTO tipoatividade VALUES (150, 'aliquet, metus');
INSERT INTO tipoatividade VALUES (151, 'ridiculus mus.');
INSERT INTO tipoatividade VALUES (152, 'orci. Donec');
INSERT INTO tipoatividade VALUES (153, 'in, tempus');
INSERT INTO tipoatividade VALUES (154, 'lorem fringilla ornare');
INSERT INTO tipoatividade VALUES (155, 'vulputate, risus a');
INSERT INTO tipoatividade VALUES (156, 'Duis ac arcu. Nunc');
INSERT INTO tipoatividade VALUES (157, 'dolor. Quisque tincidunt pede');
INSERT INTO tipoatividade VALUES (158, 'mi enim,');
INSERT INTO tipoatividade VALUES (159, 'dictum ultricies');
INSERT INTO tipoatividade VALUES (160, 'pellentesque, tellus sem');
INSERT INTO tipoatividade VALUES (161, 'nunc');
INSERT INTO tipoatividade VALUES (162, 'lectus justo eu');
INSERT INTO tipoatividade VALUES (163, 'Quisque imperdiet,');
INSERT INTO tipoatividade VALUES (164, 'hendrerit');
INSERT INTO tipoatividade VALUES (165, 'magna. Phasellus');
INSERT INTO tipoatividade VALUES (166, 'Donec elementum, lorem');
INSERT INTO tipoatividade VALUES (167, 'habitant morbi tristique senectus');
INSERT INTO tipoatividade VALUES (168, 'nonummy ut, molestie in,');
INSERT INTO tipoatividade VALUES (169, 'in,');
INSERT INTO tipoatividade VALUES (170, 'luctus aliquet odio. Etiam');
INSERT INTO tipoatividade VALUES (171, 'Curabitur vel');
INSERT INTO tipoatividade VALUES (172, 'iaculis');
INSERT INTO tipoatividade VALUES (173, 'penatibus et magnis');
INSERT INTO tipoatividade VALUES (174, 'sem, vitae aliquam');
INSERT INTO tipoatividade VALUES (175, 'massa.');
INSERT INTO tipoatividade VALUES (176, 'at augue id ante');
INSERT INTO tipoatividade VALUES (177, 'felis');
INSERT INTO tipoatividade VALUES (178, 'amet, dapibus');
INSERT INTO tipoatividade VALUES (179, 'in molestie');
INSERT INTO tipoatividade VALUES (180, 'Donec at');
INSERT INTO tipoatividade VALUES (181, 'sed, facilisis vitae, orci.');
INSERT INTO tipoatividade VALUES (182, 'In lorem. Donec');
INSERT INTO tipoatividade VALUES (183, 'Aenean egestas hendrerit neque.');
INSERT INTO tipoatividade VALUES (184, 'Integer');
INSERT INTO tipoatividade VALUES (185, 'massa.');
INSERT INTO tipoatividade VALUES (186, 'sagittis placerat. Cras');
INSERT INTO tipoatividade VALUES (187, 'adipiscing elit. Etiam');
INSERT INTO tipoatividade VALUES (188, 'orci tincidunt adipiscing. Mauris');
INSERT INTO tipoatividade VALUES (189, 'consequat enim');
INSERT INTO tipoatividade VALUES (190, 'a felis');
INSERT INTO tipoatividade VALUES (191, 'erat volutpat. Nulla');
INSERT INTO tipoatividade VALUES (192, 'vel, faucibus id,');
INSERT INTO tipoatividade VALUES (193, 'Ut nec urna et');
INSERT INTO tipoatividade VALUES (194, 'at');
INSERT INTO tipoatividade VALUES (195, 'pretium aliquet,');
INSERT INTO tipoatividade VALUES (196, 'ligula. Aliquam erat volutpat.');
INSERT INTO tipoatividade VALUES (197, 'a purus. Duis');
INSERT INTO tipoatividade VALUES (198, 'pretium');
INSERT INTO tipoatividade VALUES (199, 'pellentesque eget, dictum placerat,');
INSERT INTO tipoatividade VALUES (200, 'imperdiet ullamcorper. Duis');


--
-- TOC entry 2239 (class 0 OID 66206)
-- Dependencies: 196
-- Data for Name: topeve; Type: TABLE DATA; Schema: teste; Owner: postgres
--

INSERT INTO topeve VALUES (153, 33);
INSERT INTO topeve VALUES (37, 22);
INSERT INTO topeve VALUES (183, 3);
INSERT INTO topeve VALUES (115, 47);
INSERT INTO topeve VALUES (75, 28);
INSERT INTO topeve VALUES (128, 14);
INSERT INTO topeve VALUES (82, 24);
INSERT INTO topeve VALUES (198, 26);
INSERT INTO topeve VALUES (110, 18);
INSERT INTO topeve VALUES (195, 21);
INSERT INTO topeve VALUES (83, 23);
INSERT INTO topeve VALUES (135, 2);
INSERT INTO topeve VALUES (82, 43);
INSERT INTO topeve VALUES (139, 3);
INSERT INTO topeve VALUES (140, 23);
INSERT INTO topeve VALUES (142, 45);
INSERT INTO topeve VALUES (177, 31);
INSERT INTO topeve VALUES (187, 23);
INSERT INTO topeve VALUES (112, 16);
INSERT INTO topeve VALUES (1, 12);
INSERT INTO topeve VALUES (187, 33);
INSERT INTO topeve VALUES (97, 18);
INSERT INTO topeve VALUES (38, 3);
INSERT INTO topeve VALUES (126, 33);
INSERT INTO topeve VALUES (73, 37);
INSERT INTO topeve VALUES (31, 32);
INSERT INTO topeve VALUES (175, 43);
INSERT INTO topeve VALUES (139, 36);
INSERT INTO topeve VALUES (134, 46);
INSERT INTO topeve VALUES (183, 49);
INSERT INTO topeve VALUES (178, 28);
INSERT INTO topeve VALUES (80, 14);
INSERT INTO topeve VALUES (88, 7);
INSERT INTO topeve VALUES (13, 44);
INSERT INTO topeve VALUES (104, 24);
INSERT INTO topeve VALUES (8, 7);
INSERT INTO topeve VALUES (97, 22);
INSERT INTO topeve VALUES (5, 34);
INSERT INTO topeve VALUES (98, 33);
INSERT INTO topeve VALUES (66, 43);
INSERT INTO topeve VALUES (75, 24);
INSERT INTO topeve VALUES (98, 13);
INSERT INTO topeve VALUES (67, 10);
INSERT INTO topeve VALUES (193, 1);
INSERT INTO topeve VALUES (19, 44);
INSERT INTO topeve VALUES (197, 50);
INSERT INTO topeve VALUES (83, 19);
INSERT INTO topeve VALUES (50, 43);
INSERT INTO topeve VALUES (102, 16);
INSERT INTO topeve VALUES (145, 2);
INSERT INTO topeve VALUES (42, 5);
INSERT INTO topeve VALUES (21, 16);
INSERT INTO topeve VALUES (72, 5);
INSERT INTO topeve VALUES (37, 8);
INSERT INTO topeve VALUES (159, 44);
INSERT INTO topeve VALUES (6, 19);
INSERT INTO topeve VALUES (198, 14);
INSERT INTO topeve VALUES (123, 43);
INSERT INTO topeve VALUES (172, 1);
INSERT INTO topeve VALUES (93, 30);
INSERT INTO topeve VALUES (3, 21);
INSERT INTO topeve VALUES (79, 29);
INSERT INTO topeve VALUES (189, 13);
INSERT INTO topeve VALUES (25, 17);
INSERT INTO topeve VALUES (13, 9);
INSERT INTO topeve VALUES (181, 14);
INSERT INTO topeve VALUES (53, 1);
INSERT INTO topeve VALUES (115, 32);
INSERT INTO topeve VALUES (20, 38);
INSERT INTO topeve VALUES (155, 45);
INSERT INTO topeve VALUES (126, 40);
INSERT INTO topeve VALUES (53, 31);
INSERT INTO topeve VALUES (15, 44);
INSERT INTO topeve VALUES (94, 47);
INSERT INTO topeve VALUES (180, 47);
INSERT INTO topeve VALUES (107, 46);
INSERT INTO topeve VALUES (70, 47);
INSERT INTO topeve VALUES (97, 15);
INSERT INTO topeve VALUES (37, 31);
INSERT INTO topeve VALUES (124, 13);
INSERT INTO topeve VALUES (157, 26);
INSERT INTO topeve VALUES (103, 3);
INSERT INTO topeve VALUES (106, 5);
INSERT INTO topeve VALUES (133, 32);
INSERT INTO topeve VALUES (168, 22);
INSERT INTO topeve VALUES (102, 24);
INSERT INTO topeve VALUES (48, 39);
INSERT INTO topeve VALUES (18, 16);
INSERT INTO topeve VALUES (130, 28);
INSERT INTO topeve VALUES (49, 28);
INSERT INTO topeve VALUES (97, 39);
INSERT INTO topeve VALUES (90, 42);
INSERT INTO topeve VALUES (140, 47);
INSERT INTO topeve VALUES (24, 44);
INSERT INTO topeve VALUES (107, 37);
INSERT INTO topeve VALUES (25, 16);
INSERT INTO topeve VALUES (51, 32);
INSERT INTO topeve VALUES (72, 40);
INSERT INTO topeve VALUES (144, 2);
INSERT INTO topeve VALUES (81, 28);
INSERT INTO topeve VALUES (93, 46);
INSERT INTO topeve VALUES (5, 35);
INSERT INTO topeve VALUES (137, 6);
INSERT INTO topeve VALUES (3, 17);
INSERT INTO topeve VALUES (133, 13);
INSERT INTO topeve VALUES (175, 8);
INSERT INTO topeve VALUES (6, 16);
INSERT INTO topeve VALUES (195, 37);
INSERT INTO topeve VALUES (51, 5);
INSERT INTO topeve VALUES (121, 40);
INSERT INTO topeve VALUES (166, 37);
INSERT INTO topeve VALUES (21, 5);
INSERT INTO topeve VALUES (72, 24);
INSERT INTO topeve VALUES (173, 4);
INSERT INTO topeve VALUES (98, 14);
INSERT INTO topeve VALUES (126, 48);
INSERT INTO topeve VALUES (35, 33);
INSERT INTO topeve VALUES (130, 43);
INSERT INTO topeve VALUES (22, 24);
INSERT INTO topeve VALUES (171, 33);
INSERT INTO topeve VALUES (162, 42);
INSERT INTO topeve VALUES (12, 12);
INSERT INTO topeve VALUES (57, 37);
INSERT INTO topeve VALUES (52, 35);
INSERT INTO topeve VALUES (115, 48);
INSERT INTO topeve VALUES (149, 14);
INSERT INTO topeve VALUES (81, 23);
INSERT INTO topeve VALUES (31, 15);
INSERT INTO topeve VALUES (14, 5);
INSERT INTO topeve VALUES (149, 32);
INSERT INTO topeve VALUES (80, 38);
INSERT INTO topeve VALUES (170, 17);
INSERT INTO topeve VALUES (78, 17);
INSERT INTO topeve VALUES (134, 25);
INSERT INTO topeve VALUES (160, 27);
INSERT INTO topeve VALUES (30, 31);
INSERT INTO topeve VALUES (70, 11);
INSERT INTO topeve VALUES (166, 32);
INSERT INTO topeve VALUES (188, 5);
INSERT INTO topeve VALUES (64, 26);
INSERT INTO topeve VALUES (8, 4);
INSERT INTO topeve VALUES (157, 23);


--
-- TOC entry 2240 (class 0 OID 66209)
-- Dependencies: 197
-- Data for Name: topico; Type: TABLE DATA; Schema: teste; Owner: postgres
--

INSERT INTO topico VALUES (1, 'Nulla facilisi. Sed neque.');
INSERT INTO topico VALUES (2, 'egestas. Aliquam nec enim.');
INSERT INTO topico VALUES (3, 'et magnis dis parturient');
INSERT INTO topico VALUES (4, 'tincidunt aliquam arcu. Aliquam');
INSERT INTO topico VALUES (5, 'leo. Morbi neque');
INSERT INTO topico VALUES (6, 'turpis.');
INSERT INTO topico VALUES (7, 'eu,');
INSERT INTO topico VALUES (8, 'arcu. Curabitur ut');
INSERT INTO topico VALUES (9, 'Duis dignissim tempor arcu.');
INSERT INTO topico VALUES (10, 'tellus.');
INSERT INTO topico VALUES (11, 'eleifend, nunc risus');
INSERT INTO topico VALUES (12, 'dapibus gravida. Aliquam');
INSERT INTO topico VALUES (13, 'et magnis');
INSERT INTO topico VALUES (14, 'ante, iaculis');
INSERT INTO topico VALUES (15, 'Phasellus fermentum');
INSERT INTO topico VALUES (16, 'lacinia vitae,');
INSERT INTO topico VALUES (17, 'Fusce fermentum fermentum arcu.');
INSERT INTO topico VALUES (18, 'Proin dolor.');
INSERT INTO topico VALUES (19, 'imperdiet ornare. In faucibus.');
INSERT INTO topico VALUES (20, 'luctus. Curabitur egestas nunc');
INSERT INTO topico VALUES (21, 'Integer');
INSERT INTO topico VALUES (22, 'est tempor bibendum. Donec');
INSERT INTO topico VALUES (23, 'dui augue eu tellus.');
INSERT INTO topico VALUES (24, 'netus et malesuada fames');
INSERT INTO topico VALUES (25, 'Aliquam');
INSERT INTO topico VALUES (26, 'fringilla purus');
INSERT INTO topico VALUES (27, 'ut nisi');
INSERT INTO topico VALUES (28, 'magnis dis parturient');
INSERT INTO topico VALUES (29, 'Maecenas libero est,');
INSERT INTO topico VALUES (30, 'dictum.');
INSERT INTO topico VALUES (31, 'Proin vel nisl. Quisque');
INSERT INTO topico VALUES (32, 'gravida. Aliquam tincidunt,');
INSERT INTO topico VALUES (33, 'aliquet nec, imperdiet');
INSERT INTO topico VALUES (34, 'nascetur ridiculus mus.');
INSERT INTO topico VALUES (35, 'nascetur');
INSERT INTO topico VALUES (36, 'felis');
INSERT INTO topico VALUES (37, 'nibh. Donec');
INSERT INTO topico VALUES (38, 'arcu eu odio tristique');
INSERT INTO topico VALUES (39, 'eu sem. Pellentesque ut');
INSERT INTO topico VALUES (40, 'pede.');
INSERT INTO topico VALUES (41, 'et magnis dis');
INSERT INTO topico VALUES (42, 'non arcu. Vivamus sit');
INSERT INTO topico VALUES (43, 'mattis semper, dui');
INSERT INTO topico VALUES (44, 'Duis mi enim,');
INSERT INTO topico VALUES (45, 'mi, ac mattis');
INSERT INTO topico VALUES (46, 'facilisis facilisis, magna');
INSERT INTO topico VALUES (47, 'Nulla eget');
INSERT INTO topico VALUES (48, 'vel turpis. Aliquam');
INSERT INTO topico VALUES (49, 'pede,');
INSERT INTO topico VALUES (50, 'risus quis diam luctus');


SET search_path = teste, pg_catalog;

--
-- TOC entry 2241 (class 0 OID 74196)
-- Dependencies: 198
-- Data for Name: cidade; Type: TABLE DATA; Schema: teste; Owner: postgres
--



SET search_path = teste, pg_catalog;

--
-- TOC entry 2051 (class 2606 OID 66213)
-- Name: pkatividade; Type: CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY atividade
    ADD CONSTRAINT pkatividade PRIMARY KEY (codeve, sequencia);


--
-- TOC entry 2053 (class 2606 OID 66215)
-- Name: pkativmin; Type: CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY ativmin
    ADD CONSTRAINT pkativmin PRIMARY KEY (codeve, sequencia, codpess);


--
-- TOC entry 2055 (class 2606 OID 66217)
-- Name: pkcidade; Type: CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT pkcidade PRIMARY KEY (codcid);


--
-- TOC entry 2059 (class 2606 OID 66219)
-- Name: pkenquadramento; Type: CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY enquadramento
    ADD CONSTRAINT pkenquadramento PRIMARY KEY (codenq);


--
-- TOC entry 2063 (class 2606 OID 66221)
-- Name: pkenquadramentopessoa; Type: CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY enquadramentopessoa
    ADD CONSTRAINT pkenquadramentopessoa PRIMARY KEY (codpess, codenq);


--
-- TOC entry 2065 (class 2606 OID 66223)
-- Name: pkestado; Type: CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT pkestado PRIMARY KEY (codest);


--
-- TOC entry 2067 (class 2606 OID 66225)
-- Name: pkevento; Type: CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY evento
    ADD CONSTRAINT pkevento PRIMARY KEY (codeve);


--
-- TOC entry 2069 (class 2606 OID 66227)
-- Name: pkinscativ; Type: CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY inscativ
    ADD CONSTRAINT pkinscativ PRIMARY KEY (numeroinsc, codeve, sequencia);


--
-- TOC entry 2071 (class 2606 OID 66229)
-- Name: pkinscricao; Type: CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY inscricao
    ADD CONSTRAINT pkinscricao PRIMARY KEY (numeroinsc);


--
-- TOC entry 2073 (class 2606 OID 66231)
-- Name: pkinstituicao; Type: CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY instituicao
    ADD CONSTRAINT pkinstituicao PRIMARY KEY (codinst);


--
-- TOC entry 2075 (class 2606 OID 66233)
-- Name: pkinstituicaopessoa; Type: CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY instituicaopessoa
    ADD CONSTRAINT pkinstituicaopessoa PRIMARY KEY (codinst, codpess);


--
-- TOC entry 2077 (class 2606 OID 66235)
-- Name: pkpais; Type: CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT pkpais PRIMARY KEY (codpais);


--
-- TOC entry 2079 (class 2606 OID 66237)
-- Name: pkpessoa; Type: CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY pessoa
    ADD CONSTRAINT pkpessoa PRIMARY KEY (codpess);


--
-- TOC entry 2081 (class 2606 OID 66239)
-- Name: pksubarea; Type: CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY subarea
    ADD CONSTRAINT pksubarea PRIMARY KEY (codsuba);


--
-- TOC entry 2083 (class 2606 OID 66241)
-- Name: pktipoativ; Type: CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY tipoatividade
    ADD CONSTRAINT pktipoativ PRIMARY KEY (codtipo);


--
-- TOC entry 2085 (class 2606 OID 66243)
-- Name: pktopeve; Type: CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY topeve
    ADD CONSTRAINT pktopeve PRIMARY KEY (codeve, codtop);


--
-- TOC entry 2087 (class 2606 OID 66245)
-- Name: pktpico; Type: CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY topico
    ADD CONSTRAINT pktpico PRIMARY KEY (codtop);


--
-- TOC entry 2061 (class 2606 OID 66247)
-- Name: undescricaoenq; Type: CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY enquadramento
    ADD CONSTRAINT undescricaoenq UNIQUE (descricao);


--
-- TOC entry 2089 (class 2606 OID 66249)
-- Name: undescricaotop; Type: CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY topico
    ADD CONSTRAINT undescricaotop UNIQUE (descricao);


--
-- TOC entry 2057 (class 2606 OID 66251)
-- Name: unnomecodestcid; Type: CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT unnomecodestcid UNIQUE (nome, codest);


--
-- TOC entry 2104 (class 2606 OID 66252)
-- Name: fkcodcidinst; Type: FK CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY instituicao
    ADD CONSTRAINT fkcodcidinst FOREIGN KEY (codcid) REFERENCES cidade(codcid);


--
-- TOC entry 2107 (class 2606 OID 66257)
-- Name: fkcodcidpess; Type: FK CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY pessoa
    ADD CONSTRAINT fkcodcidpess FOREIGN KEY (codcid) REFERENCES cidade(codcid);


--
-- TOC entry 2095 (class 2606 OID 66262)
-- Name: fkcodenqenqpess; Type: FK CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY enquadramentopessoa
    ADD CONSTRAINT fkcodenqenqpess FOREIGN KEY (codenq) REFERENCES enquadramento(codenq);


--
-- TOC entry 2094 (class 2606 OID 66267)
-- Name: fkcodestcid; Type: FK CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT fkcodestcid FOREIGN KEY (codest) REFERENCES estado(codest);


--
-- TOC entry 2090 (class 2606 OID 66272)
-- Name: fkcodeveativ; Type: FK CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY atividade
    ADD CONSTRAINT fkcodeveativ FOREIGN KEY (codeve) REFERENCES evento(codeve);


--
-- TOC entry 2102 (class 2606 OID 66277)
-- Name: fkcodeveinsc; Type: FK CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY inscricao
    ADD CONSTRAINT fkcodeveinsc FOREIGN KEY (codeve) REFERENCES evento(codeve);


--
-- TOC entry 2092 (class 2606 OID 66282)
-- Name: fkcodeveseqativmin; Type: FK CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY ativmin
    ADD CONSTRAINT fkcodeveseqativmin FOREIGN KEY (codeve, sequencia) REFERENCES atividade(codeve, sequencia);


--
-- TOC entry 2100 (class 2606 OID 66287)
-- Name: fkcodeveseqinscativ; Type: FK CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY inscativ
    ADD CONSTRAINT fkcodeveseqinscativ FOREIGN KEY (codeve, sequencia) REFERENCES atividade(codeve, sequencia);


--
-- TOC entry 2108 (class 2606 OID 66292)
-- Name: fkcodevetopeve; Type: FK CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY topeve
    ADD CONSTRAINT fkcodevetopeve FOREIGN KEY (codeve) REFERENCES evento(codeve);


--
-- TOC entry 2098 (class 2606 OID 66297)
-- Name: fkcodinsteve; Type: FK CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY evento
    ADD CONSTRAINT fkcodinsteve FOREIGN KEY (codinst) REFERENCES instituicao(codinst);


--
-- TOC entry 2105 (class 2606 OID 66302)
-- Name: fkcodinstinstpess; Type: FK CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY instituicaopessoa
    ADD CONSTRAINT fkcodinstinstpess FOREIGN KEY (codinst) REFERENCES instituicao(codinst);


--
-- TOC entry 2097 (class 2606 OID 66307)
-- Name: fkcodpaisest; Type: FK CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT fkcodpaisest FOREIGN KEY (codpais) REFERENCES pais(codpais);


--
-- TOC entry 2093 (class 2606 OID 66312)
-- Name: fkcodpessativmin; Type: FK CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY ativmin
    ADD CONSTRAINT fkcodpessativmin FOREIGN KEY (codpess) REFERENCES pessoa(codpess);


--
-- TOC entry 2096 (class 2606 OID 66317)
-- Name: fkcodpessenqpess; Type: FK CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY enquadramentopessoa
    ADD CONSTRAINT fkcodpessenqpess FOREIGN KEY (codpess) REFERENCES pessoa(codpess);


--
-- TOC entry 2103 (class 2606 OID 66322)
-- Name: fkcodpessinsc; Type: FK CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY inscricao
    ADD CONSTRAINT fkcodpessinsc FOREIGN KEY (codpess) REFERENCES pessoa(codpess);


--
-- TOC entry 2106 (class 2606 OID 66327)
-- Name: fkcodpessinstpess; Type: FK CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY instituicaopessoa
    ADD CONSTRAINT fkcodpessinstpess FOREIGN KEY (codpess) REFERENCES pessoa(codpess);


--
-- TOC entry 2099 (class 2606 OID 66332)
-- Name: fkcodsubaeve; Type: FK CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY evento
    ADD CONSTRAINT fkcodsubaeve FOREIGN KEY (codsuba) REFERENCES subarea(codsuba);


--
-- TOC entry 2091 (class 2606 OID 66337)
-- Name: fkcodtipoativ; Type: FK CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY atividade
    ADD CONSTRAINT fkcodtipoativ FOREIGN KEY (codtipo) REFERENCES tipoatividade(codtipo);


--
-- TOC entry 2109 (class 2606 OID 66342)
-- Name: fkcodtoptopeve; Type: FK CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY topeve
    ADD CONSTRAINT fkcodtoptopeve FOREIGN KEY (codtop) REFERENCES topico(codtop);


--
-- TOC entry 2101 (class 2606 OID 66347)
-- Name: fknumeroinscinscativ; Type: FK CONSTRAINT; Schema: teste; Owner: postgres
--

ALTER TABLE ONLY inscativ
    ADD CONSTRAINT fknumeroinscinscativ FOREIGN KEY (numeroinsc) REFERENCES inscricao(numeroinsc);


--
-- TOC entry 2248 (class 0 OID 0)
-- Dependencies: 6
-- Name: teste; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA teste FROM teste;
REVOKE ALL ON SCHEMA teste FROM postgres;
GRANT ALL ON SCHEMA teste TO postgres;
GRANT ALL ON SCHEMA teste TO teste;


-- Completed on 2017-08-16 20:04:46

--
-- PostgreSQL database dump complete
--

