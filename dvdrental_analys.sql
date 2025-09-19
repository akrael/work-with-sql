--- ïîëó÷åíèå ïîëåé
select
    payment_id as "¹ ïëàòåæà",
    customer_id as "¹ ïîêóïàòåëÿ",
    amount as "ñóììà ïëàòåæà"
from
    payment

--- âûâîä ñóììû ïëàòåæà â ðóáëÿõ 
select
    amount as "ñóììà  äîëëàðàõ" ,
    amount * 85 as "Ñóììà â ðóáëÿõ"
from
    payment p
--- âûâîä óíèêàëüíûõ çíà÷åíèé 
select
    distinct rental_duration
from
    film f
--- âûâîä èìåí àêòåðîâ ÷üè èìåíà íà÷èíàþòñÿ íà R
select
    first_name as "Èìåíà íà 'R'"
from
    actor a
where
    first_name like 'R%'
--- ôèëüòðàöèÿ âûâîäà äàííûõ 
--- 1) ïî ñòîèìîñòè 
select
    amount
from
    payment
where
    amount > 7.00
    or amount between 3.3 and 5.5
--- 2) ïî äëèííå ôèëüìà
select
    title as "íàçâàíèå ôèëüìà",
    length  as "ïðîäîëæèòåëüíîñòü ôèëüìà"
from
    film f
where f.length = 87
or f.length = 116
or f.length = 184
--- Âûâîä ôèëüìîâ ïî âûáðàííîé êàòåãîðèè 
--- ðàáîòà ñ ïðîìåæóòî÷íîé òàáëèöåé
select
    f.title as "film name",
    c."name" 
from
    film_category fc
join film f on fc.film_id = f.film_id
join category c on fc.category_id = c.category_id 
where c."name" = ('Comedy')
--- ðàáîòà ñ ïðîìåæóòî÷íîé òàáëèöåé, áåç ôèëüòðà
--- ïî êàòåãîðèè
select
    f.title as "film name",
    c."name" 
from
    film_category fc
join film f on fc.film_id = f.film_id
join category c on fc.category_id = c.category_id 
order by "film name" 
--- Ñîâìåùåíèå äàííûõ èç ðàçíûõ ñòîëáöîâ 
--- ðàáîòà ñ ïðîìåæóòî÷íîé òàáëèöåé äëÿ ïîëó÷åíèÿ äàííûõ
--- î àêòåðàõ ñ ôèëüìîãðàôèåé áîëüøå 20òè ôèëüìîâ 
select
    a.first_name || ' ' || a.last_name as name,
    count(film_id) as film_number
from
    film_actor fa
join actor a on fa.actor_id = a.actor_id
group by name 
having count(film_id) > 20


