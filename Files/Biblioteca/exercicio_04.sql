/* Mostrar as retiradas em que a entrega real ocorreu no ano de 2017. Exibir a data da retirada,
   data da entrega, valor da multa, nome do usuário que fez a retirada, nome da cidade do usuário,
   o título do livro, o nome da editora do livro e o número da estante em que está o livro. Ordenar
   pelo nome do usuário.*/

SELECT r.dataret     as data_retirada,
       r.dataentreal as data_entrega,
       r.multa,
       u.nome        as nome,
       c.nome        as cidade,
       l.titulo,
       e.nome,
       es.numest     as numero_estante
FROM retirada r,
     usuario u,
     livro l,
     cidade c,
     editora e,
     estante es
WHERE u.codusu = r.codusu
  AND r.codlivro = l.codlivro
  AND u.codcid = c.codcid
  AND l.numest = es.numest
  AND l.codedit = e.codedit
  AND r.dataret BETWEEN '01/01/2017' AND '03/12/2017'
ORDER BY u.nome;

/* Exibir a lista completa das editoras cadastradas e para cada uma delas, mostrar as retiradas dos
   livros (quando houver) que a editora possui. Exibir o código e nome da editora, título e isbn do
   livro, data da retirada, data da entrega prevista e o nome do usuário que fez a retirada. */

SELECT e.codedit     as cod_edit,
       e.nome        as editora,
       l.titulo,
       l.isbn,
       r.dataret     as data_ret,
       r.dataentprev as entrega_prev,
       u.nome        as usuario
FROM editora e,
     retirada r,
     livro l,
     usuario u
WHERE e.codedit = l.codedit
  AND u.codusu = r.codusu
  AND r.codlivro = l.codlivro;

/* Mostrar os livros que têm a palavra ‘banco’ no título. Exibir o título do livro, a edição do livro,
   o nome da editora e as descrições das categorias relacionadas a cada livro. Ordenar o resultado
   pela descrição da categoria e pelo título do livro. */

SELECT l.titulo,
       l.edicao,
       e.nome,
       c.descricao
FROM livro l,
     editora e,
     livrocategoria lc,
     categoria c
WHERE lc.codlivro = l.codlivro
  AND lc.codcat = c.codcat
  AND l.codedit = e.codedit
  AND l.titulo LIKE '%banco%'
ORDER BY c.descricao,
         l.titulo;