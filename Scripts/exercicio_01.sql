/* Mostrar os dados dos livros que estão localizados na estante que possui o código 1. Exibir o título
do livro, o isbn, o código da editora e os nomes dos autores de cada livro. Ordenar os dados pelo
título do livro. */

SELECT l.titulo, l.isbn, l.numest, l.codedit, a.nome
FROM livro l,
     livroautor la,
     autor a
WHERE l.codlivro = la.codlivro
  AND a.codaut = la.codaut
  AND l.numest = 1;

SELECT l.titulo, l.isbn, l.numest, l.codedit, a.nome
FROM livro l
         INNER JOIN livroautor la ON l.codlivro = la.codlivro
         INNER JOIN autor a ON a.codaut = la.codaut
WHERE l.numest = 1
ORDER BY l.titulo;


/* Exibir a lista dos bibliotecários admitidos a partir do ano de 2010. Exibir o nome, a data de
admissão do bibliotecário, o nome da cidade, o nome do estado e o nome do país de residência dos
bibliotecários. */

SELECT b.nome nome_bibliotecario, b.dataadm, c.nome nome_cidade, e.nome nome_estado, p.nome nome_pais
FROM bibliotecario b,
     cidade c,
     estado e,
     pais p
WHERE b.codcid = c.codcid
  AND c.codest = e.codest
  AND e.codpais = p.codpais
  AND b.dataadm >= '01/01/2010';

SELECT b.nome nome_bibliotecario, b.dataadm, c.nome nome_cidade, e.nome nome_estado, p.nome nome_pais
FROM bibliotecario b
         INNER JOIN cidade c ON b.codcid = c.codcid
         INNER JOIN estado e ON c.codest = e.codest
         INNER JOIN pais p ON e.codpais = p.codpais
WHERE b.dataadm >= '01/01/2010';