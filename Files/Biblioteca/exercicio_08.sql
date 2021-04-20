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
       l.titulo as livro
FROM retirada r,
     livro l
WHERE r.codlivro = l.codlivro
  AND r.dataret IN (SELECT MAX(r.dataret) FROM retirada r);


/* PARTE 02 */

/* Quais usuários já retiraram o livro que possui o código 1? Mostrar o código, o nome, data
de nascimento e nome da cidade destes usuários. */

SELECT u.codusu,
       u.nome as nome_usu,
       u.datanasc,
       c.nome as cidade
FROM usuario u,
     cidade c,
     retirada r
WHERE u.codcid = c.codcid
  AND u.codusu = r.codusu
  AND r.codlivro = 1;

/* Criar uma consulta que mostre um resumo para cada usuário. Exibir o código e o nome
do usuário, quantas reservas e quantas retiradas ele fez. As contagens devem ser obtidas
por subconsultas usadas na cláusula SELECT da consulta principal. */

SELECT u.codusu,
       u.nome as usuario,
       (SELECT COUNT(r.codres) FROM reserva r WHERE u.codusu = r.codusu) qntd_reservas,
       (SELECT COUNT(r1.codret) FROM retirada r1 WHERE u.codusu = r1.codusu) qntd_retiradas
FROM usuario u;