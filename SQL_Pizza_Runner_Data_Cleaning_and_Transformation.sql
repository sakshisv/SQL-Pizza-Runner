---------- Pizza Runner Case Study ----------

-- Data Cleaning and Transformation

-- In customers_order table, exclusions and extras columns has missing/ blank spaces ' ' and null values.
-- Now, creating another table as "customer_orders_temp" with all the columns and removing null values from exclusions and extras columns and replacing with blank space ' '.

select order_id, customer_id, pizza_id,
case
when exclusions is null or exclusions like 'null' then ' '
else exclusions
end as exclusions,
case 
when extras is null or extras like 'null' then ' '
else extras
end as extras,
order_time
into customer_orders_temp
from customer_orders

-- customer_orders_temp is the clean table and will be using it for further questions.

select * from customer_orders_temp

-- In runner_orders table,
-- pickup_time column - remove nulls and replace with ' '
-- distance column - remove km and nulls
-- duration column - remove minutes and nulls
-- cancellation column - remove NULL and null and replace with ' ' 

-- Now, creating another table as "runner_orders_temp" with all the columns and 

select order_id, runner_id,
case
when pickup_time like 'null' then ' '
else pickup_time
end as pickup_time,
case 
when distance like 'null' then ' '
when distance like '%km' then trim('km' from distance)
else distance
end as distance,
case 
when duration like 'null' then ' '
when duration like '%mins' then trim('mins' from duration)
when duration like '%minute' then trim('minute' from duration)
when duration like '%minutes' then trim('minutes' from duration)
else duration
end as duration,
case 
when cancellation is null or cancellation like 'null' then ' '
else cancellation
end as cancellation
into runner_orders_temp
from runner_orders


-- In table runner_orders_temp,
-- column pickup_time is of varchar type, converting it to datetime.
-- column distance is of varchar type, converting it to float.
-- column duration is of varchar type, converting it to int.

alter table runner_orders_temp
alter column pickup_time datetime

alter table runner_orders_temp
alter column distance float

alter table runner_orders_temp
alter column duration int

-----------------------------------------------------------------------------------------------------------------
