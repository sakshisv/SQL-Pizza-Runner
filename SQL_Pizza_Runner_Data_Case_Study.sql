-------- Pizza Runner Case Study --------

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

