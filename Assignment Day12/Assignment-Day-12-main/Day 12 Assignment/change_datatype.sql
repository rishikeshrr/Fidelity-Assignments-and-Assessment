ALTER TABLE customers
ALTER COLUMN customer_id TYPE INT USING customer_id::integer;