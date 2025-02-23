/*
Client selection 1
Check the database for the clients who meet the following results:

their account balance is above 1000,
they have more than 5 loans,
they were born after 1990.
And we assume that the account balance is loan amount - payments.

*/



select

    c.client_id as Client,
    count(loan_id) as NumberOfLoans,
    round(sum(amount - payments)) as AccountBalance,
    birth_date as BirthDate


from loan l

join disp d  on l.account_id = d.account_id
join client c on d.client_id = c.client_id
where type in ('OWNER')
    -- and extract(year from birth_date) > 1990
group by Client
having sum(amount - payments) > 1000
       -- and count(loan_id) > 5
order by AccountBalance desc
;


/*
Není žádný klient s počtem úvěrů vyšším než 5 a s rokem narození mladším než 1990.
*/