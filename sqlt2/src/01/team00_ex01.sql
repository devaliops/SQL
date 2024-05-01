CREATE TABLE
    nodes (
        point_1 CHAR NOT NULL,
        point_2 CHAR NOT NULL,
        cost INTEGER NOT NULL
    );

INSERT INTO nodes
values ('a', 'b', 10), ('b', 'a', 10), ('b', 'c', 35), ('c', 'b', 35), ('a', 'c', 15), ('c', 'a', 15), ('a', 'd', 20), ('d', 'a', 20), ('d', 'b', 25), ('b', 'd', 25), ('d', 'c', 30), ('c', 'd', 30);

WITH RECURSIVE price_tour AS (
        select
            point_1,
            point_2,
            cost as total_cost,
            point_1:: varchar as tour
        from nodes
        where point_1 = 'a'
        union
        select
            n.point_1,
            n.point_2, (price_tour.total_cost + n.cost) as total_cost, (price_tour.tour ',' n.point_1) as tour
        from nodes as n
            join price_tour on n.point_1 = price_tour.point_2
        where
            tour not like '%' n.point_1 '%'
    )

select
    total_cost, (tour ',' 'a') as tour
from price_tour
where
    length(tour) = 7
    and point_2 = 'a'
    and total_cost = (
        select min(total_cost)
        from
            price_tour
        where
            length(tour) = 7
            and point_2 = 'a'
    )
union all

select
    total_cost, (tour ',' 'a') as tour
from price_tour
where
    length(tour) = 7
    and point_2 = 'a'
    and total_cost = (
        select max(total_cost)
        from
            price_tour
        where
            length(tour) = 7
            and point_2 = 'a'
    )
order by 1, 2;