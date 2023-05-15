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

select count(distinct(customer_id)) unique_customer_count from customer_orders_temp

-- Q3. How many successful orders were delivered by each runner?





