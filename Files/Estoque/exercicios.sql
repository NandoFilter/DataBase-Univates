-- Exercício 01

/* Produtos podem estar armazenados em prateleiras ou simplesmente estarem
alocados em uma seção, sem ficarem em determinada prateleira. Em função de
um tamanho maior produtos que não estão em prateleira estão associados somente
a uma ou mais seções. Para saber a localização dos produtos, faça uma consulta
que mostre o código e a descrição do produto, o número das prateleiras em que o
produto está (caso ele esteja em prateleira) ou o número das seções (caso de
produtos que não estão em prateleiras). É necessário garantir que todos os
produtos apareçam, mesmo que não estejam em prateleiras ou seções. */

SELECT p.codprod as produto, p.descricao as nome, pr.numprat as prateleira, s.numsecao as seção
FROM produto p
         FULL OUTER JOIN prateleira pr ON p.codprod = pr.codprod
         FULL OUTER JOIN secao s on pr.numsecao = s.numsecao;


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
ORDER BY p.descricao;

-- Exercício 03

/* O gerente de vendas da empresa precisa saber quais vendas foram feitas no mês
de maio de 2018 e para quem estas foram feitas. Ele solicitou uma listagem das
vendas com os seguintes dados: número da nota fiscal, data da emissão, nome do
cliente, nome da cidade do cliente, além dos produtos de cada venda, mostrando
código do produto, quantidade vendida e o valor total de cada produto vendido
(quantidade * preço). */

SELECT nfv.numnf                as num_notaFiscal,
       nfv.dtemissao            as data_emissao,
       c.fantasia,
       cid.nome                 as nome_cidade,
       pnfv.codprod             as cod_prod,
       pnfv.qtde                as qntd_prod,
       (pnfv.qtde * pnfv.preco) as preco
FROM nfvenda nfv,
     cliente c,
     cidade cid,
     prodnfvenda pnfv
WHERE pnfv.numnf = nfv.numnf
  AND nfv.codcli = c.codcli
  AND c.codcid = cid.codcid
  AND nfv.dtemissao BETWEEN '01/05/2018' AND '31/05/2018'

-- Exercício 04

/* Elabore uma consulta que mostre todas as movimentações feitas pelos
funcionários 74 e 75 (considerar funcionário responsável pela movimentação).
Mostrar o código e a descrição do produto, a data e hora da movimentação, o
nome do funcionário responsável pela movimentação e a quantidade
movimentada. */

SELECT p.codprod, p.descricao as descricao_prod, mv.datahora, f.nome as nome_funcionario, mv.qtde
FROM produto p,
     movest mv,
     funcionario f
WHERE mv.codprod = p.codprod
AND f.matfunc BETWEEN '74' AND '75';