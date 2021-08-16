CREATE CLUSTERED COLUMNSTORE INDEX cci_cc on call_center
CREATE CLUSTERED COLUMNSTORE INDEX cci_cp on [dbo].[catalog_page]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_cr on [dbo].[catalog_returns]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_cs on catalog_sales
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_customer on [dbo].[customer]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_cu_add on [dbo].[customer_address]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_cu_demo on [dbo].[customer_demographics]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_dd on [dbo].[date_dim]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_db on [dbo].[dbgen_version]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_hd on [dbo].[household_demographics]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_ib on [dbo].[income_band]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_item on [dbo].[item]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_promo on [dbo].[promotion]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_reason on [dbo].[reason]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_sm on [dbo].[ship_mode]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_store on [dbo].[store]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_sr on [dbo].[store_returns]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_ss on [dbo].[store_sales]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_td on [dbo].[time_dim]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_ware on [dbo].[warehouse]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_webp on [dbo].[web_page]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_webre on [dbo].[web_returns]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_webs on [dbo].[web_sales]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_website on [dbo].[web_site]
GO
CREATE CLUSTERED COLUMNSTORE INDEX cci_inv on [dbo].[inventory]
GO