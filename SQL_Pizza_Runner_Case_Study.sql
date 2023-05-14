---------- Pizza Runner Case Study ----------

select * from customer_orders

-- Data Cleaning and Transformation

-- In customers_order table, exclusions and extras columns has missing/ blank spaces ' ' and null values.
-- Now, creating another table as "customer_orders_temp" with all the columns and removing null values from exclusions and extras columns and replacing with blank space ' '.

select order_id, customer_id, pizza_id,
case
when exclusions is null or exclusions like 'null' then ' '
else exclusions
end as exclusions,
case when extras is null or extras like 'null' then ' '
else extras
end as extras,
order_time
into customer_orders_temp
from customer_orders

-- This is the clean table and will be using it for further questions.

select * from customer_orders_temp

-- In runner_orders table, exclusions and extras columns has missing/ blank spaces ' ' and null values.
-- pickup_time column - remove nulls and replace with ' '
-- distance column - remove km and nulls
--duration - remove minutes and nulls
--cancellation - remove NULL and null and replace with ' ' 
-- Now, creating another table as "customer_orders_temp" with all the columns and removing null values from exclusions and extras columns and replacing with blank space ' '.



select * from runner_orders
