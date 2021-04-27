/* PARTE 01 */

/* Criar uma consulta para mostrar as editoras que possuem pelo menos um livro com
edição maior do que 1. Usar o operador IN para buscar a editora na lista de códigos de
editoras dos livros com edição maior do que 1. Exibir código, nome, endereço e nome da
cidade da editora. */

SELECT e.codedit, e.nome as ed_nome, e.endereco as end_editora, e.codcid as cid_editora, c.nome as cid_nome
FROM editora e,
     cidade c
WHERE e.codcid = c.codcid
  AND e.codedit IN (SELECT l.codedit FROM livro l WHERE l.edicao > 1);

/* Mostrar os dados da retirada que possui a maior data de retirada. Exibir a data e a hora
da retirada, e o título do livro retirado. */

SELECT r.dataret as data_ret,
       r.horaret as hora_ret,
       l.titulo  as livro
FROM retirada r,
     livro l
WHERE r.codlivro = l.codlivro
  AND r.dataret IN (SELECT MAX(r.dataret) FROM retirada r);


/* PARTE 02 */

/* Quais usuários já retiraram o livro que possui o código 1 e também retiraram o livro com código 3?
   Mostrar o código, o nome, data de nascimento e nome da cidade destes usuários. */

SELECT u.codusu,
       u.nome as nome_usu,
       u.datanasc,
       c.nome as cidade
FROM usuario u,
     cidade c
WHERE u.codcid = c.codcid
  AND u.codusu IN (
    SELECT r.codusu
    FROM retirada r
    WHERE r.codlivro = 1) -- Livro 1
  AND u.codusu IN (
    SELECT r.codusu
    FROM retirada r
    WHERE r.codlivro = 4);
-- Livro 3

-- Não resolve o problema, pois faz uma união e não intersecção
SELECT u.codusu, u.nome, u.datanasc, c.nome
FROM usuario u,
     cidade c,
     retirada r
WHERE u.codcid = c.codcid
  AND u.codusu = r.codusu
  AND (r.codlivro = 1 OR r.codlivro = 3);

-- Solução equivalente com intersecção explícita
SELECT u.codusu, u.nome, u.datanasc, c.nome
FROM usuario u,
     cidade c,
     retirada r
WHERE u.codcid = c.codcid
  AND u.codusu = r.codusu
  AND r.codlivro = 1
INTERSECT
SELECT u.codusu, u.nome, u.datanasc, c.nome
FROM usuario u,
     cidade c,
     retirada r
WHERE u.codcid = c.codcid
  AND u.codusu = r.codusu
  AND r.codlivro = 3;

/* Criar uma consulta que mostre os livros (código e título) e para cada livro mostre a data,
hora e o nome do usuário das reservas feitas no ano de 2018 e também das reservas
feitas no ano de 2019. Na resolução faça uma junção da tabela livro com uma
subconsulta que traga os dados das reservas de 2018 e outra junção com uma
subconsulta que traga os mesmos dados para 2019. Ordenar pelo título do livro. */

SELECT l.codlivro,
       l.titulo,
       r18.datares,
       r18.horares,
       r18.nome as nome_usuario,
       r19.datares,
       r19.horares,
       r19.nome as nome_usuario
FROM livro l
         LEFT JOIN
     (SELECT r.codlivro, r.datares, r.horares, u.nome
      FROM reserva r,
           usuario u
      WHERE r.codusu = u.codusu
        AND r.datares BETWEEN '01/01/18' AND '31/12/18') r18 ON l.codlivro = r18.codlivro
         LEFT JOIN
     (SELECT r.codlivro, r.datares, r.horares, u.nome
      FROM reserva r,
           usuario u
      WHERE r.codusu = u.codusu
        AND r.datares BETWEEN '01/01/19' AND '31/12/19') r19 ON l.codlivro = r19.codlivro
ORDER BY l.titulo;

/* Criar uma consulta que mostre um resumo para cada usuário. Exibir o código e o nome
do usuário, quantas reservas e quantas retiradas ele fez. As contagens devem ser obtidas
por subconsultas usadas na cláusula SELECT da consulta principal. */

SELECT u.codusu,
       u.nome as                                                             usuario,
       (SELECT COUNT(r.codres) FROM reserva r WHERE u.codusu = r.codusu)     qntd_reservas,
       (SELECT COUNT(r1.codret) FROM retirada r1 WHERE u.codusu = r1.codusu) qntd_retiradas
FROM usuario u;