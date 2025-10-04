CREATE TABLE blinkit_sales (
id SERIAL,
item_identifier VARCHAR,
item_fat_content VARCHAR,
item_type VARCHAR,
outlet_establishment_year INT,
outlet_identifier VARCHAR,
outlet_location_type VARCHAR,
outlet_size VARCHAR,
outlet_type VARCHAR,
item_visibility FLOAT,
item_weight FLOAT,
total_sales FLOAT,
rating FLOAT
);

INSERT INTO blinkit_sales 
(item_identifier, item_fat_content, item_type, outlet_establishment_year, outlet_identifier, outlet_location_type, outlet_size, outlet_type, item_visibility, item_weight, total_sales, rating)
VALUES
('FDX01', 'Low Fat', 'Dairy', 2010, 'OUT045', 'Tier 1', 'Medium', 'Supermarket Type1', 0.065, 9.3, 2500.75, 4.2),
('FDX02', 'Regular', 'Soft Drinks', 2005, 'OUT017', 'Tier 2', 'Small', 'Grocery Store', 0.089, 12.5, 1890.40, 3.8),
('FDX03', 'Low Fat', 'Meat', 2014, 'OUT013', 'Tier 3', 'High', 'Supermarket Type2', 0.045, 15.0, 3400.10, 4.5),
('FDX04', 'Regular', 'Household', 1999, 'OUT027', 'Tier 1', 'Medium', 'Supermarket Type1', 0.120, 8.7, 2200.00, 3.9),
('FDX05', 'Low Fat', 'Fruits and Vegetables', 2007, 'OUT035', 'Tier 2', 'Small', 'Supermarket Type3', 0.075, 6.2, 1750.60, 4.1),
('FDX06', 'Regular', 'Frozen Foods', 2011, 'OUT019', 'Tier 3', 'High', 'Supermarket Type1', 0.052, 14.8, 2980.90, 4.3),
('FDX07', 'Low Fat', 'Snack Foods', 2009, 'OUT045', 'Tier 1', 'Medium', 'Supermarket Type2', 0.033, 11.6, 2600.30, 4.0),
('FDX08', 'Regular', 'Baking Goods', 2003, 'OUT017', 'Tier 2', 'Small', 'Grocery Store', 0.095, 13.0, 1980.75, 3.7),
('FDX09', 'Low Fat', 'Seafood', 2018, 'OUT013', 'Tier 3', 'High', 'Supermarket Type3', 0.041, 16.5, 3560.40, 4.6),
('FDX10', 'Regular', 'Canned', 2000, 'OUT027', 'Tier 1', 'Medium', 'Supermarket Type1', 0.080, 10.1, 2100.50, 3.8);

select * from blinkit_sales;

select cast(sum(total_sales) as decimal(10,0)) as total_sales_value from blinkit_sales;

select avg(total_sales) as total_average_sales from blinkit_sales;

select count(item_type) as No_Of_item from blinkit_sales;

select avg(rating) as avg_customer_rating from blinkit_sales;

select item_fat_content,
	sum(total_sales) as total_amount,
	avg(total_sales) AS average_sales,
	count(item_type) as No_of_item,
	avg(rating) as average_rating from blinkit_sales
group by item_fat_content order by total_amount desc;

select item_type,
	sum(total_sales) AS total_amount,
	avg(total_sales) as average_sales,
	count(item_type) AS No_Of_items,
	avg(rating) as average_rating from blinkit_sales
group by item_type order by total_amount desc;

select item_fat_content,outlet_size,
	sum(total_sales) as total_amount,
	avg(total_sales) as average_sales,
	count(item_type) as No_of_item,
	avg(rating) as average_rating from blinkit_sales
group by item_fat_content,outlet_size order by total_amount desc;

select outlet_establishment_year,
	sum(total_sales) as total_amount,
	avg(total_sales) as average_sales,
	count(item_type) as No_Of_item,
	avg(rating) as average_rating from blinkit_sales
group by outlet_establishment_year order by total_amount desc;

select outlet_size,
	sum(total_sales) as total_amount,
	ROUND(cast(SUM(total_sales) * 100.0 / SUM(SUM(total_sales)) 
	OVER() as numeric),2) as percentage_sales from blinkit_sales
group by outlet_size order by total_amount desc;

select outlet_location_type,
	sum(total_sales) as total_amount,
	avg(total_sales) as average_sales,
	count(item_type) as No_Of_items,
	avg(rating) as average_rating from blinkit_sales
group by outlet_location_type order by total_amount desc;

select outlet_type,
 	sum(total_sales) as total_amount,
	avg(total_sales) as average_sales,
	count(item_type) as No_of_item,
	avg(rating) as average_rating from blinkit_sales
group by outlet_type order by total_amount desc;





























































































