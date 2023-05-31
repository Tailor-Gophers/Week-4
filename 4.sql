-- Section1
    create index orders_created_at_total_index
    on orders (created_at, total);
-- Section2
    create index orders_created_at_user_id_total_index
    on orders (user_id, created_at, total);
-- Section3
    SELECT t2.date, COALESCE(t1.t, 0) AS t 
    FROM (
        SELECT DATE_FORMAT(created_at, '%Y-%m-%d') AS date, sum(total) AS t 
        FROM orders 
        GROUP BY DATE_FORMAT(created_at, '%Y-%m-%d')
    ) AS t1
    RIGHT JOIN (
        SELECT DATE(ADDDATE(@min, INTERVAL @i:=@i+1 DAY)) AS date 
        FROM orders 
        JOIN (SELECT @i := -1) r1 
        JOIN (SELECT @min:=min(orders.created_at) FROM orders) r2 
        JOIN (SELECT @max:=max(orders.created_at) FROM orders) r3
        HAVING @i < DATEDIFF(@max, @min)
    ) AS t2 ON t1.date=t2.date
    ORDER BY t2.date;