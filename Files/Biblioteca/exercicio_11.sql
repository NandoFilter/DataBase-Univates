/* Criar uma consulta para mostrar os nomes dos usuários que pagaram multa em alguma
retirada no ano de 2016 e que também pagaram multa em alguma retirada do ano de
2017. Mostrar o código, o nome e a data de nascimento destes usuários. */

SELECT u.codusu,
       u.nome as usuario,
       u.datanasc
FROM usuario u
WHERE u.codusu IN (SELECT r.codusu FROM retirada r WHERE r.dataret BETWEEN '01/01/16' AND '31/12/16' AND r.multa > 0)
  AND u.codusu IN (SELECT r.codusu FROM retirada r WHERE r.dataret BETWEEN '01/01/17' AND '31/12/17' AND r.multa > 0);

/* O responsável pelas compras de livros está fazendo um levantamento das informações
sobre editoras. Ele deseja visualizar a lista completa das editoras cadastradas e para
cada uma delas, quer saber: Quantos livros existem, quantos exemplares existem com
situação diferente de ‘B’, quantas retiradas foram feitas para livros da editora. Exibir os
dados da editora e ao lado as três colunas com as contagens. */

SELECT e.codedit,
       e.nome as                                                           editora,
       (SELECT COUNT(l.codlivro) FROM livro l WHERE l.codedit = e.codedit) qntd_livros,
       (SELECT COUNT(ex.sequencia)
        FROM exemplar ex,
             livro l
        WHERE ex.codlivro = l.codedit
          AND l.codedit = e.codedit
          AND ex.situacao <> 'B')                                          qntd_exemplares_ativos,
       (SELECT COUNT(r.codret)
        FROM retirada r,
             livro l
        WHERE r.codlivro = l.codlivro
          AND l.codedit = e.codedit)                                       qntd_retiradas
FROM editora e;

/* Mostrar a lista das estantes que possuem livros que estão associados com a categoria
‘Banco de dados’, mas que não estão associados com a categoria ‘Programação’. Neste
caso deseja-se verificar se a estante está na lista dos livros da categoria de banco de
dados e que não esteja na lista de estantes dos livros de programação. */

SELECT e.numest as estante, e.descricao
FROM estante e
WHERE e.numest IN (SELECT l.numest
                   FROM livro l,
                        livrocategoria lv,
                        categoria c
                   WHERE l.codlivro = lv.codlivro
                     AND c.codcat = lv.codcat
                     AND c.descricao = 'Banco de dados')
  AND e.numest NOT IN (SELECT l.numest
                   FROM livro l,
                        livrocategoria lv,
                        categoria c
                   WHERE l.codlivro = lv.codlivro
                     AND c.codcat = lv.codcat
                     AND c.descricao = 'Programação');