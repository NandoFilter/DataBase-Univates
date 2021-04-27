/* Mostrar o nome e a data de nascimento do autor que está cadastrado
é o mais velho. Nesta consulta devem ser considerados somente autores
que nasceram no Brasil.  Assinale a consulta abaixo que resolve
corretamente este problema. */

-- Opção 01

SELECT a.nome, a.datanasc
FROM autor a,
     cidade c,
     estado e,
     pais p
WHERE a.codcid = c.codcid
  AND c.codest = e.codest
  AND e.codpais = p.codpais
  AND p.nome = 'Brasil'
  AND a.datanasc >= all (SELECT a1.datanasc
                         FROM autor a1,
                              cidade c1,
                              estado e1,
                              pais p1
                         WHERE a1.codcid = c1.codcid
                           AND c1.codest = e1.codest
                           AND e1.codpais = p1.codpais
                           AND p1.nome = 'Brasil'); -- Erro: Retorna a data mais recente

-- Opção 02

SELECT a.nome, a.datanasc
FROM autor a,
     cidade c,
     estado e,
     pais p
WHERE a.codcid = c.codcid
  AND c.codest = e.codest
  AND e.codpais = p.codpais
  AND p.nome = 'Brasil'
  AND a.datanasc = (SELECT MIN(a1.datanasc)
                    FROM autor a1,
                         cidade c1,
                         estado e1,
                         pais p1
                    WHERE a1.codcid = c1.codcid
                      AND c1.codest = e1.codest
                      AND e1.codpais = p1.codpais
                      AND p1.nome = 'Brasil'); -- Correta

-- Opção 03

SELECT a.nome, a.datanasc
FROM autor a,
     cidade c,
     estado e,
     pais p
WHERE a.codcid = c.codcid
  AND c.codest = e.codest
  AND e.codpais = p.codpais
  AND p.nome = 'Brasil'
  AND a.datanasc = (SELECT MAX(datanasc)
                    FROM autor a1,
                         cidade c1,
                         estado e1,
                         pais p1
                    WHERE a1.codcid = c1.codcid
                      AND c1.codest = e1.codest
                      AND e1.codpais = p1.codpais
                      AND p1.nome = 'Brasil'); -- Erro: MAX retorna a data mais recente

-- Opção 04

SELECT a.nome, a.datanasc
FROM autor a,
     cidade c,
     estado e,
     pais p
WHERE a.codcid = c.codcid
  AND c.codest = e.codest
  AND e.codpais = p.codpais
  AND p.nome = 'Brasil'
  AND a.datanasc = (SELECT MIN(a1.datanasc) FROM autor a1); -- Erro: Falta junção e teste de país