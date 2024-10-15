CREATE TABLE orders(
   or_no NUMERIC(S) PRIMARY KEY,
   pur_amt DECIMAL(0,2),
   ord_date DATE,
   customer_id NUMERIC(S),
   salesman_id NUMERIC(S),
   FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
)