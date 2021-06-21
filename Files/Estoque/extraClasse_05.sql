/* Atividade Extra Classe 05 */

/* Fernando Halmenschlager Filter - 703692*/

--------------------------------------------------

-- Exercício 01

/* Considere as visões e a consulta abaixo que mostram as quantidades totais
movimentadas em períodos diferentes. Foram criadas duas visões, uma para cada
período. Escreva uma procedure (function) que faça o mesmo que as visões,
porém, recebendo as datas (inicial e final) como parâmetro. Reescreva a consulta
final para usar a procedure no lugar das visões. Neste caso a mesma procedure
será chamada duas vezes, na consulta final, com períodos diferentes. */

CREATE VIEW v_soma_qtde_s1(codprod, somaqtde)
AS
SELECT m.codprod, SUM(m.qtde)
FROM movest m
WHERE m.datahora BETWEEN '01/01/18' AND '30/06/18'
GROUP BY m.codprod;

CREATE VIEW v_soma_qtde_s2(codprod, somaqtde)
AS
SELECT m.codprod, SUM(m.qtde)
FROM movest m
WHERE m.datahora BETWEEN '01/07/18' AND '31/12/18'
GROUP BY m.codprod;

SELECT p.codprod,
       p.descricao AS nomeprod,
       v1.somaqtde AS soma_sem1,
       v2.somaqtde AS soma_sem2
FROM produto p
         LEFT JOIN v_soma_qtde_s1 v1 ON v1.codprod = p.codprod
         LEFT JOIN v_soma_qtde_s2 v2 ON v2.codprod = p.codprod
WHERE v1.somaqtde IS NOT NULL
   OR v2.somaqtde IS NOT NULL;

-- Versão com Function

CREATE TYPE t_soma_qnde AS
(
    codprod  integer,
    somaqtde numeric(11, 3)
);

create or replace function f_soma_qnde(dataInicio date, dataFim date)
    returns setof t_soma_qnde
as
$$
select m.codprod, sum(m.qtde)
from movest m
where dataFim > dataInicio
  and m.datahora between dataInicio and dataFim
group by m.codprod;

$$ language sql;

drop type t_soma_qnde;
drop function f_soma_qnde(date, date);

SELECT p.codprod,
       p.descricao AS nomeprod,
       f1.somaqtde AS soma_sem1,
       f2.somaqtde AS soma_sem2
FROM produto p
         LEFT JOIN f_soma_qnde('2018-01-01', '2018-06-30') f1 on f1.codprod = p.codprod
         LEFT JOIN f_soma_qnde('2018-07-01', '2018-12-31') f2 on f2.codprod = p.codprod
WHERE f1.somaqtde IS NOT NULL
   OR f2.somaqtde IS NOT NULL;

--------------------------------------------------

-- Exercício 02

/* Criar uma trigger para atualizar um campo que armazena a data da última
movimentação de um produto, ou seja, da maior data de movimentação para cada
produto. Inicialmente deve ser criado um campo chamado dataultmov na tabela
produto. Em seguida deve ser elaborada a trigger que será ativada quando ocorrer
uma inclusão de uma movimentação. Ela irá verificar se a data da nova
movimentação é maior do que a que está no produto e em caso positivo irá
atualizar o campo. */

alter table produto
    add dataultmov date;

create trigger t_dataultmov_prod
    after insert or update
    on produto
    for each row
execute procedure f_dataultmov_prod();

drop trigger t_dataultmov_prod on estoque.produto;

/* create or replace function f_dataultmov_prod()
    returns trigger
as
$$
declare
    ult_data   date;
    data_salva date;
    vproduto   int;
begin

    select p.codprod, p.dataultmov, max(m.datahora)
    into vproduto, ult_data, data_salva
    from produto p,
         movest m
    where p.codprod = m.codprod
    group by p.codprod, p.dataultmov;

    if (data_salva > ult_data) then
        update produto
        set dataultmov = data_salva
        where codprod = vproduto;
    end if;

    return null;
end;
$$ language plpgsql; */

create or replace function f_dataultmov_prod()
    returns trigger
as
$$
declare

begin

    select p.codprod, p.dataultmov
    from produto p
    group by p.codprod, p.dataultmov;

    if (new.dataultmov > produto.dataultmov) then
        update produto
        set old.dataultmov = new.dataultmov
        where codprod = new.codprod;
    end if;

    return null;
end;
$$ language plpgsql;

--------------------------------------------------

-- Exercício 03

/* Criar uma trigger para validar o departamento informado na movimentação.
Sempre que uma movimentação for incluída, verificar se o departamento do
registro de movimentação é o mesmo que o departamento do funcionário
responsável pela movimentação. Caso seja diferente a movimentação deve ser
cancelada (raise exception). */

create trigger t_valida_dep
    after update or insert
    on movest
    for each row
execute procedure f_valida_dep();

create or replace function f_valida_dep()
    returns trigger
as
$$
declare
    dep_mov int;
    dep_fuc int;
begin
    select m.coddep, f.coddep
    into dep_mov, dep_fuc
    from movest m,
         funcionario f
    where m.funcresp = f.matfunc;

    if (dep_mov <> dep_fuc) then
        raise exception 'Departamentos diferentes';
    end if;
    return null;

end;
$$ language plpgsql;