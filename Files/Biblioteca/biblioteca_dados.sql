SELECT nome, datanasc
FROM usuario
WHERE datanasc = '10/05/71';
SELECT *
FROM usuario;
SELECT codcat, descricao
FROM categoria
WHERE codcat > 1;

SELECT codusu, usuario.nome, cidade.nome
FROM usuario,
     cidade
WHERE usuario.codcid = cidade.codcid
  AND usuario.codusu > 2;

SELECT livro.titulo, editora.nome
FROM livro,
     editora
WHERE livro.codedit = editora.codedit;

SELECT livro.titulo, reserva.datares, reserva.codusu
FROM reserva,
     livro
WHERE reserva.codlivro = livro.codlivro;

/* ------------------------------------- */

SELECT l.titulo, r.datares data_reserva, r.codusu, u.nome
FROM livro l,
     reserva r,
     usuario AS u
WHERE l.codlivro = r.codlivro
  AND r.codusu = u.codusu
  AND r.datares >= '01/01/18'
  AND r.datares <= '31/12/18/'
ORDER BY r.datares ASC;

SELECT livro.titulo, reserva.datares, reserva.codusu, usuario.nome
FROM (livro INNER JOIN reserva ON livro.codlivro = reserva.codlivro)
         INNER JOIN usuario ON reserva.codusu = usuario.codusu
WHERE reserva.datares BETWEEN '01/01/18' AND '31/12/18';



SELECT usuario.codusu, usuario.nome, cidade.nome
FROM usuario
         INNER JOIN cidade ON usuario.codcid = cidade.codcid;

SELECT usuario.codusu, usuario.nome, cidade.nome
FROM usuario,
     cidade
WHERE usuario.codcid = cidade.codcid;

/* ------------------------------------- */

SELECT *
FROM cidade;
INSERT INTO cidade
VALUES (6, 'Estrela', 1);

SELECT usuario.codusu, usuario.nome, cidade.codcid, cidade.nome
FROM usuario
         RIGHT JOIN cidade ON usuario.codcid = cidade.codcid;

SELECT usuario.codusu, usuario.nome, cidade.codcid, cidade.nome
FROM cidade
         LEFT JOIN usuario ON usuario.codcid = cidade.codcid;

SELECT DISTINCT codlivro, datares -- DISTINCT mostra apenas uma vez na Tabela
FROM reserva
ORDER BY codlivro;

SELECT *
FROM usuario
WHERE nome LIKE '%Vargas%'
   OR nome LIKE '%vargas%';

SELECT *
FROM usuario
WHERE UPPER(nome) LIKE '%VARGAS%';

SELECT COUNT(*), SUM(multa), MAX(multa), MAX(dataret)
FROM retirada; -- COUNT Não conta valores nulos

SELECT COUNT(DISTINCT codlivro)
FROM retirada;

SELECT u.codusu, u.nome, SUM(r.multa)
FROM retirada r,
     usuario u
WHERE r.codusu = u.codusu
GROUP BY u.codusu
HAVING SUM(r.multa) > 0
ORDER BY SUM(r.multa);