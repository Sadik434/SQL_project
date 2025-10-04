CREATE TABLE Phonepe(
	transaction_id VARCHAR(50) NOT NULL,
	user_id VARCHAR(50) NOT NULL,
	amount INT NOT NULL,
	transaction_date DATE NOT NULL,
	status VARCHAR(50)NOT NULL,
	state VARCHAR(50) NOT NULL, 
	city VARCHAR(50) NOT NULL,
	merchant_id VARCHAR(50) NOT NULL
);
SELECT * FROM Phonepe;

INSERT INTO Phonepe (transaction_id, user_id, amount, transaction_date, status, state, city, merchant_id)
VALUES
('TXN001', 'USR001', 500, '2025-09-01', 'SUCCESS', 'Delhi', 'New Delhi', 'MER001'),
('TXN002', 'USR002', 1200, '2025-09-02', 'FAILED', 'Maharashtra', 'Mumbai', 'MER002'),
('TXN003', 'USR003', 750, '2025-09-02', 'SUCCESS', 'Karnataka', 'Bengaluru', 'MER003'),
('TXN004', 'USR004', 2300, '2025-09-03', 'SUCCESS', 'Tamil Nadu', 'Chennai', 'MER004'),
('TXN005', 'USR005', 150, '2025-09-03', 'PENDING', 'West Bengal', 'Kolkata', 'MER005'),
('TXN006', 'USR006', 980, '2025-09-04', 'SUCCESS', 'Uttar Pradesh', 'Lucknow', 'MER006'),
('TXN007', 'USR007', 600, '2025-09-04', 'SUCCESS', 'Rajasthan', 'Jaipur', 'MER007'),
('TXN008', 'USR008', 4500, '2025-09-05', 'FAILED', 'Punjab', 'Amritsar', 'MER008'),
('TXN009', 'USR009', 300, '2025-09-05', 'SUCCESS', 'Haryana', 'Gurgaon', 'MER009'),
('TXN010', 'USR010', 2000, '2025-09-06', 'SUCCESS', 'Madhya Pradesh', 'Bhopal', 'MER010'),
('TXN011', 'USR011', 1750, '2025-09-06', 'PENDING', 'Kerala', 'Kochi', 'MER011'),
('TXN012', 'USR012', 400, '2025-09-07', 'SUCCESS', 'Gujarat', 'Ahmedabad', 'MER012'),
('TXN013', 'USR013', 2800, '2025-09-07', 'FAILED', 'Odisha', 'Bhubaneswar', 'MER013'),
('TXN014', 'USR014', 1350, '2025-09-08', 'SUCCESS', 'Telangana', 'Hyderabad', 'MER014'),
('TXN015', 'USR015', 900, '2025-09-08', 'SUCCESS', 'Assam', 'Guwahati', 'MER015'),
('TXN016', 'USR016', 620, '2025-09-09', 'SUCCESS', 'Bihar', 'Patna', 'MER016'),
('TXN017', 'USR017', 5100, '2025-09-09', 'FAILED', 'Jharkhand', 'Ranchi', 'MER017'),
('TXN018', 'USR018', 250, '2025-09-10', 'SUCCESS', 'Chhattisgarh', 'Raipur', 'MER018'),
('TXN019', 'USR019', 3100, '2025-09-10', 'SUCCESS', 'Uttarakhand', 'Dehradun', 'MER019'),
('TXN020', 'USR020', 800, '2025-09-11', 'PENDING', 'Himachal Pradesh', 'Shimla', 'MER020');

-- Write a query to calculate the success rate of UPI transactions per state per day.
SELECT state,transaction_date,
	count(case when status = 'SUCCESS' then 1 end)*100.0/count(*) 
	AS success_rate FROM Phonepe
group by state,transaction_date order by state,transaction_date desc limit 10;
	
-- Identify users who made transactions in three or more different cities within a month.
SELECT user_id,city,
	extract(year from transaction_date) as Year,
	extract(month from transaction_date) as Month,
	count(distinct city) as unique_cities from Phonepe
group by user_id,city,extract(year from transaction_date),extract(month from transaction_date)
having count(distinct city)>=1
order by user_id,Year,Month;

-- From a transaction table, calculate the average transaction amount during peak hours (6 PM to 10 PM)
SELECT AVG(amount) as avg_peak_transaction from Phonepe
where extract(hour from transaction_date) between 18 and 22;

-- Create a query to find merchants who had more than 5 failed transactions in a row
SELECT merchant_id,
	count(*) AS failed_transaction from Phonepe
where status = 'FAILED'
group by merchant_id;














































































































