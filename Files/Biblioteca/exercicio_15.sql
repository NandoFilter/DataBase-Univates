/* Criar uma trigger para validar uma atualização de cidade. A trigger deve verificar se o
código da cidade está sendo alterado e em caso positivo cancelar a operação. */

CREATE TRIGGER t_valida_codcid
    AFTER UPDATE
    ON cidade
    FOR EACH ROW
EXECUTE PROCEDURE f_valida_codcid();

CREATE OR REPLACE FUNCTION f_valida_codcid()
    RETURNS TRIGGER
AS
$$
BEGIN
    IF NEW.codcid & <> OLD.codcid THEN
        RAISE EXCEPTION 'Não é possível alterar a chave da cidade';
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

/* Validar se o usuário pode fazer retirada. Quando uma nova retirada é feita, é necessário
verificar se o status do usuário. Caso o status seja igual a ‘D’, a inclusão da retirada deve
ser cancelada. */

CREATE TRIGGER t_valida_situacao_usuario
    AFTER INSERT
    ON retirada
    FOR EACH ROW
EXECUTE PROCEDURE f_valida_situacao_usuario();

CREATE OR REPLACE FUNCTION f_valida_situacao_usuario()
    RETURNS TRIGGER
AS
$$
DECLARE
    vsituacao CHAR(1);
BEGIN
    SELECT situacao
    INTO vsituacao
    FROM usuario
    WHERE codusu = new.codusu;
    IF vsituacao = 'D' THEN
        RAISE EXCEPTION 'Usuário não pode fazer retirada';
    END IF;
    RETURN NULL;
END;
$$
    LANGUAGE plpgsql;

/* Quando uma retirada nova for feita, validar se a situação do exemplar é diferente de ‘D’.
Em caso positivo, cancelar a operação. */

CREATE TRIGGER t_valida_situacao_exemplar
    AFTER INSERT
    ON retirada
    FOR EACH ROW
EXECUTE PROCEDURE f_valida_situacao_exemplar();

create or replace function f_valida_situacao_exemplar()
    returns trigger
as
$$
declare
    vsituacao varchar(1);
begin
    select situacao
    into vsituacao
    from exemplar
    where codlivro = new.codlivro
      and sequencia = new.sequencia;
    if vsituacao <> 'D' then
        raise exception 'Usuário não pode fazer retirada';
    end if;
    return null;
end;
$$
    language plpgsql;

/*Criar uma trigger para manter atualizado o atributo que armazena o número de retiradas
por usuário. Sempre que uma retirada for incluída, atualizada ou excluída é necessário
aumentar ou diminuir este atributo. Na inclusão deve-se somar 1 ao número de retiradas
no usuário que fez a retirada, na exclusão é subtraído 1 e na alteração subtrai-se 1 no
usuário antigo (OLD.codusu) e aumenta-se 1 no usuário novo (NEW.codusu). */

ALTER TABLE usuario
    ADD numretiradas int;

CREATE TRIGGER t_atualiza_numretiradas
    AFTER INSERT OR UPDATE OR DELETE
    ON retirada
    FOR EACH ROW
EXECUTE PROCEDURE f_atualiza_numretiradas_t();

CREATE OR REPLACE FUNCTION f_atualiza_numretiradas_t()
    RETURNS TRIGGER
AS
$$
DECLARE
BEGIN
    IF TG_OP = 'INSERT ' OR TG_OP = 'UPDATE ' THEN
        UPDATE usuario
        SET numretiradas = numretiradas + 1
        WHERE codusu = NEW.codusu;
    END IF;

    IF TG_OP = 'DELETE' OR TG_OP = 'UPDATE' THEN
        UPDATE usuario
        SET numretiradas = numretiradas - 1
        WHERE codusu = OLD.codusu;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

/* Existem categorias de livros cuja retirada deve ser acompanhada. Para poder realizar
este acompanhamento deve ser gerado um log no qual será registrada a data da retirada,
o código do usuário que retirou e o código do livro retirado.Após criar a tabela que
armazenará os logs, crie uma trigger que gere os registros de log sempre que uma
retirada de um livro das categorias marcadas ocorre.O indicativo de qual categoria deve
ser monitorada será dado por um atributo “geralog” na tabela de categoria.Se ele estiver
com valor “S” ou verdadeiro deve ser gravado o log para a retirada.No log gravar o nome
do usuário, a data da retirada e o título do livro retirado.

-- Buscar os dados do livro: SELECT geralog INTO vgeralog, titulo INTO vtitulo …
-- Buscar o nome do usuario: SELECT nome INTO vnome FROM usuario….
IF vgeralog=’S’….INSERT INTO log_retiradada */

alter table livro
    add geralog char(1);

update livro
set geralog = 'N';
update livro
set geralog = 'S'
where codlivro = 4;

create table log_retiradas
(
    nome_usu varchar(100),
    titulo   varchar(100),
    dataret  date
);

create trigger t_geralog
    after insert
    on retirada
    for each row
execute procedure f_geralog();

create or replace function f_geralog()
    returns trigger
as
$$
declare
    vnome    varchar(100);
    vtitulo  varchar(100);
    vgeralog char(1);
begin
    select geralog, titulo
    into vgeralog, vtitulo
    from livro
    where codlivro = new.codlivro;

    raise notice 'Geralog: % e titulo: %', vgeralog, vtitulo;

    select nome into vnome from usuario where codusu = new.codusu;

    if vgeralog = 'S' then
        insert into log_retiradas values (vnome, vtitulo, new.dataret);
    end if;

    return null;
end;
$$ language plpgsql;

select *
from retirada;

insert into retirada
values (957, '31-05-21', '19:30', '14/06/21', null, 0, 1, 1, 4, 101, null);

/* Criar um atributo na tabela de usuario para armazenar a data da última retirada de cada
usuário. Após a criação do atributo, elaborar uma procedure que atualize esta data para
cada usuário, ou seja, deve ser obtida a última data de retirada para cada usuário e esta
deve ser gravada no atributo criado. Após executar a procedure, criar uma trigger e uma
nova procedure a ser executada na trigger. A trigger deve ser disparada na inclusão de
uma retirada e deve verificar se a data da última retirada no usuário é menor do que a
data da retirada que está sendo lançada. Em caso positivo, a data da última retirada deve
ser atualizada no usuário, com a data da retirada. */

alter table usuario
    add ultima_dataret date;

create trigger t_atualiza_ultima_dataret
    after insert
    on retirada
    for each row
execute procedure f_atualiza_ultima_dataret();

create or replace function f_atualiza_ultima_dataret()
    returns trigger
as
$$
declare
    vdataultret date;
begin
    select ultima_dataret into vdataultret from usuario where codusu = new.codusu;

    if (vdataultret < new.dataret or vdataultret is null) then
        update usuario set ultima_dataret = new.dataret where codusu = new.codusu;
    end if;
    return null;
end;
$$ language plpgsql;

select *
from retirada;

select *
from usuario;

insert into retirada
values (962, '01-06-21', '19:30', '14/06/21', null, 0, 1, 1, 4, 101, null);