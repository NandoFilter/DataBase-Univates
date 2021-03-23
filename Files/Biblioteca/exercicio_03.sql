/* O coordenador geral da biblioteca deseja saber quem são os usuários que em algum momento pagaram multa
   em alguma retirada. Assinale a alternativa abaixo que é uma solução correta para esta necessidade.*/

SELECT DISTINCT u.codusu, u.nome
FROM usuario u,
     retirada r
WHERE u.codusu = r.codusu
  AND r.multa IS NOT NULL;

SELECT DISTINCT u.codusu, u.nome
FROM usuario u,
     retirada r
WHERE u.codusu = r.codusu AND r.multa > 0
   OR r.multa IS NOT NULL;

SELECT DISTINCT u.codusu, u.nome
FROM usuario u,
     retirada r
WHERE u.codusu = r.codusu
  AND r.multa > 0; -- Correta

SELECT DISTINCT u.codusu, u.nome
FROM usuario u,
     retirada r
WHERE r.multa > 0;

/* Qual das consultas abaixo responde corretamente a pergunta: De quais países (exceto Brasil) já houve reservas de livros? */

select distinct p.nome
from pais p,
     cidade c,
     usuario u,
     reserva r
where p.codpais = c.codest
  and u.codcid = c.codcid
  and u.codusu = r.codusu
  and p.nome <> 'Brasil';

select distinct p.nome
from pais p,
     estado e,
     cidade c,
     usuario u,
     reserva r
where p.codpais = e.codpais
  and u.codcid = c.codcid
  and u.codusu = r.codusu
  and p.nome <> 'Brasil';

select distinct p.nome
from pais p,
     estado e,
     cidade c,
     usuario u,
     reserva r
where p.codpais = e.codpais
  and e.codest = c.codest
  and u.codcid = c.codcid
  and u.codusu = r.codusu
  and p.nome = 'Brasil';

select distinct p.nome
from pais p,
     estado e,
     cidade c,
     usuario u,
     reserva r
where p.codpais = e.codpais
  and e.codest = c.codest
  and u.codcid = c.codcid
  and u.codusu = r.codusu
  and p.nome <> 'Brasil'; -- Correta