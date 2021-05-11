/* Criar uma visão para retornar a lista das cidades (código, nome da cidade e nome do
estado) que ficam no Brasil. Criar uma consulta que utiliza a visão para mostrar o nome,
endereço e o nome da cidade dos usuários que residem no Brasil. */

create view v_lista_cidades
as
select c.codcid, c.nome as cidade, e.nome as estado
from cidade c,
     estado e,
     pais p
where c.codest = e.codest
  and e.codpais = p.codpais
  and p.nome = 'Brasil';

select u.nome as usuario, u.endereco, v.cidade
from usuario u,
     v_lista_cidades v
where u.codcid = v.codcid;

/* Criar uma visão para retornar os exemplares de livros retirados no ano de 2019. A visão
deve retornar o código do livro, a sequencia do exemplar, a data da retirada e o código do
usuário da retirada. Utilizar a visão em uma consulta que mostre o título do livro, o nome
da editora do livro, o nome do usuário que fez a retirada e a data das retiradas retornadas
pela visão. */

create view v_exemplares_ret2019
as
select l.codlivro, e.sequencia, r.dataret, u.codusu
from livro l,
     exemplar e,
     retirada r,
     usuario u
where l.codlivro = e.codlivro
  and r.codlivro = l.codlivro
  and u.codusu = r.codusu
  and r.sequencia = e.sequencia
  and r.dataret between '2019-01-01' and '2019-12-31';

select l.titulo as livro,
       ed.nome  as editora,
       u.nome   as usuario,
       v.dataret
from livro l,
     editora ed,
     usuario u,
     v_exemplares_ret2019 v
where l.codedit = ed.codedit
  and u.codusu = v.codusu
  and l.codlivro = v.codlivro;

/* Criar duas visões, a primeira deve retornar o código do usuário e a contagem das
retiradas feitas por ele. A segunda deve retornar o código do usuário e quantas reservas
ele fez. Criar uma nova consulta que use as visões para mostrar o código e o nome do
usuário e para cada um, a contagem de reservas e a contagem de retiradas. */

create view v_qntdret_usu
as
select u.codusu, u.nome, count(rt.codret) as qntd_ret
from usuario u,
     retirada rt
where rt.codusu = u.codusu
group by u.codusu;

create view v_qntdres_usu
as
select u.codusu, count(rs.codres) as qntd_res
from usuario u,
     reserva rs
where rs.codusu = u.codusu
group by u.codusu;

select vres.codusu as usuario, vres.qntd_res, vret.qntd_ret
from v_qntdres_usu vres,
     v_qntdret_usu vret
where vres.codusu = vret.codusu
order by vres.codusu;

/* Criar uma visão que retorne a soma e a média das multas para cada livro, no ano de
2019. Outra duas visões devem retornar estes mesmos dados para 2018 e 2017. Criar
uma nova consulta que utilize estas visões para mostrar os resultados exibidos abaixo.
Ordenar os dados da consulta final pelo nome da editora. */

create view v_multasLivro_2019 (codlivro, soma, media)
as
select r.codlivro, sum(r.multa), avg(r.multa)
from retirada r
where r.dataret between '2019-01-01' and '2019-12-31'
group by r.codlivro;

create view v_multasLivro_2018 (codlivro, soma, media)
as
select r.codlivro, sum(r.multa), avg(r.multa)
from retirada r
where r.dataret between '2018-01-01' and '2018-12-31'
group by r.codlivro;

create view v_multasLivro_2017 (codlivro, soma, media)
as
select r.codlivro, sum(r.multa), avg(r.multa)
from retirada r
where r.dataret between '2017-01-01' and '2017-12-31'
group by r.codlivro;

select l.codlivro,
       l.titulo,
       v19.soma,
       v19.media,
       v18.soma,
       v18.media,
       v17.soma,
       v17.media
from livro l
         left join v_multasLivro_2017 v17 on l.codlivro = v17.codlivro
         left join v_multasLivro_2018 v18 on l.codlivro = v18.codlivro
         left join v_multasLivro_2019 v19 on l.codlivro = v19.codlivro
where v19.soma is not null
   or v18.soma is not null
   or v17.soma is not null;