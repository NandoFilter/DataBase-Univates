/* Mostrar as retiradas feitas no período de 01/07/19 a 31/12/19. Para cada retirada, mostrar o código
do livro, o título do livro, a sequencia do exemplar, a data da retirada, o nome do usuário que fez a
retirada, o nome do bibliotecário que fez o atendimento. */

SELECT r.codlivro, l.titulo, r.sequencia, r.dataret data_retirada, u.nome nome_usuario, b.nome nome_bibliotecario
FROM retirada r,
     exemplar e,
     livro l,
     usuario u,
     bibliotecario b
WHERE e.codlivro = l.codlivro
  AND r.codlivro = e.codlivro
  AND r.sequencia = e.sequencia
  AND r.codusu = u.codusu
  AND r.nummat = b.nummat
  AND r.dataret BETWEEN '01/07/19' AND '31/12/19';

SELECT r.codlivro, l.titulo, r.sequencia, r.dataret data_retirada, u.nome nome_usuario, b.nome nome_bibliotecario
FROM retirada r
         INNER JOIN exemplar e ON r.codlivro = e.codlivro AND r.sequencia = e.sequencia
         JOIN livro l ON e.codlivro = l.codlivro
         JOIN usuario u ON r.codusu = u.codusu
         JOIN bibliotecario b ON r.nummat = b.nummat
WHERE r.dataret BETWEEN '01/07/19' AND '31/12/19';


/* Mostrar a lista dos autores cadastrados e para aqueles que possuem livro associado, mostrar os
 livros dos autores. Quando o autor não possuir livro deverá aparecer pelo menos uma vez no resultado. */

SELECT a.nome, l.titulo
FROM autor a
         LEFT JOIN livroautor la ON a.codaut = la.codaut
         LEFT JOIN livro l ON la.codlivro = l.codlivro;

SELECT *
FROM autor INSERT INTO autor;
VALUES (10, 'Fernando', 'RUA A', 1);



