/* O gestor da biblioteca está analisando a possibilidade de criar filiais em algumas
cidades, ou seja, manter bibliotecas nas cidades que possuem retiradas frequentes.

Para isso quer saber quais as cidades que possuem usuários que fizeram retirada no
ano de 2018 e também no ano de 2019. Assinale a alternativa abaixo que mostra
corretamente o nome destas cidades. */

-- Opção 01

SELECT c.nome
FROM cidade c
WHERE c.codcid IN (SELECT u.codcid
                   FROM usuario u,
                        retirada r
                   WHERE u.codusu = r.codusu
                     AND r.dataret >= '01/01/18'
                     AND r.dataret <= '31/12/18')
  AND c.codcid NOT IN (SELECT u.codcid
                       FROM usuario u,
                            retirada r
                       WHERE u.codusu = r.codusu
                         AND r.dataret >= '01/01/19'
                         AND r.dataret <= '31/12/19'); -- Erro: NOT IN

-- Opção 02

SELECT c.nome
FROM cidade c
WHERE c.codcid IN (SELECT u.codusu
                   FROM usuario u,
                        retirada r
                   WHERE u.codusu = r.codusu
                     AND r.dataret >= '01/01/18'
                     AND r.dataret <= '31/12/18')
  AND c.codcid IN (SELECT u.codusu
                   FROM usuario u,
                        retirada r
                   WHERE u.codusu = r.codusu
                     AND r.dataret >= '01/01/19'
                     AND r.dataret <= '31/12/19'); -- Erro: Seleciona u.codusu para c.codcid

-- Opção 03

SELECT c.nome
FROM cidade c
WHERE c.codcid IN (SELECT u.codcid
                   FROM usuario u,
                        retirada r
                   WHERE u.codusu = r.codusu
                     AND r.dataret >= '01/01/18'
                     AND r.dataret <= '31/12/18'
                     AND r.dataret >= '01/01/19'
                     AND r.dataret <= '31/12/19'); -- Erro: Faz uma união de datas

-- Opção 04

SELECT c.nome
FROM cidade c
WHERE c.codcid IN (SELECT u.codcid
                   FROM usuario u,
                        retirada r
                   WHERE u.codusu = r.codusu
                     AND r.dataret >= '01/01/18'
                     AND r.dataret <= '31/12/18')
  AND c.codcid IN (SELECT u.codcid
                   FROM usuario u,
                        retirada r
                   WHERE u.codusu = r.codusu
                     AND r.dataret >= '01/01/19'
                     AND r.dataret <= '31/12/19'); -- Correta