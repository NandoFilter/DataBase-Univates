-- Exercício 01

/* Produtos podem estar armazenados em prateleiras ou simplesmente estarem
alocados em uma seção, sem ficarem em determinada prateleira. Em função de
um tamanho maior produtos que não estão em prateleira estão associados somente
a uma ou mais seções. Para saber a localização dos produtos, faça uma consulta
que mostre o código e a descrição do produto, o número das prateleiras em que o
produto está (caso ele esteja em prateleira) ou o número das seções (caso de
produtos que não estão em prateleiras). É necessário garantir que todos os
produtos apareçam, mesmo que não estejam em prateleiras ou seções. */

SELECT p.codprod as cod_produto, p.descricao, pr.numprat as num_prateleira, pr.numsecao as num_secao
FROM produto p
         LEFT JOIN prateleira pr ON p.codprod = pr.codprod
         LEFT JOIN secao s ON pr.numsecao = s.numsecao

-- Exercício 02

/* Houve um problema com o estoque e a empresa suspeita que movimentações
incorretas foram feitas no mês de junho de 2018. Para auxiliar na detecção do
problema, faça uma consulta que mostre as movimentações feitas neste mês.
Mostre o código e a descrição do produto, a data e a hora da movimentação, a
quantidade movimentada, além da descrição do grupo do produto. Para facilitar a
visualização, ordene por descrição de produto. */

SELECT p.codprod, p.descricao as desc_prod, mv.datahora, mv.qtde as qntd_mov, gp.descricao as desc_grupoProd
FROM produto p,
     movest mv,
     grupoprod gp
WHERE mv.codprod = p.codprod
  AND p.codgru = gp.codgru
  AND mv.datahora BETWEEN '01/06/2018' AND '30/06/2018'
ORDER BY p.descricao

