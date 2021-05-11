/* Criar uma procedure que aumente o salário dos bibliotecários em X%. O percentual de
reajuste deve ser passado para a função como parâmetro e dentro da função deve ser
executado um UPDATE que aumenta o salário de acordo com o parâmetro recebido. */

create or replace function f_aumentarSalario(perc decimal(11, 2))
    returns integer
as $$
begin
    update bibliotecario set valorsal = valorsal + (valorsal * (perc / 100));
    return 0;
end
$$ language plpgsql;

select sum(valorsal) from bibliotecario;
select f_aumentarSalario(10);

/* Criar uma procedure para mostrar as reservas para livros de uma deteminada categoria.
O nome da categoria deve ser recebido como parâmetro pela função. No código da
função deve ser executada uma consulta que retorne o código e o título do livro, a data da
reserva, o nome do usuário que fez a reserva e o nome da cidade deste usuário. Criar um
TYPE com as colunas de retorno da consulta. */

CREATE TYPE t_reservas_categoria AS
(
    codlivro integer,
    titulo varchar(50),
    data_reserva timestamp,
    usuario varchar(50),
    cidade varchar(50)
);

create or replace function f_reservas_categorias(nomecategoria varchar(100))
    returns setof t_reservas_categoria
AS $$

    SELECT l.codlivro, l.titulo, r.datares, u.nome, c.nome
    FROM reserva r,
         livro l,
         usuario u,
         cidade c,
         livrocategoria lc,
         categoria ct
    WHERE l.codlivro = lc.codlivro
        and lc.codcat = ct.codcat
        and r.codlivro = l.codlivro
        and u.codcid = c.codcid
        and r.codusu = u.codusu
        and ct.descricao = nomecategoria
    order by l.codlivro;

$$ LANGUAGE sql;

select *
from f_reservas_categorias('Banco de dados');