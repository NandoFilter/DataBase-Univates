/* Criar duas procedures que retornem os dados de consultas. A primeira deve trazer o
número de retiradas e a data da última retirada para cada livro em um determinado
período (parâmetros). A segunda deve trazer o número de reservas e a data da última
reserva para cada livro em um período especificado pelos parâmetros. Ambas devem
retornar o código do livro, a contagem e a data. Após a criação das procedures, elas
devem ser usadas em uma consulta que mostre o código, o título, o nome da editora do
livro, além da quantidade de reservas, de retiradas e as datas da última reserva e última
retirada. Testar com períodos diferentes. */

create type t_retiradas_livro as
(
    codlivro  int,
    contagem  bigint,
    maiordata date
);

create or replace function f_retiradas_livro(datainicial date, datafinal date)
    returns setof t_retiradas_livro
as
$$

select r.codlivro, count(r.codret), max(r.dataret)
from retirada r
where r.dataret between datainicial and datafinal
group by r.codlivro

$$ language sql;

create or replace function f_reservas_livro(datainicial date, datafinal date)
    returns setof t_retiradas_livro
as
$$

select r.codlivro, count(r.codres), max(r.datares)
from reserva r
where r.datares between datainicial and datafinal
group by r.codlivro

$$ language sql;

select l.codlivro,
       l.titulo,
       e.nome,
       fret.contagem  qnt_retiradas,
       fres.contagem  qntd_reservas,
       fret.maiordata ultimaretirada,
       fres.maiordata ultimareserva
from f_retiradas_livro('19-01-01', '19-12-31') fret,
     f_reservas_livro('19-01-01', '19-12-31') fres,
     livro l,
     editora e
where fret.codlivro = l.codlivro
  and fres.codlivro = l.codlivro
  and l.codedit = e.codedit;

/* Criar um atributo para armazenar o número de livros que cada editora possui. Para
atualizar este atributo, criar uma procedure que execute uma consulta que retorne o
código da editora e uma contagem de livros por editora. A procedure vai executar a
consulta e armazenar o resultado em um CURSOR. A seguir, é necessário percorrer o
cursor e usar cada registro para atualizar as editoras na tabela editora. Executar um
UPDATE para cada linha do CURSOR. */

ALTER TABLE editora
    ADD numlivros INT;

CREATE OR REPLACE FUNCTION f_atualiza_numlivros_editora()
    RETURNS INTEGER
AS
$$
DECLARE
    cur_livros_editora CURSOR FOR SELECT l.codedit, COUNT(l.codlivro)

                                  FROM livro l
                                  GROUP BY l.codedit;
    vcodedit  INTEGER;
    vcontagem BIGINT;
BEGIN
    UPDATE editora SET numlivros=0;
    OPEN cur_livros_editora;
-- Vai para a primeira linha do cursor
    FETCH cur_livros_editora INTO vcodedit, vcontagem;
    WHILE FOUND
        LOOP
            -- Testa se acabaram os registros
            UPDATE editora
            SET numlivros=vcontagem

            WHERE codedit = vcodedit;
-- Vai para a próxima linha do cursor
            FETCH cur_livros_editora INTO vcodedit, vcontagem;

        END LOOP;
    CLOSE cur_livros_editora;
    RETURN 0;
END;
$$ LANGUAGE plpgsql;

SELECT f_atualiza_numlivros_editora();

SELECT *
FROM editora;

/* Criar um atributo no usuario que indica que ele está em situação normal ou em débito
(N/D). Este atributo vai ter valor D quando o usuário possuir pelo menos uma retirada
vencida e não devolvida. Após a criação do campo, criar uma procedure que verifique as
retiradas para o usuário e faça uma atualização para D nos usuários que estão com
retirada em aberto. */

-- Se a data da entrega prevista é menor que a atual
-- Se não tem data de entrega real

SELECT *
FROM retirada;

UPDATE retirada
SET dataentreal=null
WHERE codret = 33;

select current_date;

ALTER TABLE usuario
    ADD situacao CHAR(1);

CREATE OR REPLACE FUNCTION f_atualiza_situacao_usuario()
    RETURNS INTEGER
AS
$$
DECLARE
    cur_retiradas_vencidas CURSOR FOR SELECT r.codusu,
                                             r.dataentprev,
                                             r.dataentreal

                                      FROM retirada r
                                      WHERE r.dataentreal IS NULL
                                        AND r.dataentprev < current_date;
    vcodusu      INTEGER;
    vdataentprev DATE;
    vdataentreal DATE;
BEGIN
    UPDATE usuario SET situacao = 'N';
    OPEN cur_retiradas_vencidas;
-- Vai para a primeira linha do cursor
    FETCH cur_retiradas_vencidas INTO vcodusu, vdataentprev, vdataentreal;
    WHILE FOUND
        LOOP
            -- Testa se acabaram os registros
            UPDATE usuario
            SET situacao = 'D'
            WHERE codusu = vcodusu;
-- Vai para a próxima linha do cursor
            FETCH cur_retiradas_vencidas INTO vcodusu, vdataentprev, vdataentreal;

        END LOOP;
    CLOSE cur_retiradas_vencidas;
    RETURN 0;
END;
$$ LANGUAGE plpgsql;

SELECT f_atualiza_situacao_usuario();