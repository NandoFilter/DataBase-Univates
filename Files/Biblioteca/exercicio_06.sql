/* Quais os livros que foram mais retirados no ano de 2019? */

-- Opção 01

SELECT l.codlivro, l.titulo, COUNT(r.codret) num_retiradas
FROM livro l,
     retirada r
WHERE r.dataret BETWEEN '01/01/2019' AND '31/12/2019'
GROUP BY l.codlivro
ORDER BY num_retiradas DESC; -- Erro: Falta Junção l.codlivro = r.codlivro

-- Opção 02

SELECT l.codlivro, l.titulo, COUNT(r.codret) num_retiradas
FROM livro l,
     retirada r
WHERE l.codlivro = r.codlivro
  AND r.dataret BETWEEN '01/01/2019' AND '31/12/2019'
GROUP BY l.codlivro
ORDER BY num_retiradas DESC; -- Correta

-- Opção 03

SELECT l.codlivro, l.titulo, COUNT(r.codret) num_retiradas
FROM livro l,
     retirada r
WHERE l.codlivro = r.codlivro
  AND r.dataret BETWEEN '01/01/2019' AND '31/12/2019'
GROUP BY r.codret
ORDER BY num_retiradas DESC; -- Erro: Agrupamento errado

-- Opção 04

SELECT l.codlivro, l.titulo, SUM(r.codret) num_retiradas
FROM livro l,
     retirada r
WHERE l.codlivro = r.codlivro
  AND r.dataret BETWEEN '01/01/2019' AND '31/12/2019'
GROUP BY l.codlivro
ORDER BY num_retiradas DESC; -- Erro: Soma dos códigos