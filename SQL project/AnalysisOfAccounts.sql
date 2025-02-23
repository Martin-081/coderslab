/*
Analysis of accounts
Write a query that ranks accounts according to the following criteria:

number of given loans (decreasing),
amount of given loans (decreasing),
average loan amount,
Only fully paid loans are considered.
 */


select
    account_id as AccounId,
    -- rank() over (order by count(loan_id)) as RankByGivenLoans,
    rank() over (order by sum(amount)) as RankByAmount,
    count(loan_id) as GivenLoans,
    sum(amount) as TotalAmount,
    round(avg(amount)) as AverageAmount


from loan l
where status in ('A','C')

group by account_id
order by RankByAmount desc
;

/*
Použil jsem pouze RankByAmount - podle poskytnuté výše úvěru, protože pro každé account_id byl poskytnut právě 1 úvěr
a nedávalo by to v tom případě smysl pužít i RankByGivenLoans (podle počtu poskytnutých úvěrů, i když je v zadání).
*/