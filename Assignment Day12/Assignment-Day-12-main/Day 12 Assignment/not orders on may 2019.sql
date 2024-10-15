SELECT *FROM hotel_details hd
WHERE NOT EXISTS(
    SELECT 1 FROM orders o
    WHERE o.hotel_id =hd.hotel_id
    AND o.order_date BETWEEN '2019-05-01' AND '2019-05-31'
)
ORDER BY hd.hotel_id ASC;