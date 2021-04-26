/* Prova 01 */

/* Fernando Halmenschlager Filter - 703692 */

/* 1. Mostrar a lista dos eventos que foram organizados por instituições localizadas na cidade de
‘Duis’. Exibir o código e o nome do evento, o nome da instituição e o nome da cidade. */

SELECT e.codeve as cod_evento,
       e.titulo as nome_evento,
       i.nome   as nome_inst,
       c.nome   as nome_cid
FROM evento e,
     instituicao i,
     cidade c
WHERE e.codinst = i.codinst
  AND i.codcid = c.codcid
  AND c.nome = 'Duis';

/* 2. Existem diversos eventos que ocorreram no ano de 2019. O presidente da associação que
gerencia os eventos deseja saber quantas inscrições foram feitas para os eventos que tiveram
data de início no referido ano (2019). A consulta deve mostrar o código e o nome do evento e
a quantidade de inscrições para cada evento. */

SELECT e.codeve as         cod_evento,
       e.titulo as         evento,
       COUNT(i.numeroinsc) qntd_insc
FROM evento e,
     inscricao i
WHERE i.codeve = e.codeve
  AND e.dataini BETWEEN '01/01/2019' AND '31/12/2019'
GROUP BY e.codeve;

/* 3. As pessoas cadastradas podem estar vinculadas a instituições, especialmente no caso de
alunos e professores. Para conhecer estes vínculos elabore uma consulta que mostre a lista
completa de instituições cadastradas e para cada uma delas, as pessoas vinculadas. Exibir o
código e o nome da instituição e os nomes das pessoas associadas a cada instituição. Ordenar
pelo nome da instituição. */

SELECT i.codinst,
       i.nome as instituicao,
       p.nome as nome_associado
FROM instituicao i,
     instituicaopessoa ip,
     pessoa p
WHERE ip.codinst = i.codinst
  AND ip.codpess = p.codpess
ORDER BY i.nome;

-- Correção:

SELECT i.codinst,
       i.nome as nome_instituicao,
       p.nome as nome_pessoa
FROM instituicao i
         LEFT JOIN instituicaopessoa ip ON i.codinst = ip.codinst
         LEFT JOIN pessoa p ON p.codpess = ip.codpess
ORDER BY i.nome;

/* 4. O administrador financeiro da associação que controla os eventos deseja saber quanto foi
arrecadado para cada atividade. Para obter esta informação precisa de uma consulta que
mostre o código do evento, a sequencia da atividade, a soma e a média dos valores pagos nas
inscrições feitas para a atividade. É importante verificar que a chave da atividade é composta
(codeve, sequencia) e o agrupamento deve ser feito por esta chave. */

SELECT a.codeve,
       a.sequencia,
       SUM(ia.valor) soma_valores,
       AVG(ia.valor) media_valores
FROM atividade a,
     inscativ ia
WHERE ia.codeve = a.codeve
  AND ia.sequencia = a.sequencia
GROUP BY a.codeve, a.sequencia;

-- Outro formato:

SELECT ia.codeve, ia.sequencia, SUM(ia.valor) soma_valor, AVG(ia.valor) media_valores
FROM inscativ ia
GROUP BY ia.codeve, ia.sequencia;