-------- Pizza Runner Case Study --------

use Pizza_Runner

select * from runners
select * from customer_orders_temp
select * from runner_orders_temp
select * from pizza_names
select * from pizza_recipes
select * from pizza_toppings

-- Questions:

---------- PIZZA METRICS QUESTIONS ----------

-- Q1. How many pizzas were ordered?

select count(*) pizza_order_count from customer_orders_temp

-- Q2. How many unique customer orders were made?

select count(distinct(order_id)) unique_customer_orders 
from customer_orders_temp

-- Q3. How many successful orders were delivered by each runner?

select runner_id, count(*) successful_orders from runner_orders_temp
where cancellation = ' '
group by runner_id

-- Q4. How many of each type of pizza was delivered?

select a.pizza_id, count(*) as pizza_type_count from customer_orders_temp a
left join runner_orders_temp b
on a.order_id = b.order_id
where cancellation = ' '
group by a.pizza_id

-- Q5. How many Vegetarian and Meatlovers were ordered by each customer?

select a.customer_id, b.pizza_name, count(*) pizza_type_count from customer_orders_temp a
left join pizza_names b
on a.pizza_id = b.pizza_id
group by a.customer_id, b.pizza_name
order by a.customer_id

-- Q6. What was the maximum number of pizzas delivered in a single order?

select a.order_id, count(*) as no_of_pizzas 
from customer_orders_temp a
left join runner_orders_temp b
on a.order_id = b.order_id
where b.cancellation = ' '
group by a.order_id

-- Q7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?

select a.customer_id,
sum(
case
when a.exclusions <> ' ' or a.extras <> ' ' then 1
else 0
end) as at_least_1_change,
sum(
case
when a.exclusions = ' ' or a.extras = ' ' then 1
else 0
end) as no_change
from customer_orders_temp a
left join runner_orders_temp b
on a.order_id = b.order_id
where b.cancellation = ' '
group by a.customer_id

-- Q8. How many pizzas were delivered that had both exclusions and extras?

select count(*) as pizzas_delivered
from customer_orders_temp a
left join runner_orders_temp b
on a.order_id = b.order_id
where b.cancellation = ' ' and a.exclusions <> ' ' and a.extras <> ' '

--Q9. What was the total volume of pizzas ordered for each hour of the day?

select DATEPART(hour, order_time) as hour_of_the_day, count(*) total_pizzas_delivered
from customer_orders_temp 
group by DATEPART(hour, order_time)

--Q10. What was the volume of orders for each day of the week?

select DATEPART(WEEKDAY, order_time) as day_of_the_week, count(*) total_pizzas_delivered
from customer_orders_temp 
group by DATEPART(WEEKDAY, order_time)

SELECT DATEPART(DAY, [order_time]) AS day_of_week, COUNT(order_id) AS total_pizzas_ordered
FROM customer_orders_temp
GROUP BY DATEPART(DAY, [order_time])

SELECT DATENAME(WEEKDAY,[order_time]) as weekday, 
       COUNT (order_id) as pizza_count
FROM customer_orders_temp
GROUP BY DATENAME(WEEKDAY,[order_time]);

SELECT 
  FORMAT(DATEADD(DAY, 2, order_time),'dddd') AS day_of_week, -- add 2 to adjust 1st day of the week as Monday
  COUNT(order_id) AS total_pizzas_ordered
FROM customer_orders_temp
GROUP BY FORMAT(DATEADD(DAY, 2, order_time),'dddd');