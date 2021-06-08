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