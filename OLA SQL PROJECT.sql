USE OLA;
select * from booking;
-- Retrieve all successful bookings:
create view booking_status as
select * from booking
where booking_status = "Success";
select * from booking_status;

-- Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as
select vehicle_type,
	round(avg(ride_distance),2)as total_ride_distance from booking
group by vehicle_type;
select * from ride_distance_for_each_vehicle;

-- Get the total number of cancelled rides by customers:-- 
CREATE VIEW total_cancelled_ride_by_customer as 
SELECT  count(booking_status) as cancelled_ride_by_customer from booking
WHERE booking_status = "canceled by customer";
SELECT * FROM total_cancelled_ride_by_customer;

-- List the top 5 customers who booked the highest number of rides
CREATE VIEW top_5_customer as
SELECT customer_id,
	count(booking_id) as total_ride from booking
group by customer_id order by total_ride desc limit 5;
SELECT * FROM top_5_customer;

-- Get the number of rides cancelled by drivers due to personal and car-related issues:-- 
CREATE VIEW  total_cancelled_by_driver as
SELECT count(*) from booking 
where canceled_rides_by_driver = "personal & car related issue";
select * from total_cancelled_by_driver;

-- Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view driver_rating as 
select vehicle_type,
	max(driver_ratings) max_rating,
    min(driver_ratings) min_rating from booking
where vehicle_type = "prime sedan"
group by vehicle_type;
select * from driver_rating;

-- Retrieve all rides where payment was made using UPI:
create view using_UPI AS 
select * from booking
where payment_method = "upi";
SELECT * FROM using_upi;

-- Find the average customer rating per vehicle type:
create view avg_cust_rating as
select vehicle_type,
	round(avg(customer_rating),2) as avg_cust_rating from booking
group by vehicle_type;
select * from avg_cust_rating;

-- Calculate the total booking value of rides completed successfully
create view total_booking_value as 
select booking_status,
	sum(booking_value) as ride_completed_successfully from booking
where booking_status = "success";
select * from total_booking_value;

-- List all incomplete rides along with the reason:
create view incomplete_rides as 
select booking_id,incomplete_rides_reason from booking
where incomplete_rides = "yes";













