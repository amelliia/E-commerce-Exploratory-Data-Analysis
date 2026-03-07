CREATE DATABASE eda;
USE eda;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    country VARCHAR(50),
    age_range VARCHAR(50),
    signup_date DATE
);

CREATE TABLE channels (
    channel VARCHAR(50) PRIMARY KEY,
    description VARCHAR(50)
);

CREATE TABLE products (
	product_id INT PRIMARY KEY,
	product_name VARCHAR(255),
    category VARCHAR(50),
	brand VARCHAR(50),
    color VARCHAR(50),
    size VARCHAR(50),
    catalog_price DECIMAL(10,2),
    cost_price DECIMAL(10,2),
    gender VARCHAR(50)
);

CREATE TABLE campaigns (
    campaign_id INT PRIMARY KEY,
    campaign_name VARCHAR(100),
    start_date VARCHAR(20),      -- Changed from DATE to VARCHAR to load DD/MM/YYYY
    end_date VARCHAR(20),        -- Changed from DATE to VARCHAR
    channel VARCHAR(50),
    discount_type VARCHAR(20),
    discount_value VARCHAR(20),  -- Changed from DECIMAL to VARCHAR to allow '%' or text
    FOREIGN KEY (channel) REFERENCES channels(channel)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    channel VARCHAR(50),
    discounted BOOLEAN,
    total_amount DECIMAL(10,2),
    sale_date DATE,
    customer_id INT,
    country VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (channel) REFERENCES channels(channel)
);


CREATE TABLE sales_items (
    item_id INT PRIMARY KEY,
    sale_id INT,
    product_id INT,
    quantity INT,
    original_price DECIMAL(10,2),
    unit_price DECIMAL(10,2),
    discount_applied DECIMAL(10,2),
    discount_percent VARCHAR(20),
    discounted BOOLEAN,
    item_total DECIMAL(10,2),
    sale_date DATE,
    channel VARCHAR(50),
    channel_campaigns VARCHAR(50),
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (channel) REFERENCES channels(channel)
);



LOAD DATA LOCAL INFILE 'C:/Users/Asus/Desktop/EDA/E-commerce/channels.csv'
INTO TABLE channels
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(channel, description);


LOAD DATA LOCAL INFILE 'C:/Users/Asus/Desktop/EDA/E-commerce/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customer_id, country, age_range, signup_date);

-- error showing here 
-- 1000 row(s) affected, 999 warning(s): 4095 Delimiter '\r' in position 10 in datetime value '2025-04-24 ' at row 1 is deprecated. 

SELECT *
FROM customers
WHERE signup_date LIKE '%\r%'; -- nothing returned

SHOW COLUMNS FROM customers LIKE 'signup_date'; -- data type is DATE so MySQL normalised the value 
-- MySQL removed the \r automatically during the import

LOAD DATA LOCAL INFILE 'C:/Users/Asus/Desktop/EDA/E-commerce/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id, product_name, category, brand, color,	size, catalog_price, cost_price, gender);


LOAD DATA LOCAL INFILE 'C:/Users/Asus/Desktop/EDA/E-commerce/campaigns.csv'
INTO TABLE campaigns
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(campaign_id, campaign_name, start_date, end_date, channel, discount_type, discount_value);

LOAD DATA LOCAL INFILE 'C:/Users/Asus/Desktop/EDA/E-commerce/sales.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(sale_id, channel, discounted, total_amount, sale_date, customer_id, country);



LOAD DATA LOCAL INFILE 'C:/Users/Asus/Desktop/EDA/E-commerce/sales_items.csv'
INTO TABLE sales_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(item_id, sale_id, product_id, quantity, original_price, unit_price, discount_applied, discount_percent, discounted, item_total, sale_date, channel, channel_campaigns);