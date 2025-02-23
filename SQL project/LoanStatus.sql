/*
Loan status
On the database site, we can find information that there are a total of 682 granted loans in the database, of which 606 have been repaid and 76 have not.

Let's assume that we don't have information about which status corresponds to a repaid loan and which does not. In this situation, we need to infer this information from the data.

To do this, write a query to help you answer the question of which statuses represent repaid loans and which represent unpaid loans.
*/

select
    count(status)
from loan l;

select
    sum(amount) as AmountOfLoans,
    count(loan_id) as StatusCounter,
    status as Status
from loan l
where status in ('A','C')
group by status with rollup ;
/*
Počet všech statusů je 682, z toho je 606 splacených a 76 nesplacených.
Nedokázal jsem vytvořit kod pro zjištění součtu statusů,který by dohromady měl hodnotu 606(splacené úvěry) nebo 76(nesplacené úvěry).
Spočítáno "ručně:-)" s výsledkem, počet statusů /A+C=606/ a /B+D = 76/,
se závěrem,že statusy A a C reprezentují splacené úvěry a B a D úvěry nesplacené.
 */


