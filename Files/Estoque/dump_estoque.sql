--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-07-27 14:25:48

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 202 (class 1259 OID 16918)
-- Name: cidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cidade (
    codcid integer NOT NULL,
    nome character varying(100) NOT NULL,
    uf character(2) NOT NULL
);


ALTER TABLE public.cidade OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16921)
-- Name: classfisc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classfisc (
    codclass integer NOT NULL,
    descricao character varying(100) NOT NULL
);


ALTER TABLE public.classfisc OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16924)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    codcli integer NOT NULL,
    razaosocial character varying(100),
    endereco character varying(150) NOT NULL,
    fantasia character varying(100) NOT NULL,
    codcid integer NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16927)
-- Name: departamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamento (
    coddep integer NOT NULL,
    descricao character varying(100) NOT NULL
);


ALTER TABLE public.departamento OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16930)
-- Name: fechest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fechest (
    datafech date NOT NULL,
    codprod integer NOT NULL,
    qtdeest numeric(13,3) NOT NULL,
    custom numeric(11,2),
    qtdeent numeric(13,3),
    qtdesai numeric(13,3)
);


ALTER TABLE public.fechest OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16933)
-- Name: fornecedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fornecedor (
    codfor integer NOT NULL,
    razaosocial character varying(100) NOT NULL,
    endereco character varying(150) NOT NULL,
    fantasia character varying(100) NOT NULL,
    codcid integer NOT NULL
);


ALTER TABLE public.fornecedor OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16936)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcionario (
    matfunc integer NOT NULL,
    nome character varying(100) NOT NULL,
    endereco character varying(150),
    codcid integer NOT NULL,
    coddep integer NOT NULL,
    matchefe integer
);


ALTER TABLE public.funcionario OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16939)
-- Name: grupoprod; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grupoprod (
    codgru integer NOT NULL,
    descricao character varying(100) NOT NULL
);


ALTER TABLE public.grupoprod OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16942)
-- Name: movest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movest (
    codprod integer NOT NULL,
    datahora timestamp without time zone NOT NULL,
    qtde numeric(11,3) DEFAULT 1,
    custounit numeric(11,2),
    codoper integer NOT NULL,
    coddep integer,
    funcresp integer NOT NULL,
    numnfvenda integer,
    numnfcompra integer
);


ALTER TABLE public.movest OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16946)
-- Name: nfcompra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nfcompra (
    numnf integer NOT NULL,
    dtemissao date NOT NULL,
    codfor integer NOT NULL
);


ALTER TABLE public.nfcompra OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16949)
-- Name: nfvenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nfvenda (
    numnf integer NOT NULL,
    dtemissao date NOT NULL,
    codcli integer NOT NULL
);


ALTER TABLE public.nfvenda OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16952)
-- Name: operacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operacao (
    codoper integer NOT NULL,
    descricao character varying(100) NOT NULL,
    natureza character(1) NOT NULL,
    CONSTRAINT chknaturezaoper CHECK (((natureza = 'S'::bpchar) OR (natureza = 'E'::bpchar)))
);


ALTER TABLE public.operacao OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16956)
-- Name: prateleira; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prateleira (
    numprat integer NOT NULL,
    altura numeric(11,2),
    largura numeric(11,2),
    codprod integer NOT NULL,
    numsecao integer NOT NULL
);


ALTER TABLE public.prateleira OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16959)
-- Name: prodnfcompra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prodnfcompra (
    numnf integer NOT NULL,
    codprod integer NOT NULL,
    qtde numeric(11,3),
    preco numeric(11,2)
);


ALTER TABLE public.prodnfcompra OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16962)
-- Name: prodnfvenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prodnfvenda (
    numnf integer NOT NULL,
    codprod integer NOT NULL,
    qtde numeric(11,3),
    preco numeric(11,2)
);


ALTER TABLE public.prodnfvenda OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16965)
-- Name: prodsec; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prodsec (
    numsecao integer NOT NULL,
    codprod integer NOT NULL
);


ALTER TABLE public.prodsec OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16968)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produto (
    codprod integer NOT NULL,
    descricao character varying(100) NOT NULL,
    qtdeminest numeric(11,3),
    custounit numeric(11,2),
    codgru integer NOT NULL,
    codclass integer NOT NULL
);


ALTER TABLE public.produto OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16971)
-- Name: secao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.secao (
    numsecao integer NOT NULL,
    tamanho numeric(11,2),
    matfunc integer NOT NULL,
    CONSTRAINT chktamanhosec CHECK ((tamanho <= (200)::numeric))
);


ALTER TABLE public.secao OWNER TO postgres;

--
-- TOC entry 2945 (class 0 OID 16918)
-- Dependencies: 202
-- Data for Name: cidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cidade VALUES (3, 'Lajeado', 'RS');
INSERT INTO public.cidade VALUES (2, 'Palmas', 'TO');
INSERT INTO public.cidade VALUES (1, 'Arroio do Meio', 'RS');
INSERT INTO public.cidade VALUES (4, 'São Paulo', 'RS');
INSERT INTO public.cidade VALUES (5, 'Rio de Janeiro', 'RJ');


--
-- TOC entry 2946 (class 0 OID 16921)
-- Dependencies: 203
-- Data for Name: classfisc; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.classfisc VALUES (1, 'Classe 1');
INSERT INTO public.classfisc VALUES (2, 'Classe 2');
INSERT INTO public.classfisc VALUES (3, 'Classe 3');


--
-- TOC entry 2947 (class 0 OID 16924)
-- Dependencies: 204
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cliente VALUES (1, 'abc', 'Rua xyz, 45', 'abc', 1);
INSERT INTO public.cliente VALUES (2, 'cde', 'Rua abc, 120', 'cde', 2);
INSERT INTO public.cliente VALUES (3, 'fgh', 'asd sd ', 'f1', 2);
INSERT INTO public.cliente VALUES (4, 'xyz', 'alkasm asdna ', 'xx', 4);
INSERT INTO public.cliente VALUES (5, 'Parafusos e martelos SA', 'lasma ásk', 'Parafusos', 5);
INSERT INTO public.cliente VALUES (6, 'Mesas e cadeiras Ltda', 'asdkn aksda ', 'Mesas', 5);


--
-- TOC entry 2948 (class 0 OID 16927)
-- Dependencies: 205
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departamento VALUES (4, 'Vendas');
INSERT INTO public.departamento VALUES (1, 'Compras');
INSERT INTO public.departamento VALUES (2, 'Informática');
INSERT INTO public.departamento VALUES (3, 'Contabilidade');
INSERT INTO public.departamento VALUES (5, 'Diretoria');


--
-- TOC entry 2949 (class 0 OID 16930)
-- Dependencies: 206
-- Data for Name: fechest; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fechest VALUES ('2018-06-28', 178, 38.000, 9.00, 13.000, 107.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 46, 9.000, 12.00, 194.000, 19.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 124, 34.000, 2.00, 55.000, 100.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 48, 37.000, 3.00, 83.000, 32.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 136, 4.000, 19.00, 61.000, 161.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 3, 18.000, 20.00, 154.000, 164.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 69, 16.000, 18.00, 159.000, 23.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 98, 1.000, 20.00, 94.000, 60.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 110, 36.000, 6.00, 94.000, 65.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 81, 6.000, 16.00, 151.000, 44.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 156, 4.000, 7.00, 24.000, 115.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 92, 19.000, 17.00, 136.000, 24.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 166, 45.000, 6.00, 34.000, 140.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 114, 14.000, 14.00, 162.000, 34.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 66, 49.000, 3.00, 94.000, 97.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 60, 3.000, 13.00, 76.000, 82.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 143, 31.000, 20.00, 75.000, 27.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 17, 14.000, 6.00, 86.000, 61.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 30, 12.000, 6.00, 173.000, 179.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 147, 42.000, 20.00, 154.000, 117.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 35, 47.000, 10.00, 138.000, 42.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 115, 49.000, 15.00, 154.000, 115.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 12, 30.000, 7.00, 174.000, 168.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 5, 10.000, 18.00, 19.000, 187.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 179, 11.000, 5.00, 11.000, 194.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 148, 19.000, 7.00, 17.000, 49.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 170, 12.000, 5.00, 61.000, 117.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 61, 25.000, 10.00, 69.000, 29.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 187, 6.000, 19.00, 36.000, 115.000);
INSERT INTO public.fechest VALUES ('2018-06-28', 88, 18.000, 19.00, 150.000, 127.000);
INSERT INTO public.fechest VALUES ('2018-07-13', 23, 21.000, 12.00, 63.000, 127.000);
INSERT INTO public.fechest VALUES ('2018-07-13', 127, 48.000, 16.00, 45.000, 32.000);
INSERT INTO public.fechest VALUES ('2018-07-13', 10, 20.000, 3.00, 21.000, 113.000);
INSERT INTO public.fechest VALUES ('2018-07-13', 33, 34.000, 5.00, 200.000, 105.000);
INSERT INTO public.fechest VALUES ('2018-07-13', 143, 9.000, 10.00, 33.000, 94.000);
INSERT INTO public.fechest VALUES ('2018-07-13', 57, 20.000, 13.00, 13.000, 160.000);
INSERT INTO public.fechest VALUES ('2018-07-13', 93, 47.000, 3.00, 125.000, 189.000);
INSERT INTO public.fechest VALUES ('2018-07-13', 4, 9.000, 19.00, 179.000, 143.000);
INSERT INTO public.fechest VALUES ('2018-07-13', 148, 24.000, 18.00, 119.000, 27.000);
INSERT INTO public.fechest VALUES ('2018-07-13', 155, 38.000, 5.00, 40.000, 200.000);
INSERT INTO public.fechest VALUES ('2018-07-13', 44, 19.000, 16.00, 142.000, 30.000);
INSERT INTO public.fechest VALUES ('2018-07-13', 3, 7.000, 10.00, 49.000, 52.000);
INSERT INTO public.fechest VALUES ('2018-07-13', 181, 18.000, 6.00, 136.000, 167.000);
INSERT INTO public.fechest VALUES ('2018-07-13', 37, 7.000, 10.00, 177.000, 57.000);
INSERT INTO public.fechest VALUES ('2018-07-13', 167, 43.000, 8.00, 27.000, 134.000);
INSERT INTO public.fechest VALUES ('2018-07-13', 22, 42.000, 7.00, 97.000, 190.000);
INSERT INTO public.fechest VALUES ('2018-07-13', 49, 20.000, 16.00, 70.000, 12.000);
INSERT INTO public.fechest VALUES ('2018-07-13', 1, 4.000, 7.00, 147.000, 182.000);
INSERT INTO public.fechest VALUES ('2018-07-13', 36, 45.000, 16.00, 16.000, 42.000);
INSERT INTO public.fechest VALUES ('2018-07-13', 182, 3.000, 10.00, 187.000, 189.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 3, 17.000, 16.00, 10.000, 40.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 112, 27.000, 20.00, 111.000, 178.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 59, 13.000, 3.00, 133.000, 11.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 105, 39.000, 7.00, 34.000, 79.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 66, 45.000, 11.00, 175.000, 17.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 43, 11.000, 12.00, 125.000, 180.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 173, 20.000, 9.00, 64.000, 36.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 123, 50.000, 7.00, 170.000, 181.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 82, 47.000, 18.00, 87.000, 11.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 119, 21.000, 2.00, 90.000, 74.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 52, 26.000, 9.00, 191.000, 179.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 27, 38.000, 15.00, 21.000, 48.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 186, 11.000, 16.00, 156.000, 86.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 179, 49.000, 5.00, 184.000, 52.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 13, 42.000, 7.00, 125.000, 111.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 156, 43.000, 14.00, 82.000, 152.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 133, 12.000, 13.00, 168.000, 45.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 130, 19.000, 7.00, 115.000, 185.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 158, 1.000, 11.00, 123.000, 29.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 150, 40.000, 7.00, 145.000, 139.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 39, 48.000, 8.00, 179.000, 93.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 48, 19.000, 18.00, 76.000, 118.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 172, 16.000, 7.00, 177.000, 74.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 28, 48.000, 20.00, 130.000, 66.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 151, 21.000, 7.00, 18.000, 48.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 163, 3.000, 9.00, 44.000, 87.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 70, 42.000, 4.00, 80.000, 11.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 185, 23.000, 4.00, 27.000, 161.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 106, 13.000, 11.00, 29.000, 97.000);
INSERT INTO public.fechest VALUES ('2018-07-28', 148, 35.000, 2.00, 107.000, 143.000);


--
-- TOC entry 2950 (class 0 OID 16933)
-- Dependencies: 207
-- Data for Name: fornecedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fornecedor VALUES (1, 'Vende tudo SA', 'ask askdnas ', 'Vende', 2);
INSERT INTO public.fornecedor VALUES (2, 'Qualquer coisa', 'dlsma asldam', 'Qualquer', 1);
INSERT INTO public.fornecedor VALUES (3, 'Pode ser assim', 'asdasaçalsdmçs', 'Pode ser', 3);
INSERT INTO public.fornecedor VALUES (4, 'Não sei', 'Rua não sei', 'Não', 3);
INSERT INTO public.fornecedor VALUES (5, 'Novo fornecedor', 'Alameda 1', 'Novo', 2);


--
-- TOC entry 2951 (class 0 OID 16936)
-- Dependencies: 208
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.funcionario VALUES (1, 'anipsa', 'asdpas', 1, 1, NULL);
INSERT INTO public.funcionario VALUES (2, 'Alden', '864-4760 Eu Rd.', 4, 4, NULL);
INSERT INTO public.funcionario VALUES (3, 'Oscar', '1049 Elit, St.', 3, 1, NULL);
INSERT INTO public.funcionario VALUES (4, 'May', 'Ap #595-8843 Magna. Avenue', 3, 2, NULL);
INSERT INTO public.funcionario VALUES (5, 'Jackson', 'P.O. Box 989, 4950 Diam Street', 4, 1, NULL);
INSERT INTO public.funcionario VALUES (6, 'Barrett', 'P.O. Box 915, 5293 Neque. Ave', 1, 3, NULL);
INSERT INTO public.funcionario VALUES (7, 'Gavin', 'Ap #870-518 Luctus Av.', 3, 2, NULL);
INSERT INTO public.funcionario VALUES (8, 'Marny', '479-3184 Luctus Road', 4, 2, NULL);
INSERT INTO public.funcionario VALUES (9, 'Kuame', 'Ap #647-4687 Quis Rd.', 1, 1, NULL);
INSERT INTO public.funcionario VALUES (10, 'Giselle', '586-3782 Eget St.', 4, 1, NULL);
INSERT INTO public.funcionario VALUES (11, 'Kenneth', 'P.O. Box 691, 1456 Mauris St.', 4, 2, NULL);
INSERT INTO public.funcionario VALUES (12, 'Ignacia', '9741 Lorem, Rd.', 1, 5, NULL);
INSERT INTO public.funcionario VALUES (13, 'Zenaida', 'Ap #447-1714 Augue Road', 3, 2, NULL);
INSERT INTO public.funcionario VALUES (14, 'Casey', 'P.O. Box 249, 7157 Non, Road', 4, 5, NULL);
INSERT INTO public.funcionario VALUES (15, 'Jasmine', 'Ap #633-1664 Mi Avenue', 3, 1, NULL);
INSERT INTO public.funcionario VALUES (16, 'Hoyt', 'P.O. Box 271, 5297 Lorem, Ave', 1, 3, NULL);
INSERT INTO public.funcionario VALUES (17, 'Beverly', 'P.O. Box 673, 8115 Orci. Street', 3, 1, NULL);
INSERT INTO public.funcionario VALUES (18, 'Carolyn', 'P.O. Box 298, 5471 Libero St.', 1, 5, NULL);
INSERT INTO public.funcionario VALUES (19, 'Zelenia', 'Ap #953-9025 Eu Road', 2, 5, NULL);
INSERT INTO public.funcionario VALUES (20, 'Carol', '113-187 Neque. Rd.', 2, 4, NULL);
INSERT INTO public.funcionario VALUES (21, 'Elliott', 'P.O. Box 825, 2252 Id, Ave', 5, 3, NULL);
INSERT INTO public.funcionario VALUES (22, 'Tate', 'Ap #727-3972 Justo Rd.', 1, 3, NULL);
INSERT INTO public.funcionario VALUES (23, 'Justina', '178-9263 Etiam St.', 1, 3, NULL);
INSERT INTO public.funcionario VALUES (24, 'Ivy', 'Ap #606-4138 Tincidunt. Road', 2, 5, NULL);
INSERT INTO public.funcionario VALUES (25, 'Jack', 'Ap #473-7755 Est. St.', 5, 2, NULL);
INSERT INTO public.funcionario VALUES (26, 'Nell', '979-2638 Netus Street', 1, 4, NULL);
INSERT INTO public.funcionario VALUES (27, 'Willa', 'P.O. Box 464, 8975 Posuere Rd.', 2, 5, NULL);
INSERT INTO public.funcionario VALUES (28, 'Kylan', '635-8840 Nisi. Street', 3, 2, NULL);
INSERT INTO public.funcionario VALUES (29, 'Robert', '466-5692 Et Ave', 3, 2, NULL);
INSERT INTO public.funcionario VALUES (30, 'Willa', 'P.O. Box 890, 5908 Nulla Av.', 2, 2, NULL);
INSERT INTO public.funcionario VALUES (31, 'Zoe', 'P.O. Box 130, 7230 Suspendisse Rd.', 1, 1, NULL);
INSERT INTO public.funcionario VALUES (32, 'Zephr', '6119 Mi St.', 2, 4, NULL);
INSERT INTO public.funcionario VALUES (33, 'Lance', 'Ap #494-4980 Praesent Street', 1, 5, NULL);
INSERT INTO public.funcionario VALUES (34, 'Hakeem', '4652 Quam Rd.', 3, 2, NULL);
INSERT INTO public.funcionario VALUES (35, 'Anne', '3067 Enim, Road', 1, 3, NULL);
INSERT INTO public.funcionario VALUES (36, 'Brittany', '511-9826 Eget, Road', 1, 1, NULL);
INSERT INTO public.funcionario VALUES (37, 'Samantha', 'Ap #935-124 Penatibus Ave', 5, 4, NULL);
INSERT INTO public.funcionario VALUES (38, 'Larissa', '809-824 Nec Road', 4, 4, NULL);
INSERT INTO public.funcionario VALUES (39, 'Naomi', '938-1732 Risus Street', 5, 3, NULL);
INSERT INTO public.funcionario VALUES (40, 'Vladimir', 'Ap #570-3590 Id, St.', 2, 1, NULL);
INSERT INTO public.funcionario VALUES (41, 'Nyssa', '285-3531 Urna St.', 4, 1, NULL);
INSERT INTO public.funcionario VALUES (42, 'Eliana', 'P.O. Box 671, 2168 Consectetuer Road', 5, 5, NULL);
INSERT INTO public.funcionario VALUES (43, 'Lynn', 'P.O. Box 703, 7886 Feugiat Road', 1, 4, NULL);
INSERT INTO public.funcionario VALUES (44, 'Amela', 'P.O. Box 409, 2039 Aliquam Ave', 4, 1, NULL);
INSERT INTO public.funcionario VALUES (45, 'Ethan', '820-9937 Odio St.', 4, 3, NULL);
INSERT INTO public.funcionario VALUES (46, 'Ocean', '655-5408 Sagittis Av.', 1, 5, NULL);
INSERT INTO public.funcionario VALUES (47, 'Tiger', '7924 Consectetuer Road', 1, 4, NULL);
INSERT INTO public.funcionario VALUES (48, 'Dexter', 'P.O. Box 238, 1674 Eu Avenue', 1, 3, NULL);
INSERT INTO public.funcionario VALUES (49, 'Wing', 'Ap #419-8280 Elit St.', 1, 5, NULL);
INSERT INTO public.funcionario VALUES (50, 'Jenette', '886-4138 Nisi. St.', 4, 1, NULL);
INSERT INTO public.funcionario VALUES (51, 'Rebecca', 'P.O. Box 801, 9998 Sit Road', 3, 1, NULL);
INSERT INTO public.funcionario VALUES (52, 'Martin', '8905 Ridiculus Rd.', 2, 1, NULL);
INSERT INTO public.funcionario VALUES (53, 'Neville', '9027 Lorem, St.', 5, 5, NULL);
INSERT INTO public.funcionario VALUES (54, 'Burke', 'P.O. Box 887, 7334 A Ave', 2, 4, NULL);
INSERT INTO public.funcionario VALUES (55, 'May', '5949 Non Av.', 1, 1, NULL);
INSERT INTO public.funcionario VALUES (56, 'Victor', 'Ap #285-7396 Porttitor Avenue', 5, 3, NULL);
INSERT INTO public.funcionario VALUES (57, 'Cade', '8779 Nec, St.', 3, 1, NULL);
INSERT INTO public.funcionario VALUES (58, 'Zephania', 'P.O. Box 993, 1083 Auctor Avenue', 4, 3, NULL);
INSERT INTO public.funcionario VALUES (59, 'Andrew', 'P.O. Box 465, 3299 Erat Street', 1, 5, NULL);
INSERT INTO public.funcionario VALUES (60, 'Palmer', '285-2972 Lorem Road', 1, 1, NULL);
INSERT INTO public.funcionario VALUES (61, 'Hayfa', 'P.O. Box 764, 4630 Duis Av.', 5, 3, NULL);
INSERT INTO public.funcionario VALUES (62, 'Cairo', 'Ap #506-6025 Faucibus St.', 3, 1, NULL);
INSERT INTO public.funcionario VALUES (63, 'Micah', '442-7149 Vulputate Street', 3, 1, NULL);
INSERT INTO public.funcionario VALUES (64, 'MacKensie', 'Ap #410-867 Enim Avenue', 5, 3, NULL);
INSERT INTO public.funcionario VALUES (65, 'Nyssa', 'P.O. Box 140, 3660 Mauris St.', 2, 5, NULL);
INSERT INTO public.funcionario VALUES (66, 'Dennis', '763-5082 Quis Ave', 5, 3, NULL);
INSERT INTO public.funcionario VALUES (67, 'Lawrence', 'P.O. Box 201, 5734 Justo. Ave', 3, 4, NULL);
INSERT INTO public.funcionario VALUES (68, 'Macey', '192 Neque Avenue', 2, 5, NULL);
INSERT INTO public.funcionario VALUES (69, 'Quintessa', '181-3811 Porttitor Road', 2, 2, NULL);
INSERT INTO public.funcionario VALUES (70, 'Odysseus', 'Ap #211-2975 Et St.', 2, 1, NULL);
INSERT INTO public.funcionario VALUES (71, 'Eliana', '809-8253 Penatibus Rd.', 3, 1, NULL);
INSERT INTO public.funcionario VALUES (72, 'Dieter', 'P.O. Box 957, 1417 Ante, Av.', 3, 3, NULL);
INSERT INTO public.funcionario VALUES (73, 'Montana', 'P.O. Box 583, 4433 Libero St.', 4, 1, NULL);
INSERT INTO public.funcionario VALUES (74, 'Hall', '3626 Sodales Rd.', 5, 1, NULL);
INSERT INTO public.funcionario VALUES (75, 'Zane', 'Ap #353-8206 Velit Av.', 1, 3, NULL);
INSERT INTO public.funcionario VALUES (76, 'Forrest', 'Ap #471-7721 Quisque Rd.', 1, 1, NULL);
INSERT INTO public.funcionario VALUES (77, 'Hedley', 'Ap #883-8848 Tortor. St.', 4, 1, NULL);
INSERT INTO public.funcionario VALUES (78, 'Reece', '5167 Vitae St.', 3, 5, NULL);
INSERT INTO public.funcionario VALUES (79, 'Candice', '1333 Molestie Ave', 1, 3, NULL);
INSERT INTO public.funcionario VALUES (80, 'Rhiannon', 'P.O. Box 416, 9307 Nulla Avenue', 5, 3, NULL);
INSERT INTO public.funcionario VALUES (81, 'Mohammad', '178-8643 Lacinia Avenue', 2, 4, NULL);
INSERT INTO public.funcionario VALUES (82, 'Samuel', 'P.O. Box 393, 9165 Odio Ave', 5, 3, NULL);
INSERT INTO public.funcionario VALUES (83, 'Baker', '824-7912 Vestibulum Rd.', 1, 4, NULL);
INSERT INTO public.funcionario VALUES (84, 'Wesley', '880 Nam St.', 4, 2, NULL);
INSERT INTO public.funcionario VALUES (85, 'Cleo', 'Ap #945-9306 Aliquam Street', 2, 5, NULL);
INSERT INTO public.funcionario VALUES (86, 'Owen', 'Ap #704-7510 Morbi Av.', 2, 5, NULL);
INSERT INTO public.funcionario VALUES (87, 'Ivana', 'Ap #961-3715 Amet Road', 5, 2, NULL);
INSERT INTO public.funcionario VALUES (88, 'Carl', 'Ap #665-7005 Lacus. Rd.', 4, 1, NULL);
INSERT INTO public.funcionario VALUES (89, 'Joshua', '8836 Maecenas Rd.', 4, 1, NULL);
INSERT INTO public.funcionario VALUES (90, 'Justine', '220-968 Nunc Rd.', 4, 2, NULL);
INSERT INTO public.funcionario VALUES (91, 'Marah', 'Ap #907-2005 Sapien. Road', 3, 3, NULL);
INSERT INTO public.funcionario VALUES (92, 'Maxine', 'Ap #495-1345 Urna, Av.', 3, 1, NULL);
INSERT INTO public.funcionario VALUES (93, 'Troy', 'P.O. Box 639, 3912 Luctus. St.', 2, 3, NULL);
INSERT INTO public.funcionario VALUES (94, 'Jorden', 'Ap #476-9844 Ligula Rd.', 1, 4, NULL);
INSERT INTO public.funcionario VALUES (95, 'Vera', '799 Ligula. Rd.', 1, 4, NULL);
INSERT INTO public.funcionario VALUES (96, 'Phyllis', 'P.O. Box 496, 5339 Pede. Ave', 3, 2, NULL);
INSERT INTO public.funcionario VALUES (97, 'Chelsea', 'Ap #933-8746 Ligula. Av.', 4, 4, NULL);
INSERT INTO public.funcionario VALUES (98, 'Deanna', 'Ap #375-4334 Ut Ave', 5, 4, NULL);
INSERT INTO public.funcionario VALUES (99, 'Lunea', 'Ap #623-1298 Bibendum Street', 1, 2, NULL);
INSERT INTO public.funcionario VALUES (100, 'Tobias', '917-5770 Nunc Rd.', 5, 4, NULL);
INSERT INTO public.funcionario VALUES (101, 'Wendy', '8401 Consectetuer St.', 3, 1, NULL);
INSERT INTO public.funcionario VALUES (150, 'Stacy', 'Ap #314-6056 Tristique Rd.', 1, 2, NULL);
INSERT INTO public.funcionario VALUES (151, 'Uta', '3797 Non Street', 3, 3, NULL);
INSERT INTO public.funcionario VALUES (152, 'Cody', 'Ap #691-1812 Dui Ave', 2, 1, NULL);
INSERT INTO public.funcionario VALUES (153, 'Zenia', 'P.O. Box 738, 7845 Duis Avenue', 4, 2, NULL);
INSERT INTO public.funcionario VALUES (154, 'Regan', '833-9262 Dignissim Av.', 3, 3, NULL);
INSERT INTO public.funcionario VALUES (155, 'Maxwell', 'Ap #317-8320 Et Avenue', 3, 3, NULL);
INSERT INTO public.funcionario VALUES (156, 'Edward', 'P.O. Box 368, 1788 Egestas. Av.', 2, 4, NULL);
INSERT INTO public.funcionario VALUES (157, 'Hayes', 'P.O. Box 584, 8491 Lacus. Road', 1, 3, NULL);
INSERT INTO public.funcionario VALUES (158, 'Leonard', '3691 Sit Road', 1, 4, NULL);
INSERT INTO public.funcionario VALUES (159, 'Leilani', 'P.O. Box 624, 6530 Risus St.', 3, 1, NULL);
INSERT INTO public.funcionario VALUES (160, 'Kirsten', '332-9060 Tellus, St.', 1, 4, NULL);
INSERT INTO public.funcionario VALUES (161, 'George', 'P.O. Box 995, 5205 Ultricies Rd.', 1, 1, NULL);
INSERT INTO public.funcionario VALUES (162, 'Vladimir', 'Ap #426-7793 Nunc Ave', 2, 1, NULL);
INSERT INTO public.funcionario VALUES (163, 'Jamalia', 'P.O. Box 730, 1579 Aenean Ave', 3, 4, NULL);
INSERT INTO public.funcionario VALUES (164, 'Emerson', 'P.O. Box 503, 4139 Eu Rd.', 1, 2, NULL);
INSERT INTO public.funcionario VALUES (165, 'Palmer', '995-827 Ante. Rd.', 2, 4, NULL);
INSERT INTO public.funcionario VALUES (166, 'Macy', '935-6455 Sollicitudin Rd.', 1, 4, NULL);
INSERT INTO public.funcionario VALUES (167, 'Marah', '213-8229 Rutrum Street', 5, 4, NULL);
INSERT INTO public.funcionario VALUES (168, 'Amos', '746-5232 Placerat Ave', 1, 4, NULL);
INSERT INTO public.funcionario VALUES (169, 'Dorothy', 'P.O. Box 381, 7210 In Road', 2, 5, NULL);
INSERT INTO public.funcionario VALUES (170, 'Hope', 'Ap #482-2330 Mollis. Av.', 4, 4, NULL);
INSERT INTO public.funcionario VALUES (171, 'Dai', '4946 Feugiat Ave', 2, 2, NULL);
INSERT INTO public.funcionario VALUES (172, 'Halee', '971-257 Nulla Rd.', 5, 3, NULL);
INSERT INTO public.funcionario VALUES (173, 'Venus', '923 Enim St.', 4, 5, NULL);
INSERT INTO public.funcionario VALUES (174, 'Tatum', '405-3951 Enim Rd.', 3, 5, NULL);
INSERT INTO public.funcionario VALUES (175, 'May', '7930 Ligula Road', 4, 3, NULL);
INSERT INTO public.funcionario VALUES (176, 'Priscilla', 'Ap #782-4761 Lectus Ave', 5, 3, NULL);
INSERT INTO public.funcionario VALUES (177, 'Jolie', 'Ap #452-3030 Ipsum. Rd.', 2, 3, NULL);
INSERT INTO public.funcionario VALUES (178, 'Uriah', '9613 Ut St.', 4, 4, NULL);
INSERT INTO public.funcionario VALUES (179, 'Phillip', 'P.O. Box 943, 9703 Quis Road', 3, 1, NULL);
INSERT INTO public.funcionario VALUES (180, 'Portia', 'P.O. Box 293, 9173 Vitae Av.', 4, 3, NULL);
INSERT INTO public.funcionario VALUES (181, 'Signe', '2241 Amet, Street', 3, 4, NULL);
INSERT INTO public.funcionario VALUES (182, 'Winifred', 'Ap #122-8311 Ac Avenue', 2, 1, NULL);
INSERT INTO public.funcionario VALUES (183, 'Ursula', 'Ap #528-9925 Sed, Rd.', 1, 3, NULL);
INSERT INTO public.funcionario VALUES (184, 'Britanney', 'Ap #163-7072 Arcu. St.', 5, 2, NULL);
INSERT INTO public.funcionario VALUES (185, 'Mallory', '909-372 Blandit. Av.', 5, 4, NULL);
INSERT INTO public.funcionario VALUES (186, 'Hermione', '894-7759 Mauris Rd.', 4, 4, NULL);
INSERT INTO public.funcionario VALUES (187, 'Whitney', '1790 Diam. St.', 5, 2, NULL);
INSERT INTO public.funcionario VALUES (188, 'Tyler', '534-720 Cras St.', 4, 2, NULL);
INSERT INTO public.funcionario VALUES (189, 'Kalia', 'Ap #496-2220 Non, Road', 1, 2, NULL);
INSERT INTO public.funcionario VALUES (190, 'Matthew', '8087 Quam. Rd.', 2, 2, NULL);
INSERT INTO public.funcionario VALUES (191, 'Madaline', '545-4824 Litora St.', 3, 2, NULL);
INSERT INTO public.funcionario VALUES (192, 'Freya', '745-5391 Libero. St.', 2, 5, NULL);
INSERT INTO public.funcionario VALUES (193, 'Idona', 'Ap #129-5849 Congue Street', 4, 3, NULL);
INSERT INTO public.funcionario VALUES (194, 'Stone', '751-6214 Eu Ave', 5, 1, NULL);
INSERT INTO public.funcionario VALUES (195, 'Rhiannon', '9422 Purus. Av.', 5, 1, NULL);
INSERT INTO public.funcionario VALUES (196, 'Wayne', '119-3313 Augue Avenue', 3, 1, NULL);
INSERT INTO public.funcionario VALUES (197, 'Amal', '7082 Sapien Avenue', 5, 4, NULL);
INSERT INTO public.funcionario VALUES (198, 'Kasimir', '667-8919 Donec Road', 5, 1, NULL);
INSERT INTO public.funcionario VALUES (199, 'MacKensie', 'P.O. Box 864, 4782 Magna. Street', 1, 3, NULL);
INSERT INTO public.funcionario VALUES (200, 'Brittany', '950-130 Eu, Street', 2, 1, NULL);
INSERT INTO public.funcionario VALUES (201, 'Ahmed', 'P.O. Box 702, 7589 Rhoncus. Av.', 1, 3, NULL);
INSERT INTO public.funcionario VALUES (202, 'Roth', '896-9131 Vehicula. Ave', 4, 4, NULL);
INSERT INTO public.funcionario VALUES (203, 'Sonya', '676-8248 Non, Avenue', 4, 5, NULL);
INSERT INTO public.funcionario VALUES (204, 'Dieter', '285-7055 Massa. Rd.', 2, 5, NULL);
INSERT INTO public.funcionario VALUES (205, 'Dolan', '911-6909 Id Avenue', 5, 5, NULL);
INSERT INTO public.funcionario VALUES (206, 'Alana', 'Ap #759-8733 Lacus. Ave', 2, 2, NULL);
INSERT INTO public.funcionario VALUES (207, 'Duncan', 'Ap #278-1037 Orci Ave', 5, 3, NULL);
INSERT INTO public.funcionario VALUES (208, 'Isabella', 'P.O. Box 751, 7239 Non St.', 2, 1, NULL);
INSERT INTO public.funcionario VALUES (209, 'Madeline', 'P.O. Box 600, 7663 Auctor Av.', 2, 1, NULL);
INSERT INTO public.funcionario VALUES (210, 'Darryl', '583-6440 Imperdiet Rd.', 3, 1, NULL);
INSERT INTO public.funcionario VALUES (211, 'Jamal', '158-7812 Hendrerit Road', 5, 1, NULL);
INSERT INTO public.funcionario VALUES (212, 'Alice', '636 Donec Road', 3, 1, NULL);
INSERT INTO public.funcionario VALUES (213, 'Kato', '426-4139 Ligula. Rd.', 2, 5, NULL);
INSERT INTO public.funcionario VALUES (214, 'Jorden', 'P.O. Box 305, 2953 Aenean Rd.', 1, 3, NULL);
INSERT INTO public.funcionario VALUES (215, 'Freya', '4195 Vitae Rd.', 5, 1, NULL);
INSERT INTO public.funcionario VALUES (216, 'Elliott', '8414 Suscipit Street', 3, 3, NULL);
INSERT INTO public.funcionario VALUES (217, 'Craig', 'P.O. Box 732, 5982 Sed, Road', 3, 2, NULL);
INSERT INTO public.funcionario VALUES (218, 'Sybil', 'P.O. Box 458, 8055 Mauris St.', 1, 5, NULL);
INSERT INTO public.funcionario VALUES (219, 'Zephania', '165-4308 Amet Av.', 5, 1, NULL);
INSERT INTO public.funcionario VALUES (220, 'Tanner', 'P.O. Box 950, 7413 Donec Av.', 4, 2, NULL);
INSERT INTO public.funcionario VALUES (221, 'Josiah', '115-1996 Eu Street', 1, 3, NULL);
INSERT INTO public.funcionario VALUES (222, 'Isabella', '9033 Ullamcorper, Av.', 3, 5, NULL);
INSERT INTO public.funcionario VALUES (223, 'Sade', 'P.O. Box 618, 9082 Vitae Avenue', 5, 2, NULL);
INSERT INTO public.funcionario VALUES (224, 'Rana', '7532 Donec Rd.', 1, 4, NULL);
INSERT INTO public.funcionario VALUES (225, 'Bertha', '8318 Pede Rd.', 5, 3, NULL);
INSERT INTO public.funcionario VALUES (226, 'Juliet', '658-5654 Justo Avenue', 2, 4, NULL);
INSERT INTO public.funcionario VALUES (227, 'Travis', '2749 Iaculis Avenue', 4, 2, NULL);
INSERT INTO public.funcionario VALUES (228, 'Kellie', 'Ap #505-3759 Ornare. Avenue', 3, 3, NULL);
INSERT INTO public.funcionario VALUES (229, 'Olga', 'P.O. Box 672, 5627 Dolor. Street', 1, 5, NULL);
INSERT INTO public.funcionario VALUES (230, 'Driscoll', '349-7221 Eu Av.', 5, 1, NULL);
INSERT INTO public.funcionario VALUES (231, 'Bree', '487-7072 Euismod Av.', 5, 1, NULL);
INSERT INTO public.funcionario VALUES (232, 'Chandler', '8366 Neque St.', 4, 4, NULL);
INSERT INTO public.funcionario VALUES (233, 'Sean', '3921 Id, Av.', 2, 4, NULL);
INSERT INTO public.funcionario VALUES (234, 'Zachery', 'P.O. Box 746, 9547 Quis, Road', 2, 2, NULL);
INSERT INTO public.funcionario VALUES (235, 'Bryar', '208-3510 Massa Road', 5, 3, NULL);
INSERT INTO public.funcionario VALUES (236, 'Indira', 'Ap #565-4147 Odio Street', 4, 4, NULL);
INSERT INTO public.funcionario VALUES (237, 'Cullen', 'P.O. Box 282, 9399 Nunc Avenue', 1, 2, NULL);
INSERT INTO public.funcionario VALUES (238, 'Victoria', '8784 Sed Rd.', 2, 3, NULL);
INSERT INTO public.funcionario VALUES (239, 'Sebastian', 'Ap #247-1171 Turpis St.', 3, 2, NULL);
INSERT INTO public.funcionario VALUES (240, 'Stone', 'P.O. Box 448, 4254 Sodales Ave', 4, 2, NULL);
INSERT INTO public.funcionario VALUES (241, 'Valentine', '540-9531 Quis Rd.', 1, 1, NULL);
INSERT INTO public.funcionario VALUES (242, 'Haley', 'P.O. Box 144, 4126 A, Avenue', 4, 1, NULL);
INSERT INTO public.funcionario VALUES (243, 'Orli', 'P.O. Box 996, 5746 Aliquam Rd.', 1, 1, NULL);
INSERT INTO public.funcionario VALUES (244, 'Jescie', 'Ap #650-3605 Erat Road', 1, 1, NULL);
INSERT INTO public.funcionario VALUES (245, 'Hayes', '174-4676 Id Rd.', 5, 3, NULL);
INSERT INTO public.funcionario VALUES (246, 'Remedios', '443-4514 Blandit Avenue', 3, 5, NULL);
INSERT INTO public.funcionario VALUES (247, 'Cruz', 'P.O. Box 681, 870 Sed St.', 4, 3, NULL);
INSERT INTO public.funcionario VALUES (248, 'Jennifer', 'P.O. Box 857, 2179 Fusce St.', 5, 3, NULL);
INSERT INTO public.funcionario VALUES (249, 'Lesley', '6685 Sed, Rd.', 3, 1, NULL);


--
-- TOC entry 2952 (class 0 OID 16939)
-- Dependencies: 209
-- Data for Name: grupoprod; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.grupoprod VALUES (1, 'Parafusos');
INSERT INTO public.grupoprod VALUES (2, 'Martelos');
INSERT INTO public.grupoprod VALUES (3, 'Materias primas');
INSERT INTO public.grupoprod VALUES (4, 'Ferros em geral');
INSERT INTO public.grupoprod VALUES (5, 'Pregos');
INSERT INTO public.grupoprod VALUES (6, 'Canetas');
INSERT INTO public.grupoprod VALUES (7, 'Lápis');


--
-- TOC entry 2953 (class 0 OID 16942)
-- Dependencies: 210
-- Data for Name: movest; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.movest VALUES (69, '2018-06-28 02:20:46', 26.000, 19.00, 4, 3, 46, NULL, NULL);
INSERT INTO public.movest VALUES (58, '2018-06-19 08:24:33', 31.000, 5.00, 2, 4, 82, NULL, NULL);
INSERT INTO public.movest VALUES (13, '2018-06-21 14:46:00', 17.000, 3.00, 1, 4, 10, NULL, NULL);
INSERT INTO public.movest VALUES (4, '2018-04-20 15:49:29', 40.000, 15.00, 1, 3, 23, NULL, NULL);
INSERT INTO public.movest VALUES (77, '2018-06-11 13:10:28', 49.000, 14.00, 3, 2, 11, NULL, NULL);
INSERT INTO public.movest VALUES (89, '2018-04-26 06:16:47', 36.000, 14.00, 3, 4, 39, NULL, NULL);
INSERT INTO public.movest VALUES (118, '2018-06-19 12:51:05', 41.000, 12.00, 3, 2, 51, NULL, NULL);
INSERT INTO public.movest VALUES (65, '2018-05-06 07:13:39', 19.000, 6.00, 5, 1, 57, NULL, NULL);
INSERT INTO public.movest VALUES (26, '2018-04-29 13:56:22', 43.000, 18.00, 1, 1, 94, NULL, NULL);
INSERT INTO public.movest VALUES (20, '2018-04-20 04:57:40', 36.000, 15.00, 4, 3, 76, NULL, NULL);
INSERT INTO public.movest VALUES (77, '2018-05-05 06:35:54', 50.000, 5.00, 1, 4, 79, NULL, NULL);
INSERT INTO public.movest VALUES (49, '2018-04-13 09:08:56', 28.000, 6.00, 4, 4, 100, NULL, NULL);
INSERT INTO public.movest VALUES (142, '2018-06-18 06:49:35', 12.000, 4.00, 4, 4, 85, NULL, NULL);
INSERT INTO public.movest VALUES (2, '2018-06-28 18:25:55', 37.000, 5.00, 4, 5, 38, NULL, NULL);
INSERT INTO public.movest VALUES (75, '2018-06-28 07:33:51', 24.000, 9.00, 2, 1, 64, NULL, NULL);
INSERT INTO public.movest VALUES (1, '2018-06-09 21:29:39', 43.000, 9.00, 4, 4, 74, NULL, NULL);
INSERT INTO public.movest VALUES (117, '2018-05-07 04:22:15', 10.000, 10.00, 3, 5, 15, NULL, NULL);
INSERT INTO public.movest VALUES (72, '2018-06-30 14:54:22', 28.000, 11.00, 2, 5, 67, NULL, NULL);
INSERT INTO public.movest VALUES (7, '2018-05-08 04:56:56', 21.000, 19.00, 3, 2, 68, NULL, NULL);
INSERT INTO public.movest VALUES (130, '2018-04-08 12:05:13', 26.000, 3.00, 2, 4, 22, NULL, NULL);
INSERT INTO public.movest VALUES (36, '2018-04-14 07:19:15', 35.000, 16.00, 1, 3, 77, NULL, NULL);
INSERT INTO public.movest VALUES (12, '2018-04-09 14:36:40', 3.000, 7.00, 4, 1, 15, NULL, NULL);
INSERT INTO public.movest VALUES (81, '2018-06-28 22:30:55', 30.000, 12.00, 4, 5, 21, NULL, NULL);
INSERT INTO public.movest VALUES (52, '2018-06-23 02:02:52', 46.000, 9.00, 5, 5, 100, NULL, NULL);
INSERT INTO public.movest VALUES (67, '2018-04-20 01:48:21', 1.000, 4.00, 2, 5, 63, NULL, NULL);
INSERT INTO public.movest VALUES (77, '2018-05-20 08:03:20', 4.000, 5.00, 3, 1, 63, NULL, NULL);
INSERT INTO public.movest VALUES (51, '2018-05-06 06:36:01', 25.000, 6.00, 5, 1, 83, NULL, NULL);
INSERT INTO public.movest VALUES (147, '2018-05-24 02:04:15', 32.000, 12.00, 4, 3, 6, NULL, NULL);
INSERT INTO public.movest VALUES (25, '2018-06-30 20:39:06', 7.000, 2.00, 5, 1, 6, NULL, NULL);
INSERT INTO public.movest VALUES (115, '2018-06-23 18:54:58', 25.000, 14.00, 5, 5, 27, NULL, NULL);
INSERT INTO public.movest VALUES (18, '2018-06-30 14:18:34', 23.000, 18.00, 3, 3, 34, NULL, NULL);
INSERT INTO public.movest VALUES (72, '2018-04-14 07:02:10', 46.000, 15.00, 5, 3, 15, NULL, NULL);
INSERT INTO public.movest VALUES (108, '2018-06-25 19:34:29', 29.000, 18.00, 4, 4, 39, NULL, NULL);
INSERT INTO public.movest VALUES (138, '2018-04-17 12:49:28', 35.000, 2.00, 5, 3, 42, NULL, NULL);
INSERT INTO public.movest VALUES (112, '2018-06-20 05:22:18', 47.000, 7.00, 4, 2, 5, NULL, NULL);
INSERT INTO public.movest VALUES (128, '2018-04-17 01:01:37', 37.000, 16.00, 2, 1, 78, NULL, NULL);
INSERT INTO public.movest VALUES (24, '2018-06-21 10:01:44', 26.000, 15.00, 1, 1, 9, NULL, NULL);
INSERT INTO public.movest VALUES (83, '2018-06-23 00:45:20', 37.000, 6.00, 2, 3, 27, NULL, NULL);
INSERT INTO public.movest VALUES (119, '2018-05-27 01:08:54', 1.000, 9.00, 4, 4, 17, NULL, NULL);
INSERT INTO public.movest VALUES (59, '2018-06-23 23:22:43', 17.000, 10.00, 4, 1, 59, NULL, NULL);
INSERT INTO public.movest VALUES (107, '2018-04-25 15:09:45', 12.000, 20.00, 2, 2, 24, NULL, NULL);
INSERT INTO public.movest VALUES (30, '2018-05-02 03:24:47', 21.000, 14.00, 4, 1, 71, NULL, NULL);
INSERT INTO public.movest VALUES (16, '2018-05-20 02:15:40', 36.000, 18.00, 1, 1, 62, NULL, NULL);
INSERT INTO public.movest VALUES (74, '2018-06-22 04:44:36', 50.000, 4.00, 1, 2, 17, NULL, NULL);
INSERT INTO public.movest VALUES (39, '2018-04-22 08:28:07', 7.000, 16.00, 2, 1, 83, NULL, NULL);
INSERT INTO public.movest VALUES (101, '2018-07-05 05:32:30', 19.000, 11.00, 1, 5, 91, NULL, NULL);
INSERT INTO public.movest VALUES (72, '2018-05-05 01:14:40', 5.000, 13.00, 4, 1, 77, NULL, NULL);
INSERT INTO public.movest VALUES (140, '2018-05-25 19:31:36', 30.000, 3.00, 3, 2, 74, NULL, NULL);
INSERT INTO public.movest VALUES (57, '2018-06-08 01:31:57', 24.000, 12.00, 2, 1, 66, NULL, NULL);
INSERT INTO public.movest VALUES (3, '2018-06-01 08:56:13', 5.000, 5.00, 4, 4, 60, NULL, NULL);
INSERT INTO public.movest VALUES (77, '2018-05-25 22:33:58', 11.000, 17.00, 2, 3, 16, NULL, NULL);
INSERT INTO public.movest VALUES (141, '2018-06-16 03:36:24', 40.000, 20.00, 5, 2, 27, NULL, NULL);
INSERT INTO public.movest VALUES (73, '2018-04-13 21:53:26', 44.000, 20.00, 5, 4, 13, NULL, NULL);
INSERT INTO public.movest VALUES (111, '2018-06-28 14:26:14', 43.000, 9.00, 5, 3, 98, NULL, NULL);
INSERT INTO public.movest VALUES (148, '2018-07-06 23:35:57', 45.000, 11.00, 5, 5, 27, NULL, NULL);
INSERT INTO public.movest VALUES (40, '2018-06-13 01:02:45', 25.000, 6.00, 2, 5, 26, NULL, NULL);
INSERT INTO public.movest VALUES (109, '2018-07-05 21:13:57', 21.000, 18.00, 4, 2, 80, NULL, NULL);
INSERT INTO public.movest VALUES (137, '2018-06-07 15:30:19', 38.000, 3.00, 1, 2, 65, NULL, NULL);
INSERT INTO public.movest VALUES (113, '2018-04-26 04:22:40', 16.000, 14.00, 5, 2, 6, NULL, NULL);
INSERT INTO public.movest VALUES (72, '2018-06-15 07:48:23', 3.000, 10.00, 2, 3, 49, NULL, NULL);
INSERT INTO public.movest VALUES (30, '2018-06-11 03:37:30', 39.000, 9.00, 3, 2, 98, NULL, NULL);
INSERT INTO public.movest VALUES (71, '2018-06-16 12:33:19', 42.000, 15.00, 1, 5, 22, NULL, NULL);
INSERT INTO public.movest VALUES (105, '2018-05-30 23:19:34', 8.000, 20.00, 2, 2, 52, NULL, NULL);
INSERT INTO public.movest VALUES (70, '2018-04-24 06:32:26', 42.000, 10.00, 5, 4, 23, NULL, NULL);
INSERT INTO public.movest VALUES (71, '2018-05-03 06:18:51', 47.000, 19.00, 1, 4, 34, NULL, NULL);
INSERT INTO public.movest VALUES (73, '2018-06-21 19:17:38', 3.000, 14.00, 4, 3, 2, NULL, NULL);
INSERT INTO public.movest VALUES (27, '2018-04-15 22:26:19', 9.000, 20.00, 1, 3, 59, NULL, NULL);
INSERT INTO public.movest VALUES (54, '2018-04-22 15:09:01', 41.000, 14.00, 4, 3, 95, NULL, NULL);
INSERT INTO public.movest VALUES (49, '2018-07-02 02:46:16', 27.000, 5.00, 3, 2, 24, NULL, NULL);
INSERT INTO public.movest VALUES (25, '2018-06-24 10:47:13', 35.000, 17.00, 3, 1, 88, NULL, NULL);
INSERT INTO public.movest VALUES (149, '2018-06-23 09:50:34', 8.000, 19.00, 2, 5, 89, NULL, NULL);
INSERT INTO public.movest VALUES (5, '2018-05-30 02:05:02', 30.000, 16.00, 5, 4, 91, NULL, NULL);
INSERT INTO public.movest VALUES (138, '2018-04-30 21:42:01', 17.000, 17.00, 4, 1, 27, NULL, NULL);
INSERT INTO public.movest VALUES (138, '2018-05-29 18:48:18', 6.000, 18.00, 3, 4, 46, NULL, NULL);
INSERT INTO public.movest VALUES (131, '2018-05-14 12:56:52', 22.000, 7.00, 3, 5, 8, NULL, NULL);
INSERT INTO public.movest VALUES (65, '2018-04-20 02:44:05', 1.000, 19.00, 1, 2, 54, NULL, NULL);
INSERT INTO public.movest VALUES (83, '2018-06-04 06:08:45', 40.000, 13.00, 2, 5, 67, NULL, NULL);
INSERT INTO public.movest VALUES (108, '2018-06-15 20:11:50', 43.000, 3.00, 2, 4, 70, NULL, NULL);
INSERT INTO public.movest VALUES (93, '2019-01-07 21:25:57', 20.000, 8.00, 4, 4, 59, NULL, NULL);
INSERT INTO public.movest VALUES (91, '2018-11-16 14:22:15', 24.000, 12.00, 3, 3, 20, NULL, NULL);
INSERT INTO public.movest VALUES (93, '2018-12-24 07:04:10', 26.000, 13.00, 2, 3, 68, NULL, NULL);
INSERT INTO public.movest VALUES (92, '2018-11-18 07:37:43', 31.000, 18.00, 1, 3, 41, NULL, NULL);
INSERT INTO public.movest VALUES (97, '2018-12-31 23:47:44', 14.000, 18.00, 4, 4, 79, NULL, NULL);
INSERT INTO public.movest VALUES (100, '2018-10-28 05:09:43', 29.000, 12.00, 2, 5, 75, NULL, NULL);
INSERT INTO public.movest VALUES (94, '2018-11-13 17:08:12', 34.000, 4.00, 1, 1, 50, NULL, NULL);
INSERT INTO public.movest VALUES (95, '2019-01-04 10:36:37', 34.000, 19.00, 4, 3, 54, NULL, NULL);
INSERT INTO public.movest VALUES (97, '2018-10-27 18:52:14', 13.000, 16.00, 2, 4, 32, NULL, NULL);
INSERT INTO public.movest VALUES (92, '2018-11-07 22:18:55', 17.000, 13.00, 5, 1, 37, NULL, NULL);
INSERT INTO public.movest VALUES (98, '2018-11-17 08:33:06', 34.000, 8.00, 4, 2, 10, NULL, NULL);
INSERT INTO public.movest VALUES (6, '2018-06-25 18:26:42', 12.000, 15.00, 3, 5, 38, NULL, NULL);
INSERT INTO public.movest VALUES (37, '2018-06-23 08:47:14', 29.000, 2.00, 3, 5, 21, NULL, NULL);
INSERT INTO public.movest VALUES (86, '2018-07-07 08:36:58', 37.000, 12.00, 2, 1, 44, NULL, NULL);
INSERT INTO public.movest VALUES (11, '2018-05-12 03:12:35', 10.000, 17.00, 1, 3, 80, NULL, NULL);
INSERT INTO public.movest VALUES (52, '2018-06-20 22:14:46', 12.000, 13.00, 1, 1, 34, NULL, NULL);
INSERT INTO public.movest VALUES (81, '2018-04-18 11:59:34', 48.000, 16.00, 1, 5, 4, NULL, NULL);
INSERT INTO public.movest VALUES (129, '2018-04-21 08:06:31', 33.000, 3.00, 2, 5, 31, NULL, NULL);
INSERT INTO public.movest VALUES (105, '2018-06-16 23:22:42', 27.000, 12.00, 2, 1, 23, NULL, NULL);
INSERT INTO public.movest VALUES (27, '2018-06-22 18:30:40', 48.000, 20.00, 4, 4, 60, NULL, NULL);
INSERT INTO public.movest VALUES (82, '2018-06-22 07:32:30', 6.000, 20.00, 3, 4, 49, NULL, NULL);
INSERT INTO public.movest VALUES (81, '2018-06-04 21:04:41', 11.000, 3.00, 4, 2, 22, NULL, NULL);
INSERT INTO public.movest VALUES (118, '2018-06-28 01:46:17', 20.000, 4.00, 1, 4, 59, NULL, NULL);
INSERT INTO public.movest VALUES (63, '2018-04-28 00:45:54', 48.000, 11.00, 1, 1, 22, NULL, NULL);
INSERT INTO public.movest VALUES (29, '2018-04-21 16:03:30', 18.000, 10.00, 3, 4, 40, NULL, NULL);
INSERT INTO public.movest VALUES (81, '2018-06-06 16:58:29', 22.000, 12.00, 1, 5, 63, NULL, NULL);
INSERT INTO public.movest VALUES (147, '2018-04-26 02:03:30', 22.000, 14.00, 5, 3, 39, NULL, NULL);
INSERT INTO public.movest VALUES (123, '2018-06-01 20:31:01', 42.000, 14.00, 1, 1, 66, NULL, NULL);
INSERT INTO public.movest VALUES (116, '2018-06-20 00:36:56', 2.000, 16.00, 5, 1, 85, NULL, NULL);
INSERT INTO public.movest VALUES (146, '2018-06-24 16:24:07', 36.000, 17.00, 4, 1, 100, NULL, NULL);
INSERT INTO public.movest VALUES (128, '2018-04-12 16:38:02', 24.000, 17.00, 1, 3, 44, NULL, NULL);
INSERT INTO public.movest VALUES (2, '2018-06-02 10:17:44', 24.000, 19.00, 4, 4, 74, NULL, NULL);
INSERT INTO public.movest VALUES (51, '2018-04-11 18:22:42', 35.000, 19.00, 4, 3, 83, NULL, NULL);
INSERT INTO public.movest VALUES (147, '2018-04-28 08:47:16', 32.000, 6.00, 5, 3, 19, NULL, NULL);
INSERT INTO public.movest VALUES (116, '2018-06-29 18:57:14', 14.000, 18.00, 2, 5, 45, NULL, NULL);
INSERT INTO public.movest VALUES (116, '2018-06-22 18:12:45', 6.000, 8.00, 2, 4, 95, NULL, NULL);
INSERT INTO public.movest VALUES (111, '2018-06-03 00:03:46', 8.000, 17.00, 1, 2, 22, NULL, NULL);
INSERT INTO public.movest VALUES (54, '2018-06-28 15:42:38', 39.000, 9.00, 1, 4, 35, NULL, NULL);
INSERT INTO public.movest VALUES (77, '2018-07-07 11:34:53', 14.000, 10.00, 4, 3, 7, NULL, NULL);
INSERT INTO public.movest VALUES (38, '2018-04-20 10:23:25', 38.000, 16.00, 5, 5, 61, NULL, NULL);
INSERT INTO public.movest VALUES (126, '2018-04-17 08:33:26', 37.000, 19.00, 3, 5, 37, NULL, NULL);
INSERT INTO public.movest VALUES (11, '2018-05-29 06:44:09', 42.000, 19.00, 1, 2, 45, NULL, NULL);
INSERT INTO public.movest VALUES (19, '2018-04-21 10:42:41', 35.000, 15.00, 2, 1, 53, NULL, NULL);
INSERT INTO public.movest VALUES (2, '2018-04-15 21:03:43', 43.000, 5.00, 5, 2, 34, NULL, NULL);
INSERT INTO public.movest VALUES (10, '2018-05-21 10:42:34', 9.000, 14.00, 4, 4, 70, NULL, NULL);
INSERT INTO public.movest VALUES (3, '2018-05-10 05:35:28', 35.000, 20.00, 4, 4, 35, NULL, NULL);
INSERT INTO public.movest VALUES (104, '2018-04-28 13:34:56', 1.000, 12.00, 1, 3, 58, NULL, NULL);
INSERT INTO public.movest VALUES (128, '2018-04-22 16:24:00', 32.000, 18.00, 1, 2, 55, NULL, NULL);
INSERT INTO public.movest VALUES (53, '2018-06-30 20:55:28', 43.000, 3.00, 3, 4, 58, NULL, NULL);
INSERT INTO public.movest VALUES (148, '2018-04-23 22:48:02', 17.000, 10.00, 1, 4, 83, NULL, NULL);
INSERT INTO public.movest VALUES (49, '2018-07-06 14:48:56', 2.000, 8.00, 5, 4, 86, NULL, NULL);
INSERT INTO public.movest VALUES (45, '2018-06-18 23:50:25', 36.000, 19.00, 2, 4, 57, NULL, NULL);
INSERT INTO public.movest VALUES (76, '2018-05-19 05:30:45', 3.000, 2.00, 1, 4, 20, NULL, NULL);
INSERT INTO public.movest VALUES (20, '2018-07-02 21:14:58', 15.000, 15.00, 4, 5, 71, NULL, NULL);
INSERT INTO public.movest VALUES (67, '2018-05-18 12:10:35', 2.000, 16.00, 4, 5, 19, NULL, NULL);
INSERT INTO public.movest VALUES (119, '2018-04-27 11:32:19', 48.000, 10.00, 4, 4, 37, NULL, NULL);
INSERT INTO public.movest VALUES (145, '2018-05-18 17:57:04', 43.000, 16.00, 2, 1, 32, NULL, NULL);
INSERT INTO public.movest VALUES (136, '2018-04-08 07:21:37', 18.000, 7.00, 1, 1, 12, NULL, NULL);
INSERT INTO public.movest VALUES (34, '2018-07-01 11:33:45', 49.000, 6.00, 5, 2, 25, NULL, NULL);
INSERT INTO public.movest VALUES (1, '2018-05-10 01:34:55', 25.000, 8.00, 4, 1, 76, NULL, NULL);
INSERT INTO public.movest VALUES (43, '2018-07-04 11:40:43', 11.000, 2.00, 1, 3, 5, NULL, NULL);
INSERT INTO public.movest VALUES (36, '2018-06-06 03:15:00', 5.000, 11.00, 4, 5, 21, NULL, NULL);
INSERT INTO public.movest VALUES (16, '2018-05-22 09:22:00', 36.000, 6.00, 2, 3, 52, NULL, NULL);
INSERT INTO public.movest VALUES (132, '2018-05-08 04:44:38', 44.000, 4.00, 3, 4, 65, NULL, NULL);
INSERT INTO public.movest VALUES (140, '2018-06-28 18:25:15', 32.000, 2.00, 1, 3, 27, NULL, NULL);
INSERT INTO public.movest VALUES (14, '2018-06-09 05:04:42', 43.000, 12.00, 3, 1, 94, NULL, NULL);
INSERT INTO public.movest VALUES (41, '2018-05-29 10:02:08', 47.000, 5.00, 1, 3, 99, NULL, NULL);
INSERT INTO public.movest VALUES (33, '2018-06-21 06:05:08', 18.000, 10.00, 3, 4, 10, NULL, NULL);
INSERT INTO public.movest VALUES (50, '2018-07-04 00:46:04', 38.000, 8.00, 4, 5, 71, NULL, NULL);
INSERT INTO public.movest VALUES (26, '2018-04-15 06:43:18', 40.000, 3.00, 1, 1, 85, NULL, NULL);
INSERT INTO public.movest VALUES (149, '2018-06-18 00:19:59', 3.000, 6.00, 5, 2, 31, NULL, NULL);
INSERT INTO public.movest VALUES (62, '2018-06-15 00:08:54', 6.000, 2.00, 3, 3, 75, NULL, NULL);
INSERT INTO public.movest VALUES (85, '2018-05-22 00:17:09', 14.000, 2.00, 5, 2, 50, NULL, NULL);
INSERT INTO public.movest VALUES (133, '2018-06-15 23:37:14', 5.000, 19.00, 1, 1, 85, NULL, NULL);
INSERT INTO public.movest VALUES (51, '2018-06-26 21:38:09', 41.000, 15.00, 2, 4, 82, NULL, NULL);
INSERT INTO public.movest VALUES (81, '2018-04-10 10:47:03', 19.000, 13.00, 1, 5, 80, NULL, NULL);
INSERT INTO public.movest VALUES (35, '2018-09-05 09:50:07', 38.000, 16.00, 5, 4, 27, NULL, NULL);
INSERT INTO public.movest VALUES (73, '2018-08-31 02:55:46', 45.000, 12.00, 2, 5, 29, NULL, NULL);
INSERT INTO public.movest VALUES (140, '2018-07-28 12:09:11', 28.000, 10.00, 2, 5, 8, NULL, NULL);
INSERT INTO public.movest VALUES (68, '2018-07-22 22:43:35', 20.000, 13.00, 3, 2, 90, NULL, NULL);
INSERT INTO public.movest VALUES (129, '2018-08-06 02:13:49', 27.000, 8.00, 5, 4, 12, NULL, NULL);
INSERT INTO public.movest VALUES (18, '2018-07-17 20:03:29', 11.000, 6.00, 5, 4, 66, NULL, NULL);
INSERT INTO public.movest VALUES (123, '2018-07-30 13:48:32', 11.000, 5.00, 5, 3, 100, NULL, NULL);
INSERT INTO public.movest VALUES (142, '2018-08-13 08:47:39', 27.000, 16.00, 4, 1, 100, NULL, NULL);
INSERT INTO public.movest VALUES (104, '2018-08-17 17:37:40', 11.000, 9.00, 2, 2, 97, NULL, NULL);
INSERT INTO public.movest VALUES (95, '2019-01-08 07:42:13', 6.000, 11.00, 1, 1, 10, NULL, NULL);
INSERT INTO public.movest VALUES (99, '2018-11-09 06:11:16', 41.000, 19.00, 4, 2, 86, NULL, NULL);
INSERT INTO public.movest VALUES (98, '2018-12-26 23:04:50', 6.000, 15.00, 2, 4, 89, NULL, NULL);
INSERT INTO public.movest VALUES (92, '2018-11-02 19:36:12', 11.000, 7.00, 4, 1, 30, NULL, NULL);
INSERT INTO public.movest VALUES (98, '2019-01-10 04:30:54', 49.000, 10.00, 4, 2, 99, NULL, NULL);
INSERT INTO public.movest VALUES (93, '2019-03-09 13:28:44', 4.000, 7.00, 5, 2, 19, NULL, NULL);
INSERT INTO public.movest VALUES (66, '2018-09-03 16:36:49', 14.000, 9.00, 1, 5, 51, NULL, NULL);
INSERT INTO public.movest VALUES (147, '2018-08-15 16:48:54', 29.000, 16.00, 2, 3, 73, NULL, NULL);
INSERT INTO public.movest VALUES (26, '2018-09-05 09:07:24', 46.000, 9.00, 5, 5, 11, NULL, NULL);
INSERT INTO public.movest VALUES (2, '2018-08-18 03:27:48', 40.000, 7.00, 2, 3, 22, NULL, NULL);
INSERT INTO public.movest VALUES (114, '2018-08-06 12:25:16', 29.000, 11.00, 4, 5, 41, NULL, NULL);
INSERT INTO public.movest VALUES (65, '2018-08-22 01:48:02', 12.000, 18.00, 4, 5, 59, NULL, NULL);
INSERT INTO public.movest VALUES (22, '2018-07-21 06:55:00', 17.000, 15.00, 2, 5, 39, NULL, NULL);
INSERT INTO public.movest VALUES (88, '2018-08-12 19:03:04', 7.000, 20.00, 3, 3, 52, NULL, NULL);
INSERT INTO public.movest VALUES (69, '2018-07-20 13:31:57', 11.000, 19.00, 4, 4, 73, NULL, NULL);
INSERT INTO public.movest VALUES (119, '2018-09-02 11:30:58', 14.000, 14.00, 1, 1, 95, NULL, NULL);
INSERT INTO public.movest VALUES (84, '2018-07-31 01:34:36', 25.000, 13.00, 1, 1, 73, NULL, NULL);
INSERT INTO public.movest VALUES (140, '2018-09-01 10:09:11', 20.000, 10.00, 3, 3, 8, NULL, NULL);
INSERT INTO public.movest VALUES (101, '2018-08-16 15:06:54', 5.000, 6.00, 3, 1, 60, NULL, NULL);
INSERT INTO public.movest VALUES (27, '2018-07-14 17:47:15', 46.000, 17.00, 3, 4, 53, NULL, NULL);
INSERT INTO public.movest VALUES (33, '2018-07-29 11:23:28', 34.000, 5.00, 2, 4, 54, NULL, NULL);
INSERT INTO public.movest VALUES (26, '2018-08-13 00:19:36', 19.000, 11.00, 1, 2, 6, NULL, NULL);
INSERT INTO public.movest VALUES (150, '2018-08-08 14:00:12', 19.000, 9.00, 4, 4, 1, NULL, NULL);
INSERT INTO public.movest VALUES (43, '2018-07-11 18:32:53', 13.000, 14.00, 1, 1, 64, NULL, NULL);
INSERT INTO public.movest VALUES (144, '2018-07-28 17:00:48', 21.000, 15.00, 4, 3, 71, NULL, NULL);
INSERT INTO public.movest VALUES (107, '2018-07-27 02:31:25', 2.000, 17.00, 3, 5, 53, NULL, NULL);
INSERT INTO public.movest VALUES (70, '2018-07-29 04:28:25', 40.000, 6.00, 1, 2, 33, NULL, NULL);
INSERT INTO public.movest VALUES (84, '2018-07-25 10:40:44', 32.000, 4.00, 1, 2, 36, NULL, NULL);
INSERT INTO public.movest VALUES (39, '2018-08-05 22:31:37', 23.000, 9.00, 5, 4, 79, NULL, NULL);
INSERT INTO public.movest VALUES (40, '2018-09-02 08:30:50', 39.000, 12.00, 3, 1, 23, NULL, NULL);
INSERT INTO public.movest VALUES (70, '2018-08-31 13:35:15', 20.000, 5.00, 5, 3, 5, NULL, NULL);
INSERT INTO public.movest VALUES (90, '2018-07-17 10:15:03', 13.000, 14.00, 1, 5, 34, NULL, NULL);
INSERT INTO public.movest VALUES (22, '2018-08-06 21:52:14', 19.000, 17.00, 4, 5, 48, NULL, NULL);
INSERT INTO public.movest VALUES (146, '2018-07-12 12:17:54', 2.000, 8.00, 3, 4, 78, NULL, NULL);
INSERT INTO public.movest VALUES (147, '2018-07-29 17:48:42', 9.000, 4.00, 4, 5, 76, NULL, NULL);
INSERT INTO public.movest VALUES (86, '2018-07-20 21:17:35', 15.000, 3.00, 4, 4, 78, NULL, NULL);
INSERT INTO public.movest VALUES (33, '2018-07-11 07:07:01', 31.000, 20.00, 2, 1, 51, NULL, NULL);
INSERT INTO public.movest VALUES (60, '2018-08-26 14:57:44', 17.000, 5.00, 3, 1, 60, NULL, NULL);
INSERT INTO public.movest VALUES (46, '2018-07-31 01:33:36', 15.000, 2.00, 4, 4, 1, NULL, NULL);
INSERT INTO public.movest VALUES (86, '2018-07-24 20:00:30', 46.000, 14.00, 1, 5, 44, NULL, NULL);
INSERT INTO public.movest VALUES (85, '2018-08-29 21:37:24', 2.000, 8.00, 5, 3, 74, NULL, NULL);
INSERT INTO public.movest VALUES (12, '2018-07-30 23:21:02', 39.000, 6.00, 4, 5, 41, NULL, NULL);
INSERT INTO public.movest VALUES (71, '2018-07-26 09:19:12', 18.000, 10.00, 1, 5, 39, NULL, NULL);
INSERT INTO public.movest VALUES (59, '2018-08-11 20:26:47', 4.000, 15.00, 1, 1, 23, NULL, NULL);
INSERT INTO public.movest VALUES (27, '2018-07-25 12:43:20', 40.000, 15.00, 4, 1, 52, NULL, NULL);
INSERT INTO public.movest VALUES (32, '2018-07-18 06:18:11', 22.000, 12.00, 3, 2, 28, NULL, NULL);
INSERT INTO public.movest VALUES (102, '2018-08-10 10:17:20', 3.000, 11.00, 2, 4, 14, NULL, NULL);
INSERT INTO public.movest VALUES (4, '2018-08-17 16:55:10', 16.000, 11.00, 5, 2, 71, NULL, NULL);
INSERT INTO public.movest VALUES (138, '2018-07-28 03:00:30', 34.000, 20.00, 3, 4, 47, NULL, NULL);
INSERT INTO public.movest VALUES (111, '2018-08-17 05:16:30', 49.000, 4.00, 2, 5, 34, NULL, NULL);
INSERT INTO public.movest VALUES (62, '2018-07-10 01:00:50', 3.000, 18.00, 5, 4, 73, NULL, NULL);
INSERT INTO public.movest VALUES (8, '2018-08-14 17:11:07', 11.000, 14.00, 3, 5, 52, NULL, NULL);
INSERT INTO public.movest VALUES (8, '2018-07-10 07:28:30', 49.000, 11.00, 2, 4, 95, NULL, NULL);
INSERT INTO public.movest VALUES (43, '2018-07-27 14:23:31', 39.000, 3.00, 1, 4, 39, NULL, NULL);
INSERT INTO public.movest VALUES (118, '2018-08-25 16:41:53', 42.000, 14.00, 5, 5, 51, NULL, NULL);
INSERT INTO public.movest VALUES (88, '2018-08-02 10:55:09', 49.000, 18.00, 1, 2, 16, NULL, NULL);
INSERT INTO public.movest VALUES (76, '2018-08-06 17:11:29', 41.000, 2.00, 4, 5, 65, NULL, NULL);
INSERT INTO public.movest VALUES (17, '2018-07-16 20:54:54', 11.000, 6.00, 5, 2, 31, NULL, NULL);
INSERT INTO public.movest VALUES (113, '2018-07-27 16:32:44', 38.000, 12.00, 3, 3, 99, NULL, NULL);
INSERT INTO public.movest VALUES (23, '2018-07-13 12:40:44', 12.000, 16.00, 2, 5, 16, NULL, NULL);
INSERT INTO public.movest VALUES (145, '2018-09-03 05:58:23', 29.000, 4.00, 2, 3, 99, NULL, NULL);
INSERT INTO public.movest VALUES (73, '2018-07-29 14:34:36', 3.000, 18.00, 2, 5, 89, NULL, NULL);
INSERT INTO public.movest VALUES (50, '2018-08-06 23:20:26', 24.000, 20.00, 5, 5, 55, NULL, NULL);
INSERT INTO public.movest VALUES (124, '2018-07-17 16:05:55', 10.000, 18.00, 5, 3, 12, NULL, NULL);
INSERT INTO public.movest VALUES (148, '2018-08-02 13:38:25', 20.000, 13.00, 4, 2, 89, NULL, NULL);
INSERT INTO public.movest VALUES (69, '2018-08-10 17:43:46', 35.000, 10.00, 1, 5, 18, NULL, NULL);
INSERT INTO public.movest VALUES (102, '2018-07-28 03:27:35', 23.000, 9.00, 3, 2, 41, NULL, NULL);
INSERT INTO public.movest VALUES (29, '2018-09-06 04:52:55', 30.000, 18.00, 4, 1, 70, NULL, NULL);
INSERT INTO public.movest VALUES (78, '2018-08-24 11:38:42', 9.000, 2.00, 2, 3, 91, NULL, NULL);
INSERT INTO public.movest VALUES (117, '2018-09-04 21:47:24', 50.000, 17.00, 2, 4, 67, NULL, NULL);
INSERT INTO public.movest VALUES (152, '2019-03-09 19:50:51', 46.000, 13.00, 5, 5, 11, NULL, NULL);
INSERT INTO public.movest VALUES (173, '2018-12-24 14:22:12', 10.000, 12.00, 4, 4, 18, NULL, NULL);
INSERT INTO public.movest VALUES (157, '2018-12-27 12:47:58', 39.000, 17.00, 3, 2, 21, NULL, NULL);
INSERT INTO public.movest VALUES (180, '2019-01-12 01:12:20', 38.000, 8.00, 3, 4, 64, NULL, NULL);
INSERT INTO public.movest VALUES (159, '2019-02-07 07:15:00', 25.000, 12.00, 5, 3, 16, NULL, NULL);
INSERT INTO public.movest VALUES (161, '2018-12-22 13:30:38', 31.000, 20.00, 5, 2, 12, NULL, NULL);
INSERT INTO public.movest VALUES (181, '2019-03-02 21:02:43', 22.000, 10.00, 2, 5, 87, NULL, NULL);
INSERT INTO public.movest VALUES (165, '2019-01-11 14:12:13', 34.000, 10.00, 2, 4, 35, NULL, NULL);
INSERT INTO public.movest VALUES (157, '2018-12-21 02:31:14', 32.000, 3.00, 4, 4, 93, NULL, NULL);
INSERT INTO public.movest VALUES (152, '2019-02-24 05:43:51', 23.000, 11.00, 3, 4, 46, NULL, NULL);
INSERT INTO public.movest VALUES (160, '2019-01-01 21:20:28', 17.000, 4.00, 1, 2, 9, NULL, NULL);
INSERT INTO public.movest VALUES (168, '2019-02-24 20:40:59', 42.000, 6.00, 3, 1, 95, NULL, NULL);
INSERT INTO public.movest VALUES (166, '2019-03-02 05:50:49', 16.000, 18.00, 3, 3, 72, NULL, NULL);
INSERT INTO public.movest VALUES (161, '2019-01-30 11:48:00', 50.000, 20.00, 5, 1, 96, NULL, NULL);
INSERT INTO public.movest VALUES (185, '2019-01-05 18:11:56', 16.000, 11.00, 5, 2, 36, NULL, NULL);
INSERT INTO public.movest VALUES (169, '2019-01-14 13:52:11', 25.000, 18.00, 1, 2, 19, NULL, NULL);
INSERT INTO public.movest VALUES (186, '2019-01-30 03:45:11', 22.000, 6.00, 5, 4, 2, NULL, NULL);
INSERT INTO public.movest VALUES (165, '2018-12-29 18:01:19', 15.000, 12.00, 1, 4, 10, NULL, NULL);
INSERT INTO public.movest VALUES (182, '2019-02-10 15:44:18', 45.000, 10.00, 2, 4, 80, NULL, NULL);
INSERT INTO public.movest VALUES (154, '2019-02-28 01:23:10', 34.000, 4.00, 1, 1, 31, NULL, NULL);
INSERT INTO public.movest VALUES (157, '2018-12-25 21:41:39', 20.000, 17.00, 5, 3, 79, NULL, NULL);
INSERT INTO public.movest VALUES (99, '2019-03-10 14:20:57', 1.000, 6.00, 1, 5, 56, NULL, NULL);
INSERT INTO public.movest VALUES (98, '2019-03-13 19:02:17', 36.000, 9.00, 5, 2, 97, NULL, NULL);
INSERT INTO public.movest VALUES (96, '2019-02-24 16:53:30', 14.000, 9.00, 2, 4, 87, NULL, NULL);
INSERT INTO public.movest VALUES (93, '2019-02-28 17:36:02', 24.000, 11.00, 5, 5, 27, NULL, NULL);
INSERT INTO public.movest VALUES (151, '2018-12-22 20:34:01', 35.000, 12.00, 4, 1, 85, NULL, NULL);
INSERT INTO public.movest VALUES (157, '2019-02-16 05:01:42', 47.000, 11.00, 2, 2, 60, NULL, NULL);
INSERT INTO public.movest VALUES (182, '2019-01-06 03:15:39', 20.000, 13.00, 2, 3, 68, NULL, NULL);
INSERT INTO public.movest VALUES (161, '2019-02-11 00:33:23', 22.000, 11.00, 2, 2, 50, NULL, NULL);
INSERT INTO public.movest VALUES (172, '2019-02-22 21:52:23', 6.000, 10.00, 5, 4, 86, NULL, NULL);
INSERT INTO public.movest VALUES (158, '2018-12-21 00:03:37', 35.000, 12.00, 5, 4, 98, NULL, NULL);
INSERT INTO public.movest VALUES (171, '2019-02-01 16:10:18', 10.000, 3.00, 1, 4, 91, NULL, NULL);
INSERT INTO public.movest VALUES (163, '2018-12-15 10:58:28', 17.000, 20.00, 1, 4, 88, NULL, NULL);
INSERT INTO public.movest VALUES (188, '2019-01-27 13:36:39', 50.000, 12.00, 2, 3, 16, NULL, NULL);
INSERT INTO public.movest VALUES (163, '2019-01-06 16:06:09', 18.000, 8.00, 2, 4, 59, NULL, NULL);
INSERT INTO public.movest VALUES (157, '2018-12-14 20:53:26', 27.000, 7.00, 3, 1, 67, NULL, NULL);
INSERT INTO public.movest VALUES (178, '2019-01-31 21:35:10', 26.000, 20.00, 5, 1, 82, NULL, NULL);
INSERT INTO public.movest VALUES (162, '2019-02-15 05:14:57', 28.000, 10.00, 5, 1, 16, NULL, NULL);
INSERT INTO public.movest VALUES (169, '2019-02-07 19:18:29', 34.000, 15.00, 3, 3, 92, NULL, NULL);
INSERT INTO public.movest VALUES (176, '2019-01-09 11:00:02', 37.000, 14.00, 4, 5, 18, NULL, NULL);
INSERT INTO public.movest VALUES (182, '2019-03-05 01:15:38', 38.000, 4.00, 1, 5, 47, NULL, NULL);
INSERT INTO public.movest VALUES (184, '2019-01-14 00:17:58', 12.000, 17.00, 2, 2, 53, NULL, NULL);
INSERT INTO public.movest VALUES (174, '2019-01-31 12:18:48', 19.000, 2.00, 3, 2, 23, NULL, NULL);
INSERT INTO public.movest VALUES (151, '2019-02-13 02:03:42', 7.000, 8.00, 1, 3, 50, NULL, NULL);
INSERT INTO public.movest VALUES (157, '2019-01-12 05:33:01', 10.000, 10.00, 3, 5, 95, NULL, NULL);
INSERT INTO public.movest VALUES (171, '2019-05-05 07:14:44', 12.000, 5.00, 3, 1, 60, NULL, NULL);
INSERT INTO public.movest VALUES (159, '2019-03-18 21:15:49', 21.000, 2.00, 2, 2, 22, NULL, NULL);
INSERT INTO public.movest VALUES (182, '2019-03-18 02:02:12', 4.000, 6.00, 2, 2, 49, NULL, NULL);
INSERT INTO public.movest VALUES (182, '2019-04-18 12:08:00', 32.000, 17.00, 1, 2, 61, NULL, NULL);
INSERT INTO public.movest VALUES (160, '2019-04-09 03:11:52', 23.000, 5.00, 1, 4, 52, NULL, NULL);
INSERT INTO public.movest VALUES (159, '2019-05-13 12:04:20', 13.000, 12.00, 4, 5, 97, NULL, NULL);
INSERT INTO public.movest VALUES (168, '2019-04-02 17:20:23', 32.000, 6.00, 4, 4, 50, NULL, NULL);
INSERT INTO public.movest VALUES (170, '2019-04-21 00:02:59', 45.000, 7.00, 3, 5, 16, NULL, NULL);
INSERT INTO public.movest VALUES (163, '2019-05-08 09:25:12', 6.000, 18.00, 5, 4, 79, NULL, NULL);
INSERT INTO public.movest VALUES (158, '2019-03-16 11:48:53', 6.000, 20.00, 5, 5, 23, NULL, NULL);
INSERT INTO public.movest VALUES (187, '2019-04-02 23:36:45', 25.000, 18.00, 5, 2, 17, NULL, NULL);
INSERT INTO public.movest VALUES (171, '2019-03-25 05:09:51', 46.000, 3.00, 1, 3, 78, NULL, NULL);
INSERT INTO public.movest VALUES (172, '2019-03-30 19:44:18', 5.000, 16.00, 4, 3, 2, NULL, NULL);
INSERT INTO public.movest VALUES (167, '2019-04-19 15:23:01', 26.000, 5.00, 5, 2, 63, NULL, NULL);
INSERT INTO public.movest VALUES (186, '2019-04-01 16:53:33', 5.000, 20.00, 4, 3, 11, NULL, NULL);
INSERT INTO public.movest VALUES (174, '2019-05-01 17:10:09', 41.000, 8.00, 5, 4, 11, NULL, NULL);
INSERT INTO public.movest VALUES (163, '2019-03-28 15:29:37', 39.000, 2.00, 1, 3, 27, NULL, NULL);
INSERT INTO public.movest VALUES (157, '2019-04-30 01:35:20', 31.000, 11.00, 4, 3, 76, NULL, NULL);
INSERT INTO public.movest VALUES (182, '2019-04-28 10:25:50', 15.000, 4.00, 5, 2, 46, NULL, NULL);
INSERT INTO public.movest VALUES (157, '2019-04-10 16:09:16', 45.000, 6.00, 3, 2, 87, NULL, NULL);
INSERT INTO public.movest VALUES (176, '2019-03-27 10:36:41', 45.000, 3.00, 2, 1, 59, NULL, NULL);
INSERT INTO public.movest VALUES (157, '2019-04-14 23:21:49', 3.000, 2.00, 4, 5, 71, NULL, NULL);


--
-- TOC entry 2954 (class 0 OID 16946)
-- Dependencies: 211
-- Data for Name: nfcompra; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nfcompra VALUES (1000, '2018-05-16', 2);
INSERT INTO public.nfcompra VALUES (1001, '2018-05-17', 1);
INSERT INTO public.nfcompra VALUES (1002, '2018-05-23', 5);
INSERT INTO public.nfcompra VALUES (1003, '2018-05-30', 4);
INSERT INTO public.nfcompra VALUES (1004, '2018-06-04', 2);
INSERT INTO public.nfcompra VALUES (1005, '2018-06-11', 4);
INSERT INTO public.nfcompra VALUES (1007, '2018-06-17', 3);
INSERT INTO public.nfcompra VALUES (1008, '2018-06-18', 2);
INSERT INTO public.nfcompra VALUES (1009, '2018-06-20', 4);
INSERT INTO public.nfcompra VALUES (1010, '2018-06-22', 1);
INSERT INTO public.nfcompra VALUES (1011, '2018-06-26', 4);
INSERT INTO public.nfcompra VALUES (1006, '2018-05-28', 2);


--
-- TOC entry 2955 (class 0 OID 16949)
-- Dependencies: 212
-- Data for Name: nfvenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nfvenda VALUES (1100, '2018-05-17', 2);
INSERT INTO public.nfvenda VALUES (1101, '2018-05-18', 1);
INSERT INTO public.nfvenda VALUES (1102, '2018-05-24', 5);
INSERT INTO public.nfvenda VALUES (1103, '2018-05-31', 4);
INSERT INTO public.nfvenda VALUES (1104, '2018-06-05', 2);
INSERT INTO public.nfvenda VALUES (1105, '2018-06-12', 4);
INSERT INTO public.nfvenda VALUES (1107, '2018-06-18', 3);
INSERT INTO public.nfvenda VALUES (1108, '2018-06-19', 2);
INSERT INTO public.nfvenda VALUES (1109, '2018-06-21', 4);
INSERT INTO public.nfvenda VALUES (1110, '2018-06-23', 1);
INSERT INTO public.nfvenda VALUES (1111, '2018-06-27', 4);
INSERT INTO public.nfvenda VALUES (1106, '2018-05-29', 3);


--
-- TOC entry 2956 (class 0 OID 16952)
-- Dependencies: 213
-- Data for Name: operacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.operacao VALUES (1, 'Compra', 'E');
INSERT INTO public.operacao VALUES (2, 'Venda ', 'S');
INSERT INTO public.operacao VALUES (3, 'Quebra', 'S');
INSERT INTO public.operacao VALUES (4, 'Consumo em produção', 'S');
INSERT INTO public.operacao VALUES (5, 'Devolução', 'E');


--
-- TOC entry 2957 (class 0 OID 16956)
-- Dependencies: 214
-- Data for Name: prateleira; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.prateleira VALUES (1, 25.00, 3.00, 21, 6);
INSERT INTO public.prateleira VALUES (2, 11.00, 12.00, 75, 4);
INSERT INTO public.prateleira VALUES (3, 22.00, 16.00, 125, 6);
INSERT INTO public.prateleira VALUES (4, 38.00, 17.00, 121, 5);
INSERT INTO public.prateleira VALUES (5, 19.00, 19.00, 162, 2);
INSERT INTO public.prateleira VALUES (6, 18.00, 16.00, 179, 10);
INSERT INTO public.prateleira VALUES (7, 43.00, 9.00, 71, 2);
INSERT INTO public.prateleira VALUES (8, 12.00, 17.00, 26, 8);
INSERT INTO public.prateleira VALUES (9, 6.00, 9.00, 112, 1);
INSERT INTO public.prateleira VALUES (10, 20.00, 6.00, 62, 5);
INSERT INTO public.prateleira VALUES (11, 47.00, 7.00, 35, 5);
INSERT INTO public.prateleira VALUES (12, 30.00, 6.00, 101, 3);
INSERT INTO public.prateleira VALUES (13, 20.00, 20.00, 27, 2);
INSERT INTO public.prateleira VALUES (14, 41.00, 9.00, 174, 10);
INSERT INTO public.prateleira VALUES (15, 30.00, 5.00, 177, 3);
INSERT INTO public.prateleira VALUES (16, 37.00, 20.00, 2, 8);
INSERT INTO public.prateleira VALUES (17, 19.00, 7.00, 127, 8);
INSERT INTO public.prateleira VALUES (18, 49.00, 6.00, 35, 2);
INSERT INTO public.prateleira VALUES (19, 3.00, 18.00, 27, 2);
INSERT INTO public.prateleira VALUES (20, 13.00, 19.00, 86, 2);
INSERT INTO public.prateleira VALUES (21, 23.00, 9.00, 162, 8);
INSERT INTO public.prateleira VALUES (22, 18.00, 5.00, 8, 7);
INSERT INTO public.prateleira VALUES (23, 41.00, 4.00, 154, 9);
INSERT INTO public.prateleira VALUES (24, 17.00, 6.00, 131, 7);
INSERT INTO public.prateleira VALUES (25, 43.00, 2.00, 107, 9);
INSERT INTO public.prateleira VALUES (26, 34.00, 5.00, 116, 8);
INSERT INTO public.prateleira VALUES (27, 24.00, 5.00, 130, 9);
INSERT INTO public.prateleira VALUES (28, 37.00, 16.00, 165, 4);
INSERT INTO public.prateleira VALUES (29, 25.00, 12.00, 163, 1);
INSERT INTO public.prateleira VALUES (30, 5.00, 11.00, 162, 3);
INSERT INTO public.prateleira VALUES (31, 16.00, 9.00, 96, 8);
INSERT INTO public.prateleira VALUES (32, 3.00, 7.00, 46, 10);
INSERT INTO public.prateleira VALUES (33, 33.00, 20.00, 24, 6);
INSERT INTO public.prateleira VALUES (34, 11.00, 20.00, 134, 3);
INSERT INTO public.prateleira VALUES (35, 34.00, 7.00, 56, 2);
INSERT INTO public.prateleira VALUES (36, 44.00, 17.00, 90, 9);
INSERT INTO public.prateleira VALUES (37, 10.00, 19.00, 163, 6);
INSERT INTO public.prateleira VALUES (38, 35.00, 13.00, 172, 7);
INSERT INTO public.prateleira VALUES (39, 41.00, 14.00, 131, 3);
INSERT INTO public.prateleira VALUES (40, 26.00, 18.00, 142, 2);
INSERT INTO public.prateleira VALUES (41, 30.00, 4.00, 44, 10);
INSERT INTO public.prateleira VALUES (42, 25.00, 19.00, 21, 10);
INSERT INTO public.prateleira VALUES (43, 33.00, 14.00, 69, 6);
INSERT INTO public.prateleira VALUES (44, 21.00, 11.00, 30, 4);
INSERT INTO public.prateleira VALUES (45, 2.00, 2.00, 109, 3);
INSERT INTO public.prateleira VALUES (46, 29.00, 14.00, 55, 5);
INSERT INTO public.prateleira VALUES (47, 35.00, 19.00, 40, 1);
INSERT INTO public.prateleira VALUES (48, 16.00, 9.00, 109, 4);
INSERT INTO public.prateleira VALUES (49, 40.00, 6.00, 24, 2);
INSERT INTO public.prateleira VALUES (50, 41.00, 11.00, 67, 7);
INSERT INTO public.prateleira VALUES (51, 19.00, 9.00, 107, 1);
INSERT INTO public.prateleira VALUES (52, 40.00, 14.00, 185, 8);
INSERT INTO public.prateleira VALUES (53, 10.00, 12.00, 129, 6);
INSERT INTO public.prateleira VALUES (54, 32.00, 7.00, 175, 3);
INSERT INTO public.prateleira VALUES (55, 29.00, 10.00, 16, 5);
INSERT INTO public.prateleira VALUES (56, 49.00, 4.00, 108, 5);
INSERT INTO public.prateleira VALUES (57, 38.00, 9.00, 107, 3);
INSERT INTO public.prateleira VALUES (58, 49.00, 5.00, 169, 2);
INSERT INTO public.prateleira VALUES (59, 7.00, 8.00, 75, 5);
INSERT INTO public.prateleira VALUES (60, 12.00, 3.00, 11, 8);
INSERT INTO public.prateleira VALUES (61, 40.00, 12.00, 26, 7);
INSERT INTO public.prateleira VALUES (62, 8.00, 17.00, 27, 3);
INSERT INTO public.prateleira VALUES (63, 34.00, 13.00, 176, 2);
INSERT INTO public.prateleira VALUES (64, 46.00, 6.00, 135, 7);
INSERT INTO public.prateleira VALUES (65, 5.00, 8.00, 29, 9);
INSERT INTO public.prateleira VALUES (66, 40.00, 2.00, 160, 8);
INSERT INTO public.prateleira VALUES (67, 18.00, 19.00, 160, 3);
INSERT INTO public.prateleira VALUES (68, 43.00, 10.00, 99, 3);
INSERT INTO public.prateleira VALUES (69, 14.00, 2.00, 181, 1);
INSERT INTO public.prateleira VALUES (70, 46.00, 16.00, 88, 10);
INSERT INTO public.prateleira VALUES (71, 44.00, 2.00, 161, 6);
INSERT INTO public.prateleira VALUES (72, 36.00, 18.00, 17, 2);
INSERT INTO public.prateleira VALUES (73, 40.00, 15.00, 26, 9);
INSERT INTO public.prateleira VALUES (74, 33.00, 10.00, 22, 7);
INSERT INTO public.prateleira VALUES (75, 39.00, 10.00, 95, 7);
INSERT INTO public.prateleira VALUES (76, 43.00, 2.00, 14, 6);
INSERT INTO public.prateleira VALUES (77, 30.00, 11.00, 55, 5);
INSERT INTO public.prateleira VALUES (78, 19.00, 7.00, 95, 9);
INSERT INTO public.prateleira VALUES (79, 14.00, 10.00, 78, 8);
INSERT INTO public.prateleira VALUES (80, 4.00, 11.00, 179, 2);
INSERT INTO public.prateleira VALUES (81, 46.00, 16.00, 36, 2);
INSERT INTO public.prateleira VALUES (82, 33.00, 3.00, 2, 6);
INSERT INTO public.prateleira VALUES (83, 1.00, 2.00, 183, 5);
INSERT INTO public.prateleira VALUES (84, 31.00, 9.00, 30, 4);
INSERT INTO public.prateleira VALUES (85, 36.00, 10.00, 74, 10);
INSERT INTO public.prateleira VALUES (86, 40.00, 5.00, 12, 5);
INSERT INTO public.prateleira VALUES (87, 28.00, 2.00, 6, 3);
INSERT INTO public.prateleira VALUES (88, 28.00, 4.00, 37, 9);
INSERT INTO public.prateleira VALUES (89, 48.00, 10.00, 59, 4);
INSERT INTO public.prateleira VALUES (90, 9.00, 10.00, 95, 3);
INSERT INTO public.prateleira VALUES (91, 38.00, 3.00, 85, 8);
INSERT INTO public.prateleira VALUES (92, 37.00, 3.00, 150, 1);
INSERT INTO public.prateleira VALUES (93, 29.00, 15.00, 86, 5);
INSERT INTO public.prateleira VALUES (94, 15.00, 11.00, 147, 4);
INSERT INTO public.prateleira VALUES (95, 17.00, 3.00, 140, 2);
INSERT INTO public.prateleira VALUES (96, 34.00, 7.00, 154, 8);
INSERT INTO public.prateleira VALUES (97, 35.00, 20.00, 27, 5);
INSERT INTO public.prateleira VALUES (98, 46.00, 14.00, 10, 1);
INSERT INTO public.prateleira VALUES (99, 41.00, 7.00, 45, 1);
INSERT INTO public.prateleira VALUES (100, 38.00, 17.00, 65, 8);
INSERT INTO public.prateleira VALUES (101, 41.00, 18.00, 113, 5);
INSERT INTO public.prateleira VALUES (102, 40.00, 3.00, 104, 4);
INSERT INTO public.prateleira VALUES (103, 6.00, 9.00, 138, 1);
INSERT INTO public.prateleira VALUES (104, 7.00, 18.00, 36, 6);
INSERT INTO public.prateleira VALUES (105, 16.00, 4.00, 183, 10);
INSERT INTO public.prateleira VALUES (106, 26.00, 20.00, 137, 4);
INSERT INTO public.prateleira VALUES (107, 10.00, 7.00, 98, 10);
INSERT INTO public.prateleira VALUES (108, 38.00, 13.00, 31, 5);
INSERT INTO public.prateleira VALUES (109, 13.00, 2.00, 119, 9);
INSERT INTO public.prateleira VALUES (110, 34.00, 14.00, 184, 4);
INSERT INTO public.prateleira VALUES (111, 8.00, 19.00, 27, 2);
INSERT INTO public.prateleira VALUES (112, 19.00, 2.00, 181, 1);
INSERT INTO public.prateleira VALUES (113, 16.00, 17.00, 88, 6);
INSERT INTO public.prateleira VALUES (114, 10.00, 10.00, 130, 9);
INSERT INTO public.prateleira VALUES (115, 14.00, 7.00, 29, 1);
INSERT INTO public.prateleira VALUES (116, 21.00, 5.00, 78, 10);
INSERT INTO public.prateleira VALUES (117, 3.00, 5.00, 98, 6);
INSERT INTO public.prateleira VALUES (118, 38.00, 14.00, 81, 6);
INSERT INTO public.prateleira VALUES (119, 15.00, 5.00, 2, 9);
INSERT INTO public.prateleira VALUES (120, 41.00, 16.00, 135, 5);
INSERT INTO public.prateleira VALUES (121, 44.00, 20.00, 16, 3);
INSERT INTO public.prateleira VALUES (122, 28.00, 17.00, 26, 1);
INSERT INTO public.prateleira VALUES (123, 34.00, 17.00, 105, 4);
INSERT INTO public.prateleira VALUES (124, 49.00, 17.00, 129, 5);
INSERT INTO public.prateleira VALUES (125, 46.00, 19.00, 123, 1);
INSERT INTO public.prateleira VALUES (126, 33.00, 2.00, 99, 3);
INSERT INTO public.prateleira VALUES (127, 24.00, 18.00, 37, 7);
INSERT INTO public.prateleira VALUES (128, 36.00, 5.00, 32, 10);
INSERT INTO public.prateleira VALUES (129, 23.00, 6.00, 125, 5);
INSERT INTO public.prateleira VALUES (130, 23.00, 7.00, 173, 9);
INSERT INTO public.prateleira VALUES (131, 34.00, 5.00, 147, 5);
INSERT INTO public.prateleira VALUES (132, 41.00, 18.00, 83, 2);
INSERT INTO public.prateleira VALUES (133, 10.00, 19.00, 162, 6);
INSERT INTO public.prateleira VALUES (134, 32.00, 8.00, 66, 6);
INSERT INTO public.prateleira VALUES (135, 34.00, 17.00, 118, 6);
INSERT INTO public.prateleira VALUES (136, 50.00, 12.00, 85, 1);
INSERT INTO public.prateleira VALUES (137, 42.00, 15.00, 4, 3);
INSERT INTO public.prateleira VALUES (138, 47.00, 6.00, 2, 2);
INSERT INTO public.prateleira VALUES (139, 10.00, 18.00, 132, 9);
INSERT INTO public.prateleira VALUES (140, 21.00, 13.00, 125, 1);
INSERT INTO public.prateleira VALUES (141, 13.00, 2.00, 45, 9);
INSERT INTO public.prateleira VALUES (142, 16.00, 7.00, 170, 4);
INSERT INTO public.prateleira VALUES (143, 23.00, 16.00, 115, 2);
INSERT INTO public.prateleira VALUES (144, 16.00, 9.00, 157, 2);
INSERT INTO public.prateleira VALUES (145, 8.00, 15.00, 165, 8);
INSERT INTO public.prateleira VALUES (146, 18.00, 11.00, 24, 8);
INSERT INTO public.prateleira VALUES (147, 26.00, 16.00, 100, 9);
INSERT INTO public.prateleira VALUES (148, 15.00, 12.00, 29, 3);
INSERT INTO public.prateleira VALUES (149, 46.00, 5.00, 57, 4);
INSERT INTO public.prateleira VALUES (150, 43.00, 9.00, 171, 6);
INSERT INTO public.prateleira VALUES (151, 29.00, 4.00, 40, 1);
INSERT INTO public.prateleira VALUES (152, 20.00, 12.00, 51, 2);
INSERT INTO public.prateleira VALUES (153, 1.00, 12.00, 34, 1);
INSERT INTO public.prateleira VALUES (154, 19.00, 10.00, 137, 9);
INSERT INTO public.prateleira VALUES (155, 33.00, 13.00, 111, 10);
INSERT INTO public.prateleira VALUES (156, 40.00, 3.00, 158, 3);
INSERT INTO public.prateleira VALUES (157, 22.00, 16.00, 174, 1);
INSERT INTO public.prateleira VALUES (158, 8.00, 10.00, 170, 8);
INSERT INTO public.prateleira VALUES (159, 41.00, 3.00, 146, 4);
INSERT INTO public.prateleira VALUES (160, 29.00, 9.00, 44, 5);
INSERT INTO public.prateleira VALUES (161, 24.00, 2.00, 117, 7);
INSERT INTO public.prateleira VALUES (162, 29.00, 5.00, 38, 6);
INSERT INTO public.prateleira VALUES (163, 22.00, 10.00, 138, 1);
INSERT INTO public.prateleira VALUES (164, 21.00, 13.00, 164, 3);
INSERT INTO public.prateleira VALUES (165, 26.00, 9.00, 134, 10);
INSERT INTO public.prateleira VALUES (166, 46.00, 14.00, 113, 10);
INSERT INTO public.prateleira VALUES (167, 9.00, 16.00, 135, 10);
INSERT INTO public.prateleira VALUES (168, 11.00, 19.00, 98, 4);
INSERT INTO public.prateleira VALUES (169, 34.00, 14.00, 142, 4);
INSERT INTO public.prateleira VALUES (170, 4.00, 6.00, 187, 8);
INSERT INTO public.prateleira VALUES (171, 3.00, 8.00, 100, 10);
INSERT INTO public.prateleira VALUES (172, 29.00, 6.00, 2, 5);
INSERT INTO public.prateleira VALUES (173, 33.00, 6.00, 111, 5);
INSERT INTO public.prateleira VALUES (174, 34.00, 14.00, 39, 7);
INSERT INTO public.prateleira VALUES (175, 48.00, 17.00, 69, 6);
INSERT INTO public.prateleira VALUES (176, 14.00, 13.00, 42, 1);
INSERT INTO public.prateleira VALUES (177, 17.00, 7.00, 104, 4);
INSERT INTO public.prateleira VALUES (178, 9.00, 5.00, 101, 10);
INSERT INTO public.prateleira VALUES (179, 20.00, 4.00, 158, 8);
INSERT INTO public.prateleira VALUES (180, 44.00, 13.00, 60, 2);
INSERT INTO public.prateleira VALUES (181, 6.00, 10.00, 152, 10);
INSERT INTO public.prateleira VALUES (182, 15.00, 7.00, 24, 4);
INSERT INTO public.prateleira VALUES (183, 14.00, 11.00, 134, 2);
INSERT INTO public.prateleira VALUES (184, 30.00, 11.00, 118, 9);
INSERT INTO public.prateleira VALUES (185, 37.00, 2.00, 70, 10);
INSERT INTO public.prateleira VALUES (186, 29.00, 9.00, 25, 10);
INSERT INTO public.prateleira VALUES (187, 7.00, 14.00, 148, 6);
INSERT INTO public.prateleira VALUES (188, 13.00, 6.00, 172, 4);
INSERT INTO public.prateleira VALUES (189, 10.00, 14.00, 59, 1);
INSERT INTO public.prateleira VALUES (190, 10.00, 7.00, 62, 8);
INSERT INTO public.prateleira VALUES (191, 4.00, 9.00, 137, 9);
INSERT INTO public.prateleira VALUES (192, 3.00, 8.00, 108, 5);
INSERT INTO public.prateleira VALUES (193, 14.00, 15.00, 94, 2);
INSERT INTO public.prateleira VALUES (194, 13.00, 2.00, 90, 8);
INSERT INTO public.prateleira VALUES (195, 29.00, 7.00, 12, 10);
INSERT INTO public.prateleira VALUES (196, 7.00, 2.00, 136, 3);
INSERT INTO public.prateleira VALUES (197, 19.00, 8.00, 113, 9);
INSERT INTO public.prateleira VALUES (198, 49.00, 12.00, 68, 8);
INSERT INTO public.prateleira VALUES (199, 36.00, 10.00, 31, 5);
INSERT INTO public.prateleira VALUES (200, 42.00, 4.00, 13, 6);


--
-- TOC entry 2958 (class 0 OID 16959)
-- Dependencies: 215
-- Data for Name: prodnfcompra; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.prodnfcompra VALUES (1001, 81, 20.000, 12.00);
INSERT INTO public.prodnfcompra VALUES (1003, 69, 10.000, 14.00);
INSERT INTO public.prodnfcompra VALUES (1004, 93, 43.000, 11.00);
INSERT INTO public.prodnfcompra VALUES (1011, 34, 17.000, 3.00);
INSERT INTO public.prodnfcompra VALUES (1009, 36, 40.000, 19.00);
INSERT INTO public.prodnfcompra VALUES (1003, 110, 2.000, 8.00);
INSERT INTO public.prodnfcompra VALUES (1011, 46, 19.000, 19.00);
INSERT INTO public.prodnfcompra VALUES (1004, 133, 19.000, 13.00);
INSERT INTO public.prodnfcompra VALUES (1001, 113, 15.000, 18.00);
INSERT INTO public.prodnfcompra VALUES (1008, 98, 8.000, 4.00);
INSERT INTO public.prodnfcompra VALUES (1009, 35, 39.000, 9.00);
INSERT INTO public.prodnfcompra VALUES (1001, 61, 41.000, 18.00);
INSERT INTO public.prodnfcompra VALUES (1011, 122, 1.000, 11.00);
INSERT INTO public.prodnfcompra VALUES (1001, 150, 46.000, 8.00);
INSERT INTO public.prodnfcompra VALUES (1006, 23, 8.000, 4.00);
INSERT INTO public.prodnfcompra VALUES (1001, 42, 44.000, 14.00);
INSERT INTO public.prodnfcompra VALUES (1008, 48, 35.000, 3.00);
INSERT INTO public.prodnfcompra VALUES (1001, 9, 18.000, 9.00);
INSERT INTO public.prodnfcompra VALUES (1011, 12, 32.000, 14.00);
INSERT INTO public.prodnfcompra VALUES (1001, 77, 8.000, 3.00);
INSERT INTO public.prodnfcompra VALUES (1007, 94, 8.000, 7.00);
INSERT INTO public.prodnfcompra VALUES (1008, 92, 37.000, 19.00);
INSERT INTO public.prodnfcompra VALUES (1009, 123, 31.000, 20.00);
INSERT INTO public.prodnfcompra VALUES (1002, 148, 38.000, 13.00);
INSERT INTO public.prodnfcompra VALUES (1009, 79, 36.000, 6.00);
INSERT INTO public.prodnfcompra VALUES (1005, 40, 36.000, 12.00);
INSERT INTO public.prodnfcompra VALUES (1010, 74, 37.000, 8.00);
INSERT INTO public.prodnfcompra VALUES (1005, 88, 2.000, 12.00);
INSERT INTO public.prodnfcompra VALUES (1010, 71, 36.000, 3.00);
INSERT INTO public.prodnfcompra VALUES (1007, 7, 28.000, 10.00);
INSERT INTO public.prodnfcompra VALUES (1003, 126, 4.000, 10.00);
INSERT INTO public.prodnfcompra VALUES (1008, 117, 48.000, 11.00);
INSERT INTO public.prodnfcompra VALUES (1010, 92, 12.000, 7.00);
INSERT INTO public.prodnfcompra VALUES (1007, 113, 8.000, 13.00);
INSERT INTO public.prodnfcompra VALUES (1011, 139, 19.000, 20.00);
INSERT INTO public.prodnfcompra VALUES (1003, 32, 44.000, 17.00);
INSERT INTO public.prodnfcompra VALUES (1005, 114, 15.000, 3.00);
INSERT INTO public.prodnfcompra VALUES (1010, 38, 22.000, 15.00);
INSERT INTO public.prodnfcompra VALUES (1001, 62, 39.000, 13.00);
INSERT INTO public.prodnfcompra VALUES (1008, 91, 46.000, 10.00);
INSERT INTO public.prodnfcompra VALUES (1008, 121, 27.000, 14.00);
INSERT INTO public.prodnfcompra VALUES (1007, 145, 49.000, 15.00);
INSERT INTO public.prodnfcompra VALUES (1003, 4, 30.000, 16.00);
INSERT INTO public.prodnfcompra VALUES (1010, 142, 18.000, 5.00);
INSERT INTO public.prodnfcompra VALUES (1011, 149, 25.000, 16.00);
INSERT INTO public.prodnfcompra VALUES (1009, 66, 39.000, 17.00);
INSERT INTO public.prodnfcompra VALUES (1010, 150, 47.000, 11.00);
INSERT INTO public.prodnfcompra VALUES (1000, 18, 25.000, 10.00);
INSERT INTO public.prodnfcompra VALUES (1001, 95, 2.000, 8.00);
INSERT INTO public.prodnfcompra VALUES (1010, 97, 44.000, 9.00);
INSERT INTO public.prodnfcompra VALUES (1001, 124, 34.000, 10.00);
INSERT INTO public.prodnfcompra VALUES (1004, 140, 12.000, 10.00);
INSERT INTO public.prodnfcompra VALUES (1000, 130, 21.000, 4.00);
INSERT INTO public.prodnfcompra VALUES (1008, 10, 26.000, 6.00);
INSERT INTO public.prodnfcompra VALUES (1007, 29, 49.000, 5.00);
INSERT INTO public.prodnfcompra VALUES (1011, 43, 26.000, 12.00);
INSERT INTO public.prodnfcompra VALUES (1008, 113, 42.000, 9.00);
INSERT INTO public.prodnfcompra VALUES (1011, 74, 19.000, 8.00);
INSERT INTO public.prodnfcompra VALUES (1008, 44, 36.000, 9.00);
INSERT INTO public.prodnfcompra VALUES (1008, 126, 50.000, 12.00);
INSERT INTO public.prodnfcompra VALUES (1007, 73, 46.000, 6.00);
INSERT INTO public.prodnfcompra VALUES (1008, 119, 16.000, 17.00);
INSERT INTO public.prodnfcompra VALUES (1002, 79, 26.000, 20.00);
INSERT INTO public.prodnfcompra VALUES (1010, 107, 10.000, 15.00);
INSERT INTO public.prodnfcompra VALUES (1003, 22, 10.000, 18.00);
INSERT INTO public.prodnfcompra VALUES (1001, 49, 14.000, 14.00);
INSERT INTO public.prodnfcompra VALUES (1009, 124, 23.000, 13.00);
INSERT INTO public.prodnfcompra VALUES (1007, 83, 18.000, 19.00);
INSERT INTO public.prodnfcompra VALUES (1003, 93, 32.000, 12.00);
INSERT INTO public.prodnfcompra VALUES (1003, 31, 20.000, 8.00);
INSERT INTO public.prodnfcompra VALUES (1001, 55, 23.000, 18.00);
INSERT INTO public.prodnfcompra VALUES (1000, 23, 46.000, 18.00);
INSERT INTO public.prodnfcompra VALUES (1010, 56, 25.000, 13.00);
INSERT INTO public.prodnfcompra VALUES (1003, 54, 40.000, 6.00);
INSERT INTO public.prodnfcompra VALUES (1003, 138, 50.000, 9.00);
INSERT INTO public.prodnfcompra VALUES (1007, 106, 3.000, 4.00);
INSERT INTO public.prodnfcompra VALUES (1001, 84, 31.000, 5.00);
INSERT INTO public.prodnfcompra VALUES (1006, 76, 27.000, 16.00);
INSERT INTO public.prodnfcompra VALUES (1007, 79, 24.000, 19.00);
INSERT INTO public.prodnfcompra VALUES (1007, 92, 38.000, 17.00);


--
-- TOC entry 2959 (class 0 OID 16962)
-- Dependencies: 216
-- Data for Name: prodnfvenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.prodnfvenda VALUES (1102, 25, 5.000, 8.00);
INSERT INTO public.prodnfvenda VALUES (1104, 50, 15.000, 8.00);
INSERT INTO public.prodnfvenda VALUES (1101, 94, 37.000, 14.00);
INSERT INTO public.prodnfvenda VALUES (1100, 162, 26.000, 8.00);
INSERT INTO public.prodnfvenda VALUES (1101, 57, 7.000, 17.00);
INSERT INTO public.prodnfvenda VALUES (1109, 128, 46.000, 7.00);
INSERT INTO public.prodnfvenda VALUES (1106, 68, 29.000, 3.00);
INSERT INTO public.prodnfvenda VALUES (1109, 89, 36.000, 14.00);
INSERT INTO public.prodnfvenda VALUES (1104, 175, 29.000, 17.00);
INSERT INTO public.prodnfvenda VALUES (1104, 43, 9.000, 18.00);
INSERT INTO public.prodnfvenda VALUES (1105, 141, 48.000, 9.00);
INSERT INTO public.prodnfvenda VALUES (1108, 9, 16.000, 19.00);
INSERT INTO public.prodnfvenda VALUES (1107, 32, 25.000, 13.00);
INSERT INTO public.prodnfvenda VALUES (1109, 141, 30.000, 6.00);
INSERT INTO public.prodnfvenda VALUES (1111, 182, 29.000, 18.00);
INSERT INTO public.prodnfvenda VALUES (1109, 87, 23.000, 10.00);
INSERT INTO public.prodnfvenda VALUES (1108, 41, 24.000, 12.00);
INSERT INTO public.prodnfvenda VALUES (1110, 128, 23.000, 19.00);
INSERT INTO public.prodnfvenda VALUES (1104, 96, 24.000, 18.00);
INSERT INTO public.prodnfvenda VALUES (1111, 102, 38.000, 17.00);
INSERT INTO public.prodnfvenda VALUES (1100, 145, 35.000, 8.00);
INSERT INTO public.prodnfvenda VALUES (1100, 160, 38.000, 16.00);
INSERT INTO public.prodnfvenda VALUES (1109, 30, 20.000, 6.00);
INSERT INTO public.prodnfvenda VALUES (1108, 123, 17.000, 5.00);
INSERT INTO public.prodnfvenda VALUES (1102, 138, 19.000, 4.00);
INSERT INTO public.prodnfvenda VALUES (1108, 15, 46.000, 16.00);
INSERT INTO public.prodnfvenda VALUES (1106, 61, 19.000, 15.00);
INSERT INTO public.prodnfvenda VALUES (1103, 67, 42.000, 8.00);
INSERT INTO public.prodnfvenda VALUES (1101, 112, 21.000, 16.00);
INSERT INTO public.prodnfvenda VALUES (1110, 37, 24.000, 8.00);
INSERT INTO public.prodnfvenda VALUES (1104, 155, 14.000, 14.00);
INSERT INTO public.prodnfvenda VALUES (1101, 91, 39.000, 7.00);
INSERT INTO public.prodnfvenda VALUES (1100, 20, 2.000, 5.00);
INSERT INTO public.prodnfvenda VALUES (1102, 121, 7.000, 10.00);
INSERT INTO public.prodnfvenda VALUES (1110, 142, 29.000, 17.00);
INSERT INTO public.prodnfvenda VALUES (1102, 123, 18.000, 6.00);
INSERT INTO public.prodnfvenda VALUES (1107, 140, 46.000, 14.00);
INSERT INTO public.prodnfvenda VALUES (1101, 33, 19.000, 8.00);
INSERT INTO public.prodnfvenda VALUES (1108, 143, 7.000, 19.00);
INSERT INTO public.prodnfvenda VALUES (1104, 127, 34.000, 19.00);
INSERT INTO public.prodnfvenda VALUES (1103, 22, 12.000, 17.00);
INSERT INTO public.prodnfvenda VALUES (1106, 177, 20.000, 11.00);
INSERT INTO public.prodnfvenda VALUES (1101, 48, 33.000, 10.00);
INSERT INTO public.prodnfvenda VALUES (1108, 95, 13.000, 14.00);
INSERT INTO public.prodnfvenda VALUES (1102, 122, 46.000, 9.00);
INSERT INTO public.prodnfvenda VALUES (1108, 126, 23.000, 4.00);
INSERT INTO public.prodnfvenda VALUES (1103, 70, 29.000, 4.00);
INSERT INTO public.prodnfvenda VALUES (1111, 132, 44.000, 3.00);
INSERT INTO public.prodnfvenda VALUES (1103, 17, 38.000, 9.00);
INSERT INTO public.prodnfvenda VALUES (1107, 176, 31.000, 19.00);
INSERT INTO public.prodnfvenda VALUES (1102, 177, 28.000, 15.00);
INSERT INTO public.prodnfvenda VALUES (1108, 55, 32.000, 6.00);
INSERT INTO public.prodnfvenda VALUES (1107, 41, 50.000, 13.00);
INSERT INTO public.prodnfvenda VALUES (1101, 186, 40.000, 3.00);
INSERT INTO public.prodnfvenda VALUES (1108, 27, 14.000, 18.00);
INSERT INTO public.prodnfvenda VALUES (1110, 165, 44.000, 15.00);
INSERT INTO public.prodnfvenda VALUES (1111, 161, 2.000, 15.00);
INSERT INTO public.prodnfvenda VALUES (1100, 28, 49.000, 11.00);
INSERT INTO public.prodnfvenda VALUES (1108, 155, 43.000, 7.00);
INSERT INTO public.prodnfvenda VALUES (1100, 112, 31.000, 9.00);
INSERT INTO public.prodnfvenda VALUES (1100, 143, 30.000, 14.00);
INSERT INTO public.prodnfvenda VALUES (1100, 49, 9.000, 19.00);
INSERT INTO public.prodnfvenda VALUES (1100, 84, 17.000, 8.00);
INSERT INTO public.prodnfvenda VALUES (1111, 166, 19.000, 17.00);
INSERT INTO public.prodnfvenda VALUES (1110, 133, 19.000, 4.00);
INSERT INTO public.prodnfvenda VALUES (1106, 78, 45.000, 5.00);
INSERT INTO public.prodnfvenda VALUES (1105, 96, 33.000, 10.00);
INSERT INTO public.prodnfvenda VALUES (1100, 72, 33.000, 14.00);
INSERT INTO public.prodnfvenda VALUES (1108, 113, 8.000, 6.00);
INSERT INTO public.prodnfvenda VALUES (1109, 92, 34.000, 18.00);
INSERT INTO public.prodnfvenda VALUES (1109, 36, 35.000, 15.00);
INSERT INTO public.prodnfvenda VALUES (1110, 101, 45.000, 6.00);
INSERT INTO public.prodnfvenda VALUES (1104, 19, 17.000, 14.00);
INSERT INTO public.prodnfvenda VALUES (1109, 10, 12.000, 13.00);
INSERT INTO public.prodnfvenda VALUES (1106, 130, 18.000, 18.00);
INSERT INTO public.prodnfvenda VALUES (1100, 154, 11.000, 10.00);
INSERT INTO public.prodnfvenda VALUES (1104, 91, 5.000, 17.00);
INSERT INTO public.prodnfvenda VALUES (1101, 70, 27.000, 14.00);
INSERT INTO public.prodnfvenda VALUES (1109, 112, 20.000, 19.00);
INSERT INTO public.prodnfvenda VALUES (1102, 96, 1.000, 17.00);


--
-- TOC entry 2960 (class 0 OID 16965)
-- Dependencies: 217
-- Data for Name: prodsec; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2961 (class 0 OID 16968)
-- Dependencies: 218
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.produto VALUES (1, 'Proin', 55.000, 9.00, 5, 3);
INSERT INTO public.produto VALUES (2, 'ac mi', 100.000, 5.00, 5, 2);
INSERT INTO public.produto VALUES (3, 'mi', 19.000, 1.00, 1, 1);
INSERT INTO public.produto VALUES (4, 'Vivamus molestie', 21.000, 9.00, 1, 2);
INSERT INTO public.produto VALUES (5, 'imperdiet', 68.000, 4.00, 7, 3);
INSERT INTO public.produto VALUES (6, 'ac', 48.000, 8.00, 1, 2);
INSERT INTO public.produto VALUES (7, 'vitae', 67.000, 10.00, 2, 3);
INSERT INTO public.produto VALUES (8, 'Phasellus elit pede,', 30.000, 7.00, 4, 2);
INSERT INTO public.produto VALUES (9, 'vel,', 25.000, 7.00, 5, 1);
INSERT INTO public.produto VALUES (10, 'nibh lacinia orci,', 61.000, 7.00, 1, 1);
INSERT INTO public.produto VALUES (11, 'Aenean', 11.000, 10.00, 1, 2);
INSERT INTO public.produto VALUES (12, 'magnis dis parturient', 16.000, 1.00, 5, 2);
INSERT INTO public.produto VALUES (13, 'elit,', 12.000, 8.00, 1, 2);
INSERT INTO public.produto VALUES (14, 'lacinia at, iaculis', 9.000, 7.00, 7, 3);
INSERT INTO public.produto VALUES (15, 'Lorem', 22.000, 2.00, 6, 2);
INSERT INTO public.produto VALUES (16, 'ac mi', 44.000, 8.00, 1, 2);
INSERT INTO public.produto VALUES (17, 'quis', 82.000, 4.00, 1, 3);
INSERT INTO public.produto VALUES (18, 'Aenean', 84.000, 9.00, 7, 2);
INSERT INTO public.produto VALUES (19, 'egestas. Aliquam fringilla', 5.000, 1.00, 4, 1);
INSERT INTO public.produto VALUES (20, 'dui, in sodales', 88.000, 5.00, 3, 1);
INSERT INTO public.produto VALUES (21, 'metus. In nec', 43.000, 3.00, 7, 3);
INSERT INTO public.produto VALUES (22, 'sed turpis nec', 96.000, 8.00, 3, 1);
INSERT INTO public.produto VALUES (23, 'erat. Etiam vestibulum', 82.000, 9.00, 4, 3);
INSERT INTO public.produto VALUES (24, 'Aliquam gravida', 13.000, 2.00, 2, 2);
INSERT INTO public.produto VALUES (25, 'amet lorem semper', 49.000, 8.00, 5, 1);
INSERT INTO public.produto VALUES (26, 'interdum. Sed auctor', 71.000, 7.00, 4, 3);
INSERT INTO public.produto VALUES (27, 'cursus', 77.000, 10.00, 4, 1);
INSERT INTO public.produto VALUES (28, 'faucibus', 59.000, 6.00, 3, 3);
INSERT INTO public.produto VALUES (29, 'dapibus rutrum, justo.', 57.000, 6.00, 4, 3);
INSERT INTO public.produto VALUES (30, 'In', 12.000, 7.00, 6, 2);
INSERT INTO public.produto VALUES (31, 'et, magna.', 31.000, 5.00, 2, 1);
INSERT INTO public.produto VALUES (32, 'a,', 44.000, 3.00, 2, 2);
INSERT INTO public.produto VALUES (33, 'magnis dis parturient', 61.000, 7.00, 7, 1);
INSERT INTO public.produto VALUES (34, 'feugiat tellus lorem', 72.000, 4.00, 7, 3);
INSERT INTO public.produto VALUES (35, 'metus vitae', 76.000, 10.00, 5, 3);
INSERT INTO public.produto VALUES (36, 'nulla. Cras eu', 80.000, 7.00, 5, 2);
INSERT INTO public.produto VALUES (37, 'consectetuer mauris id', 35.000, 6.00, 4, 3);
INSERT INTO public.produto VALUES (38, 'nisi', 13.000, 8.00, 2, 2);
INSERT INTO public.produto VALUES (39, 'hendrerit', 50.000, 10.00, 6, 3);
INSERT INTO public.produto VALUES (40, 'Integer urna.', 76.000, 1.00, 5, 2);
INSERT INTO public.produto VALUES (41, 'posuere', 68.000, 10.00, 6, 2);
INSERT INTO public.produto VALUES (42, 'Sed congue, elit', 95.000, 1.00, 1, 1);
INSERT INTO public.produto VALUES (43, 'arcu vel quam', 95.000, 6.00, 5, 1);
INSERT INTO public.produto VALUES (44, 'auctor vitae,', 50.000, 5.00, 1, 1);
INSERT INTO public.produto VALUES (45, 'fringilla cursus purus.', 95.000, 5.00, 6, 2);
INSERT INTO public.produto VALUES (46, 'habitant', 79.000, 7.00, 7, 1);
INSERT INTO public.produto VALUES (47, 'dui augue', 1.000, 5.00, 1, 3);
INSERT INTO public.produto VALUES (48, 'est ac facilisis', 41.000, 4.00, 4, 2);
INSERT INTO public.produto VALUES (49, 'nulla.', 98.000, 10.00, 1, 1);
INSERT INTO public.produto VALUES (50, 'Mauris quis', 92.000, 8.00, 4, 1);
INSERT INTO public.produto VALUES (51, 'ullamcorper eu, euismod', 36.000, 8.00, 2, 2);
INSERT INTO public.produto VALUES (52, 'lectus sit amet', 48.000, 10.00, 6, 1);
INSERT INTO public.produto VALUES (53, 'aliquet odio. Etiam', 82.000, 10.00, 6, 3);
INSERT INTO public.produto VALUES (54, 'massa', 43.000, 8.00, 5, 3);
INSERT INTO public.produto VALUES (55, 'fringilla est. Mauris', 51.000, 1.00, 4, 2);
INSERT INTO public.produto VALUES (56, 'facilisis lorem tristique', 65.000, 4.00, 5, 3);
INSERT INTO public.produto VALUES (57, 'fringilla. Donec', 41.000, 6.00, 1, 2);
INSERT INTO public.produto VALUES (58, 'et malesuada', 48.000, 7.00, 4, 2);
INSERT INTO public.produto VALUES (59, 'libero dui nec', 65.000, 5.00, 6, 1);
INSERT INTO public.produto VALUES (60, 'a, facilisis', 34.000, 1.00, 2, 1);
INSERT INTO public.produto VALUES (61, 'Suspendisse commodo tincidunt', 44.000, 10.00, 6, 2);
INSERT INTO public.produto VALUES (62, 'tristique aliquet.', 68.000, 9.00, 5, 1);
INSERT INTO public.produto VALUES (63, 'mus.', 37.000, 5.00, 4, 2);
INSERT INTO public.produto VALUES (64, 'ultrices posuere', 83.000, 5.00, 6, 1);
INSERT INTO public.produto VALUES (65, 'dictum', 60.000, 6.00, 6, 1);
INSERT INTO public.produto VALUES (66, 'nec, diam.', 15.000, 3.00, 4, 2);
INSERT INTO public.produto VALUES (67, 'Nullam suscipit, est', 64.000, 6.00, 5, 1);
INSERT INTO public.produto VALUES (68, 'tellus faucibus', 47.000, 2.00, 1, 1);
INSERT INTO public.produto VALUES (69, 'nisi sem', 35.000, 8.00, 2, 3);
INSERT INTO public.produto VALUES (70, 'Aenean massa. Integer', 18.000, 8.00, 6, 1);
INSERT INTO public.produto VALUES (71, 'a, dui. Cras', 55.000, 9.00, 7, 1);
INSERT INTO public.produto VALUES (72, 'dictum eu,', 96.000, 9.00, 7, 2);
INSERT INTO public.produto VALUES (73, 'Nunc mauris', 63.000, 4.00, 7, 1);
INSERT INTO public.produto VALUES (74, 'risus quis diam', 49.000, 5.00, 5, 2);
INSERT INTO public.produto VALUES (75, 'at, velit.', 51.000, 4.00, 4, 1);
INSERT INTO public.produto VALUES (76, 'bibendum fermentum', 81.000, 9.00, 1, 3);
INSERT INTO public.produto VALUES (77, 'nisl', 54.000, 1.00, 6, 1);
INSERT INTO public.produto VALUES (78, 'risus.', 14.000, 7.00, 4, 3);
INSERT INTO public.produto VALUES (79, 'malesuada. Integer', 18.000, 9.00, 4, 2);
INSERT INTO public.produto VALUES (80, 'sem, vitae aliquam', 10.000, 7.00, 5, 1);
INSERT INTO public.produto VALUES (81, 'orci.', 28.000, 9.00, 6, 1);
INSERT INTO public.produto VALUES (82, 'adipiscing non, luctus', 100.000, 5.00, 4, 1);
INSERT INTO public.produto VALUES (83, 'turpis nec mauris', 67.000, 1.00, 4, 3);
INSERT INTO public.produto VALUES (84, 'Fusce mollis. Duis', 94.000, 9.00, 2, 2);
INSERT INTO public.produto VALUES (85, 'dui nec', 48.000, 10.00, 4, 2);
INSERT INTO public.produto VALUES (86, 'eleifend', 80.000, 5.00, 7, 1);
INSERT INTO public.produto VALUES (87, 'neque', 72.000, 7.00, 1, 2);
INSERT INTO public.produto VALUES (88, 'magna. Ut tincidunt', 98.000, 1.00, 1, 2);
INSERT INTO public.produto VALUES (89, 'malesuada augue', 10.000, 4.00, 5, 3);
INSERT INTO public.produto VALUES (90, 'montes, nascetur ridiculus', 12.000, 3.00, 2, 2);
INSERT INTO public.produto VALUES (91, 'enim consequat purus.', 46.000, 2.00, 2, 2);
INSERT INTO public.produto VALUES (92, 'augue porttitor interdum.', 18.000, 10.00, 4, 2);
INSERT INTO public.produto VALUES (93, 'aliquet, metus urna', 1.000, 5.00, 1, 2);
INSERT INTO public.produto VALUES (94, 'tincidunt congue', 44.000, 8.00, 6, 1);
INSERT INTO public.produto VALUES (95, 'Integer urna. Vivamus', 86.000, 9.00, 2, 2);
INSERT INTO public.produto VALUES (96, 'nisl. Quisque', 50.000, 1.00, 7, 1);
INSERT INTO public.produto VALUES (97, 'varius orci,', 26.000, 2.00, 1, 3);
INSERT INTO public.produto VALUES (98, 'adipiscing elit.', 61.000, 10.00, 4, 3);
INSERT INTO public.produto VALUES (99, 'arcu. Curabitur ut', 18.000, 1.00, 3, 2);
INSERT INTO public.produto VALUES (100, 'libero. Proin', 1.000, 5.00, 1, 3);
INSERT INTO public.produto VALUES (101, 'nec,', 72.000, 4.00, 4, 2);
INSERT INTO public.produto VALUES (102, 'nec', 48.000, 5.00, 1, 2);
INSERT INTO public.produto VALUES (103, 'semper, dui lectus', 41.000, 6.00, 6, 3);
INSERT INTO public.produto VALUES (104, 'eu, ligula. Aenean', 23.000, 9.00, 2, 1);
INSERT INTO public.produto VALUES (105, 'accumsan sed,', 2.000, 10.00, 7, 3);
INSERT INTO public.produto VALUES (106, 'penatibus', 4.000, 8.00, 5, 3);
INSERT INTO public.produto VALUES (107, 'auctor', 42.000, 7.00, 5, 1);
INSERT INTO public.produto VALUES (108, 'nascetur ridiculus', 84.000, 5.00, 7, 1);
INSERT INTO public.produto VALUES (109, 'sit amet,', 100.000, 3.00, 3, 3);
INSERT INTO public.produto VALUES (110, 'Mauris', 71.000, 10.00, 7, 1);
INSERT INTO public.produto VALUES (111, 'magna.', 89.000, 10.00, 3, 2);
INSERT INTO public.produto VALUES (112, 'In ornare sagittis', 56.000, 6.00, 7, 3);
INSERT INTO public.produto VALUES (113, 'Donec consectetuer', 85.000, 8.00, 4, 1);
INSERT INTO public.produto VALUES (114, 'Integer eu', 59.000, 1.00, 7, 2);
INSERT INTO public.produto VALUES (115, 'bibendum.', 40.000, 7.00, 6, 2);
INSERT INTO public.produto VALUES (116, 'nibh vulputate', 1.000, 9.00, 3, 2);
INSERT INTO public.produto VALUES (117, 'eros turpis', 6.000, 4.00, 1, 2);
INSERT INTO public.produto VALUES (118, 'magna.', 2.000, 10.00, 4, 1);
INSERT INTO public.produto VALUES (119, 'Nam nulla', 18.000, 10.00, 3, 1);
INSERT INTO public.produto VALUES (120, 'Cum', 61.000, 5.00, 3, 3);
INSERT INTO public.produto VALUES (121, 'dictum placerat,', 4.000, 6.00, 2, 2);
INSERT INTO public.produto VALUES (122, 'cursus.', 14.000, 4.00, 5, 3);
INSERT INTO public.produto VALUES (123, 'pede.', 85.000, 3.00, 7, 3);
INSERT INTO public.produto VALUES (124, 'dignissim', 34.000, 7.00, 7, 1);
INSERT INTO public.produto VALUES (125, 'Nullam suscipit, est', 75.000, 1.00, 5, 1);
INSERT INTO public.produto VALUES (126, 'gravida sagittis.', 15.000, 1.00, 4, 3);
INSERT INTO public.produto VALUES (127, 'urna.', 26.000, 9.00, 1, 2);
INSERT INTO public.produto VALUES (128, 'et magnis dis', 30.000, 7.00, 3, 1);
INSERT INTO public.produto VALUES (129, 'eget mollis lectus', 85.000, 3.00, 5, 3);
INSERT INTO public.produto VALUES (130, 'Fusce mollis.', 12.000, 3.00, 4, 2);
INSERT INTO public.produto VALUES (131, 'aliquet,', 41.000, 3.00, 4, 3);
INSERT INTO public.produto VALUES (132, 'semper tellus id', 91.000, 10.00, 2, 3);
INSERT INTO public.produto VALUES (133, 'ultricies adipiscing, enim', 94.000, 6.00, 4, 1);
INSERT INTO public.produto VALUES (134, 'mauris, rhoncus', 71.000, 4.00, 3, 1);
INSERT INTO public.produto VALUES (135, 'Donec vitae erat', 24.000, 7.00, 1, 2);
INSERT INTO public.produto VALUES (136, 'at augue id', 43.000, 2.00, 4, 3);
INSERT INTO public.produto VALUES (137, 'mollis.', 61.000, 5.00, 3, 2);
INSERT INTO public.produto VALUES (138, 'et netus et', 64.000, 7.00, 4, 1);
INSERT INTO public.produto VALUES (139, 'Nam nulla', 64.000, 4.00, 3, 2);
INSERT INTO public.produto VALUES (140, 'Sed', 51.000, 2.00, 3, 2);
INSERT INTO public.produto VALUES (141, 'Nullam ut nisi', 70.000, 7.00, 3, 1);
INSERT INTO public.produto VALUES (142, 'quis turpis vitae', 62.000, 5.00, 2, 1);
INSERT INTO public.produto VALUES (143, 'non,', 28.000, 10.00, 2, 1);
INSERT INTO public.produto VALUES (144, 'pharetra, felis', 17.000, 9.00, 4, 1);
INSERT INTO public.produto VALUES (145, 'Curabitur dictum.', 42.000, 10.00, 2, 1);
INSERT INTO public.produto VALUES (146, 'Fusce mi lorem,', 13.000, 2.00, 3, 2);
INSERT INTO public.produto VALUES (147, 'consequat dolor', 51.000, 1.00, 7, 2);
INSERT INTO public.produto VALUES (148, 'malesuada', 17.000, 7.00, 4, 3);
INSERT INTO public.produto VALUES (149, 'dignissim.', 3.000, 4.00, 5, 3);
INSERT INTO public.produto VALUES (150, 'ad litora torquent', 21.000, 3.00, 3, 1);
INSERT INTO public.produto VALUES (151, 'cursus. Nunc mauris', 63.000, 9.00, 4, 1);
INSERT INTO public.produto VALUES (152, 'interdum libero', 99.000, 6.00, 4, 2);
INSERT INTO public.produto VALUES (153, 'elit sed', 14.000, 7.00, 7, 3);
INSERT INTO public.produto VALUES (154, 'euismod', 64.000, 6.00, 6, 3);
INSERT INTO public.produto VALUES (155, 'tristique senectus', 81.000, 3.00, 5, 2);
INSERT INTO public.produto VALUES (156, 'sit amet', 46.000, 10.00, 6, 1);
INSERT INTO public.produto VALUES (157, 'Nunc mauris', 35.000, 2.00, 4, 2);
INSERT INTO public.produto VALUES (158, 'elit, a', 49.000, 4.00, 5, 2);
INSERT INTO public.produto VALUES (159, 'libero. Proin', 21.000, 5.00, 7, 2);
INSERT INTO public.produto VALUES (160, 'quis urna.', 44.000, 3.00, 6, 2);
INSERT INTO public.produto VALUES (161, 'molestie tellus.', 2.000, 7.00, 7, 3);
INSERT INTO public.produto VALUES (162, 'et ultrices', 63.000, 1.00, 1, 3);
INSERT INTO public.produto VALUES (163, 'elementum,', 14.000, 4.00, 7, 3);
INSERT INTO public.produto VALUES (164, 'et,', 1.000, 1.00, 3, 3);
INSERT INTO public.produto VALUES (165, 'augue', 91.000, 5.00, 5, 2);
INSERT INTO public.produto VALUES (166, 'tincidunt. Donec', 11.000, 4.00, 7, 3);
INSERT INTO public.produto VALUES (167, 'ut dolor dapibus', 16.000, 3.00, 7, 3);
INSERT INTO public.produto VALUES (168, 'accumsan convallis,', 7.000, 3.00, 3, 3);
INSERT INTO public.produto VALUES (169, 'amet nulla. Donec', 8.000, 3.00, 7, 2);
INSERT INTO public.produto VALUES (170, 'semper tellus', 91.000, 8.00, 6, 3);
INSERT INTO public.produto VALUES (171, 'natoque penatibus', 73.000, 5.00, 4, 2);
INSERT INTO public.produto VALUES (172, 'Integer', 4.000, 5.00, 4, 2);
INSERT INTO public.produto VALUES (173, 'fringilla', 37.000, 7.00, 7, 1);
INSERT INTO public.produto VALUES (174, 'quis turpis vitae', 88.000, 7.00, 7, 2);
INSERT INTO public.produto VALUES (175, 'ipsum nunc id', 27.000, 10.00, 4, 3);
INSERT INTO public.produto VALUES (176, 'amet metus.', 72.000, 3.00, 1, 2);
INSERT INTO public.produto VALUES (177, 'vehicula et, rutrum', 29.000, 3.00, 5, 1);
INSERT INTO public.produto VALUES (178, 'semper', 35.000, 6.00, 2, 3);
INSERT INTO public.produto VALUES (179, 'lectus ante dictum', 77.000, 3.00, 3, 1);
INSERT INTO public.produto VALUES (180, 'dignissim magna a', 35.000, 8.00, 3, 3);
INSERT INTO public.produto VALUES (181, 'eu, euismod', 39.000, 7.00, 7, 3);
INSERT INTO public.produto VALUES (182, 'sed turpis', 22.000, 1.00, 4, 2);
INSERT INTO public.produto VALUES (183, 'Nam consequat dolor', 76.000, 5.00, 4, 1);
INSERT INTO public.produto VALUES (184, 'enim consequat', 38.000, 10.00, 2, 1);
INSERT INTO public.produto VALUES (185, 'sit amet', 66.000, 7.00, 5, 1);
INSERT INTO public.produto VALUES (186, 'Proin', 82.000, 1.00, 4, 1);
INSERT INTO public.produto VALUES (187, 'at pede.', 76.000, 1.00, 2, 2);
INSERT INTO public.produto VALUES (188, 'erat semper', 78.000, 10.00, 4, 1);
INSERT INTO public.produto VALUES (189, 'semper', 50.000, 9.00, 4, 2);
INSERT INTO public.produto VALUES (190, 'id', 22.000, 9.00, 5, 2);
INSERT INTO public.produto VALUES (191, 'quam vel', 6.000, 10.00, 2, 1);
INSERT INTO public.produto VALUES (192, 'massa. Vestibulum accumsan', 59.000, 3.00, 3, 3);
INSERT INTO public.produto VALUES (193, 'arcu ac', 53.000, 1.00, 3, 3);
INSERT INTO public.produto VALUES (194, 'augue eu tellus.', 71.000, 10.00, 3, 1);
INSERT INTO public.produto VALUES (195, 'nibh enim, gravida', 92.000, 5.00, 5, 3);
INSERT INTO public.produto VALUES (196, 'Proin', 95.000, 3.00, 1, 1);
INSERT INTO public.produto VALUES (197, 'consectetuer, cursus', 73.000, 6.00, 2, 1);
INSERT INTO public.produto VALUES (198, 'non', 83.000, 2.00, 6, 1);
INSERT INTO public.produto VALUES (199, 'consectetuer rhoncus. Nullam', 5.000, 1.00, 5, 2);
INSERT INTO public.produto VALUES (200, 'nulla. Donec', 17.000, 4.00, 7, 2);


--
-- TOC entry 2962 (class 0 OID 16971)
-- Dependencies: 219
-- Data for Name: secao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.secao VALUES (1, 100.00, 10);
INSERT INTO public.secao VALUES (2, 120.00, 20);
INSERT INTO public.secao VALUES (3, 80.00, 10);
INSERT INTO public.secao VALUES (4, 80.00, 30);
INSERT INTO public.secao VALUES (5, 100.00, 20);
INSERT INTO public.secao VALUES (6, 50.00, 10);
INSERT INTO public.secao VALUES (7, 50.00, 30);
INSERT INTO public.secao VALUES (8, 70.00, 30);
INSERT INTO public.secao VALUES (9, 100.00, 20);
INSERT INTO public.secao VALUES (10, 80.00, 10);


--
-- TOC entry 2757 (class 2606 OID 16976)
-- Name: cidade pkcidade; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT pkcidade PRIMARY KEY (codcid);


--
-- TOC entry 2761 (class 2606 OID 16978)
-- Name: classfisc pkclassfisc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classfisc
    ADD CONSTRAINT pkclassfisc PRIMARY KEY (codclass);


--
-- TOC entry 2763 (class 2606 OID 16980)
-- Name: cliente pkcliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT pkcliente PRIMARY KEY (codcli);


--
-- TOC entry 2765 (class 2606 OID 16982)
-- Name: departamento pkdepartamento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT pkdepartamento PRIMARY KEY (coddep);


--
-- TOC entry 2767 (class 2606 OID 16984)
-- Name: fechest pkfechest; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fechest
    ADD CONSTRAINT pkfechest PRIMARY KEY (datafech, codprod);


--
-- TOC entry 2769 (class 2606 OID 16986)
-- Name: fornecedor pkfornecedor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT pkfornecedor PRIMARY KEY (codfor);


--
-- TOC entry 2771 (class 2606 OID 16988)
-- Name: funcionario pkfuncionario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT pkfuncionario PRIMARY KEY (matfunc);


--
-- TOC entry 2773 (class 2606 OID 16990)
-- Name: grupoprod pkgrupoprod; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupoprod
    ADD CONSTRAINT pkgrupoprod PRIMARY KEY (codgru);


--
-- TOC entry 2775 (class 2606 OID 16992)
-- Name: movest pkmovest; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movest
    ADD CONSTRAINT pkmovest PRIMARY KEY (codprod, datahora);


--
-- TOC entry 2777 (class 2606 OID 16994)
-- Name: nfcompra pknfcompra; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfcompra
    ADD CONSTRAINT pknfcompra PRIMARY KEY (numnf);


--
-- TOC entry 2779 (class 2606 OID 16996)
-- Name: nfvenda pknfvenda; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfvenda
    ADD CONSTRAINT pknfvenda PRIMARY KEY (numnf);


--
-- TOC entry 2781 (class 2606 OID 16998)
-- Name: operacao pkoperacao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operacao
    ADD CONSTRAINT pkoperacao PRIMARY KEY (codoper);


--
-- TOC entry 2783 (class 2606 OID 17000)
-- Name: prateleira pkprateleira; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prateleira
    ADD CONSTRAINT pkprateleira PRIMARY KEY (numprat);


--
-- TOC entry 2789 (class 2606 OID 17002)
-- Name: prodsec pkprodsec; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodsec
    ADD CONSTRAINT pkprodsec PRIMARY KEY (numsecao, codprod);


--
-- TOC entry 2791 (class 2606 OID 17004)
-- Name: produto pkproduto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT pkproduto PRIMARY KEY (codprod);


--
-- TOC entry 2785 (class 2606 OID 17006)
-- Name: prodnfcompra pkpronfcompra; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodnfcompra
    ADD CONSTRAINT pkpronfcompra PRIMARY KEY (numnf, codprod);


--
-- TOC entry 2787 (class 2606 OID 17008)
-- Name: prodnfvenda pkpronfvenda; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodnfvenda
    ADD CONSTRAINT pkpronfvenda PRIMARY KEY (numnf, codprod);


--
-- TOC entry 2793 (class 2606 OID 17010)
-- Name: secao pksecao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.secao
    ADD CONSTRAINT pksecao PRIMARY KEY (numsecao);


--
-- TOC entry 2759 (class 2606 OID 17012)
-- Name: cidade unnomeufcid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT unnomeufcid UNIQUE (nome, uf);


--
-- TOC entry 2794 (class 2606 OID 17013)
-- Name: cliente fkcodcidcli; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fkcodcidcli FOREIGN KEY (codcid) REFERENCES public.cidade(codcid);


--
-- TOC entry 2796 (class 2606 OID 17018)
-- Name: fornecedor fkcodcidfor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT fkcodcidfor FOREIGN KEY (codcid) REFERENCES public.cidade(codcid);


--
-- TOC entry 2797 (class 2606 OID 17023)
-- Name: funcionario fkcodcidfunc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT fkcodcidfunc FOREIGN KEY (codcid) REFERENCES public.cidade(codcid);


--
-- TOC entry 2816 (class 2606 OID 17028)
-- Name: produto fkcodclassprod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fkcodclassprod FOREIGN KEY (codclass) REFERENCES public.classfisc(codclass);


--
-- TOC entry 2807 (class 2606 OID 17033)
-- Name: nfvenda fkcodclinfv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfvenda
    ADD CONSTRAINT fkcodclinfv FOREIGN KEY (codcli) REFERENCES public.cliente(codcli);


--
-- TOC entry 2798 (class 2606 OID 17038)
-- Name: funcionario fkcoddepfunc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT fkcoddepfunc FOREIGN KEY (coddep) REFERENCES public.departamento(coddep);


--
-- TOC entry 2800 (class 2606 OID 17043)
-- Name: movest fkcoddepmov; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movest
    ADD CONSTRAINT fkcoddepmov FOREIGN KEY (coddep) REFERENCES public.departamento(coddep);


--
-- TOC entry 2806 (class 2606 OID 17048)
-- Name: nfcompra fkcodfornfc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfcompra
    ADD CONSTRAINT fkcodfornfc FOREIGN KEY (codfor) REFERENCES public.fornecedor(codfor);


--
-- TOC entry 2817 (class 2606 OID 17053)
-- Name: produto fkcodgruprod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fkcodgruprod FOREIGN KEY (codgru) REFERENCES public.grupoprod(codgru);


--
-- TOC entry 2801 (class 2606 OID 17058)
-- Name: movest fkcodopermov; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movest
    ADD CONSTRAINT fkcodopermov FOREIGN KEY (codoper) REFERENCES public.operacao(codoper);


--
-- TOC entry 2795 (class 2606 OID 17063)
-- Name: fechest fkcodprod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fechest
    ADD CONSTRAINT fkcodprod FOREIGN KEY (codprod) REFERENCES public.produto(codprod);


--
-- TOC entry 2802 (class 2606 OID 17068)
-- Name: movest fkcodprodmov; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movest
    ADD CONSTRAINT fkcodprodmov FOREIGN KEY (codprod) REFERENCES public.produto(codprod);


--
-- TOC entry 2808 (class 2606 OID 17073)
-- Name: prateleira fkcodprodprat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prateleira
    ADD CONSTRAINT fkcodprodprat FOREIGN KEY (codprod) REFERENCES public.produto(codprod);


--
-- TOC entry 2810 (class 2606 OID 17078)
-- Name: prodnfcompra fkcodprodprc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodnfcompra
    ADD CONSTRAINT fkcodprodprc FOREIGN KEY (codprod) REFERENCES public.produto(codprod);


--
-- TOC entry 2814 (class 2606 OID 17083)
-- Name: prodsec fkcodprodprodsec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodsec
    ADD CONSTRAINT fkcodprodprodsec FOREIGN KEY (codprod) REFERENCES public.produto(codprod);


--
-- TOC entry 2812 (class 2606 OID 17088)
-- Name: prodnfvenda fkcodprodprv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodnfvenda
    ADD CONSTRAINT fkcodprodprv FOREIGN KEY (codprod) REFERENCES public.produto(codprod);


--
-- TOC entry 2803 (class 2606 OID 17093)
-- Name: movest fkfuncrespmov; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movest
    ADD CONSTRAINT fkfuncrespmov FOREIGN KEY (funcresp) REFERENCES public.funcionario(matfunc);


--
-- TOC entry 2799 (class 2606 OID 17098)
-- Name: funcionario fkmatchefefunc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT fkmatchefefunc FOREIGN KEY (matchefe) REFERENCES public.funcionario(matfunc);


--
-- TOC entry 2818 (class 2606 OID 17103)
-- Name: secao fkmatfuncsec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.secao
    ADD CONSTRAINT fkmatfuncsec FOREIGN KEY (matfunc) REFERENCES public.funcionario(matfunc);


--
-- TOC entry 2804 (class 2606 OID 17108)
-- Name: movest fknumnfcompramov; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movest
    ADD CONSTRAINT fknumnfcompramov FOREIGN KEY (numnfcompra) REFERENCES public.nfcompra(numnf);


--
-- TOC entry 2811 (class 2606 OID 17113)
-- Name: prodnfcompra fknumnfprc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodnfcompra
    ADD CONSTRAINT fknumnfprc FOREIGN KEY (numnf) REFERENCES public.nfcompra(numnf);


--
-- TOC entry 2813 (class 2606 OID 17118)
-- Name: prodnfvenda fknumnfprv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodnfvenda
    ADD CONSTRAINT fknumnfprv FOREIGN KEY (numnf) REFERENCES public.nfvenda(numnf);


--
-- TOC entry 2805 (class 2606 OID 17123)
-- Name: movest fknumnfvendamov; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movest
    ADD CONSTRAINT fknumnfvendamov FOREIGN KEY (numnfvenda) REFERENCES public.nfvenda(numnf);


--
-- TOC entry 2809 (class 2606 OID 17128)
-- Name: prateleira fknumsecaoprat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prateleira
    ADD CONSTRAINT fknumsecaoprat FOREIGN KEY (numsecao) REFERENCES public.secao(numsecao);


--
-- TOC entry 2815 (class 2606 OID 17133)
-- Name: prodsec fknumsecaoprodsec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodsec
    ADD CONSTRAINT fknumsecaoprodsec FOREIGN KEY (numsecao) REFERENCES public.secao(numsecao);


-- Completed on 2020-07-27 14:25:49

--
-- PostgreSQL database dump complete
--

