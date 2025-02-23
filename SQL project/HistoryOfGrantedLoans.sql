USE financial19_99;

drop procedure SummaryOfGrantedLoans;
/*
History of granted loans
Write a query that prepares a summary of the granted loans in the following dimensions:

year, quarter, month,
year, quarter,
year,
total.
Display the following information as the result of the summary:

total amount of loans,
average loan amount,
total number of given loans.
*/

delimiter $$
create procedure SummaryOfGrantedLoans (in rok int, in kvartal int, in mesic int, in total boolean)

begin
    if total = true then
        select
            sum(amount) as Total_AmountOfLoans,
            round(avg(amount)) as Average_AmountOfLoans,
            count(loan_id) as GivenLoans
        from loan l;

    elseif mesic is not null then
        select
            year(date) as Year,
            quarter(date) as Quarter,
            month(date) as Month,
            sum(amount) as Total_AmountOfLoans,
            round(avg(amount)) as Average_AmountOfLoans,
            count(loan_id) as GivenLoans
        from loan l
        where (rok is null or year(date) = rok) and (kvartal is null or quarter(date) = kvartal) and (mesic is null or month(date) = mesic)
        group by Year, Quarter, Month
        order by Year, Quarter, Month;

    elseif kvartal is not null then
        select
            year(date) as Year,
            quarter(date) as Quarter,
            sum(amount) as Total_AmountOfLoans,
            round(avg(amount)) as Average_AmountOfLoans,
            count(loan_id) as GivenLoans
        from loan l
        where (rok is null or year(date) = rok) and (kvartal is null or quarter(date) = kvartal)
        group by Year, Quarter
        order by Year, Quarter;

    elseif rok is not null then
        select
            year(date) as Year,
            sum(amount) as Total_AmountOfLoans,
            round(avg(amount)) as Average_AmountOfLoans,
            count(loan_id) as GivenLoans
        from loan l
        where (rok is null or year(date) = rok)
        group by Year
        order by Year;

    else
        select
            year(date) as Year,
            quarter(date) as Quarter,
            month(date) as Month,
            sum(amount) as Total_AmountOfLoans,
            round(avg(amount)) as Average_AmountOfLoans,
            count(loan_id) as GivenLoans
        from loan l
        group by Year, Quarter, Month
        order by Year, Quarter, Month;


    end if;

end$$
delimiter ;


/*
Volání procedury se specifikací, jaký rozsah přehledu má být zobrazen - rok,kvartal,mesic,total,
pokud bude všude zadána hodnota null, tak se zobrazí přehled za všechny roky/kvartaly/měsíce,
pokud bude zadána pro total hodnota true, tak se zobrazí jen celkový přehled,
pokud bude zadán konkrétní rok,kvartal,mesic, tak se zobrazí přehled pro dané období (např.všechny 11.měsíce, pro všechny roky, kvartaly) (hodnota total však musí být null).
*/
CALL SummaryOfGrantedLoans(null, null, null, true);