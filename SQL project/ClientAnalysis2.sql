/*
Client analysis - part 2
Make analyses that answer the questions:

which area has the most clients,
in which area the highest number of loans was paid,
in which area the highest amount of loans was paid.
Select only owners of accounts as clients.
 */



select
    A2 as District,
    -- A3 as Area,
    count(c.client_id) as NumberOfClients,
    count(loan_id) as NumberOfLoans,
    sum(amount) as AmountOfLoans

from loan l

join disp d  on l.account_id = d.account_id
join client c on d.client_id = c.client_id
join district dstr on c.district_id = dstr.district_id
    where status in ('A','C')
    and type in ('OWNER')

group by District
         -- Area
order by AmountOfLoans desc
;
/*
Nejvíce klientů, nejvyšší počet úvěrů, nejvyšší celkovou částku úvěrů má region south Moravia.
Nejvíce klientů, nejvyšší počet úvěrů, nejvyšší celkovou částku úvěrů má okres Hl. m. Praha.
*/