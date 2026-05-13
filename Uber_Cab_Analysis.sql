create database Uber_Cab_Analysis;
use uber_cab_analysis;
select * from uber_data;

#1. Retrieve all successful bookings:
create view successful_bookings as 
select * from uber_data where booking_status = "success";

#2. Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as
select vehicle_type, round(avg(ride_distance),2)avg_distance from uber_data group by vehicle_type;

#3. Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers as
select count(booking_status)total_cancelled from uber_data where booking_status = "cancelled by customer";

#4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as 
select customer_id,count(customer_id)total_rides 
from uber_data 
group by customer_id
order by total_rides desc limit 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_cancelled_by_drivers as
select count(Driver_Cancel_Reason)total_cancelled from uber_data 
where Driver_Cancel_Reason = "Personal & Car related issues";

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_driver_ratings as 
select Vehicle_Type, max(driver_ratings)max_rating,min(driver_ratings)min_rating from uber_data 
where vehicle_type = "Prime Sedan";

#7.Find the average customer rating per vehicle type:
create view avg_cust_rating as
select vehicle_type ,round(avg(customer_rating),2)avg_ratings from uber_data group by vehicle_type;

#8. Calculate the total booking value of rides completed successfully:
create view total_successful_ride_value as 
select sum(booking_value)total_booking_value  from uber_data where booking_status = "success"; 

#9.  List all incomplete rides along with the reason:
create view incomplete_rides_reason as 
select booking_id ,incomplete_reason from uber_data where incomplete_rides = "1";


# VIEWS
#1. Retrieve all successful bookings:
select * from successful_bookings;

#2. Find the average ride distance for each vehicle type:
select *from  ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
select * from cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
select * from top_5_customers; 

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from rides_cancelled_by_drivers;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select * from max_min_driver_ratings;

#7.Find the average customer rating per vehicle type:
select * from avg_cust_rating;

#8. Calculate the total booking value of rides completed successfully:
select * from total_successful_ride_value;

#9.  List all incomplete rides along with the reason:
select * from incomplete_rides_reason;
