CREATE TABLE pais
(
    codpais INT          NOT NULL,
    nome    VARCHAR(100) NOT NULL,
    CONSTRAINT pk_pais PRIMARY KEY (codpais)
);

SELECT *
FROM pais INSERT INTO pais
VALUES (1, 'Brasil');
DROP TABLE pais;

CREATE TABLE estado
(
    codest  INT          NOT NULL,
    nome    VARCHAR(100) NOT NULL,
    sigla   VARCHAR(2)   NOT NULL,
    codpais INT          NOT NULL,
    CONSTRAINT pk_estado PRIMARY KEY (codest),
    CONSTRAINT fk_codpais_estado FOREIGN KEY (codpais) REFERENCES pais
);

SELECT *
FROM estado INSERT INTO estado
VALUES (1, 'Rio Grande do Sul', 'RS', 1);

CREATE TABLE cidade
(
    codcid INT          NOT NULL,
    nome   VARCHAR(100) NOT NULL,
    codest INT          NOT NULL,
    CONSTRAINT pk_cidade PRIMARY KEY (codcid),
    CONSTRAINT fk_codest_cidade FOREIGN KEY (codest) REFERENCES estado
);

CREATE TABLE usuario
(
    codusu   INT          NOT NULL,
    nome     VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    rg       INT,
    datanasc DATE         NOT NULL,
    codcid   INT          NOT NULL,
    CONSTRAINT pk_usuario PRIMARY KEY (codusu),
    CONSTRAINT fk_codcid_usuario FOREIGN KEY (codcid) REFERENCES cidade
);

ALTER TABLE usuario
    ADD idade INT;
ALTER TABLE usuario
    DROP idade;

SELECT *
FROM usuario;

CREATE TABLE editora
(
    codedit  INT          NOT NULL,
    nome     VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    codcid   INT          NOT NULL,
    CONSTRAINT pk_editora PRIMARY KEY (codedit)
);

ALTER TABLE editora
    ADD CONSTRAINT fd_codcid_editora FOREIGN KEY (codcid)
        REFERENCES cidade;

CREATE TABLE estante
(
    numest    INT          NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    CONSTRAINT pk_estante PRIMARY KEY (numest)
);

CREATE TABLE livro
(
    codlivro INT          NOT NULL,
    titulo   VARCHAR(100) NOT NULL,
    edicao   INT,
    isbn     VARCHAR(15)  NOT NULL,
    codedit  INT          NOT NULL,
    numest   INT          NOT NULL,
    CONSTRAINT pk_livro PRIMARY KEY (codlivro),
    CONSTRAINT fk_codedit_livro FOREIGN KEY (codedit) REFERENCES editora,
    CONSTRAINT fk_numest_livro FOREIGN KEY (numest) REFERENCES estante,
    CONSTRAINT un_isbn_livro UNIQUE (isbn),
    CONSTRAINT chk_edicao_livro CHECK (edicao >= 1)
);

CREATE TABLE autor
(
    codaut   INT          NOT NULL,
    nome     VARCHAR(100) NOT NULL,
    datanasc DATE,
    codcid   INT,
    CONSTRAINT pk_autor PRIMARY KEY (codaut),
    CONSTRAINT fk_codcid_autor FOREIGN KEY (codcid) REFERENCES cidade
);

CREATE TABLE livroautor
(
    codlivro INT NOT NULL,
    codaut   INT NOT NULL,
    CONSTRAINT pk_livroautor PRIMARY KEY (codlivro, codaut),
    CONSTRAINT fk_codlivro_livroautor FOREIGN KEY (codlivro) REFERENCES livro,
    CONSTRAINT fk_codaut_livroautor FOREIGN KEY (codaut) REFERENCES autor
);

CREATE TABLE exemplar
(
    codlivro  INT NOT NULL,
    sequencia INT NOT NULL,
    situacao  CHAR(1),
    CONSTRAINT pk_exemplar PRIMARY KEY (codlivro, sequencia)
);

ALTER TABLE exemplar
    ADD CONSTRAINT fk_codlivro_exemplar FOREIGN KEY (codlivro) REFERENCES livro;

CREATE TABLE categoria
(
    codcat    INT          NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    CONSTRAINT pk_categoria PRIMARY KEY (codcat)
);

CREATE TABLE livrocategoria
(
    codlivro INT NOT NULL,
    codcat   INT NOT NULL,
    CONSTRAINT pk_livrocategoria PRIMARY KEY (codlivro, codcat),
    CONSTRAINT fk_codlivro_livrocategoria FOREIGN KEY (codlivro)
        REFERENCES livro,
    CONSTRAINT fk_codcat_livrocategoria FOREIGN KEY (codcat)
        REFERENCES categoria
);

CREATE TABLE bibliotecario
(
    nummat   INT          NOT NULL,
    nome     VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    dataadm  DATE         NOT NULL,
    valorsal DECIMAL(11, 2),
    codcid   INT          NOT NULL,
    CONSTRAINT pk_bibliotecario PRIMARY KEY (nummat),
    CONSTRAINT fk_codcid_bibliotecario FOREIGN KEY (codcid)
        REFERENCES cidade
);

CREATE TABLE reserva
(
    codres   INT  NOT NULL,
    datares  DATE NOT NULL,
    horares  TIME NOT NULL,
    codlivro INT  NOT NULL,
    codusu   INT  NOT NULL,
    nummat   INT,
    CONSTRAINT pk_reserva PRIMARY KEY (codres),
    CONSTRAINT fk_codlivro_reserva FOREIGN KEY (codlivro)
        REFERENCES livro,
    CONSTRAINT fk_codusu_reserva FOREIGN KEY (codusu)
        REFERENCES usuario,
    CONSTRAINT fk_nummat_reserva FOREIGN KEY (nummat)
        REFERENCES bibliotecario
);

CREATE TABLE retirada
(
    codret      INT  NOT NULL,
    dataret     DATE NOT NULL,
    horaret     TIME NOT NULL,
    dataentprev DATE NOT NULL,
    dataentreal DATE,
    multa       DECIMAL(11, 2),
    codlivro    INT  NOT NULL,
    sequencia   INT  NOT NULL,
    codusu      INT  NOT NULL,
    nummat      INT  NOT NULL,
    codres      INT,
    CONSTRAINT pk_retirada PRIMARY KEY (codret),
    CONSTRAINT fk_codlivrosequencia_retirada FOREIGN KEY (codlivro, sequencia) REFERENCES exemplar,
    CONSTRAINT fk_codusu_retirada FOREIGN KEY (codusu) REFERENCES usuario,
    CONSTRAINT fk_nummat_retirada FOREIGN KEY (nummat) REFERENCES bibliotecario,
    CONSTRAINT fk_codres_retirada FOREIGN KEY (codres) REFERENCES reserva
);