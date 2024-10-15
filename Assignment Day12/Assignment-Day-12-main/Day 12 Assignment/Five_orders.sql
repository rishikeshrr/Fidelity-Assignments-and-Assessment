SELECT h.hotel_id,h.hotel_name, COUNT(o.order_id) AS NO_OF_ORDERS
FROM hotel_details h JOIN orders o ON h.hotel_id=o.hotel_id
GROUP BY h.hotel_id,h.hotel_name
HAVING COUNT(o.order_id)>5
ORDER BY h.hotel_id ASC;