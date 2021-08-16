use tpcds
go
BULK INSERT catalog_sales FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\catalog_sales.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT customer FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\customer.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT customer_address FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\customer_address.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT customer_demographics FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\customer_demographics.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT date_dim FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\date_dim.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT dbgen_version FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\dbgen_version.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT household_demographics FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\household_demographics.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT income_band FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\income_band.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT inventory FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\inventory.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT item FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\item.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT promotion FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\promotion.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT reason FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\reason.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT ship_mode FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\ship_mode.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT store FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\store.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT store_returns FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\store_returns.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT store_sales FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\store_sales.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT time_dim FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\time_dim.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT warehouse FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\warehouse.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT web_page FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\web_page.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT web_returns FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\web_returns.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT web_sales FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\web_sales.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT web_site FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\web_site.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT call_center FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\call_center.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT catalog_page FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\catalog_page.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')
BULK INSERT catalog_returns FROM 'G:\dbquery-optimizer\data\tpcds-data\edited\catalog_returns.csv' WITH (TABLOCK, DATAFILETYPE='char', CODEPAGE='raw', FIELDTERMINATOR = '|')