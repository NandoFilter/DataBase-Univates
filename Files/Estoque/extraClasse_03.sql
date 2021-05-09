/* Atividade Extra Classe 03 */

/* Fernando Halmenschlager Filter - 703692*/

--------------------------------------------------

-- Exercício 01

/* Existem produtos que possuem pelo menos uma movimentação de saída e
também uma movimentação de entrada no mês de setembro de 2018? Para
responder a esta questão, elabore uma consulta que exiba código e descrição do
produto, descrição do grupo e da classificação fiscal dos produtos que se
encaixam na situação indicada. */

select p.codprod,
       p.descricao  as desc_prod,
       gp.descricao as desc_grupoProd,
       m.numnfcompra,
       m.numnfvenda
from produto p,
     grupoprod gp,
     movest m
where p.codgru = gp.codgru
  and m.codprod = p.codprod
  and (m.numnfcompra notnull)
  and (m.numnfvenda notnull)
  and m.datahora between '2018-09-01' and '2018-09-30'
order by p.codprod;

--------------------------------------------------

-- Exercício 02

/* A tabela fechest armazena os saldos dos produtos em determinada data. A data em
que foi feito o fechamento do estoque do mês de julho de 2018, foi 28/07/18.
Considerando esta data, mostre o produto que possui a maior quantidade em
estoque. Exiba o código e a descrição do produto, a quantidade em estoque e o
custo médio armazenado na data de fechamento. */

select p.codprod, p.descricao, f.qtdeest, f.custom
from produto p,
     fechest f
where f.codprod = p.codprod
  and f.qtdeest = (select max(f.qtdeest) from fechest f)
  and f.datafech = '2018-07-28';

--------------------------------------------------

-- Exercício 03

/* O responsável pelo setor de RH deseja saber quais departamentos têm
funcionários que são responsáveis por alguma seção. Em cada seção existe um
atributo no qual é informada a matrícula do funcionário responsável. Mostre o
código e o nome destes departamentos. Desenvolva duas versões, a primeira
usando o operador IN e a segunda utilizando somente junção entre tabelas. */

select distinct d.coddep, d.descricao
from departamento d,
     funcionario f,
     secao s
where f.coddep = d.coddep
  and f.matfunc = s.matfunc
order by coddep;

select distinct d.coddep, d.descricao
from departamento d,
     funcionario f
where f.coddep = d.coddep
  and f.matfunc in (select s.matfunc from secao s)
order by coddep;

--------------------------------------------------

-- Exercício 04

/* Mostrar a lista das operações que possuem pelo menos um registro de
movimentação de estoque nos últimos 10 dias de abril de 2018 (21 a 30/04) e que
não possuem movimentação nos primeiros 10 dias do mesmo mês (01 a 10/04).
Caso nenhuma operação se enquadre nesta situação, inclua registros para testar a
consulta, para que pelo menos uma operação apareça na lista. */

select distinct o.codoper, o.descricao
from operacao o,
     movest m
where o.codoper = m.codoper
  and m.datahora between '2018-04-21' and '2018-04-30'
  and o.codoper not in (select m.codoper
                        from movest m
                        where m.datahora between '2018-04-01' and '2018-04-10')