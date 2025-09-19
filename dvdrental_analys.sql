--- получение полей
select
    payment_id as "№ платежа",
    customer_id as "№ покупателя",
    amount as "сумма платежа"
from
    payment

--- вывод суммы платежа в рублях 
select
    amount as "сумма  долларах" ,
    amount * 85 as "Сумма в рублях"
from
    payment p
--- вывод уникальных значений 
select
    distinct rental_duration
from
    film f
--- вывод имен актеров чьи имена начинаются на R
select
    first_name as "Имена на 'R'"
from
    actor a
where
    first_name like 'R%'
--- фильтрация вывода данных 
--- 1) по стоимости 
select
    amount
from
    payment
where
    amount > 7.00
    or amount between 3.3 and 5.5
--- 2) по длинне фильма
select
    title as "название фильма",
    length  as "продолжительность фильма"
from
    film f
where f.length = 87
or f.length = 116
or f.length = 184
--- Вывод фильмов по выбранной категории 
--- работа с промежуточной таблицей
select
    f.title as "film name",
    c."name" 
from
    film_category fc
join film f on fc.film_id = f.film_id
join category c on fc.category_id = c.category_id 
where c."name" = ('Comedy')
--- работа с промежуточной таблицей, без фильтра
--- по категории
select
    f.title as "film name",
    c."name" 
from
    film_category fc
join film f on fc.film_id = f.film_id
join category c on fc.category_id = c.category_id 
order by "film name" 
--- Совмещение данных из разных столбцов 
--- работа с промежуточной таблицей для получения данных
--- о актерах с фильмографией больше 20ти фильмов 
select
    a.first_name || ' ' || a.last_name as name,
    count(film_id) as film_number
from
    film_actor fa
join actor a on fa.actor_id = a.actor_id
group by name 
having count(film_id) > 20
