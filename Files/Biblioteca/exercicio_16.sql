/* Mostrar a lista dos livros que foram retirados por um usuário que reside na cidade de
Lajeado e que também foram retirados por algum usuário que reside na cidade de Arroio
do Meio. Exibir o código e o título do livro. A seleção deve ser pelo nome da cidade. */

select l.codlivro, l.titulo
from livro l
where l.codlivro in (select distinct r.codlivro
                     from retirada r,
                          usuario u,
                          cidade c
                     where u.codcid = c.codcid
                       and r.codusu = u.codusu
                       and c.nome = 'Lajeado')
  and l.codlivro in (select distinct r.codlivro
                     from retirada r,
                          usuario u,
                          cidade c
                     where u.codcid = c.codcid
                       and r.codusu = u.codusu
                       and c.nome = 'Arroio do Meio');

/* Criar uma visão que retorne o código e o nome das editoras que estão localizadas no
município de Lajeado. A seguir, criar uma consulta que mostre as retiradas dos livros das
editoras de Lajeado. Exibir na consulta o código, o título e o nome da editora do livro, a
data da retirada e a data da entrega prevista. */

create view v_editLajeado(cod_edit, nome_edit)
as
select e.codedit, e.nome
from editora e,
     cidade c
where e.codcid = c.codcid
  and c.nome = 'Lajeado';

select v.cod_edit, l.titulo, v.nome_edit, r.dataret, r.dataentprev
from retirada r,
     livro l,
     v_editLajeado v
where r.codlivro = l.codlivro
  and l.codedit = v.cod_edit
order by r.dataret;

/* Transformar a visão criada na consulta anterior em uma procedure que irá receber o
nome da cidade como parâmetro. A procedure deve retornar o resultado da consulta, ou
seja, o código e o nome das editores que estão localizadas nesta cidade. Alterar a
consulta que usa a visão para que a mesma faça uso da procedure criada. */

create type t_infoEdit as
(
    cod_edit int,
    nome_edit varchar(100)
);

create or replace function f_editoras_cidade(nomeCidade varchar(100))
    returns setof t_infoEdit
as
$$
select e.codedit, e.nome
from editora e,
     cidade c
where e.codcid = c.codcid
  and c.nome = nomeCidade;
$$
    language sql;

select f.cod_edit, l.titulo, f.nome_edit, r.dataret, r.dataentprev
from retirada r,
     livro l
        left join f_editoras_cidade('Lajeado') f on l.codedit = f.cod_edit
where r.codlivro = l.codlivro
  and l.codedit = f.cod_edit
order by r.dataret;