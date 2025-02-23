/*
Client analysis - part 1
Modifying the queries from the exercise on repaid loans, answer the following questions:

Who has more repaid loans - women or men?
What is the average age of the borrower divided by gender?
 */



select
    count(loan_id) as NumberOfLoans,
    gender as Gender,
    round(avg(timestampdiff(year,birth_date, date))) as AverageAge

from loan l

join disp d  on l.account_id = d.account_id
join client c on d.client_id = c.client_id
    where status in ('A','C')
    and type in ('OWNER')

group by gender
;

/*
Vyšší počet úvěrů byl poskytnut ženám, s vyšším průměrným věkem mužů.
Průměrný věk je počítán k datu poskytnutí úvěru, v zadání je sice použit rok 2024, ale to mi nedávalo smysl.
*/