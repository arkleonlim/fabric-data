CREATE VIEW Sales.staging_salesdata AS
SELECT * FROM [DataStagingLakehouse].[dbo].[new_sales_data_transformed]