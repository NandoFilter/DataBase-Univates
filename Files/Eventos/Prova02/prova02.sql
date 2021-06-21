/* Prova 02 */

/* Fernando Halmenschlager Filter - 703692 */

/* 1. Criar uma consulta para mostrar o código e o nome das pessoas que se inscreveram em algum
evento com data de início no ano de 2015 e que também se inscreveram em algum evento com início
em 2017. (1,50) */

select p.codpess, p.nome
from pessoa p
where p.codpess in (select i.codpess
                    from inscricao i,
                         evento e
                    where i.codeve = e.codeve
                      and e.dataini between '2015-01-01' and '2015-12-31')
intersect
select p.codpess, p.nome
from pessoa p
where p.codpess in (select i.codpess
                    from inscricao i,
                         evento e
                    where i.codeve = e.codeve
                      and e.dataini between '2017-01-01' and '2017-12-31');

/* 2. Criar uma visão que retorne o código, o titulo e a descrição dos eventos que estão associados a
tópicos que possuem a palavra ‘neque’ na sua descrição. Após a criação da visão, a mesma deve ser
usada em uma consulta que mostre as atividades dos eventos retornados pela visão. A consulta deve
mostrar o título do evento, além da sequencia, a data de início e o título de cada atividade. (2,00) */

create or replace view v_evento_neque(cod_eve, titulo_eve, descricao_eve)
as
select e.codeve, e.titulo, e.descricao
from evento e
where e.descricao like '%neque%';

select v.titulo_eve, a.sequencia, a.dataini, a.titulo
from atividade a,
     v_evento_neque v
where a.codeve = v.cod_eve;

/* 3. Criar uma procedure que retorne o resultado de uma consulta. A procedure deve receber como
parâmetro duas datas (inicial e final) e o código de uma cidade. A consulta executada na procedure
deve retornar o código e o título do evento, a data da inscrição, o código e o nome da pessoa que fez
a inscrição, para todas as inscrições feitas no período (parâmetros data inicial e final) por pessoas que
residem em determinada cidade (parâmetro código da cidade). (1,50) */

create type t_inscricoes_cid as
(
    cod_evento    int,
    titulo_evento varchar(200),
    data_insc     date,
    cod_pessoa    int,
    nome_pessoa   varchar(100)
);

create or replace function f_inscricoes_cid(dataInicial date, dataFinal date, codCidade int)
    returns setof t_inscricoes_cid
as
$$
select e.codeve, e.titulo, i.datainsc, p.codpess, p.nome
from evento e,
     pessoa p,
     inscricao i
where p.codpess = i.codpess
  and i.codeve = e.codeve
  and i.datainsc between dataInicial and dataFinal
  and p.codcid = codCidade;
$$ language sql;

/* 4. Criar um atributo na tabela evento para indicar se o evento está aceitando inscrições (S/N). Após a
criação do atributo, deve ser criada uma trigger que irá validar uma nova inscrição, quando esta for
lançada. A trigger deve buscar o evento da inscrição e verificar se o atributo criado possui valor igual
a ‘N’ e se isso ocorrer a inscrição deve ser cancelada (RAISE EXCEPTION). (2,00) */

alter table evento
    add aceitando_insc char;

create trigger t_evento_insc
    after insert
    on inscricao
    for each row
execute procedure f_evento_insc();

create or replace function f_evento_insc()
returns trigger
as
$$
declare
    aceitar_insc char;
begin
    select e.aceitando_insc
    into aceitar_insc
    from evento e
    where e.codeve = new.codeve;

    if (aceitar_insc = 'N') then
        raise exception 'O evento não está aceitando inscrições';
    end if;
    return null;
end;
$$ language plpgsql;