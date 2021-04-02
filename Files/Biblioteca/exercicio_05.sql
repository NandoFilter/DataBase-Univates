/* Criar uma consulta para mostrar quantos livros cada autor possui. Exibir o código
   e o nome do autor e a contagem dos livros de cada autor. Mostrar de forma ordenada
   em que apareçam na parte superior os autores com mais livros.*/

SELECT a.codaut, a.nome, COUNT(la.codlivro) as qntd_livros
FROM livroautor la,
     autor a
WHERE la.codaut = a.codaut
GROUP BY a.codaut
ORDER BY COUNT(la.codlivro) DESC;

/* Exibir os usuários e um resumo sobre as retiradas de cada usuário. Mostrar o nome
   do usuário, a data de nascimento do usuário, a soma das multas, quantas retiradas
   o usuário possui e a data da última retirada que o usuário fez.*/

SELECT u.nome,
       u.datanasc,
       SUM(r.multa)    as valor_multa,
       COUNT(r.codret) as qntd_ret,
       MAX(r.dataret)  as ultima_ret
FROM usuario u,
     retirada r
WHERE u.codusu = r.codusu
GROUP BY u.nome, u.datanasc;

/* Mostrar a lista completa das categorias cadastradas e para cada uma exibir quantos livros estão
associados a categoria. Exibir o código e a descrição da categoria e a contagem de livros. Categorias
que não possuem livros devem aparecer com a contagem igual a 0. */

SELECT c.codcat, c.descricao, COUNT(lc.codlivro) as qntd_livros
FROM livrocategoria lc
         LEFT JOIN categoria c ON c.codcat = lc.codcat
GROUP BY c.codcat, c.descricao;

/* Mostrar um resumo dos bibliotecários contratados por cidade. Exibir o código e o nome da cidade,
   quantos bibliotecários residem em cada cidade, a média dos salários do bibliotecários por cidade.
   Devem ser exibidas apenas as cidades que apresentam média de salário maior ou igual a 1500.
   Ordenar pelo número de bibliotecários de cada cidade.*/

SELECT b.nummat as cod_bibliotecario, c.nome as nome_cid, COUNT(b.codcid), b.valorsal
FROM bibliotecario b,
     cidade c
WHERE b.codcid = c.codcid
GROUP BY b.nummat, c.nome
ORDER BY COUNT(b.codcid);