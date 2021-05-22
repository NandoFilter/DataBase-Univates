/* Atividade Extra Classe 04 */

/* Fernando Halmenschlager Filter - 703692*/

--------------------------------------------------

-- Exercício 01

/* A localização dos produtos em seções, especialmente aqueles que possuem uma
quantidade reduzida em estoque é um problema para a organização. Consultas que
mostram onde estão estes produtos são comuns. Considerando esta necessidade,
vamos criar uma visão que retorne os produtos que tem quantidade em estoque
menor do que 10. A visão deve mostrar em quais seções estão estes produtos,
retornando o código do produto, a quantidade em estoque, o número da seção na
qual está o produto. Um detalhe importante é que sejam trazidos todos os
produtos, mesmo que eles não estejam associados a alguma seção.

    Após a criação da visão, elaborar uma consulta que mostre o código e a
descrição do produto, a quantidade em estoque, a descrição do grupo do produto
e o número e o tamanho da seção na qual encontra-se o produto. Ordenar por
descrição de produto. */

create view prod_menorQntd (codprod, qntd_est, num_secao)
as
select p.codprod, p.qtdeminest, s.numsecao
from produto p
         left join prodsec ps on p.codprod = ps.codprod
         left join secao s on ps.numsecao = s.numsecao
where p.qtdeminest < 10;

select *
from prod_menorQntd;

select p.codprod    as id,
       p.descricao  as produto,
       pq.qntd_est,
       gp.descricao as grupo_produto,
       pq.num_secao,
       s.tamanho    as tamanho_secao
from prod_menorQntd pq
         left join secao s on s.numsecao = pq.num_secao,
     produto p,
     grupoprod gp
where p.codprod = pq.codprod
  and gp.codgru = p.codgru
order by p.descricao;

--------------------------------------------------

-- Exercício 02

/* Criar uma visão que retorne o código dos produtos que tiveram movimentação de
entrada na primeira quinzena do mês de setembro de 2018. Após criar a visão,
elabore uma consulta que mostre o código, a descrição do produto, a descrição da
classificação fiscal e a descrição do grupo dos produtos que não aparecem na
visão, ou seja, não possuem movimentação no período citado. */

create view prod_ent_primQuin_set18
as
select p.codprod
from produto p,
     movest m
where p.codprod = m.codprod
  and m.datahora between '01-09-18' and '15-09-18';

select p.codprod    as codigo,
       p.descricao,
       cf.descricao as classicacao,
       g.descricao  as grupoProd
from prod_ent_primQuin_set18 peps
         right join produto p on peps.codprod = p.codprod
         right join grupoprod g on p.codgru = g.codgru,
     classfisc cf
where peps.codprod is null
  and cf.codclass = p.codclass;

--------------------------------------------------

-- Exercício 03

/* Criar dua visões: A primeira deve retornar a matrícula do funcionário e quantas
movimentações cada funcionário teve no mês de julho de 2018. A segunda visão
deve retornar quantas movimentação cada funcinonário teve no mês de junho de
2018.

Após criar as visões, elabore uma consulta que mostre o nome de cada
funcionário, a descrição do departamento do funcionário, uma coluna com o
número de movimentações em junho e ao lado, outra coluna mostrando o número
de movimentações em julho. */

create view qntd_func_mov_jul18
as
select f.matfunc, count(m.funcresp) as qntd_mov
from funcionario f,
     movest m
where f.matfunc = m.funcresp
  and m.datahora between '01-07-18' and '31-07-18'
group by f.matfunc;

create view qntd_func_mov_jun18
as
select f.matfunc, count(m.funcresp) as qntd_mov
from funcionario f,
     movest m
where f.matfunc = m.funcresp
  and m.datahora between '01-06-18' and '30-06-18'
group by f.matfunc;

select f.nome         as funcionario,
       d.descricao    as departamento,
       jun18.qntd_mov as movJun18,
       jul18.qntd_mov as movJul18
from funcionario f
         full outer join qntd_func_mov_jun18 jun18 on f.matfunc = jun18.matfunc
         full outer join qntd_func_mov_jul18 jul18 on f.matfunc = jul18.matfunc,
     departamento d
where f.coddep = d.coddep
  and (jun18.qntd_mov is not null
  or jul18.qntd_mov is not null);