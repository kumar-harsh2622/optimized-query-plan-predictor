
SELECT i_item_id, 
               Avg(ss_quantity)    agg1, 
               Avg(ss_list_price)  agg2, 
               Avg(ss_coupon_amt)  agg3, 
               Avg(ss_sales_price) agg4 
FROM   tpcds.dbo.store_sales, 
       tpcds.dbo.customer_demographics, 
       tpcds.dbo.date_dim, 
       tpcds.dbo.item, 
       tpcds.dbo.promotion 
WHERE  ss_sold_date_sk = d_date_sk 
       AND ss_item_sk = i_item_sk 
       AND ss_cdemo_sk = cd_demo_sk 
       AND ss_promo_sk = p_promo_sk 
       AND cd_gender = 'M'
       AND cd_marital_status = 'M'
       AND cd_education_status = 'Secondary'
       AND ( p_channel_email = 'N' 
              OR p_channel_event = 'N' ) 
       AND d_year = 1998 
GROUP  BY i_item_id 
ORDER  BY i_item_id
