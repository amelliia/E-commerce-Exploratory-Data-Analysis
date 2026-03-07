-- 1. Remove Dup
-- 2. Standarize Data
-- 3. Null Values or blank values
-- 4. Remove unnecessary columns

USE eda;

-- this is a header/detail schema which we don't want
-- I will be transforming it into a star schema and removing unnecesary columns and tables for EDA analysis

-- CAMPAIGNS TABLE
DESCRIBE campaigns; -- start and end_date are VARCHAR -- should be date so we're going to change it

SET SQL_SAFE_UPDATES = 0;

ALTER TABLE campaigns
ADD COLUMN start_date_tmp DATE,
ADD COLUMN end_date_tmp DATE;

UPDATE campaigns
SET 
    start_date_tmp = STR_TO_DATE(start_date, '%d/%m/%Y'),
    end_date_tmp   = STR_TO_DATE(end_date, '%d/%m/%Y');

SELECT start_date, start_date_tmp, end_date, end_date_tmp
FROM campaigns
LIMIT 20; -- sanity check before altering the original columns

ALTER TABLE campaigns
DROP COLUMN start_date,
DROP COLUMN end_date;


ALTER TABLE campaigns
CHANGE COLUMN start_date_tmp start_date DATE,
CHANGE COLUMN end_date_tmp end_date DATE; -- we change the data type to date and the names

SELECT * FROM campaigns; -- data looks correct

DESCRIBE campaigns;

SET SQL_SAFE_UPDATES = 1;

-- checking NULL values in campaign table
SELECT
    SUM(CASE WHEN campaign_id IS NULL THEN 1 ELSE 0 END) AS Null_campaign_id,
    SUM(CASE WHEN campaign_name IS NULL THEN 1 ELSE 0 END) AS campaign_name,
    SUM(CASE WHEN channel IS NULL THEN 1 ELSE 0 END) AS Null_Channel,
    SUM(CASE WHEN discount_type IS NULL THEN 1 ELSE 0 END) AS Null_dis_type,
    SUM(CASE WHEN discount_value IS NULL THEN 1 ELSE 0 END) AS Null_dis_val,
    SUM(CASE WHEN start_date IS NULL THEN 1 ELSE 0 END) AS Null_start,
    SUM(CASE WHEN end_date IS NULL THEN 1 ELSE 0 END) AS Null_end
FROM campaigns;

-- there is no NULL values so no action needed
-- discount value is either fixed or percentage, so I'm leaving it as VARCHAR


-- CHANNELS TABLE

SELECT * FROM channels; -- this is just a table with descriprions of channels, very small, no action needed

-- CUSTOMERS TABLE

SELECT * FROM customers;

SELECT
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS Null_customer_id,
    SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS Null_country,
    SUM(CASE WHEN age_range IS NULL THEN 1 ELSE 0 END) AS Null_age_range,
    SUM(CASE WHEN signup_date IS NULL THEN 1 ELSE 0 END) AS Null_signup_date
FROM customers;
-- There is no NULL values, no action needed

DESCRIBE customers; -- no action needed, I'll change the customer_id to INT when uploading to Power Bi

-- PRODUCTS TABLE

SELECT * FROM products;

SELECT
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS Null_product_id,
    SUM(CASE WHEN product_name IS NULL THEN 1 ELSE 0 END) AS Null_name,
    SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS Null_category,
    SUM(CASE WHEN brand IS NULL THEN 1 ELSE 0 END) AS Null_brand,
    SUM(CASE WHEN color IS NULL THEN 1 ELSE 0 END) AS Null_color,
    SUM(CASE WHEN size IS NULL THEN 1 ELSE 0 END) AS Null_size,
	SUM(CASE WHEN catalog_price IS NULL THEN 1 ELSE 0 END) AS Null_cat_price,
	SUM(CASE WHEN cost_price IS NULL THEN 1 ELSE 0 END) AS Null_cost_price,
	SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS Null_gender
FROM products; 
-- No NULL values, no action needed

DESCRIBE products; -- size is either letters like XS, S, M, L or numbers 

SELECT *
FROM products
WHERE size NOT IN ('XS', 'S', 'M', 'L', 'XL'); --  only shoes category have numeric size which means the data type varchar is correct


-- SALES TABLE

SELECT * FROM SALES;

DESCRIBE sales;  -- this is a fact table 

SELECT
    SUM(CASE WHEN sale_id IS NULL THEN 1 ELSE 0 END) AS Null_sale_id,
    SUM(CASE WHEN channel IS NULL THEN 1 ELSE 0 END) AS Null_channel,
    SUM(CASE WHEN discounted IS NULL THEN 1 ELSE 0 END) AS Null_discounted,
    SUM(CASE WHEN total_amount IS NULL THEN 1 ELSE 0 END) AS Null_total_amount,
    SUM(CASE WHEN sale_date IS NULL THEN 1 ELSE 0 END) AS Null_sale_date,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS Null_customer_id,
	SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS Null_country
FROM sales;
-- No NULL values, no action needed

SELECT * from sales_items; -- this is another fact table

DESCRIBE sales_items;

SELECT
    SUM(CASE WHEN item_id IS NULL THEN 1 ELSE 0 END) AS Null_item_id,
    SUM(CASE WHEN sale_id IS NULL THEN 1 ELSE 0 END) AS Null_sale_id,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS Null_product_id,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS Null_quantity,
    SUM(CASE WHEN original_price IS NULL THEN 1 ELSE 0 END) AS Null_original_price,
    SUM(CASE WHEN unit_price IS NULL THEN 1 ELSE 0 END) AS Null_unit_price,
	SUM(CASE WHEN discount_applied IS NULL THEN 1 ELSE 0 END) AS Null_discount_applied,
	SUM(CASE WHEN discount_percent IS NULL THEN 1 ELSE 0 END) AS Null_discount_percent,
    SUM(CASE WHEN discounted IS NULL THEN 1 ELSE 0 END) AS Null_discounted,
    SUM(CASE WHEN discounted IS NULL THEN 1 ELSE 0 END) AS Null_discounted,
    SUM(CASE WHEN item_total IS NULL THEN 1 ELSE 0 END) AS Null_item_total,
    SUM(CASE WHEN sale_date IS NULL THEN 1 ELSE 0 END) AS Null_sale_date,
    SUM(CASE WHEN channel IS NULL THEN 1 ELSE 0 END) AS Null_channel,
	SUM(CASE WHEN channel_campaigns IS NULL THEN 1 ELSE 0 END) AS Null_channel_campaigns
FROM sales_items;
-- No NULL values

-- We can see that some columns are repeated with sales table 
-- We will change this header/detail schema to a star schema 

-- Star schema means less joins and better performance. It also gives us cleaner relationships between tables

SELECT * FROM products;


-- checking if i can remove original_price from sales_items table as it might be duplicate of column from product table
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN p.catalog_price = si.original_price THEN 1 ELSE 0 END) AS matching_rows,
    SUM(CASE WHEN p.catalog_price <> si.original_price THEN 1 ELSE 0 END) AS mismatches
FROM sales_items si
JOIN products p ON si.product_id = p.product_id;
-- all the rows are matching which means i can delete it from sales_items as products table has this data


-- checking if i can remove discount_applied from sales_items

-- discount_percent tells you how much of a percentage was discounted
-- discount_applied tells you the actual amount of money discounted

-- which means discount_applied = catalog_price * (discount_percent / 100)


-- Creating fact_sales 

CREATE TABLE fact_sales AS
SELECT
    si.item_id,
    si.sale_id,
    si.product_id,
    s.customer_id,
    s.channel,
    s.country,
    s.sale_date,
    si.quantity,
    si.unit_price,
    si.item_total,
    si.discount_percent,
    si.channel_campaigns
FROM sales_items si
JOIN sales s ON si.sale_id = s.sale_id;
-- Columns NOT included from sales_items: original_price, discount_applied, discounted, sale_date (using header date instead), channel (using header channel instead)
-- From sales: discounted total_amount

SELECT * FROM fact_sales
ORDER BY sale_id;

SELECT 
    COUNT(*) AS total_sales,
    SUM(CASE WHEN f.fact_total_amount = s.total_amount THEN 1 ELSE 0 END) AS matching,
    SUM(CASE WHEN f.fact_total_amount <> s.total_amount THEN 1 ELSE 0 END) AS mismatching
FROM sales s
JOIN (
    SELECT sale_id, SUM(item_total) AS fact_total_amount
    FROM fact_sales
    GROUP BY sale_id
) f ON s.sale_id = f.sale_id;
-- matching so it's safe to drop the sales_items and sales tables

DROP TABLE sales_items;
DROP TABLE sales;

-- let's draw our schema now

DESCRIBE fact_sales;

SELECT * FROM fact_sales;

DESCRIBE channels;

select * from campaigns;

select * from channels;

select * from fact_sales;

ALTER TABLE fact_sales
ADD COLUMN campaign_id INT NULL; -- add link each sale item to a marketing campaign

SET SQL_SAFE_UPDATES = 0;

UPDATE fact_sales f
JOIN campaigns c ON f.channel = c.channel
	AND f.sale_date BETWEEN c.start_date AND c.end_date
SET f.campaign_id = c.campaign_id;

SELECT * FROM channels;

INSERT INTO campaigns (
    campaign_id,
    campaign_name,
    channel,
    discount_type,
    discount_value,
    start_date,
    end_date
)
VALUES (
    0,
    'No Promotion',
    'E-commerce',   -- MUST match an existing channel!
    NULL,
    NULL,
    '1900-01-01',
    '2099-12-31'
);

UPDATE fact_sales
SET campaign_id = 0
WHERE campaign_id IS NULL;  -- assign default campaign_d where no match was found to be 0


SET SQL_SAFE_UPDATES = 1;

SELECT *
FROM fact_sales
WHERE sale_date BETWEEN '2025-05-20' AND '2025-05-31'; -- spot-check campaign assignments by date

SELECT campaign_id, campaign_name, channel, start_date, end_date
FROM campaigns
WHERE campaign_id = 5;

SELECT * from fact_sales
WHERE campaign_id <> 0;  -- view only sales tied to an active campaign

SELECT *
FROM fact_sales;  -- full table inspection


UPDATE fact_sales
SET campaign_id = NULL
WHERE campaign_id <> 0;
-- campaign_id was assigned earlier using channel + date connection, 
-- now we will clear the previously assigned campaigns but we will keep "No Promotion" = 0

UPDATE fact_sales f
JOIN campaigns c
	ON c.discount_type = 'Percentage'
	AND f.discount_percent = c.discount_value
	AND f.sale_date BETWEEN c.start_date AND c.end_date
SET f.campaign_id = c.campaign_id;
-- assign percentage-based campaigns by matching the exact discount shown on the sale
-- and ensuring the sale date falls within the campaign’s active period
-- this links each discounted item to the campaign that caused the price reduction //  map sales to percentage campaigns using discount value + campaign date window

UPDATE fact_sales
SET campaign_id = 0
WHERE campaign_id IS NULL; 

SELECT * from fact_sales
WHERE campaign_id <> 0; -- checking campaign matches

SELECT * from campaigns; 

SELECT * from fact_sales; -- 

UPDATE campaigns
SET 
    discount_type  = TRIM(REPLACE(discount_type,  '\r', '')),
    discount_value = TRIM(REPLACE(discount_value, '\r', '')),
    channel        = TRIM(REPLACE(channel,        '\r', '')),
    campaign_name  = TRIM(REPLACE(campaign_name,  '\r', ''));
-- remove hidden CRLF characters so string comparisons work reliably
-- without this, identical-looking values (e.g. '30.00%') may not match
    
UPDATE fact_sales
SET campaign_id = NULL;

UPDATE fact_sales f
JOIN campaigns c ON f.discount_percent = c.discount_value  
	AND f.sale_date BETWEEN c.start_date AND c.end_date
	SET f.campaign_id = c.campaign_id
WHERE c.discount_value LIKE '%\%%';
-- assign campaigns that use percentage discounts only
-- LIKE '%\%%' filters values such as '10%', '25%', '30.00%'
-- prevents fixed-amount campaigns from being incorrectly matched

UPDATE fact_sales 
SET 
    campaign_id = 0
WHERE
    campaign_id IS NULL;  -- non-promotional rows

SELECT campaign_id, COUNT(*) 
FROM fact_sales
GROUP BY campaign_id
ORDER BY campaign_id;  -- distribution check across campaigns

UPDATE fact_sales
SET campaign_id = NULL;  -- final reset to apply both campaign types together

UPDATE fact_sales f
JOIN campaigns c
  ON c.discount_type = 'Percentage'
 AND f.discount_percent = c.discount_value
 AND f.sale_date BETWEEN c.start_date AND c.end_date
SET f.campaign_id = c.campaign_id; -- assign percentage campaigns

UPDATE fact_sales f
JOIN campaigns c ON c.discount_type = 'Fixed'
JOIN products p ON f.product_id = p.product_id
SET f.campaign_id = c.campaign_id
WHERE 
    (p.catalog_price - f.unit_price) = c.discount_value
  AND f.sale_date BETWEEN c.start_date AND c.end_date; --  assign fixed values campaigns by price difference
  
UPDATE fact_sales
SET campaign_id = 0
WHERE campaign_id IS NULL; -- ensure every row has a campaign_id

SELECT campaign_id, COUNT(*)
FROM fact_sales
GROUP BY campaign_id
ORDER BY campaign_id; -- validation of campaign mapping

SELECT * from fact_sales; -- final fact table ready for EDA