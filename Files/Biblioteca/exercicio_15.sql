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