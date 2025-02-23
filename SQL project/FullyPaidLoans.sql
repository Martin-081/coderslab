/*
Fully paid loans
Find out the balance of repaid loans, divided by client gender.

Additionally, use a method of your choice to check whether the query is correct.
 */

select
    sum(amount) as AmountBalance

from loan l
join disp d  on l.account_id = d.account_id
join client c on d.client_id = c.client_id
    where status in ('A','C')
    and type in ('owner')
;


select

    sum(amount) as AmountBalance,
    gender as Gender


from loan l

join disp d  on l.account_id = d.account_id
join client c on d.client_id = c.client_id
    where status in ('A','C')
    and type in ('owner')

group by gender with rollup
;

/*
Prvním příkazem zjištěna celková suma poskytnutých a splacených úvěrů.
Některé účty byly zobrazeny 2x, protože byl uveden owner i disponent účtu, toto omezeno pouze na ownera.
Pro kontrolu použito /group by with rollup/, kde zobrazí celkovou sumu poskytnutých a splacených
úvěrů bez ohledu na volbu pohlaví.
*/