CREATE TABLE Supplier(
   Supplier_id NUMERIC(S) PRIMARY KEY,
   Supplier_name VARCHJAR(150),
   Address VARCHAR(150),
   City VARCHAR(50),
   State VARCHAR(15),
   Country VARCHAR(15),
   contact VARCHAR(10)
);
GO

ALTER TABLE Supplier
ADD CONSTRAINT chk_contact_length CHECK (LEN(contact)=10);
GO