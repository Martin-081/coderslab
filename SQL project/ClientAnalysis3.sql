/*
Client analysis - part 3
Use the query created in the previous task and modify it to determine the percentage of each district in the total amount of loans granted.
 */



select
    -- A3 as Area,
    A2 as District,
    count(loan_id) as NumberOfLoans,
    sum(amount) as AmountOfLoans,
    round(sum(amount) * 100.0 / sum(sum(amount)) over (),2) as PercentageOfAmountOfLoans,
    round(count(loan_id) * 100.0 / sum(count(loan_id)) over (), 2) AS PercentageOfNumberOfLoans

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
Podle potřeby zvolím kraj nebo okres a nevyhovující v kodu zakomentuji.
*/