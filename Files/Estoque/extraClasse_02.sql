/* Atividade Extra Classe 02 */

/* Fernando Halmenschlager Filter - 703692*/

--------------------------------------------------

-- Exercício 01

/* Criar uma consulta que mostre a soma das quantidades movimentadas para cada
produto. Considerar somente as movimentações feitas no primeiro semestre de
2018. Exibir o código e a descrição do produto e a soma das quantidades
movimentadas. Ordenar os resultados pelo código do produto. */

SELECT p.codprod as codigo, p.descricao as descricao, SUM(m.qtde) quantidade
FROM produto p,
     movest m
WHERE m.codprod = p.codprod
  AND m.datahora BETWEEN '01/01/2018%' and '30/06/2018%'
GROUP BY p.codprod
ORDER BY p.codprod;

--------------------------------------------------

-- Exercício 02

/* Quando um produto é comprado é lançada uma nota fiscal de compra no sistema
(nfcompra). Cada nota possui diversos produtos que são comprados. Faça uma
consulta que calcule a soma das quantidades e o preço médio das compras por
produto. Exibir o código e a descrição do produto e a descrição do grupo do
produto, além da soma das quantidades compradas e da média do preço de
compra. Exibir apenas os produtos que possuem soma de quantidade maior do que 50. */

SELECT p.codprod    as codigo,
       p.descricao,
       gp.descricao as descricao_grupo,
       SUM(pnfc.qtde)  somaQntd,
       AVG(pnfc.preco) mediaPreco
FROM produto p,
     grupoprod gp,
     prodnfcompra pnfc
WHERE p.codgru = gp.codgru
  AND pnfc.codprod = p.codprod
GROUP BY p.codprod, gp.descricao
HAVING SUM(pnfc.qtde) > 50;

--------------------------------------------------

-- Exercício 03

/* Para verificar a produtividade dos funcionários do estoque foi solicitada uma
consulta que mostre cada funcionário, o número de movimentações que ele fez
(foi responsável) e data e hora da última movimentação feita por cada um dos
responsáveis por movimentações de estoque. */

SELECT f.nome as funcionario, COUNT(m.funcresp) mov_func, MAX(m.datahora) ultima_mov
FROM funcionario f,
     movest m
WHERE m.funcresp = f.matfunc
GROUP BY f.matfunc;