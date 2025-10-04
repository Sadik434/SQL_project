CREATE TABLE Amazon_project(
    product_id INT PRIMARY KEY,
    category VARCHAR(100),
    total_sales DECIMAL(10,2),
    returns INT,
    profit DECIMAL(10,2),
    purchase_date DATE,
    return_date DATE
);


INSERT INTO Amazon_project (product_id,category, total_sales, returns, profit, purchase_date, return_date)
VALUES
(1,'Electronics', 15000.50, 2, 5000.25, '2025-01-10', '2025-01-15'),
(2,'Clothing', 8000.00, 1, 2500.75, '2025-02-05','2025-02-20'),
(3,'Furniture', 22000.00, 0, 7000.00, '2025-03-12','2025-10-09'),
(4,'Grocery', 1200.75, 5, 300.50, '2025-03-18', '2025-03-20'),
(5,'Toys', 5000.00, 2, 1500.00, '2025-04-01', '2025-04-07'),
(6,'Books', 3200.00, 0, 1200.00, '2025-04-15', '2025-08-26'),
(7,'Sports', 7800.00, 1, 2200.00, '2025-05-02', '2025-05-05'),
(8,'Beauty', 4300.50, 0, 1500.25, '2025-05-10','2025-04-16'),
(9,'Shoes', 9500.00, 3, 3000.00, '2025-06-01', '2025-06-06'),
(10,'Jewelry', 30500.75, 0, 12000.50, '2025-06-20','2024-10-19'),
(11,'Electronics', 18000.00, 1, 6000.00, '2025-07-05', '2025-07-10'),
(12,'Clothing', 6500.00, 2, 2000.00, '2025-07-18', '2025-07-22'),
(13,'Furniture', 27500.00, 1, 9000.00, '2025-08-02', '2025-08-05'),
(14,'Grocery', 2100.00, 0, 500.00, '2025-08-15','2024-09-18'),
(15,'Toys', 7200.00, 1, 2500.00, '2025-09-01', '2025-09-04');

select * from Amazon_project;

-- Use SQL to filter & group by category
select category,
	sum(total_sales) as sales_by_category,
	sum(returns) as totol_return,
	sum(profit) as profit_by_category from Amazon_project
group by category order by category desc;

-- Use CASE to flag low-profit products
select product_id,profit, category, total_sales,
	case
		when profit < 3000 then 'low profit'
		else 'high profit' end from Amazon_project
order by category;
	
-- Use CTEs to get month-over-month trends
WITH monthly_sales as (
	select DATE_TRUNC('month',purchase_date) as month,
	sum(total_sales) as total_sales
from Amazon_project
group by DATE_TRUNC('month',purchase_date)
)
select month,total_sales,
	lag(total_sales) over (order by month) as prev_month_sales,
	(total_sales - lag(total_sales) over (order by month)) as sales_change
	from monthly_sales
order by month;








































