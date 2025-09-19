-- Create a schema named Sales — a container for organizing related tables (like a folder).
CREATE Schema [Sales]
GO

-- Create Fact_Sales     
 IF NOT EXISTS (SELECT * FROM sys.tables WHERE name='Fact_Sales' AND SCHEMA_NAME(schema_id)='Sales')
 	CREATE TABLE Sales.Fact_Sales (
 		CustomerID VARCHAR(255) NOT NULL,
 		ItemID VARCHAR(255) NOT NULL,
 		SalesOrderNumber VARCHAR(30),
 		SalesOrderLineNumber INT,
 		OrderDate DATE,
 		Quantity INT,
 		TaxAmount FLOAT,
 		UnitPrice FLOAT,
        [Year] INT,
        [Month] INT
 	);

-- Create Dim_Customer    
 IF NOT EXISTS (SELECT * FROM sys.tables WHERE name='Dim_Customer' AND SCHEMA_NAME(schema_id)='Sales')
     CREATE TABLE Sales.Dim_Customer (
         CustomerID VARCHAR(255) NOT NULL,
         CustomerName VARCHAR(255) NOT NULL,
         FirstName VARCHAR(255) NOT NULL,
        LastName VARCHAR(255) NOT NULL,
         EmailAddress VARCHAR(255) NOT NULL
     );
        
-- Add PK Constraint in Dim_Customer to ensure CustomerID is unique        
 ALTER TABLE Sales.Dim_Customer add CONSTRAINT PK_Dim_Customer PRIMARY KEY NONCLUSTERED (CustomerID) NOT ENFORCED
 GO
    
-- Create Dim_Item (Product)    
 IF NOT EXISTS (SELECT * FROM sys.tables WHERE name='Dim_Item' AND SCHEMA_NAME(schema_id)='Sales')
     CREATE TABLE Sales.Dim_Item (
         ItemID VARCHAR(255) NOT NULL,
         ItemName VARCHAR(255) NOT NULL
     );


-- Add PK Constraint in Dim_Item to ensure ItemID is unique
 ALTER TABLE Sales.Dim_Item add CONSTRAINT PK_Dim_Item PRIMARY KEY NONCLUSTERED (ItemID) NOT ENFORCED
 GO