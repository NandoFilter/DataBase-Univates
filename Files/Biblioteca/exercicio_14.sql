/* Criar duas procedures que retornem os dados de consultas. A primeira deve trazer o
número de retiradas e a data da última retirada para cada livro em um determinado
período (parâmetros). A segunda deve trazer o número de reservas e a data da última
reserva para cada livro em um período especificado pelos parâmetros. Ambas devem
retornar o código do livro, a contagem e a data. Após a criação das procedures, elas
devem ser usadas em uma consulta que mostre o código, o título, o nome da editora do
livro, além da quantidade de reservas, de retiradas e as datas da última reserva e última
retirada. Testar com períodos diferentes. */

create type t_retiradas_livro as
(
    codlivro  int,
    contagem  bigint,
    maiordata date
);

create or replace function f_retiradas_livro(datainicial date, datafinal date)
    returns setof t_retiradas_livro
as
$$

select r.codlivro, count(r.codret), max(r.dataret)
from retirada r
where r.dataret between datainicial and datafinal
group by r.codlivro

$$ language sql;

create or replace function f_reservas_livro(datainicial date, datafinal date)
    returns setof t_retiradas_livro
as
$$

select r.codlivro, count(r.codres), max(r.datares)
from reserva r
where r.datares between datainicial and datafinal
group by r.codlivro

$$ language sql;

select l.codlivro,
       l.titulo,
       e.nome,
       fret.contagem  qnt_retiradas,
       fres.contagem  qntd_reservas,
       fret.maiordata ultimaretirada,
       fres.maiordata ultimareserva
from f_retiradas_livro('19-01-01', '19-12-31') fret,
     f_reservas_livro('19-01-01', '19-12-31') fres,
     livro l,
     editora e
where fret.codlivro = l.codlivro
  and fres.codlivro = l.codlivro
  and l.codedit = e.codedit;