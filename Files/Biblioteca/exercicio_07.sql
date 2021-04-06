/* Mostrar estatísticas dos salários dos bibliotecários por estado. Exibir o código, o nome e a
sigla do estado, o valor médio do salário, o maior e o menor salário para cada estado. */

SELECT e.codest,
       e.nome  as      nome_estado,
       e.sigla as      sigla_estado,
       AVG(b.valorsal) media_salario,
       MAX(b.valorsal) maior_salario,
       MIN(b.valorsal) menor_salario
FROM estado e,
     bibliotecario b,
     cidade c
WHERE b.codcid = c.codcid
  AND c.codest = e.codest
GROUP BY e.codest;

/* Criar uma consulta que mostre os livros cadastrados na base de dados e para cada livro,
quantos exemplares existem em cada situação (B, D, R). O sistema deve mostrar o título
do livro, a sequencia do exemplar, a situação e, ao lado a contagem de exemplares
naquela situação. */

SELECT l.titulo, e.situacao, COUNT(e.situacao) num_exemplares
FROM livro l,
     exemplar e
WHERE l.codlivro = e.codlivro
GROUP BY l.codlivro, e.situacao

/* Criar uma consulta para um resumo das reservas por editora. Exibir o código e a
descrição da editora, quantas reservas foram feitas, quantos usuários diferentes fizeram
reservas para livros da editora, a data da primeira e da última reserva para cada editora.
Mostrar somente as editoras que possuem mais de duas reservas. */

SELECT e.codedit,
       e.nome as                nome_editora,
       COUNT(r.codres)          num_reservas,
       COUNT(DISTINCT r.codusu) num_usuarios,
       MIN(r.datares)           primeira_reserva,
       MAX(r.datares)           ultima_reserva
FROM editora e,
     reserva r,
     livro l
WHERE e.codedit = l.codedit
  AND r.codlivro = l.codlivro
GROUP BY e.codedit
HAVING COUNT(r.codres) > 2;
