SELECT o.order_id,c.customer_name,h.hotel_name,o.order_amount
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
JOIN hotel_details h ON o.hotel_id =h. hotel_id
ORDER BY o.order_id ASC;